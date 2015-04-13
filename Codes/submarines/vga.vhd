library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity vga is
	Port(
		CLOCK_50		: in std_logic;
		data_x		: in std_logic_vector(9 downto 0);
		data_y		: in std_logic_vector(9 downto 0);
		
		out_red		: out std_logic;
		out_green	: out std_logic;
		out_blue		: out std_logic;
		out_h_sync	: out std_logic;
		out_v_sync	: out std_logic
		);
end entity vga;

architecture vga_arch of vga is
	-- Sync signal
	signal h_sync			: std_logic;
	signal v_sync			: std_logic;
	-- Video Enables
	signal video_en		: std_logic;
	signal horizontal_en	: std_logic;
	signal vertical_en	: std_logic;
	-- Color signal
	signal red_signal		: std_logic;
	signal green_signal	: std_logic;
	signal blue_signal	: std_logic;
	-- Sync Counters
	signal h_cnt			: std_logic_vector(10 downto 0) := (others => '0');
	signal v_cnt			: std_logic_vector(10 downto 0) := (others => '0');
	
	-- Signal positionning the boat
	signal left_bound		: std_logic_vector(9 downto 0) ;--:= std_logic_vector(to_unsigned(300,10));
	signal right_bound	: std_logic_vector(9 downto 0) ;--:= std_logic_vector(to_unsigned(500,10));
	signal top_bound		: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(150,10));
	signal bottom_bound	: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(160,10));
	
	-- To represent acceleration of both directions
	shared variable sign_g_y		: std_logic;
	shared variable magn_g_y		: std_logic_vector(8 downto 0); -- variable à la place de signal pour mise à jour immédiate
	shared variable old_magn_g_y	: std_logic_vector(8 downto 0); -- variable à la place de signal pour mise à jour immédiate
	shared variable tmp_magn_g_y	: std_logic_vector(10 downto 0); -- variable à la place de signal pour mise à jour immédiate
	
	-- Submarines
	type Submarine_tab is array(49 downto 0) of std_logic_vector (11 downto 0); -- 1 bit for signaling if there is a boat, 1 bit for signaling its direction and 10 bits for its position
	shared variable submarines : Submarine_tab;
	
	-- Rockets
	type Rocket_tab is array(74 downto 0) of std_logic_vector(49 downto 0);
	shared variable rockets : Rocket_tab;
	
	shared variable index : integer range 0 to 200; -- normally 75 enough
	shared variable i_loop : integer range 0 to 200;
	shared variable init : integer range 0 to 1 := 0;
	
	shared variable cnt_fast 				: integer range 0 to 5000 := 0;
	shared variable cnt_slow 				: integer range 0 to 100 := 0;
	shared variable timer_lauch_rockets : integer range 0 to 100 := 0;
	shared variable timer_update_rockets: integer range 0 to 1 := 0;
	shared variable index_submarine		: integer range 0 to 49;
	shared variable shooter 				: integer range 0 to 9 :=0;
	shared variable tmp 						: integer;
	shared variable tmp_random		    	: integer range 0 to 65 := 0;
	shared variable nb_submarines    	: integer range 0 to 15 :=0; -- To count the number of submarines
begin
	
	update_submarines : process (CLOCK_50)
	begin
		if(CLOCK_50 = '1') then
			
			-- Generate submarines
--			if(init = 0) then
--				submarines(0) := "10" & (std_logic_vector(to_unsigned(280,10)));
--				submarines(20) := "10" & (std_logic_vector(to_unsigned(380,10)));
--				submarines(30) := "11" & (std_logic_vector(to_unsigned(380,10)));
--				submarines(40) := "11" & (std_logic_vector(to_unsigned(480,10)));
--				init := 1;
--				nb_submarines := 4;
--			end if;
			
			if(tmp_random = 1) then
				tmp_random := to_integer(unsigned(magn_g_y(5 downto 0))); -- to take a random number
				if (tmp_random >= 50) then -- 2^6 can be greater than 50
					tmp_random := tmp_random - 15;
				end if;
				for i_loop in 0 to 49 loop
					if(submarines(tmp_random)(11) = '0') then -- No submarine in this line => create one
						if ( magn_g_y(6) = '0') then -- too choose the direction
							submarines(tmp_random)(11 downto 0) := "10" & (std_logic_vector(to_unsigned(760,10)));
						else
							submarines(tmp_random)(11 downto 0) := "11" & (std_logic_vector(to_unsigned(0,10)));
						end if;
						nb_submarines := nb_submarines +1;
						exit;
					else
						tmp_random := tmp_random +1;
						if (tmp_random > 49) then 
							tmp_random := 0;
						end if;
					end if;
				end loop;
				tmp_random := 0;
			end if;
			
			
			
			if(cnt_slow = 100 and v_sync = '0') then
				-- Update submarines position
				for i_loop in 0 to 49 loop
					if(submarines(i_loop)(11) = '1') then 	-- if there is a boat on this line
						if(submarines(i_loop)(10) = '1') then 	-- if it goes to the right
							if(submarines(i_loop)(9 downto 0) = 760)then
								submarines(i_loop)(10) := '0'; 
							else
								submarines(i_loop) := submarines(i_loop) + 1;
							end if;
						else 												-- if it goes to the left
							if(submarines(i_loop)(9 downto 0) = 0)then
								submarines(i_loop)(10) := '1'; 
							else
								submarines(i_loop) := submarines(i_loop) - 1;
							end if;
						end if;
					end if;
				end loop;
				
				-- Generate rockets
				if(timer_lauch_rockets = 100) then -- 1 second ellapsed
				
					-- Try to add a submarine every second if there is less than 8 submarines
					if(nb_submarines < 8) then -- if there is less than 8 submarines, we add one every second
--						tmp_random := to_integer(unsigned(magn_g_y)) mod 50; -- to get a "random" position in the table
--						i_loop := 0;
--						while(submarines(tmp_random)(11) = '1' AND i_loop < 50) loop -- to get a line with no other submarines
--							tmp_random := tmp_random +1;
--							if (tmp_random = 50 ) then
--								tmp_random := 0;
--							end if;
--							i_loop := i_loop +1;
--						end loop;	
--
--						if ( magn_g_y(6) = '0') then
--							submarines(tmp_random)(11 downto 0) := "10" & (std_logic_vector(to_unsigned(760,10)));
--						else
--							submarines(tmp_random)(11 downto 0) := "11" & (std_logic_vector(to_unsigned(0,10)));
--						end if;
--						nb_submarines := nb_submarines + 1;
					tmp_random :=1;
					end if;

					--for i_loop in 0 to 4 loop
					for i_loop in 0 to 49 loop
					
						--index_submarine := shooter + i_loop * 10;
						--if( submarines(index_submarine)(11) = '1' ) then -- if there is a submarine at this line, it shoots
						if( submarines(i_loop)(11) = '1' ) then -- if there is a submarine at this line, it shoots
							rockets(i_loop + 25)(to_integer(unsigned(submarines(i_loop)(9 downto 0) + 12) srl 4)) := '1';
						end if;
					end loop;
					
--					if(shooter = 9) then
--						shooter := 0;
--					else
--						shooter := shooter + 1;
--					end if;
					
					timer_lauch_rockets := 0;
				
				else
					timer_lauch_rockets := timer_lauch_rockets + 1;
				end if;
				
				-- Update rockets
				if(timer_update_rockets = 1) then
					for i_loop in 1 to 74 loop
						rockets(i_loop-1) := rockets(i_loop);
					end loop;
					rockets(74) := std_logic_vector(to_unsigned(0,50));
					timer_update_rockets := 0;
				else
					timer_update_rockets := 1;
				end if;
				
				cnt_fast := 0;
				cnt_slow := 0;
				
			elsif(cnt_slow = 100) then
				cnt_slow := cnt_slow;
			elsif(cnt_fast = 5000) then
				cnt_fast := 0;
				cnt_slow := cnt_slow + 1;
			else
				cnt_fast := cnt_fast + 1;
			end if;
			
		end if;
	end process;
	
	boat : process(v_sync)
	begin	
	
		if (v_sync = '0') then
	
			-- Get the sign of the acceleration over y
			sign_g_y := data_y(9);
			
			-- Get the magnitude of the acceleration over y
			if (sign_g_y = '0') then
				magn_g_y := (data_y(8 downto 0));
			else 
				magn_g_y := (NOT(data_y(8 downto 0))) + "000000001"; -- 2's complement
			end if;
			
			-- Filter
			tmp_magn_g_y := "00" & old_magn_g_y;
			tmp_magn_g_y := tmp_magn_g_y + tmp_magn_g_y + tmp_magn_g_y + ("00" & magn_g_y);
			magn_g_y := tmp_magn_g_y(10 downto 2); -- Division by 4

			
			-- Compute the horizontal position of the square
			if(sign_g_y = '0') then -- si positif
				left_bound <= std_logic_vector(to_unsigned(380-((380*(to_integer(unsigned(magn_g_y))))/256),10));
				--left_bound <= "0100101100" + magn_g_y(8 downto 1);
			else
				left_bound <= std_logic_vector(to_unsigned(380+((380*(to_integer(unsigned(magn_g_y))))/256),10));
				--left_bound <= "0100101100" - magn_g_y(8 downto 1);
			end if;
			right_bound <= left_bound + 40;
		
			old_magn_g_y := magn_g_y;
			
		end if;
	end process;

	
	---------------------------------------------------------------------------------------------------
	
	
	vga_gen : process
	begin

		wait until ( (CLOCK_50'event) and (CLOCK_50 = '1') ) ;

		-- Generate Screen
		if( v_cnt >= 0) and (v_cnt <= 599) then
			
			-- sky
			if( ((v_cnt >= 0) and (v_cnt <= 160)) and ((h_cnt >= 0) and (h_cnt <= 799)) ) then
				red_signal <= '0';
				green_signal <= '1';
				blue_signal <= '1';
			end if;
			
			-- boat
			if( ((v_cnt >= top_bound) and (v_cnt <= bottom_bound)) and ((h_cnt >= left_bound) and (h_cnt <= right_bound)) ) then
				red_signal <= '1';
				green_signal <= '0';
				blue_signal <= '0';
			end if;
			
			-- sea
			if( ((v_cnt >= 160) and (v_cnt <= 599)) and ((h_cnt >= 0) and (h_cnt <= 799)) ) then
				blue_signal <= '1';
				red_signal <= '0';
				green_signal <= '0';
			end if;
			
			-- submarines
			if( (v_cnt >= 200) and (v_cnt <= 599) and (h_cnt >= 0) and (h_cnt <= 799) ) then
				
				index := to_integer(unsigned(v_cnt-200) srl 3);
				if(submarines(index)(11) = '1') then
				
					if( (h_cnt(9 downto 0) >= submarines(index)(9 downto 0)) and (h_cnt(9 downto 0) <= submarines(index)(9 downto 0) + 40) ) then
						blue_signal <= '0';
						red_signal <= '0';
						green_signal <= '0';
					end if;
				end if;
			end if;
			
			-- Rockets
			if( (v_cnt >= 0) and (v_cnt <= 599) and (h_cnt >= 0) and (h_cnt <= 799) ) then

				index := to_integer(unsigned(v_cnt) srl 3);
				tmp := to_integer(unsigned(h_cnt) srl 4);
				
				if(rockets(index)(tmp) = '1') then
						blue_signal <= '0';
						red_signal <= '1';
						green_signal <= '0';
				end if;
				
			end if;

		
		end if;

		-- Generate Horizontal Sync
		if(h_cnt <= 975) and (h_cnt >= 855) then
			h_sync <= '0';
		else
			h_sync <= '1';
		end if;

		-- Reset Horizontal Counter
		if(h_cnt = 1039) then
			h_cnt <= "00000000000";
		else
			h_cnt <= h_cnt + 1;
		end if;

		-- Reset Vertical Counter
		if (v_cnt >= 665) and (h_cnt >= 1039) then
			v_cnt <= "00000000000";
		elsif (h_cnt = 1039) then
			v_cnt <= v_cnt + 1;
		end if;

		-- Generate Vertival Sync
		if (v_cnt <= 642) and (v_cnt >= 636) then
			v_sync <= '0';
		else
			v_sync <= '1';
		end if;

		-- Generate Horizontal Enable
		if(h_cnt <= 799) then
			horizontal_en <= '1';
		else
			horizontal_en <= '0';
		end if;

		-- Generate Vertical Enable
		if (v_cnt <= 599) then
			vertical_en <= '1';
		else
			vertical_en <= '0';
		end if;

		video_en <= horizontal_en and vertical_en;

		-- Assign physical signal to vga
		out_red 		<= red_signal and video_en;
		out_green 	<= green_signal and video_en;
		out_blue 	<= blue_signal and video_en;
		out_h_sync	<= h_sync;
		out_v_sync	<= v_sync;

	end process vga_gen;

end architecture vga_arch;
