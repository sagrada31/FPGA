library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity vga is
	Port(
		CLOCK_50		: in std_logic;
		
		-- FOR THE ACCELEROMETER DATA
		data_x		: in std_logic_vector(9 downto 0);
		data_y		: in std_logic_vector(9 downto 0);
		
		-- FOR THE OUTPUT SIGNALS
		out_red		: out std_logic;
		out_green	: out std_logic;
		out_blue		: out std_logic;
		out_h_sync	: out std_logic;
		out_v_sync	: out std_logic;
	
		-- FOR THE RAM PROCESSING
		data_a_sub			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		data_b_sub			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		address_a_sub		: buffer STD_LOGIC_VECTOR (4 DOWNTO 0);
		address_b_sub		: buffer STD_LOGIC_VECTOR (4 DOWNTO 0);
		wr_en_a_sub				: OUT STD_LOGIC  := '0';
		wr_en_b_sub				: OUT STD_LOGIC  := '0';
		rd_en_a_sub				: OUT STD_LOGIC  := '0';
		rd_en_b_sub				: OUT STD_LOGIC  := '0';
		q_a_sub					: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		q_b_sub					: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		
		-- FOR THE RAM PROCESSING
		data_a_roc			: OUT STD_LOGIC_VECTOR (255 DOWNTO 0);
		data_b_roc			: OUT STD_LOGIC_VECTOR (255 DOWNTO 0);
		address_a_roc		: buffer STD_LOGIC_VECTOR (5 DOWNTO 0);
		address_b_roc		: buffer STD_LOGIC_VECTOR (5 DOWNTO 0);
		wr_en_a_roc			: OUT STD_LOGIC  := '0';
		wr_en_b_roc				: OUT STD_LOGIC  := '0';
		rd_en_a_roc				: OUT STD_LOGIC  := '0';
		rd_en_b_roc				: OUT STD_LOGIC  := '0';
		q_a_roc					: IN STD_LOGIC_VECTOR (255 DOWNTO 0);
		q_b_roc					: IN STD_LOGIC_VECTOR (255 DOWNTO 0)
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
	signal left_boat		: std_logic_vector(9 downto 0) ;--:= std_logic_vector(to_unsigned(300,10));
	signal right_boat	: std_logic_vector(9 downto 0) ;--:= std_logic_vector(to_unsigned(500,10));
	signal top_boat		: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(150,10));
	signal bottom_boat	: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(160,10));
	
	-- To represent acceleration of both directions
	shared variable sign_g_y		: std_logic;
	shared variable magn_g_y		: std_logic_vector(8 downto 0); -- variable à la place de signal pour mise à jour immédiate
	shared variable old_magn_g_y	: std_logic_vector(8 downto 0); -- variable à la place de signal pour mise à jour immédiate
	shared variable tmp_magn_g_y	: std_logic_vector(10 downto 0); -- variable à la place de signal pour mise à jour immédiate
	
	shared variable submarines : std_logic_vector(49 downto 0) := (others => '0');  -- 1 bit for signaling if there is a boat, 1 bit for signaling its direction and 10 bits for its position
	--shared variable submarines : Submarine_tab;
	
	shared variable index 					: integer range 0 to 200; -- normally 75 enough
	shared variable i_loop 					: integer range 0 to 200;
	
	shared variable update_submarines 	: std_logic := '0';
	shared variable update_rockets 		: std_logic := '0';
	shared variable generate_subarine	: std_logic := '0';
	shared variable generate_rocket		: std_logic := '0';
	shared variable cycle_cnt				: integer range 0 to 100 := 0;
	
	shared variable current_submarine 	: integer range 0 to 49 := 0;
	shared variable first_part 			: std_logic := '1';
	shared variable first_data_sub 		: std_logic_vector (15 downto 0);
	shared variable second_data_sub 		: std_logic_vector (15 downto 0);
	shared variable tmp_read_data_sub	: std_logic_vector (31 downto 0);
	shared variable address_tmp			: std_logic_vector (5 downto 0);
	
	shared variable first_data_roc 		: std_logic_vector (127 downto 0);
	shared variable second_data_roc 		: std_logic_vector (127 downto 0);
	shared variable tmp_read_data_roc	: std_logic_vector (255	downto 0);
	
	shared variable current_rocket		: integer range 0 to 74 := 0;
	
	shared variable index_submarine		: integer range 0 to 49;
	shared variable index_rocket			: integer range 0 to 74;
	shared variable shooter 				: integer range 0 to 9 := 0;
	shared variable tmp 						: integer;
	shared variable tmp_random		    	: integer range 0 to 65 := 0;
	shared variable old_random		    	: integer range -1 to 65 := -1;
	shared variable nb_submarines    	: integer range 0 to 15 := 0; -- To count the number of submarines
	
	shared variable current_submarine_line	: integer range 0 to 615 := 0;
	shared variable current_rocket_line		: integer range -1 to 615 := 0;
	
	shared variable ask_read					: std_logic := '0';
	shared variable data_read					: std_logic_vector (15 downto 0);

	shared variable first_row_sub 			: std_logic_vector (15 downto 0);
	shared variable second_row_sub 			: std_logic_vector (15 downto 0);
	shared variable first_row_roc 			: std_logic_vector (127 downto 0);
	shared variable second_row_roc 			: std_logic_vector (127 downto 0);
	
	shared variable ask_read_debug			: std_logic := '0';
	shared variable vector_debug				: std_logic_vector(215 downto 0) := (others => '1');
begin

	update_elements_position : process(CLOCK_50)
	begin
		if(CLOCK_50 = '1') then
			
			-- Prepare to load the first line of submarines from memory (just before the v_sync)
			if(v_cnt = 635 and h_cnt = 1039) then
				update_submarines := '1';
				update_rockets := '0';
				generate_subarine := '0';
				generate_rocket := '0';
				current_submarine := 0;
				
				address_a_sub <= "00000";
				rd_en_a_sub <= '1';
				wr_en_a_sub <= '0';
				--address_a_roc <= "011001";
				--rd_en_a_roc <= '1';
				--wr_en_a_roc <= '0';
				
				if(cycle_cnt = 100) then
					cycle_cnt := 0;
				else
					cycle_cnt := cycle_cnt + 1;
				end if;
								
			elsif(v_sync = '0' ) then --and (cycle_cnt = 25 or cycle_cnt = 50 or cycle_cnt = 75 or cycle_cnt = 100)) then
				
				-- Update submarines position	
				if (update_submarines = '1') then
						
					if(first_part = '1') then								-- first part
						
						if(current_submarine = 0) then
							first_data_sub(15 downto 0) := q_a_sub(31 downto 16);
							second_data_sub(15 downto 0) := q_a_sub(15 downto 0);
--							first_data_roc(127 downto 0) := q_a_roc(255 downto 128);
--							second_data_roc(127 downto 0) := q_a_roc(127 downto 0);
						else
							first_data_sub(15 downto 0) := tmp_read_data_sub(31 downto 16);
							second_data_sub(15 downto 0) := tmp_read_data_sub(15 downto 0);
--							first_data_roc(127 downto 0) := tmp_read_data_roc(255 downto 128);
--							second_data_roc(127 downto 0) := tmp_read_data_roc(127 downto 0);
						end if;
						
						if(first_data_sub(11) = '1') then 									-- if there is a submarine on this line
							if(first_data_sub(10) = '1') then 								-- if it goes to the right
								if(first_data_sub(9 downto 0) = 760)then					-- if max at right
									first_data_sub(10) := not first_data_sub(10);		-- reverse direction
								else
									first_data_sub(15 downto 0) := first_data_sub(15 downto 0) + 1;	-- go to right
								end if;
							else 																		-- if it goes to the left
								if(first_data_sub(9 downto 0) = 0)then						-- if max at left
									first_data_sub(10) := not first_data_sub(10);		-- reverse direction
								else
									first_data_sub(15 downto 0) := first_data_sub(15 downto 0) - 1;	-- go to left
								end if;
							end if;
--							if (cycle_cnt = 100) then
--								first_data_roc(to_integer(unsigned(first_data_sub(9 downto 0) + 16) srl 3)) := '1';
--							end if;
						end if;
						-- prepare to load the next line from memory 
						--address_tmp := std_logic_vector(to_unsigned(current_submarine,6)); 
						--address_a_sub <= address_tmp(5 downto 1) + 1;
						address_a_sub <= std_logic_vector(to_unsigned(current_submarine/2,5)) + 1; 	
						rd_en_a_sub <= '1';
						wr_en_a_sub <= '0';
--						address_a_roc <= std_logic_vector(to_unsigned(current_submarine/2,6)) + 26;
--						rd_en_a_roc <= '1';
--						wr_en_a_roc <= '0';
						
					else																	-- second part
						tmp_read_data_sub := q_a_sub;
--						tmp_read_data_roc := q_a_roc;
						if(second_data_sub(11) = '1') then 							-- if there is a submarine on this line
							if(second_data_sub(10) = '1') then 						-- if it goes to the right
								if(second_data_sub(9 downto 0) = 760)then			-- if max at right
									second_data_sub(10) := not second_data_sub(10);	-- reverse direction
								else
									second_data_sub(15 downto 0) := second_data_sub(15 downto 0) + 1; -- go to right
								end if;
							else 															-- if it goes to the left
								if(second_data_sub(9 downto 0) = 0)then				-- if max at left
									second_data_sub(10) := not second_data_sub(10);	-- reverse direction
								else
									second_data_sub(9 downto 0) := second_data_sub(9 downto 0) - 1;	-- go to left
								end if;
							end if;
							--if (cycle_cnt = 100) then
--								second_data_roc(to_integer(unsigned(second_data_sub(9 downto 0) + 16) srl 3)) := '1';
							--end if;
						end if;
						-- prepare to write the actual line to memory
						data_a_sub <= first_data_sub & second_data_sub;
--						data_a_roc <= first_data_roc & second_data_roc;
						--address_tmp := std_logic_vector(to_unsigned(current_submarine,6));
						--address_a_sub <= address_tmp(5 downto 1); -- To divide by 2
						address_a_sub <= std_logic_vector(to_unsigned(current_submarine/2,5)) - 1;
						wr_en_a_sub <= '1';
						rd_en_a_sub <= '0';
--						if (cycle_cnt = 100) then
--							address_a_roc <= std_logic_vector(to_unsigned(current_submarine/2,6)) + 24;
--							wr_en_a_roc <= '1';
--							rd_en_a_roc <= '0';
--						end if;
					end if;
					first_part := not first_part;
					
					if(current_submarine = 49) then
						current_submarine := 0;
						update_submarines := '0'; update_rockets := '1';
					else
						current_submarine := current_submarine + 1;
					end if;

				-- Update rockets position
				elsif(update_rockets = '1') then
					
--					-- Update rockets
--				if(timer_update_rockets = 1) then
--					for i_loop in 1 to 74 loop
--						rockets(i_loop-1) := rockets(i_loop);
--					end loop;
--					rockets(74) := std_logic_vector(to_unsigned(0,50));
--					timer_update_rockets := 0;
--				else
--					timer_update_rockets := 1;
--				end if;
					
					if(current_rocket = 74) then
						current_rocket := 0;
						update_rockets := '0'; generate_subarine := '1';
					else
						current_rocket := current_rocket + 1;
					end if;
				
				-- Generate submarines
				elsif(generate_subarine = '1') then
					
					if(cycle_cnt = 100) then
						
						if(ask_read = '0') then

							if(nb_submarines < 10) then -- if there is less than 10 submarines, we try to add one
							  
								tmp_random := to_integer(unsigned(magn_g_y(5 downto 0))); -- to take a random number
								if (tmp_random >= 48) then -- 2^6 can be greater than 50
									tmp_random := tmp_random - 16;
								end if;
--								tmp_random := tmp_random + 1;
								
								if(tmp_random = old_random or (tmp_random = old_random + 1) or (tmp_random = old_random - 1) ) then
									ask_read := '0';
								elsif(submarines(tmp_random) = '0') then -- No submarine in this line => create one
									address_tmp := std_logic_vector(to_unsigned(tmp_random,6));
									address_a_sub <= address_tmp (5 downto 1); -- To divide by 2
									--address_a_sub <= std_logic_vector(to_unsigned(tmp_random/2,5)); 	
									rd_en_a_sub <= '1';
									wr_en_a_sub <= '0';
									ask_read := '1';
									submarines(tmp_random) := '1';
									old_random := tmp_random;
								else						 -- There is a submarine
									ask_read := '0';
									old_random := tmp_random;
								end if;
							end if;
							
						else
							first_data_sub(15 downto 0) := q_a_sub(31 downto 16);
							second_data_sub(15 downto 0) := q_a_sub(15 downto 0);
							
							if(std_logic_vector(to_unsigned(tmp_random,6))(0) = '0') then
								if ( sign_g_y = '1') then -- too choose the direction
									first_data_sub := "000010" & (std_logic_vector(to_unsigned(760,10)));
								else
									first_data_sub := "000011" & (std_logic_vector(to_unsigned(0,10)));
								end if;
							else
								if ( sign_g_y = '1') then -- too choose the direction
									second_data_sub := "000010" & (std_logic_vector(to_unsigned(760,10)));
								else
									second_data_sub := "000011" & (std_logic_vector(to_unsigned(0,10)));
								end if;
							end if;
							
							nb_submarines := nb_submarines +1;
							data_a_sub <= first_data_sub & second_data_sub;
							address_a_sub <= address_tmp (5 downto 1);
							wr_en_a_sub <= '1';
							rd_en_a_sub <= '0';
							generate_subarine := '0';
							ask_read := '0';
						end if;
					end if;
				
				-- Generate rockets
--				elsif(generate_rocket = '1') then
--						for i_loop in 0 to 4 loop
--						--for i_loop in 0 to 49 loop
--						
--							index_submarine := shooter + i_loop * 10;
--							address_a_sub <= std_logic_vector(to_unsigned(index_submarine,6));
--							if( q(11) = '1' ) then -- if there is a submarine at this line, it shoots
--							--if( submarines(i_loop)(11) = '1' ) then -- if there is a submarine at this line, it shoots
--								--rockets(i_loop + 25)(to_integer(unsigned(submarines(i_loop)(9 downto 0) + 12) srl 4)) := '1';
--								--rockets(index_submarine + 25)(to_integer(unsigned(submarines(index_submarine)(9 downto 0) + 12) srl 4)) := '1';
--								rockets(index_submarine + 25)(to_integer(unsigned(q(9 downto 0) + 12) srl 4)) := '1';
--							end if;
--						end loop;
--						
--						if(shooter = 9) then
--							shooter := 0;
--						else
--							shooter := shooter + 1;
--						end if;
				end if;
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
				left_boat <= std_logic_vector(to_unsigned(380-((380*(to_integer(unsigned(magn_g_y))))/256),10));
				--left_boat <= "0100101100" + magn_g_y(8 downto 1);
			else
				left_boat <= std_logic_vector(to_unsigned(380+((380*(to_integer(unsigned(magn_g_y))))/256),10));
				--left_boat <= "0100101100" - magn_g_y(8 downto 1);
			end if;
			right_boat <= left_boat + 40;
		
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
			if( ((v_cnt >= top_boat) and (v_cnt <= bottom_boat)) and ((h_cnt >= left_boat) and (h_cnt <= right_boat)) ) then
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
			
			-- ligne "magenta" degueulasse
			if( (v_cnt = 199) and ((h_cnt >= 0) and (h_cnt <= 799)) ) then
				blue_signal <= '1';
				red_signal <= '0';
				green_signal <= '1';
			end if;
			
			-- submarines -------------------------------------------------------------------
			
			-- Load the first line (submarines) from memory before entering for the first time
			if( v_cnt = 199 and h_cnt = 799) then
				address_b_sub <= "00000";
				rd_en_b_sub <= '1';
				wr_en_b_sub <= '0';
				current_submarine_line := 199;
			end if;
			
			if( (v_cnt >= 200) and (h_cnt >= 0) and (h_cnt <= 799) ) then
				
				-- Get the data loaded from memory
				if( (v_cnt - current_submarine_line) = 1 and h_cnt = 0) then
					first_row_sub(15 downto 0) := q_b_sub(31 downto 16);
					second_row_sub(15 downto 0) := q_b_sub(15 downto 0);
					rd_en_b_sub <= '0';
				end if;
				
				-- first part
				if( (v_cnt - current_submarine_line) <= 8 ) then
					if(first_row_sub(11) = '1') then
						if( (h_cnt(9 downto 0) >= first_row_sub(9 downto 0)) and (h_cnt(9 downto 0) <= first_row_sub(9 downto 0) + 40) ) then
							blue_signal <= '0';
							red_signal <= '0';
							green_signal <= '0';
						end if;
					end if;
				
				-- second part
				elsif( (v_cnt - current_submarine_line) <= 16) then
					if(second_row_sub(11) = '1') then
						if( (h_cnt(9 downto 0) >= second_row_sub(9 downto 0)) and (h_cnt(9 downto 0) <= second_row_sub(9 downto 0) + 40) ) then
							blue_signal <= '0';
							red_signal <= '0';
							green_signal <= '0';
						end if;
					end if;

				end if;
				-- Load data for next lines
				if( (v_cnt - current_submarine_line) = 16 and h_cnt = 799) then
					address_b_sub <= address_b_sub + 1;
					rd_en_b_sub <= '1';
					wr_en_b_sub <= '0';
					current_submarine_line := current_submarine_line + 16;
				end if;
			end if;
			

			
--			-- Rockets -------------------------------------------------------------------
--			
--			-- Load the first line (rockets) from memory before entering for the first time
--			if( v_cnt = 0 and h_cnt = 0) then
--				address_b_roc <= "000000"; 
--				rd_en_b_roc <= '1';
--				wr_en_b_roc <= '0';
--				current_rocket_line := -1;
--			end if;
--			
--			if( (v_cnt >= 0) and (v_cnt <= 599) and (h_cnt > 0) and (h_cnt <= 799) ) then
--
--				-- Get the data loaded from memory
--				if( (v_cnt - current_rocket_line) = 1 and h_cnt = 0) then
--					first_row_roc(127 downto 0) := q_b_roc(255 downto 128);
--					second_row_roc(127 downto 0) := q_b_roc(127 downto 0);
--				end if;
--				
--				-- first part
--				if( (v_cnt - current_rocket_line) <= 8 ) then
--					if(first_row_roc(to_integer(unsigned(h_cnt) srl 3)) = '1') then
--						blue_signal <= '0';
--						red_signal <= '1';
--						green_signal <= '0';
--					end if;
--				
--				-- second part
--				elsif( (v_cnt - current_rocket_line) <= 16) then
--					if(second_row_roc(to_integer(unsigned(h_cnt) srl 3)) = '1') then
--						blue_signal <= '0';
--						red_signal <= '1';
--						green_signal <= '0';
--					end if;
--				end if;
--				
--				-- Load data for next lines
--				if( (v_cnt - current_rocket_line) = 16 and h_cnt = 799) then
--					address_b_roc <= address_b_roc + 1;
--					rd_en_b_roc <= '1';
--					wr_en_b_roc <= '0';
--					current_rocket_line := current_rocket_line + 16;
--				end if;
--				
--			end if;


			-- life
			if(v_cnt = 9 and h_cnt = 799) then
				address_b_roc <= "001000";
				data_b_roc <= vector_debug & "1010101010101010101010101010101010101010";
				wr_en_b_roc <= '1';
				rd_en_b_roc <= '0';
			end if;
				
			if(v_cnt = 9 and h_cnt = 1039) then
				address_b_roc <= "001000";
				wr_en_b_roc <= '0';
				rd_en_b_roc <= '1';
			end if;
			
			if(v_cnt >= 10 and v_cnt <= 15 and h_cnt >= 0 and h_cnt <= 255) then
				if(q_b_roc(to_integer(unsigned(h_cnt))) = '1') then
					red_signal <= '1';
					green_signal <= '0';
					blue_signal <= '0';
				else
					red_signal <= '0';
					green_signal <= '0';
					blue_signal <= '0';
				end if;
			end if;
			
			
--			-- DEBUG
--			if(v_cnt >= 10 and v_cnt <= 21 and h_cnt >= 0 and h_cnt <= 399) then
--				if (submarines(to_integer(unsigned(h_cnt) srl 3)) = '1') then
--					red_signal <= '1';
--					green_signal <= '0';
--					blue_signal <= '0';
--				else
--					red_signal <= '0';
--					green_signal <= '0';
--					blue_signal <= '0';
--				end if;
--			end if;
		
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
