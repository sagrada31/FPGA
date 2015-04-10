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
	
	-- Signal positionning the square
	signal left_bound		: std_logic_vector(9 downto 0) ;--:= std_logic_vector(to_unsigned(300,10));
	signal right_bound	: std_logic_vector(9 downto 0) ;--:= std_logic_vector(to_unsigned(500,10));
	signal top_bound		: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(150,10));
	signal bottom_bound	: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(160,10));
	
	-- To represent acceleration of both directions
	signal sign_g_y		: std_logic;
	shared variable magn_g_y		: std_logic_vector(8 downto 0); -- variable à la place de signal pour eviter clignotement
	shared variable old_magn_g_y		: std_logic_vector(8 downto 0); -- variable à la place de signal pour eviter clignotement
	
	-- Submarines :)
	type Tab    is array(3 downto 0) of std_logic_vector(9 downto 0);
	signal sub_tab  :   Tab;
	
	
begin
	
	--submarines : process (CLOCK_50)
	--begin
		
	
	
	--end process;
	
	bound_horizontal : process (v_sync)
	begin	
		--wait until ( (CLOCK_50'event) and (CLOCK_50 = '1') ) ;
		-- Get the sign of the acceleration over y
		sign_g_y <= data_y(9);
		
		-- Get the magnitude of the acceleration over y
		if (sign_g_y = '0') then
			magn_g_y := (data_y(8 downto 0));
		else 
			magn_g_y := (NOT(data_y(8 downto 0))) + "000000001"; -- 2's complement
		end if;
		
		magn_g_y := std_logic_vector(to_unsigned(to_integer(unsigned(magn_g_y + old_magn_g_y + old_magn_g_y + old_magn_g_y))/4,9));		
		--magn_g_y(1 downto 0) := "00";
		
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
	end process;

	
	---------------------------------------------------------------------------------------------------
	
	
	vga_gen : process
	begin

		wait until ( (CLOCK_50'event) and (CLOCK_50 = '1') ) ;

		-- Generate Screen
		if( v_cnt >= 0) and (v_cnt <= 599) then
			-- sky
			red_signal <= '0';
			green_signal <= '1';
			blue_signal <= '1';
			-- boat
			if( ((v_cnt >= top_bound) and (v_cnt <= bottom_bound)) and ((h_cnt >= left_bound) and (h_cnt <= right_bound)) ) then
				red_signal <= '1';
				green_signal <= '0';
				blue_signal <= '0';
			end if;
			-- sea
			if( ((v_cnt >= bottom_bound) and (v_cnt <= 599)) and ((h_cnt >= 0) and (h_cnt <= 799)) ) then
				blue_signal <= '1';
				red_signal <= '0';
				green_signal <= '0';
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
