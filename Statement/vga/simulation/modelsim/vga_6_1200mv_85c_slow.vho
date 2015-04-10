-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"

-- DATE "03/19/2015 14:26:24"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	vga IS
    PORT (
	CLOCK_50 : IN std_logic;
	GPIO_1_D : BUFFER std_logic_vector(33 DOWNTO 0)
	);
END vga;

-- Design Ports Information
-- GPIO_1_D[0]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[1]	=>  Location: PIN_T15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[2]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[3]	=>  Location: PIN_T13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[4]	=>  Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[5]	=>  Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[6]	=>  Location: PIN_T14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[7]	=>  Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[8]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[9]	=>  Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[10]	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[11]	=>  Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[12]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[13]	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[14]	=>  Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[15]	=>  Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[16]	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[17]	=>  Location: PIN_K15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[18]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[19]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[20]	=>  Location: PIN_L16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[21]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[22]	=>  Location: PIN_B1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[23]	=>  Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[24]	=>  Location: PIN_P14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[25]	=>  Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[26]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[27]	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[28]	=>  Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[29]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[30]	=>  Location: PIN_G1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[31]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[32]	=>  Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1_D[33]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CLOCK_50	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF vga IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_GPIO_1_D : std_logic_vector(33 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GPIO_1_D[0]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[1]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[2]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[3]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[4]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[5]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[6]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[7]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[8]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[9]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[10]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[11]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[12]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[13]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[14]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[15]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[16]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[17]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[18]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[19]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[20]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[21]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[22]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[23]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[24]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[25]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[26]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[27]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[28]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[29]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[30]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[31]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[32]~output_o\ : std_logic;
SIGNAL \GPIO_1_D[33]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \h_cnt~1_combout\ : std_logic;
SIGNAL \vga_gen~14_combout\ : std_logic;
SIGNAL \vga_gen~9_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \h_cnt~0_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \LessThan4~1_combout\ : std_logic;
SIGNAL \LessThan12~0_combout\ : std_logic;
SIGNAL \horizontal_en~q\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \vga_gen~10_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \v_cnt[9]~0_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \v_cnt[10]~1_combout\ : std_logic;
SIGNAL \vga_gen~11_combout\ : std_logic;
SIGNAL \vga_gen~0_combout\ : std_logic;
SIGNAL \vga_gen~12_combout\ : std_logic;
SIGNAL \vga_gen~13_combout\ : std_logic;
SIGNAL \v_cnt~9_combout\ : std_logic;
SIGNAL \v_cnt[10]~3_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \v_cnt~10_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \v_cnt~11_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \v_cnt~8_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \v_cnt~7_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \v_cnt~2_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \v_cnt~4_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \v_cnt~6_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \v_cnt~5_combout\ : std_logic;
SIGNAL \LessThan13~1_combout\ : std_logic;
SIGNAL \LessThan13~0_combout\ : std_logic;
SIGNAL \LessThan13~2_combout\ : std_logic;
SIGNAL \vertical_en~q\ : std_logic;
SIGNAL \video_en~0_combout\ : std_logic;
SIGNAL \video_en~q\ : std_logic;
SIGNAL \LessThan5~1_combout\ : std_logic;
SIGNAL \green_signal~6_combout\ : std_logic;
SIGNAL \green_signal~5_combout\ : std_logic;
SIGNAL \green_signal~7_combout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \LessThan4~0_combout\ : std_logic;
SIGNAL \green_signal~4_combout\ : std_logic;
SIGNAL \green_signal~8_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \green_signal~0_combout\ : std_logic;
SIGNAL \green_signal~1_combout\ : std_logic;
SIGNAL \green_signal~2_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \green_signal~3_combout\ : std_logic;
SIGNAL \green_signal~9_combout\ : std_logic;
SIGNAL \green_signal~q\ : std_logic;
SIGNAL \GPIO_1_D~0_combout\ : std_logic;
SIGNAL \GPIO_1_D[3]~reg0_q\ : std_logic;
SIGNAL \vga_gen~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \vga_gen~1_combout\ : std_logic;
SIGNAL \vga_gen~3_combout\ : std_logic;
SIGNAL \h_sync~q\ : std_logic;
SIGNAL \GPIO_1_D[7]~reg0_q\ : std_logic;
SIGNAL \vga_gen~6_combout\ : std_logic;
SIGNAL \vga_gen~4_combout\ : std_logic;
SIGNAL \vga_gen~5_combout\ : std_logic;
SIGNAL \vga_gen~7_combout\ : std_logic;
SIGNAL \vga_gen~8_combout\ : std_logic;
SIGNAL \v_sync~q\ : std_logic;
SIGNAL \GPIO_1_D[9]~reg0_q\ : std_logic;
SIGNAL v_cnt : std_logic_vector(10 DOWNTO 0);
SIGNAL h_cnt : std_logic_vector(10 DOWNTO 0);

BEGIN

ww_CLOCK_50 <= CLOCK_50;
GPIO_1_D <= ww_GPIO_1_D;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

-- Location: IOOBUF_X29_Y0_N2
\GPIO_1_D[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[0]~output_o\);

-- Location: IOOBUF_X45_Y0_N16
\GPIO_1_D[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[1]~output_o\);

-- Location: IOOBUF_X53_Y22_N2
\GPIO_1_D[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[2]~output_o\);

-- Location: IOOBUF_X40_Y0_N16
\GPIO_1_D[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \GPIO_1_D[3]~reg0_q\,
	devoe => ww_devoe,
	o => \GPIO_1_D[3]~output_o\);

-- Location: IOOBUF_X23_Y34_N16
\GPIO_1_D[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[4]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\GPIO_1_D[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[5]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\GPIO_1_D[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[6]~output_o\);

-- Location: IOOBUF_X36_Y0_N23
\GPIO_1_D[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \GPIO_1_D[7]~reg0_q\,
	devoe => ww_devoe,
	o => \GPIO_1_D[7]~output_o\);

-- Location: IOOBUF_X23_Y34_N23
\GPIO_1_D[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[8]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\GPIO_1_D[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \GPIO_1_D[9]~reg0_q\,
	devoe => ww_devoe,
	o => \GPIO_1_D[9]~output_o\);

-- Location: IOOBUF_X0_Y25_N9
\GPIO_1_D[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[10]~output_o\);

-- Location: IOOBUF_X14_Y0_N23
\GPIO_1_D[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[11]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\GPIO_1_D[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[12]~output_o\);

-- Location: IOOBUF_X16_Y0_N16
\GPIO_1_D[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[13]~output_o\);

-- Location: IOOBUF_X53_Y30_N2
\GPIO_1_D[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[14]~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\GPIO_1_D[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[15]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\GPIO_1_D[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[16]~output_o\);

-- Location: IOOBUF_X53_Y13_N9
\GPIO_1_D[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[17]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\GPIO_1_D[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[18]~output_o\);

-- Location: IOOBUF_X40_Y34_N2
\GPIO_1_D[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[19]~output_o\);

-- Location: IOOBUF_X53_Y11_N9
\GPIO_1_D[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[20]~output_o\);

-- Location: IOOBUF_X31_Y34_N2
\GPIO_1_D[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[21]~output_o\);

-- Location: IOOBUF_X0_Y28_N9
\GPIO_1_D[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[22]~output_o\);

-- Location: IOOBUF_X0_Y5_N23
\GPIO_1_D[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[23]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\GPIO_1_D[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[24]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\GPIO_1_D[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[25]~output_o\);

-- Location: IOOBUF_X51_Y34_N16
\GPIO_1_D[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[26]~output_o\);

-- Location: IOOBUF_X0_Y12_N9
\GPIO_1_D[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[27]~output_o\);

-- Location: IOOBUF_X20_Y34_N16
\GPIO_1_D[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[28]~output_o\);

-- Location: IOOBUF_X31_Y34_N9
\GPIO_1_D[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[29]~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\GPIO_1_D[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[30]~output_o\);

-- Location: IOOBUF_X53_Y21_N23
\GPIO_1_D[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[31]~output_o\);

-- Location: IOOBUF_X0_Y12_N2
\GPIO_1_D[32]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[32]~output_o\);

-- Location: IOOBUF_X53_Y15_N9
\GPIO_1_D[33]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1_D[33]~output_o\);

-- Location: IOIBUF_X27_Y0_N22
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G18
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X25_Y16_N4
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = h_cnt(0) $ (VCC)
-- \Add0~1\ = CARRY(h_cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => h_cnt(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: FF_X25_Y16_N5
\h_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(0));

-- Location: LCCOMB_X25_Y16_N6
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (h_cnt(1) & (!\Add0~1\)) # (!h_cnt(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!h_cnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: FF_X25_Y16_N7
\h_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(1));

-- Location: LCCOMB_X25_Y16_N8
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (h_cnt(2) & (\Add0~3\ $ (GND))) # (!h_cnt(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((h_cnt(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => h_cnt(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: FF_X25_Y16_N9
\h_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(2));

-- Location: LCCOMB_X25_Y16_N10
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (h_cnt(3) & (!\Add0~5\)) # (!h_cnt(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!h_cnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: FF_X25_Y16_N11
\h_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(3));

-- Location: LCCOMB_X25_Y16_N30
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (h_cnt(1) & (h_cnt(0) & (h_cnt(2) & h_cnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(1),
	datab => h_cnt(0),
	datac => h_cnt(2),
	datad => h_cnt(3),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X25_Y16_N22
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (h_cnt(9) & (!\Add0~17\)) # (!h_cnt(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!h_cnt(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X25_Y16_N24
\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = \Add0~19\ $ (!h_cnt(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => h_cnt(10),
	cin => \Add0~19\,
	combout => \Add0~20_combout\);

-- Location: LCCOMB_X24_Y16_N2
\h_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \h_cnt~1_combout\ = (\Add0~20_combout\ & \Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~20_combout\,
	datac => \Equal0~2_combout\,
	combout => \h_cnt~1_combout\);

-- Location: FF_X24_Y16_N3
\h_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \h_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(10));

-- Location: LCCOMB_X24_Y16_N26
\vga_gen~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~14_combout\ = (!h_cnt(9) & !h_cnt(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(9),
	datac => h_cnt(8),
	combout => \vga_gen~14_combout\);

-- Location: LCCOMB_X25_Y16_N28
\vga_gen~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~9_combout\ = (!h_cnt(4) & (!h_cnt(7) & (!h_cnt(5) & !h_cnt(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(4),
	datab => h_cnt(7),
	datac => h_cnt(5),
	datad => h_cnt(6),
	combout => \vga_gen~9_combout\);

-- Location: LCCOMB_X24_Y16_N4
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (((!\vga_gen~9_combout\) # (!\vga_gen~14_combout\)) # (!h_cnt(10))) # (!\Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => h_cnt(10),
	datac => \vga_gen~14_combout\,
	datad => \vga_gen~9_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X25_Y16_N12
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (h_cnt(4) & (\Add0~7\ $ (GND))) # (!h_cnt(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((h_cnt(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X24_Y16_N12
\h_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \h_cnt~0_combout\ = (\Equal0~2_combout\ & \Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~2_combout\,
	datac => \Add0~8_combout\,
	combout => \h_cnt~0_combout\);

-- Location: FF_X24_Y16_N13
\h_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \h_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(4));

-- Location: LCCOMB_X25_Y16_N14
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (h_cnt(5) & (!\Add0~9\)) # (!h_cnt(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!h_cnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => h_cnt(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: FF_X25_Y16_N15
\h_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(5));

-- Location: LCCOMB_X25_Y16_N16
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (h_cnt(6) & (\Add0~11\ $ (GND))) # (!h_cnt(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((h_cnt(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => h_cnt(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: FF_X25_Y16_N17
\h_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(6));

-- Location: LCCOMB_X25_Y16_N18
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (h_cnt(7) & (!\Add0~13\)) # (!h_cnt(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!h_cnt(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => h_cnt(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: FF_X25_Y16_N19
\h_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(7));

-- Location: LCCOMB_X25_Y16_N20
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (h_cnt(8) & (\Add0~15\ $ (GND))) # (!h_cnt(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((h_cnt(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => h_cnt(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: FF_X25_Y16_N21
\h_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(8));

-- Location: FF_X25_Y16_N23
\h_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_cnt(9));

-- Location: LCCOMB_X24_Y16_N30
\LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan4~1_combout\ = (!h_cnt(7) & (!h_cnt(5) & !h_cnt(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => h_cnt(7),
	datac => h_cnt(5),
	datad => h_cnt(6),
	combout => \LessThan4~1_combout\);

-- Location: LCCOMB_X24_Y16_N18
\LessThan12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan12~0_combout\ = (!h_cnt(10) & (((\LessThan4~1_combout\) # (!h_cnt(8))) # (!h_cnt(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(9),
	datab => h_cnt(10),
	datac => h_cnt(8),
	datad => \LessThan4~1_combout\,
	combout => \LessThan12~0_combout\);

-- Location: FF_X24_Y16_N19
horizontal_en : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \horizontal_en~q\);

-- Location: LCCOMB_X23_Y17_N0
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = v_cnt(0) $ (VCC)
-- \Add1~1\ = CARRY(v_cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X24_Y16_N0
\vga_gen~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~10_combout\ = (!\Equal0~1_combout\ & (!h_cnt(9) & (!h_cnt(8) & \vga_gen~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => h_cnt(9),
	datac => h_cnt(8),
	datad => \vga_gen~9_combout\,
	combout => \vga_gen~10_combout\);

-- Location: LCCOMB_X23_Y17_N16
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (v_cnt(8) & (\Add1~15\ $ (GND))) # (!v_cnt(8) & (!\Add1~15\ & VCC))
-- \Add1~17\ = CARRY((v_cnt(8) & !\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(8),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X23_Y17_N18
\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (v_cnt(9) & (!\Add1~17\)) # (!v_cnt(9) & ((\Add1~17\) # (GND)))
-- \Add1~19\ = CARRY((!\Add1~17\) # (!v_cnt(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(9),
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: LCCOMB_X23_Y17_N30
\v_cnt[9]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt[9]~0_combout\ = (\vga_gen~13_combout\ & ((\Equal0~2_combout\ & ((v_cnt(9)))) # (!\Equal0~2_combout\ & (\Add1~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~18_combout\,
	datab => \Equal0~2_combout\,
	datac => v_cnt(9),
	datad => \vga_gen~13_combout\,
	combout => \v_cnt[9]~0_combout\);

-- Location: FF_X23_Y17_N31
\v_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(9));

-- Location: LCCOMB_X23_Y17_N20
\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = \Add1~19\ $ (!v_cnt(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => v_cnt(10),
	cin => \Add1~19\,
	combout => \Add1~20_combout\);

-- Location: LCCOMB_X23_Y17_N24
\v_cnt[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt[10]~1_combout\ = (\vga_gen~13_combout\ & ((\Equal0~2_combout\ & ((v_cnt(10)))) # (!\Equal0~2_combout\ & (\Add1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~20_combout\,
	datab => \Equal0~2_combout\,
	datac => v_cnt(10),
	datad => \vga_gen~13_combout\,
	combout => \v_cnt[10]~1_combout\);

-- Location: FF_X23_Y17_N25
\v_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(10));

-- Location: LCCOMB_X24_Y17_N24
\vga_gen~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~11_combout\ = (!v_cnt(6) & (!v_cnt(8) & (!v_cnt(10) & !v_cnt(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(6),
	datab => v_cnt(8),
	datac => v_cnt(10),
	datad => v_cnt(5),
	combout => \vga_gen~11_combout\);

-- Location: LCCOMB_X24_Y17_N26
\vga_gen~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~0_combout\ = (!v_cnt(0) & (!v_cnt(2) & !v_cnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => v_cnt(0),
	datac => v_cnt(2),
	datad => v_cnt(1),
	combout => \vga_gen~0_combout\);

-- Location: LCCOMB_X24_Y17_N2
\vga_gen~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~12_combout\ = (\vga_gen~11_combout\ & (((\vga_gen~0_combout\) # (!v_cnt(4))) # (!v_cnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(3),
	datab => \vga_gen~11_combout\,
	datac => \vga_gen~0_combout\,
	datad => v_cnt(4),
	combout => \vga_gen~12_combout\);

-- Location: LCCOMB_X24_Y17_N28
\vga_gen~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~13_combout\ = (\vga_gen~10_combout\) # (((\LessThan13~1_combout\) # (\vga_gen~12_combout\)) # (!h_cnt(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga_gen~10_combout\,
	datab => h_cnt(10),
	datac => \LessThan13~1_combout\,
	datad => \vga_gen~12_combout\,
	combout => \vga_gen~13_combout\);

-- Location: LCCOMB_X24_Y17_N20
\v_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~9_combout\ = (\Add1~0_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~0_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~9_combout\);

-- Location: LCCOMB_X24_Y17_N30
\v_cnt[10]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt[10]~3_combout\ = (!\vga_gen~13_combout\) # (!\Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt[10]~3_combout\);

-- Location: FF_X24_Y17_N21
\v_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~9_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(0));

-- Location: LCCOMB_X23_Y17_N2
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (v_cnt(1) & (!\Add1~1\)) # (!v_cnt(1) & ((\Add1~1\) # (GND)))
-- \Add1~3\ = CARRY((!\Add1~1\) # (!v_cnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X24_Y17_N6
\v_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~10_combout\ = (\Add1~2_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~10_combout\);

-- Location: FF_X24_Y17_N7
\v_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~10_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(1));

-- Location: LCCOMB_X23_Y17_N4
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (v_cnt(2) & (\Add1~3\ $ (GND))) # (!v_cnt(2) & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((v_cnt(2) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_cnt(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X24_Y17_N8
\v_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~11_combout\ = (\Add1~4_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~4_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~11_combout\);

-- Location: FF_X24_Y17_N9
\v_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~11_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(2));

-- Location: LCCOMB_X23_Y17_N6
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (v_cnt(3) & (!\Add1~5\)) # (!v_cnt(3) & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!v_cnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_cnt(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X24_Y17_N10
\v_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~8_combout\ = (\Add1~6_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~6_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~8_combout\);

-- Location: FF_X24_Y17_N11
\v_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~8_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(3));

-- Location: LCCOMB_X23_Y17_N8
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (v_cnt(4) & (\Add1~7\ $ (GND))) # (!v_cnt(4) & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((v_cnt(4) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_cnt(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X24_Y17_N16
\v_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~7_combout\ = (\Add1~8_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~8_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~7_combout\);

-- Location: FF_X24_Y17_N17
\v_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~7_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(4));

-- Location: LCCOMB_X23_Y17_N10
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (v_cnt(5) & (!\Add1~9\)) # (!v_cnt(5) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!v_cnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_cnt(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X24_Y17_N0
\v_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~2_combout\ = (\Add1~10_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~10_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~2_combout\);

-- Location: FF_X24_Y17_N1
\v_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~2_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(5));

-- Location: LCCOMB_X23_Y17_N12
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (v_cnt(6) & (\Add1~11\ $ (GND))) # (!v_cnt(6) & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((v_cnt(6) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_cnt(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X24_Y17_N18
\v_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~4_combout\ = (\Add1~12_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~12_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~4_combout\);

-- Location: FF_X24_Y17_N19
\v_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~4_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(6));

-- Location: LCCOMB_X23_Y17_N14
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (v_cnt(7) & (!\Add1~13\)) # (!v_cnt(7) & ((\Add1~13\) # (GND)))
-- \Add1~15\ = CARRY((!\Add1~13\) # (!v_cnt(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_cnt(7),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X24_Y17_N14
\v_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~6_combout\ = (\Add1~14_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~14_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~6_combout\);

-- Location: FF_X24_Y17_N15
\v_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~6_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(7));

-- Location: LCCOMB_X24_Y17_N4
\v_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_cnt~5_combout\ = (\Add1~16_combout\ & \vga_gen~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~16_combout\,
	datad => \vga_gen~13_combout\,
	combout => \v_cnt~5_combout\);

-- Location: FF_X24_Y17_N5
\v_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_cnt~5_combout\,
	ena => \v_cnt[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_cnt(8));

-- Location: LCCOMB_X25_Y17_N12
\LessThan13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~1_combout\ = (!v_cnt(10) & (((!v_cnt(8) & !v_cnt(7))) # (!v_cnt(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(8),
	datab => v_cnt(9),
	datac => v_cnt(10),
	datad => v_cnt(7),
	combout => \LessThan13~1_combout\);

-- Location: LCCOMB_X25_Y17_N2
\LessThan13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~0_combout\ = (v_cnt(6) & ((v_cnt(5)) # ((v_cnt(3) & v_cnt(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(5),
	datab => v_cnt(3),
	datac => v_cnt(4),
	datad => v_cnt(6),
	combout => \LessThan13~0_combout\);

-- Location: LCCOMB_X25_Y17_N24
\LessThan13~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~2_combout\ = (\LessThan13~1_combout\ & ((!\LessThan13~0_combout\) # (!v_cnt(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan13~1_combout\,
	datab => v_cnt(9),
	datad => \LessThan13~0_combout\,
	combout => \LessThan13~2_combout\);

-- Location: FF_X25_Y17_N25
vertical_en : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \LessThan13~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vertical_en~q\);

-- Location: LCCOMB_X25_Y17_N8
\video_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \video_en~0_combout\ = (\horizontal_en~q\ & \vertical_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \horizontal_en~q\,
	datad => \vertical_en~q\,
	combout => \video_en~0_combout\);

-- Location: FF_X25_Y17_N9
video_en : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \video_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \video_en~q\);

-- Location: LCCOMB_X24_Y16_N10
\LessThan5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~1_combout\ = (h_cnt(4) & (h_cnt(7) & (h_cnt(5) & h_cnt(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(4),
	datab => h_cnt(7),
	datac => h_cnt(5),
	datad => h_cnt(6),
	combout => \LessThan5~1_combout\);

-- Location: LCCOMB_X23_Y17_N26
\green_signal~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~6_combout\ = (!h_cnt(9) & ((v_cnt(8)) # ((v_cnt(6) & v_cnt(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(8),
	datab => v_cnt(6),
	datac => v_cnt(7),
	datad => h_cnt(9),
	combout => \green_signal~6_combout\);

-- Location: LCCOMB_X24_Y16_N28
\green_signal~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~5_combout\ = (h_cnt(8) & !h_cnt(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => h_cnt(8),
	datad => h_cnt(10),
	combout => \green_signal~5_combout\);

-- Location: LCCOMB_X24_Y16_N8
\green_signal~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~7_combout\ = (!\LessThan4~1_combout\ & (\green_signal~6_combout\ & (!v_cnt(9) & \green_signal~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~1_combout\,
	datab => \green_signal~6_combout\,
	datac => v_cnt(9),
	datad => \green_signal~5_combout\,
	combout => \green_signal~7_combout\);

-- Location: LCCOMB_X25_Y16_N0
\LessThan5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (h_cnt(3)) # ((h_cnt(2) & ((h_cnt(1)) # (h_cnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(1),
	datab => h_cnt(0),
	datac => h_cnt(2),
	datad => h_cnt(3),
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X24_Y16_N22
\LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan4~0_combout\ = (!h_cnt(4) & (!h_cnt(7) & !h_cnt(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(4),
	datab => h_cnt(7),
	datad => h_cnt(6),
	combout => \LessThan4~0_combout\);

-- Location: LCCOMB_X24_Y16_N24
\green_signal~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~4_combout\ = ((h_cnt(2) & h_cnt(3))) # (!\LessThan4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~0_combout\,
	datab => h_cnt(2),
	datac => h_cnt(3),
	combout => \green_signal~4_combout\);

-- Location: LCCOMB_X24_Y16_N20
\green_signal~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~8_combout\ = (\green_signal~7_combout\ & (\green_signal~4_combout\ & ((!\LessThan5~0_combout\) # (!\LessThan5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~1_combout\,
	datab => \green_signal~7_combout\,
	datac => \LessThan5~0_combout\,
	datad => \green_signal~4_combout\,
	combout => \green_signal~8_combout\);

-- Location: LCCOMB_X24_Y17_N12
\LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (v_cnt(5)) # ((v_cnt(4) & ((v_cnt(3)) # (!\vga_gen~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(3),
	datab => v_cnt(4),
	datac => \vga_gen~0_combout\,
	datad => v_cnt(5),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X25_Y17_N28
\LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (v_cnt(7) & (v_cnt(8) & ((v_cnt(6)) # (\LessThan3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(7),
	datab => v_cnt(6),
	datac => v_cnt(8),
	datad => \LessThan3~0_combout\,
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X25_Y17_N26
\green_signal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~0_combout\ = (v_cnt(8) & ((v_cnt(7)) # ((v_cnt(6)) # (v_cnt(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(7),
	datab => v_cnt(6),
	datac => v_cnt(5),
	datad => v_cnt(8),
	combout => \green_signal~0_combout\);

-- Location: LCCOMB_X25_Y17_N4
\green_signal~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~1_combout\ = (\green_signal~q\ & ((v_cnt(10)) # ((\green_signal~0_combout\ & v_cnt(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \green_signal~0_combout\,
	datab => v_cnt(9),
	datac => v_cnt(10),
	datad => \green_signal~q\,
	combout => \green_signal~1_combout\);

-- Location: LCCOMB_X25_Y17_N16
\green_signal~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~2_combout\ = (v_cnt(9) & ((v_cnt(7)) # ((v_cnt(5)) # (v_cnt(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(7),
	datab => v_cnt(9),
	datac => v_cnt(5),
	datad => v_cnt(6),
	combout => \green_signal~2_combout\);

-- Location: LCCOMB_X25_Y17_N22
\LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (!v_cnt(5) & (!v_cnt(3) & !v_cnt(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(5),
	datab => v_cnt(3),
	datac => v_cnt(4),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X25_Y17_N10
\green_signal~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~3_combout\ = (!v_cnt(10) & ((v_cnt(8) & (!\green_signal~2_combout\)) # (!v_cnt(8) & ((!\LessThan2~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(10),
	datab => \green_signal~2_combout\,
	datac => \LessThan2~0_combout\,
	datad => v_cnt(8),
	combout => \green_signal~3_combout\);

-- Location: LCCOMB_X25_Y17_N18
\green_signal~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \green_signal~9_combout\ = (\green_signal~1_combout\) # ((\green_signal~8_combout\ & (!\LessThan3~1_combout\ & \green_signal~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \green_signal~8_combout\,
	datab => \LessThan3~1_combout\,
	datac => \green_signal~1_combout\,
	datad => \green_signal~3_combout\,
	combout => \green_signal~9_combout\);

-- Location: FF_X25_Y17_N19
green_signal : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \green_signal~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \green_signal~q\);

-- Location: LCCOMB_X25_Y17_N20
\GPIO_1_D~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \GPIO_1_D~0_combout\ = (\video_en~q\ & \green_signal~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \video_en~q\,
	datad => \green_signal~q\,
	combout => \GPIO_1_D~0_combout\);

-- Location: DDIOOUTCELL_X40_Y0_N18
\GPIO_1_D[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \GPIO_1_D~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GPIO_1_D[3]~reg0_q\);

-- Location: LCCOMB_X24_Y16_N6
\vga_gen~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~2_combout\ = h_cnt(7) $ ((((!h_cnt(4) & !h_cnt(5))) # (!h_cnt(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(4),
	datab => h_cnt(7),
	datac => h_cnt(5),
	datad => h_cnt(6),
	combout => \vga_gen~2_combout\);

-- Location: LCCOMB_X25_Y16_N26
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (h_cnt(0) & (h_cnt(2) & h_cnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => h_cnt(0),
	datac => h_cnt(2),
	datad => h_cnt(1),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X25_Y16_N2
\vga_gen~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~1_combout\ = (!h_cnt(3) & (!h_cnt(5) & (!\Equal0~0_combout\ & !h_cnt(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_cnt(3),
	datab => h_cnt(5),
	datac => \Equal0~0_combout\,
	datad => h_cnt(7),
	combout => \vga_gen~1_combout\);

-- Location: LCCOMB_X24_Y16_N16
\vga_gen~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~3_combout\ = (\vga_gen~2_combout\) # (((\vga_gen~1_combout\) # (!h_cnt(9))) # (!\green_signal~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga_gen~2_combout\,
	datab => \green_signal~5_combout\,
	datac => h_cnt(9),
	datad => \vga_gen~1_combout\,
	combout => \vga_gen~3_combout\);

-- Location: FF_X24_Y16_N17
h_sync : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \vga_gen~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_sync~q\);

-- Location: DDIOOUTCELL_X36_Y0_N25
\GPIO_1_D[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \h_sync~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GPIO_1_D[7]~reg0_q\);

-- Location: LCCOMB_X23_Y17_N28
\vga_gen~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~6_combout\ = ((v_cnt(2) & (v_cnt(7))) # (!v_cnt(2) & ((v_cnt(6))))) # (!v_cnt(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(9),
	datab => v_cnt(7),
	datac => v_cnt(2),
	datad => v_cnt(6),
	combout => \vga_gen~6_combout\);

-- Location: LCCOMB_X24_Y17_N22
\vga_gen~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~4_combout\ = (!v_cnt(6) & (((v_cnt(1) & v_cnt(0))) # (!\LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(1),
	datab => v_cnt(0),
	datac => v_cnt(6),
	datad => \LessThan2~0_combout\,
	combout => \vga_gen~4_combout\);

-- Location: LCCOMB_X25_Y17_N30
\vga_gen~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~5_combout\ = (!v_cnt(7) & (((!v_cnt(5)) # (!v_cnt(3))) # (!v_cnt(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_cnt(4),
	datab => v_cnt(3),
	datac => v_cnt(5),
	datad => v_cnt(7),
	combout => \vga_gen~5_combout\);

-- Location: LCCOMB_X25_Y17_N0
\vga_gen~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~7_combout\ = (!v_cnt(10) & !v_cnt(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => v_cnt(10),
	datad => v_cnt(8),
	combout => \vga_gen~7_combout\);

-- Location: LCCOMB_X25_Y17_N14
\vga_gen~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \vga_gen~8_combout\ = (\vga_gen~6_combout\) # ((\vga_gen~4_combout\) # ((\vga_gen~5_combout\) # (!\vga_gen~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga_gen~6_combout\,
	datab => \vga_gen~4_combout\,
	datac => \vga_gen~5_combout\,
	datad => \vga_gen~7_combout\,
	combout => \vga_gen~8_combout\);

-- Location: FF_X25_Y17_N15
v_sync : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \vga_gen~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_sync~q\);

-- Location: DDIOOUTCELL_X34_Y0_N4
\GPIO_1_D[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \v_sync~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GPIO_1_D[9]~reg0_q\);

ww_GPIO_1_D(0) <= \GPIO_1_D[0]~output_o\;

ww_GPIO_1_D(1) <= \GPIO_1_D[1]~output_o\;

ww_GPIO_1_D(2) <= \GPIO_1_D[2]~output_o\;

ww_GPIO_1_D(3) <= \GPIO_1_D[3]~output_o\;

ww_GPIO_1_D(4) <= \GPIO_1_D[4]~output_o\;

ww_GPIO_1_D(5) <= \GPIO_1_D[5]~output_o\;

ww_GPIO_1_D(6) <= \GPIO_1_D[6]~output_o\;

ww_GPIO_1_D(7) <= \GPIO_1_D[7]~output_o\;

ww_GPIO_1_D(8) <= \GPIO_1_D[8]~output_o\;

ww_GPIO_1_D(9) <= \GPIO_1_D[9]~output_o\;

ww_GPIO_1_D(10) <= \GPIO_1_D[10]~output_o\;

ww_GPIO_1_D(11) <= \GPIO_1_D[11]~output_o\;

ww_GPIO_1_D(12) <= \GPIO_1_D[12]~output_o\;

ww_GPIO_1_D(13) <= \GPIO_1_D[13]~output_o\;

ww_GPIO_1_D(14) <= \GPIO_1_D[14]~output_o\;

ww_GPIO_1_D(15) <= \GPIO_1_D[15]~output_o\;

ww_GPIO_1_D(16) <= \GPIO_1_D[16]~output_o\;

ww_GPIO_1_D(17) <= \GPIO_1_D[17]~output_o\;

ww_GPIO_1_D(18) <= \GPIO_1_D[18]~output_o\;

ww_GPIO_1_D(19) <= \GPIO_1_D[19]~output_o\;

ww_GPIO_1_D(20) <= \GPIO_1_D[20]~output_o\;

ww_GPIO_1_D(21) <= \GPIO_1_D[21]~output_o\;

ww_GPIO_1_D(22) <= \GPIO_1_D[22]~output_o\;

ww_GPIO_1_D(23) <= \GPIO_1_D[23]~output_o\;

ww_GPIO_1_D(24) <= \GPIO_1_D[24]~output_o\;

ww_GPIO_1_D(25) <= \GPIO_1_D[25]~output_o\;

ww_GPIO_1_D(26) <= \GPIO_1_D[26]~output_o\;

ww_GPIO_1_D(27) <= \GPIO_1_D[27]~output_o\;

ww_GPIO_1_D(28) <= \GPIO_1_D[28]~output_o\;

ww_GPIO_1_D(29) <= \GPIO_1_D[29]~output_o\;

ww_GPIO_1_D(30) <= \GPIO_1_D[30]~output_o\;

ww_GPIO_1_D(31) <= \GPIO_1_D[31]~output_o\;

ww_GPIO_1_D(32) <= \GPIO_1_D[32]~output_o\;

ww_GPIO_1_D(33) <= \GPIO_1_D[33]~output_o\;
END structure;


