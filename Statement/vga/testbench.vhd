library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity test_vga is
end;

architecture test_arch of test_vga is
	signal CLOCK_50 : std_logic;
	signal GPIO_1_D : std_logic_vector(33 downto 0);
	constant frames : integer := 2;
	
	-- Description of vga
	component vga
	port(
		CLOCK_50		: in std_logic;
		GPIO_1_D		: out std_logic_vector(33 downto 0)
	);
	end component;
	
	-- beginning of the architecture:: port map
	begin
	DUT : vga
		port map(
		CLOCK_50 => CLOCK_50,
		GPIO_1_D => GPIO_1_D
		);
		
	-- Processes declaration
	clk_stimulus : process
	begin
		for i in 1 to frames * 833334 loop
			CLOCK_50 <= '0';
			wait for 0.01us;
			CLOCK_50 <= '1';
			wait for 0.01us;
		end loop;
		wait;
	
	end process clk_stimulus;
	
end architecture test_arch;
