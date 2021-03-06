library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vga_colors is
Port(
	CLOCK_50		: in std_logic;
	GPIO_1_D		: out std_logic_vector(33 downto 0)	
	);
end entity vga_colors;

architecture vga_arch_colors of vga_colors is
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
	-- Sync Colors : 
	signal color : std_logic_vector(2 downto 0) := "000";

begin

vga_gen : process

-- time_cnt est de type varaible car modifié directement par rapport à un signal (voir rappel VHDL)
variable time_cnt : integer := 50000000; 

begin
wait until ( (CLOCK_50' event) and (CLOCK_50 = '1') ) ;

time_cnt := time_cnt-1;
if(time_cnt = 0) then
	color <= color + "001";
	time_cnt := 50000000;
end if;

-- Generate Screen
if( v_cnt >= 0) and (v_cnt <= 799) then
	red_signal <= '0';
	green_signal <= '0';
	blue_signal <= '0';
	if( ((v_cnt >= 200) and (v_cnt <= 400)) and ((h_cnt >= 300) and (h_cnt <= 500)) ) then
		case color is 
		when "000" =>
			red_signal <= '0';
			green_signal <= '0';
			blue_signal <= '0';
		when "001" =>
			red_signal <= '1';
			green_signal <= '0';
			blue_signal <= '0';
		when "010" =>
			red_signal <= '0';
			green_signal <= '1';
			blue_signal <= '0';
		when "011" =>
			red_signal <= '0';
			green_signal <= '0';
			blue_signal <= '1';
		when "100" =>
			red_signal <= '1';
			green_signal <= '1';
			blue_signal <= '0';
		when "101" =>
			red_signal <= '0';
			green_signal <= '1';
			blue_signal <= '1';
		when "110" =>
			red_signal <= '1';
			green_signal <= '0';
			blue_signal <= '1';
		when "111" =>
			red_signal <= '1';
			green_signal <= '1';
			blue_signal <= '1';
		end case;

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

-- Generate Horizontal Enebale
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
GPIO_1_D (1) <= red_signal and video_en;
GPIO_1_D (3) <= green_signal and video_en;
GPIO_1_D (5) <= blue_signal and video_en;
GPIO_1_D (7) <= h_sync;
GPIO_1_D (9) <= v_sync;

end process vga_gen;

end architecture vga_arch_colors;



	