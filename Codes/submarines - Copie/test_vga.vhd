library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity test_vga is
end;

architecture test_arch of test_vga is
	signal CLOCK_50 						: std_logic;
	signal GPIO_1_D 						: std_logic_vector(33 downto 0);
	SIGNAL data_x                   	: std_logic_vector(15 DOWNTO 0);
	SIGNAL data_y                   	: std_logic_vector(15 DOWNTO 0);
	SIGNAL	out_red						: std_logic;
	SIGNAL	out_green					: std_logic;
	SIGNAL	out_blue						: std_logic;
	SIGNAL	out_h_sync					: std_logic;
	SIGNAL	out_v_sync					: std_logic;
	constant frames : integer := 2;
	
	-- Description of vga
	component vga
	port(
		CLOCK_50		: in std_logic;
		
		-- FOR THE ACCELEROMETER DATA
		data_x		: in std_logic_vector(9 downto 0);
		data_y		: in std_logic_vector(9 downto 0);
		
		-- FOR THE OUTPUT SIGNALS
		out_red		: out std_logic;
		out_green	: out std_logic;
		out_blue		: out std_logic;
		out_h_sync	: out std_logic;
		out_v_sync	: out std_logic
	);
	end component;
	
	-- beginning of the architecture:: port map
	begin
	DUT : vga
		port map(
		CLOCK_50		=> CLOCK_50,
		data_x		=> data_x(9 DOWNTO 0),
		data_y		=> data_y(9 DOWNTO 0),
			out_red		=> out_red,
			out_blue		=> out_blue,
			out_green	=> out_green,
			out_h_sync	=> out_h_sync,
			out_v_sync	=> out_v_sync
		);
		
	-- Processes declaration
	clk_stimulus : process
	begin
		for i in 1 to frames * 833334 loop
			data_y <= "1010101010";
			CLOCK_50 <= '0';
			wait for 0.01us;
			CLOCK_50 <= '1';
			wait for 0.01us;
		end loop;
		wait;
	
	end process clk_stimulus;
	
end architecture test_arch;