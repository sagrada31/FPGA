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

-- DATE "03/22/2015 09:07:09"

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

ENTITY 	gsensor IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(1 DOWNTO 0);
	G_SENSOR_INT : IN std_logic;
	I2C_SDAT : INOUT std_logic;
	I2C_SCLK : OUT std_logic;
	G_SENSOR_CS_N : OUT std_logic;
	LED : OUT std_logic_vector(7 DOWNTO 0)
	);
END gsensor;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- I2C_SCLK	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- G_SENSOR_CS_N	=>  Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LED[0]	=>  Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LED[1]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LED[2]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LED[3]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LED[4]	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LED[5]	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LED[6]	=>  Location: PIN_B1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LED[7]	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- I2C_SDAT	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- G_SENSOR_INT	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF gsensor IS
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
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_G_SENSOR_INT : std_logic;
SIGNAL ww_I2C_SCLK : std_logic;
SIGNAL ww_G_SENSOR_CS_N : std_logic;
SIGNAL ww_LED : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_spipll|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_spipll|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \u_reset_delay|cont[0]~1_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \u_reset_delay|Add0~0_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~1\ : std_logic;
SIGNAL \u_reset_delay|Add0~2_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~3\ : std_logic;
SIGNAL \u_reset_delay|Add0~4_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~5\ : std_logic;
SIGNAL \u_reset_delay|Add0~6_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~7\ : std_logic;
SIGNAL \u_reset_delay|Add0~8_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~9\ : std_logic;
SIGNAL \u_reset_delay|Add0~10_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~11\ : std_logic;
SIGNAL \u_reset_delay|Add0~12_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~13\ : std_logic;
SIGNAL \u_reset_delay|Add0~14_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~15\ : std_logic;
SIGNAL \u_reset_delay|Add0~16_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~17\ : std_logic;
SIGNAL \u_reset_delay|Add0~18_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~19\ : std_logic;
SIGNAL \u_reset_delay|Add0~20_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~21\ : std_logic;
SIGNAL \u_reset_delay|Add0~22_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~23\ : std_logic;
SIGNAL \u_reset_delay|Add0~24_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~25\ : std_logic;
SIGNAL \u_reset_delay|Add0~26_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~27\ : std_logic;
SIGNAL \u_reset_delay|Add0~28_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~29\ : std_logic;
SIGNAL \u_reset_delay|Add0~30_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~31\ : std_logic;
SIGNAL \u_reset_delay|Add0~32_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~33\ : std_logic;
SIGNAL \u_reset_delay|Add0~34_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~35\ : std_logic;
SIGNAL \u_reset_delay|Add0~36_combout\ : std_logic;
SIGNAL \u_reset_delay|Add0~37\ : std_logic;
SIGNAL \u_reset_delay|Add0~38_combout\ : std_logic;
SIGNAL \u_reset_delay|cont[20]~0_combout\ : std_logic;
SIGNAL \u_reset_delay|oRST_xhdl1~q\ : std_logic;
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[0]~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[1]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[1]~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[2]~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[3]~4_combout\ : std_logic;
SIGNAL \u_spi_ee_config|LessThan0~0_combout\ : std_logic;
SIGNAL \I2C_SDAT~input_o\ : std_logic;
SIGNAL \G_SENSOR_INT~input_o\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~q\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~10_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~q\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~q\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status_d[0]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status_d[1]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status_d[2]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[0]~15_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[14]~45_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[0]~16\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[1]~17_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[1]~18\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[2]~19_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[2]~20\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[3]~21_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[3]~22\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[4]~23_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[4]~24\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[5]~25_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[5]~26\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[6]~27_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[6]~28\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[7]~29_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[7]~30\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[8]~31_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[8]~32\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[9]~33_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[9]~34\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[10]~35_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[10]~36\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[11]~37_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[11]~38\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[12]~39_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[12]~40\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[13]~41_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[13]~42\ : std_logic;
SIGNAL \u_spi_ee_config|read_idle_count[14]~43_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[6]~11_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[15]~12_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~q\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[15]~15_combout\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~q\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count_en~q\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Add0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux7~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[6]~16_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~13_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux6~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux5~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~7_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux8~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~19_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux2~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~17_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux9~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux3~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~18_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux4~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~14_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux11~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux10~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~4_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~5_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~6_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~8_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\ : std_logic;
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oSPI_CLK~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte_d~q\ : std_logic;
SIGNAL \u_spi_ee_config|read_back_d~q\ : std_logic;
SIGNAL \u_spi_ee_config|oDATA_H_xhdl2[1]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_data[7]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_data[7]~0_combout\ : std_logic;
SIGNAL \u_led_driver|temp_xhdl6[3]~2_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~0_combout\ : std_logic;
SIGNAL \u_led_driver|int2_d[1]~feeder_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~24_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~41\ : std_logic;
SIGNAL \u_led_driver|Add0~42_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~4_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~43\ : std_logic;
SIGNAL \u_led_driver|Add0~44_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~3_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~45\ : std_logic;
SIGNAL \u_led_driver|Add0~46_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~0_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count[14]~2_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~1\ : std_logic;
SIGNAL \u_led_driver|Add0~2_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~23_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~3\ : std_logic;
SIGNAL \u_led_driver|Add0~4_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~22_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~5\ : std_logic;
SIGNAL \u_led_driver|Add0~6_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~21_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~7\ : std_logic;
SIGNAL \u_led_driver|Add0~8_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~20_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~9\ : std_logic;
SIGNAL \u_led_driver|Add0~10_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~19_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~11\ : std_logic;
SIGNAL \u_led_driver|Add0~12_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~18_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~13\ : std_logic;
SIGNAL \u_led_driver|Add0~14_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~17_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~15\ : std_logic;
SIGNAL \u_led_driver|Add0~16_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~16_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~17\ : std_logic;
SIGNAL \u_led_driver|Add0~18_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~15_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~19\ : std_logic;
SIGNAL \u_led_driver|Add0~20_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~14_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~21\ : std_logic;
SIGNAL \u_led_driver|Add0~22_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~13_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~23\ : std_logic;
SIGNAL \u_led_driver|Add0~24_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~12_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~25\ : std_logic;
SIGNAL \u_led_driver|Add0~26_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~11_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~27\ : std_logic;
SIGNAL \u_led_driver|Add0~28_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~10_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~29\ : std_logic;
SIGNAL \u_led_driver|Add0~30_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~9_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~31\ : std_logic;
SIGNAL \u_led_driver|Add0~32_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~8_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~33\ : std_logic;
SIGNAL \u_led_driver|Add0~34_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~7_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~35\ : std_logic;
SIGNAL \u_led_driver|Add0~36_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~6_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~37\ : std_logic;
SIGNAL \u_led_driver|Add0~38_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~5_combout\ : std_logic;
SIGNAL \u_led_driver|Add0~39\ : std_logic;
SIGNAL \u_led_driver|Add0~40_combout\ : std_logic;
SIGNAL \u_led_driver|int2_count~1_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[0]~14_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[2]~15_combout\ : std_logic;
SIGNAL \u_led_driver|temp_xhdl6[2]~0_combout\ : std_logic;
SIGNAL \u_led_driver|temp_xhdl6[2]~1_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[0]~16_combout\ : std_logic;
SIGNAL \u_led_driver|temp_xhdl6[1]~3_combout\ : std_logic;
SIGNAL \u_led_driver|temp_xhdl6[1]~4_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[1]~17_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[1]~25_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[2]~18_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[2]~28_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[6]~19_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[3]~20_combout\ : std_logic;
SIGNAL \u_led_driver|temp_xhdl20[3]~0_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[3]~21_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[4]~22_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[5]~26_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[6]~27_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[6]~23_combout\ : std_logic;
SIGNAL \u_led_driver|oLED[7]~24_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|p2s_data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_spi_ee_config|read_idle_count\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \u_led_driver|int2_count\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \u_spi_ee_config|clear_status_d\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|oDATA_H_xhdl2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_spi_ee_config|oDATA_L_xhdl1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_spi_ee_config|ini_index\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_led_driver|int2_d\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_spi_ee_config|low_byte_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_reset_delay|cont\ : std_logic_vector(20 DOWNTO 0);
SIGNAL \u_led_driver|ALT_INV_oLED[5]~26_combout\ : std_logic;
SIGNAL \u_reset_delay|ALT_INV_cont\ : std_logic_vector(20 DOWNTO 20);
SIGNAL \u_reset_delay|ALT_INV_oRST_xhdl1~q\ : std_logic;
SIGNAL \u_led_driver|ALT_INV_oLED[7]~24_combout\ : std_logic;
SIGNAL \u_led_driver|ALT_INV_oLED[6]~23_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ALT_INV_spi_go~q\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_G_SENSOR_INT <= G_SENSOR_INT;
I2C_SCLK <= ww_I2C_SCLK;
G_SENSOR_CS_N <= ww_G_SENSOR_CS_N;
LED <= ww_LED;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\u_spipll|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\u_spipll|altpll_component|auto_generated|wire_pll1_clk\(0) <= \u_spipll|altpll_component|auto_generated|pll1_CLK_bus\(0);
\u_spipll|altpll_component|auto_generated|wire_pll1_clk\(1) <= \u_spipll|altpll_component|auto_generated|pll1_CLK_bus\(1);
\u_spipll|altpll_component|auto_generated|wire_pll1_clk\(2) <= \u_spipll|altpll_component|auto_generated|pll1_CLK_bus\(2);
\u_spipll|altpll_component|auto_generated|wire_pll1_clk\(3) <= \u_spipll|altpll_component|auto_generated|pll1_CLK_bus\(3);
\u_spipll|altpll_component|auto_generated|wire_pll1_clk\(4) <= \u_spipll|altpll_component|auto_generated|pll1_CLK_bus\(4);

\u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_spipll|altpll_component|auto_generated|wire_pll1_clk\(1));

\u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_spipll|altpll_component|auto_generated|wire_pll1_clk\(0));

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\u_led_driver|ALT_INV_oLED[5]~26_combout\ <= NOT \u_led_driver|oLED[5]~26_combout\;
\u_reset_delay|ALT_INV_cont\(20) <= NOT \u_reset_delay|cont\(20);
\u_reset_delay|ALT_INV_oRST_xhdl1~q\ <= NOT \u_reset_delay|oRST_xhdl1~q\;
\u_led_driver|ALT_INV_oLED[7]~24_combout\ <= NOT \u_led_driver|oLED[7]~24_combout\;
\u_led_driver|ALT_INV_oLED[6]~23_combout\ <= NOT \u_led_driver|oLED[6]~23_combout\;
\u_spi_ee_config|ALT_INV_spi_go~q\ <= NOT \u_spi_ee_config|spi_go~q\;

-- Location: IOOBUF_X0_Y24_N23
\I2C_SCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_spi_ee_config|u_spi_controller|oSPI_CLK~0_combout\,
	devoe => ww_devoe,
	o => ww_I2C_SCLK);

-- Location: IOOBUF_X0_Y24_N16
\G_SENSOR_CS_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_spi_ee_config|ALT_INV_spi_go~q\,
	devoe => ww_devoe,
	o => ww_G_SENSOR_CS_N);

-- Location: IOOBUF_X38_Y34_N16
\LED[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_led_driver|oLED[0]~16_combout\,
	devoe => ww_devoe,
	o => ww_LED(0));

-- Location: IOOBUF_X49_Y34_N2
\LED[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_led_driver|oLED[1]~25_combout\,
	devoe => ww_devoe,
	o => ww_LED(1));

-- Location: IOOBUF_X49_Y34_N9
\LED[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_led_driver|oLED[2]~28_combout\,
	devoe => ww_devoe,
	o => ww_LED(2));

-- Location: IOOBUF_X40_Y34_N2
\LED[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_led_driver|oLED[3]~21_combout\,
	devoe => ww_devoe,
	o => ww_LED(3));

-- Location: IOOBUF_X0_Y25_N9
\LED[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_led_driver|oLED[4]~22_combout\,
	devoe => ww_devoe,
	o => ww_LED(4));

-- Location: IOOBUF_X0_Y26_N16
\LED[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_led_driver|ALT_INV_oLED[5]~26_combout\,
	devoe => ww_devoe,
	o => ww_LED(5));

-- Location: IOOBUF_X0_Y28_N9
\LED[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_led_driver|ALT_INV_oLED[6]~23_combout\,
	devoe => ww_devoe,
	o => ww_LED(6));

-- Location: IOOBUF_X0_Y10_N23
\LED[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_led_driver|ALT_INV_oLED[7]~24_combout\,
	devoe => ww_devoe,
	o => ww_LED(7));

-- Location: IOOBUF_X0_Y23_N2
\I2C_SDAT~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_spi_ee_config|u_spi_controller|Mux0~8_combout\,
	oe => \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\,
	devoe => ww_devoe,
	o => I2C_SDAT);

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

-- Location: CLKCTRL_G15
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

-- Location: LCCOMB_X35_Y13_N10
\u_reset_delay|cont[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|cont[0]~1_combout\ = !\u_reset_delay|cont\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_reset_delay|cont\(0),
	combout => \u_reset_delay|cont[0]~1_combout\);

-- Location: IOIBUF_X53_Y14_N1
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: FF_X35_Y13_N11
\u_reset_delay|cont[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|cont[0]~1_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(0));

-- Location: LCCOMB_X35_Y13_N12
\u_reset_delay|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~0_combout\ = (\u_reset_delay|cont\(1) & (\u_reset_delay|cont\(0) $ (VCC))) # (!\u_reset_delay|cont\(1) & (\u_reset_delay|cont\(0) & VCC))
-- \u_reset_delay|Add0~1\ = CARRY((\u_reset_delay|cont\(1) & \u_reset_delay|cont\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(1),
	datab => \u_reset_delay|cont\(0),
	datad => VCC,
	combout => \u_reset_delay|Add0~0_combout\,
	cout => \u_reset_delay|Add0~1\);

-- Location: FF_X35_Y13_N13
\u_reset_delay|cont[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(1));

-- Location: LCCOMB_X35_Y13_N14
\u_reset_delay|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~2_combout\ = (\u_reset_delay|cont\(2) & (!\u_reset_delay|Add0~1\)) # (!\u_reset_delay|cont\(2) & ((\u_reset_delay|Add0~1\) # (GND)))
-- \u_reset_delay|Add0~3\ = CARRY((!\u_reset_delay|Add0~1\) # (!\u_reset_delay|cont\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(2),
	datad => VCC,
	cin => \u_reset_delay|Add0~1\,
	combout => \u_reset_delay|Add0~2_combout\,
	cout => \u_reset_delay|Add0~3\);

-- Location: FF_X35_Y13_N15
\u_reset_delay|cont[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~2_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(2));

-- Location: LCCOMB_X35_Y13_N16
\u_reset_delay|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~4_combout\ = (\u_reset_delay|cont\(3) & (\u_reset_delay|Add0~3\ $ (GND))) # (!\u_reset_delay|cont\(3) & (!\u_reset_delay|Add0~3\ & VCC))
-- \u_reset_delay|Add0~5\ = CARRY((\u_reset_delay|cont\(3) & !\u_reset_delay|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(3),
	datad => VCC,
	cin => \u_reset_delay|Add0~3\,
	combout => \u_reset_delay|Add0~4_combout\,
	cout => \u_reset_delay|Add0~5\);

-- Location: FF_X35_Y13_N17
\u_reset_delay|cont[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~4_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(3));

-- Location: LCCOMB_X35_Y13_N18
\u_reset_delay|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~6_combout\ = (\u_reset_delay|cont\(4) & (!\u_reset_delay|Add0~5\)) # (!\u_reset_delay|cont\(4) & ((\u_reset_delay|Add0~5\) # (GND)))
-- \u_reset_delay|Add0~7\ = CARRY((!\u_reset_delay|Add0~5\) # (!\u_reset_delay|cont\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(4),
	datad => VCC,
	cin => \u_reset_delay|Add0~5\,
	combout => \u_reset_delay|Add0~6_combout\,
	cout => \u_reset_delay|Add0~7\);

-- Location: FF_X35_Y13_N19
\u_reset_delay|cont[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~6_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(4));

-- Location: LCCOMB_X35_Y13_N20
\u_reset_delay|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~8_combout\ = (\u_reset_delay|cont\(5) & (\u_reset_delay|Add0~7\ $ (GND))) # (!\u_reset_delay|cont\(5) & (!\u_reset_delay|Add0~7\ & VCC))
-- \u_reset_delay|Add0~9\ = CARRY((\u_reset_delay|cont\(5) & !\u_reset_delay|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(5),
	datad => VCC,
	cin => \u_reset_delay|Add0~7\,
	combout => \u_reset_delay|Add0~8_combout\,
	cout => \u_reset_delay|Add0~9\);

-- Location: FF_X35_Y13_N21
\u_reset_delay|cont[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~8_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(5));

-- Location: LCCOMB_X35_Y13_N22
\u_reset_delay|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~10_combout\ = (\u_reset_delay|cont\(6) & (!\u_reset_delay|Add0~9\)) # (!\u_reset_delay|cont\(6) & ((\u_reset_delay|Add0~9\) # (GND)))
-- \u_reset_delay|Add0~11\ = CARRY((!\u_reset_delay|Add0~9\) # (!\u_reset_delay|cont\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(6),
	datad => VCC,
	cin => \u_reset_delay|Add0~9\,
	combout => \u_reset_delay|Add0~10_combout\,
	cout => \u_reset_delay|Add0~11\);

-- Location: FF_X35_Y13_N23
\u_reset_delay|cont[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~10_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(6));

-- Location: LCCOMB_X35_Y13_N24
\u_reset_delay|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~12_combout\ = (\u_reset_delay|cont\(7) & (\u_reset_delay|Add0~11\ $ (GND))) # (!\u_reset_delay|cont\(7) & (!\u_reset_delay|Add0~11\ & VCC))
-- \u_reset_delay|Add0~13\ = CARRY((\u_reset_delay|cont\(7) & !\u_reset_delay|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(7),
	datad => VCC,
	cin => \u_reset_delay|Add0~11\,
	combout => \u_reset_delay|Add0~12_combout\,
	cout => \u_reset_delay|Add0~13\);

-- Location: FF_X35_Y13_N25
\u_reset_delay|cont[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~12_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(7));

-- Location: LCCOMB_X35_Y13_N26
\u_reset_delay|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~14_combout\ = (\u_reset_delay|cont\(8) & (!\u_reset_delay|Add0~13\)) # (!\u_reset_delay|cont\(8) & ((\u_reset_delay|Add0~13\) # (GND)))
-- \u_reset_delay|Add0~15\ = CARRY((!\u_reset_delay|Add0~13\) # (!\u_reset_delay|cont\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(8),
	datad => VCC,
	cin => \u_reset_delay|Add0~13\,
	combout => \u_reset_delay|Add0~14_combout\,
	cout => \u_reset_delay|Add0~15\);

-- Location: FF_X35_Y13_N27
\u_reset_delay|cont[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~14_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(8));

-- Location: LCCOMB_X35_Y13_N28
\u_reset_delay|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~16_combout\ = (\u_reset_delay|cont\(9) & (\u_reset_delay|Add0~15\ $ (GND))) # (!\u_reset_delay|cont\(9) & (!\u_reset_delay|Add0~15\ & VCC))
-- \u_reset_delay|Add0~17\ = CARRY((\u_reset_delay|cont\(9) & !\u_reset_delay|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(9),
	datad => VCC,
	cin => \u_reset_delay|Add0~15\,
	combout => \u_reset_delay|Add0~16_combout\,
	cout => \u_reset_delay|Add0~17\);

-- Location: FF_X35_Y13_N29
\u_reset_delay|cont[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~16_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(9));

-- Location: LCCOMB_X35_Y13_N30
\u_reset_delay|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~18_combout\ = (\u_reset_delay|cont\(10) & (!\u_reset_delay|Add0~17\)) # (!\u_reset_delay|cont\(10) & ((\u_reset_delay|Add0~17\) # (GND)))
-- \u_reset_delay|Add0~19\ = CARRY((!\u_reset_delay|Add0~17\) # (!\u_reset_delay|cont\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(10),
	datad => VCC,
	cin => \u_reset_delay|Add0~17\,
	combout => \u_reset_delay|Add0~18_combout\,
	cout => \u_reset_delay|Add0~19\);

-- Location: FF_X35_Y13_N31
\u_reset_delay|cont[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~18_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(10));

-- Location: LCCOMB_X35_Y12_N0
\u_reset_delay|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~20_combout\ = (\u_reset_delay|cont\(11) & (\u_reset_delay|Add0~19\ $ (GND))) # (!\u_reset_delay|cont\(11) & (!\u_reset_delay|Add0~19\ & VCC))
-- \u_reset_delay|Add0~21\ = CARRY((\u_reset_delay|cont\(11) & !\u_reset_delay|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(11),
	datad => VCC,
	cin => \u_reset_delay|Add0~19\,
	combout => \u_reset_delay|Add0~20_combout\,
	cout => \u_reset_delay|Add0~21\);

-- Location: FF_X35_Y12_N1
\u_reset_delay|cont[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~20_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(11));

-- Location: LCCOMB_X35_Y12_N2
\u_reset_delay|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~22_combout\ = (\u_reset_delay|cont\(12) & (!\u_reset_delay|Add0~21\)) # (!\u_reset_delay|cont\(12) & ((\u_reset_delay|Add0~21\) # (GND)))
-- \u_reset_delay|Add0~23\ = CARRY((!\u_reset_delay|Add0~21\) # (!\u_reset_delay|cont\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(12),
	datad => VCC,
	cin => \u_reset_delay|Add0~21\,
	combout => \u_reset_delay|Add0~22_combout\,
	cout => \u_reset_delay|Add0~23\);

-- Location: FF_X35_Y12_N3
\u_reset_delay|cont[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~22_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(12));

-- Location: LCCOMB_X35_Y12_N4
\u_reset_delay|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~24_combout\ = (\u_reset_delay|cont\(13) & (\u_reset_delay|Add0~23\ $ (GND))) # (!\u_reset_delay|cont\(13) & (!\u_reset_delay|Add0~23\ & VCC))
-- \u_reset_delay|Add0~25\ = CARRY((\u_reset_delay|cont\(13) & !\u_reset_delay|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(13),
	datad => VCC,
	cin => \u_reset_delay|Add0~23\,
	combout => \u_reset_delay|Add0~24_combout\,
	cout => \u_reset_delay|Add0~25\);

-- Location: FF_X35_Y12_N5
\u_reset_delay|cont[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~24_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(13));

-- Location: LCCOMB_X35_Y12_N6
\u_reset_delay|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~26_combout\ = (\u_reset_delay|cont\(14) & (!\u_reset_delay|Add0~25\)) # (!\u_reset_delay|cont\(14) & ((\u_reset_delay|Add0~25\) # (GND)))
-- \u_reset_delay|Add0~27\ = CARRY((!\u_reset_delay|Add0~25\) # (!\u_reset_delay|cont\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(14),
	datad => VCC,
	cin => \u_reset_delay|Add0~25\,
	combout => \u_reset_delay|Add0~26_combout\,
	cout => \u_reset_delay|Add0~27\);

-- Location: FF_X35_Y12_N7
\u_reset_delay|cont[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~26_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(14));

-- Location: LCCOMB_X35_Y12_N8
\u_reset_delay|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~28_combout\ = (\u_reset_delay|cont\(15) & (\u_reset_delay|Add0~27\ $ (GND))) # (!\u_reset_delay|cont\(15) & (!\u_reset_delay|Add0~27\ & VCC))
-- \u_reset_delay|Add0~29\ = CARRY((\u_reset_delay|cont\(15) & !\u_reset_delay|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(15),
	datad => VCC,
	cin => \u_reset_delay|Add0~27\,
	combout => \u_reset_delay|Add0~28_combout\,
	cout => \u_reset_delay|Add0~29\);

-- Location: FF_X35_Y12_N9
\u_reset_delay|cont[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~28_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(15));

-- Location: LCCOMB_X35_Y12_N10
\u_reset_delay|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~30_combout\ = (\u_reset_delay|cont\(16) & (!\u_reset_delay|Add0~29\)) # (!\u_reset_delay|cont\(16) & ((\u_reset_delay|Add0~29\) # (GND)))
-- \u_reset_delay|Add0~31\ = CARRY((!\u_reset_delay|Add0~29\) # (!\u_reset_delay|cont\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(16),
	datad => VCC,
	cin => \u_reset_delay|Add0~29\,
	combout => \u_reset_delay|Add0~30_combout\,
	cout => \u_reset_delay|Add0~31\);

-- Location: FF_X35_Y12_N11
\u_reset_delay|cont[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~30_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(16));

-- Location: LCCOMB_X35_Y12_N12
\u_reset_delay|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~32_combout\ = (\u_reset_delay|cont\(17) & (\u_reset_delay|Add0~31\ $ (GND))) # (!\u_reset_delay|cont\(17) & (!\u_reset_delay|Add0~31\ & VCC))
-- \u_reset_delay|Add0~33\ = CARRY((\u_reset_delay|cont\(17) & !\u_reset_delay|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(17),
	datad => VCC,
	cin => \u_reset_delay|Add0~31\,
	combout => \u_reset_delay|Add0~32_combout\,
	cout => \u_reset_delay|Add0~33\);

-- Location: FF_X35_Y12_N13
\u_reset_delay|cont[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~32_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(17));

-- Location: LCCOMB_X35_Y12_N14
\u_reset_delay|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~34_combout\ = (\u_reset_delay|cont\(18) & (!\u_reset_delay|Add0~33\)) # (!\u_reset_delay|cont\(18) & ((\u_reset_delay|Add0~33\) # (GND)))
-- \u_reset_delay|Add0~35\ = CARRY((!\u_reset_delay|Add0~33\) # (!\u_reset_delay|cont\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(18),
	datad => VCC,
	cin => \u_reset_delay|Add0~33\,
	combout => \u_reset_delay|Add0~34_combout\,
	cout => \u_reset_delay|Add0~35\);

-- Location: FF_X35_Y12_N15
\u_reset_delay|cont[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~34_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(18));

-- Location: LCCOMB_X35_Y12_N16
\u_reset_delay|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~36_combout\ = (\u_reset_delay|cont\(19) & (\u_reset_delay|Add0~35\ $ (GND))) # (!\u_reset_delay|cont\(19) & (!\u_reset_delay|Add0~35\ & VCC))
-- \u_reset_delay|Add0~37\ = CARRY((\u_reset_delay|cont\(19) & !\u_reset_delay|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(19),
	datad => VCC,
	cin => \u_reset_delay|Add0~35\,
	combout => \u_reset_delay|Add0~36_combout\,
	cout => \u_reset_delay|Add0~37\);

-- Location: FF_X35_Y12_N17
\u_reset_delay|cont[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|Add0~36_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \u_reset_delay|ALT_INV_cont\(20),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(19));

-- Location: LCCOMB_X35_Y12_N18
\u_reset_delay|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~38_combout\ = \u_reset_delay|Add0~37\ $ (\u_reset_delay|cont\(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_reset_delay|cont\(20),
	cin => \u_reset_delay|Add0~37\,
	combout => \u_reset_delay|Add0~38_combout\);

-- Location: LCCOMB_X35_Y12_N28
\u_reset_delay|cont[20]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|cont[20]~0_combout\ = (\u_reset_delay|cont\(20)) # (\u_reset_delay|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_reset_delay|cont\(20),
	datad => \u_reset_delay|Add0~38_combout\,
	combout => \u_reset_delay|cont[20]~0_combout\);

-- Location: FF_X35_Y12_N29
\u_reset_delay|cont[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_reset_delay|cont[20]~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|cont\(20));

-- Location: FF_X35_Y13_N9
\u_reset_delay|oRST_xhdl1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_reset_delay|cont\(20),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_reset_delay|oRST_xhdl1~q\);

-- Location: PLL_4
\u_spipll|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 150,
	c0_initial => 121,
	c0_low => 150,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 150,
	c1_initial => 101,
	c1_low => 150,
	c1_mode => "even",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 25,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "200000",
	clk1_counter => "c1",
	clk1_divide_by => 25,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 1,
	clk1_phase_shift => "166667",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 12,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 5611,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 208,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => \u_reset_delay|ALT_INV_oRST_xhdl1~q\,
	fbin => \u_spipll|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \u_spipll|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \u_spipll|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \u_spipll|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G18
\u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X40_Y18_N24
\u_spi_ee_config|u_spi_controller|spi_count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~1_combout\ = (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & \u_spi_ee_config|u_spi_controller|spi_count_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datad => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count~1_combout\);

-- Location: FF_X40_Y18_N25
\u_spi_ee_config|u_spi_controller|spi_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|spi_count~1_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|spi_count\(0));

-- Location: LCCOMB_X40_Y18_N12
\u_spi_ee_config|u_spi_controller|spi_count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~3_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & (\u_spi_ee_config|u_spi_controller|spi_count\(1) $ (\u_spi_ee_config|u_spi_controller|spi_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|spi_count~3_combout\);

-- Location: FF_X40_Y18_N13
\u_spi_ee_config|u_spi_controller|spi_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|spi_count~3_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|spi_count\(1));

-- Location: LCCOMB_X40_Y18_N2
\u_spi_ee_config|u_spi_controller|spi_count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~2_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & (\u_spi_ee_config|u_spi_controller|spi_count\(2) $ (((\u_spi_ee_config|u_spi_controller|spi_count\(1) & 
-- \u_spi_ee_config|u_spi_controller|spi_count\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datab => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|spi_count~2_combout\);

-- Location: FF_X40_Y18_N3
\u_spi_ee_config|u_spi_controller|spi_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|spi_count~2_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|spi_count\(2));

-- Location: LCCOMB_X40_Y18_N30
\u_spi_ee_config|u_spi_controller|WideOr0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(1) & (\u_spi_ee_config|u_spi_controller|spi_count\(2) & (\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- \u_spi_ee_config|u_spi_controller|spi_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\);

-- Location: LCCOMB_X46_Y18_N10
\u_spi_ee_config|ini_index[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[0]~2_combout\ = \u_spi_ee_config|ini_index\(0) $ (((!\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & \u_spi_ee_config|spi_go~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|ini_index[0]~2_combout\);

-- Location: FF_X46_Y18_N11
\u_spi_ee_config|ini_index[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|ini_index[0]~2_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|ini_index\(0));

-- Location: LCCOMB_X46_Y18_N6
\u_spi_ee_config|ini_index[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[1]~0_combout\ = (\u_spi_ee_config|spi_go~q\ & (\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & (!\u_spi_ee_config|LessThan0~0_combout\ & \u_spi_ee_config|ini_index\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|spi_go~q\,
	datab => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|ini_index\(0),
	combout => \u_spi_ee_config|ini_index[1]~0_combout\);

-- Location: LCCOMB_X46_Y18_N8
\u_spi_ee_config|ini_index[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[1]~1_combout\ = \u_spi_ee_config|ini_index\(1) $ (\u_spi_ee_config|ini_index[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|ini_index\(1),
	datad => \u_spi_ee_config|ini_index[1]~0_combout\,
	combout => \u_spi_ee_config|ini_index[1]~1_combout\);

-- Location: FF_X46_Y18_N9
\u_spi_ee_config|ini_index[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|ini_index[1]~1_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|ini_index\(1));

-- Location: LCCOMB_X46_Y18_N28
\u_spi_ee_config|ini_index[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[2]~3_combout\ = \u_spi_ee_config|ini_index\(2) $ (((\u_spi_ee_config|ini_index[1]~0_combout\ & \u_spi_ee_config|ini_index\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index[1]~0_combout\,
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|ini_index[2]~3_combout\);

-- Location: FF_X46_Y18_N29
\u_spi_ee_config|ini_index[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|ini_index[2]~3_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|ini_index\(2));

-- Location: LCCOMB_X46_Y18_N22
\u_spi_ee_config|ini_index[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[3]~4_combout\ = \u_spi_ee_config|ini_index\(3) $ (((\u_spi_ee_config|ini_index[1]~0_combout\ & (\u_spi_ee_config|ini_index\(1) & \u_spi_ee_config|ini_index\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index[1]~0_combout\,
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|ini_index[3]~4_combout\);

-- Location: FF_X46_Y18_N23
\u_spi_ee_config|ini_index[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|ini_index[3]~4_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|ini_index\(3));

-- Location: LCCOMB_X32_Y18_N8
\u_spi_ee_config|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|LessThan0~0_combout\ = (\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(2)) # ((\u_spi_ee_config|ini_index\(1) & \u_spi_ee_config|ini_index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|LessThan0~0_combout\);

-- Location: IOIBUF_X0_Y23_N1
\I2C_SDAT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => I2C_SDAT,
	o => \I2C_SDAT~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\G_SENSOR_INT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_G_SENSOR_INT,
	o => \G_SENSOR_INT~input_o\);

-- Location: LCCOMB_X46_Y18_N2
\u_spi_ee_config|high_byte~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|high_byte~0_combout\ = (\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & (\u_spi_ee_config|LessThan0~0_combout\ & \u_spi_ee_config|spi_go~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|high_byte~0_combout\);

-- Location: LCCOMB_X46_Y18_N24
\u_spi_ee_config|read_back~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_back~0_combout\ = (\u_spi_ee_config|read_back~q\ & (((!\u_spi_ee_config|LessThan0~0_combout\) # (!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\)) # (!\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|spi_go~q\,
	datab => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|read_back~q\,
	combout => \u_spi_ee_config|read_back~0_combout\);

-- Location: LCCOMB_X36_Y16_N22
\u_spi_ee_config|high_byte~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|high_byte~1_combout\ = \u_spi_ee_config|high_byte~q\ $ (((\u_spi_ee_config|read_back~q\ & \u_spi_ee_config|high_byte~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_back~q\,
	datac => \u_spi_ee_config|high_byte~q\,
	datad => \u_spi_ee_config|high_byte~0_combout\,
	combout => \u_spi_ee_config|high_byte~1_combout\);

-- Location: FF_X36_Y16_N23
\u_spi_ee_config|high_byte\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|high_byte~1_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|high_byte~q\);

-- Location: LCCOMB_X36_Y16_N6
\u_spi_ee_config|p2s_data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~10_combout\ = (!\u_spi_ee_config|read_ready~q\ & !\u_spi_ee_config|high_byte~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_ready~q\,
	datac => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|p2s_data~10_combout\);

-- Location: LCCOMB_X46_Y18_N0
\u_spi_ee_config|read_back~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_back~1_combout\ = (\u_spi_ee_config|read_back~0_combout\) # ((\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|p2s_data~10_combout\ & !\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|read_back~0_combout\,
	datac => \u_spi_ee_config|p2s_data~10_combout\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|read_back~1_combout\);

-- Location: FF_X46_Y18_N1
\u_spi_ee_config|read_back\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_back~1_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_back~q\);

-- Location: LCCOMB_X36_Y16_N2
\u_spi_ee_config|clear_status~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~1_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|clear_status~0_combout\ & (!\u_spi_ee_config|spi_go~q\ & \u_spi_ee_config|p2s_data~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|clear_status~0_combout\,
	datac => \u_spi_ee_config|spi_go~q\,
	datad => \u_spi_ee_config|p2s_data~10_combout\,
	combout => \u_spi_ee_config|clear_status~1_combout\);

-- Location: LCCOMB_X36_Y16_N10
\u_spi_ee_config|clear_status~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~2_combout\ = (\u_spi_ee_config|clear_status~1_combout\) # ((\u_spi_ee_config|clear_status~q\ & ((\u_spi_ee_config|read_back~q\) # (!\u_spi_ee_config|high_byte~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~0_combout\,
	datab => \u_spi_ee_config|read_back~q\,
	datac => \u_spi_ee_config|clear_status~q\,
	datad => \u_spi_ee_config|clear_status~1_combout\,
	combout => \u_spi_ee_config|clear_status~2_combout\);

-- Location: FF_X36_Y16_N11
\u_spi_ee_config|clear_status\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|clear_status~2_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status~q\);

-- Location: LCCOMB_X36_Y16_N12
\u_spi_ee_config|clear_status_d[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status_d[0]~feeder_combout\ = \u_spi_ee_config|clear_status~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|clear_status~q\,
	combout => \u_spi_ee_config|clear_status_d[0]~feeder_combout\);

-- Location: FF_X36_Y16_N13
\u_spi_ee_config|clear_status_d[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|clear_status_d[0]~feeder_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status_d\(0));

-- Location: LCCOMB_X36_Y16_N0
\u_spi_ee_config|clear_status_d[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status_d[1]~feeder_combout\ = \u_spi_ee_config|clear_status_d\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|clear_status_d\(0),
	combout => \u_spi_ee_config|clear_status_d[1]~feeder_combout\);

-- Location: FF_X36_Y16_N1
\u_spi_ee_config|clear_status_d[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|clear_status_d[1]~feeder_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status_d\(1));

-- Location: LCCOMB_X36_Y16_N8
\u_spi_ee_config|clear_status_d[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status_d[2]~feeder_combout\ = \u_spi_ee_config|clear_status_d\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|clear_status_d\(1),
	combout => \u_spi_ee_config|clear_status_d[2]~feeder_combout\);

-- Location: FF_X36_Y16_N9
\u_spi_ee_config|clear_status_d[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|clear_status_d[2]~feeder_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status_d\(2));

-- Location: FF_X36_Y16_N19
\u_spi_ee_config|clear_status_d[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|clear_status_d\(2),
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status_d\(3));

-- Location: LCCOMB_X40_Y15_N2
\u_spi_ee_config|read_idle_count[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[0]~15_combout\ = \u_spi_ee_config|read_idle_count\(0) $ (VCC)
-- \u_spi_ee_config|read_idle_count[0]~16\ = CARRY(\u_spi_ee_config|read_idle_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(0),
	datad => VCC,
	combout => \u_spi_ee_config|read_idle_count[0]~15_combout\,
	cout => \u_spi_ee_config|read_idle_count[0]~16\);

-- Location: LCCOMB_X46_Y18_N4
\u_spi_ee_config|read_idle_count[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[14]~45_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (((\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & !\u_spi_ee_config|read_back~q\)) # (!\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|spi_go~q\,
	datab => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|read_back~q\,
	combout => \u_spi_ee_config|read_idle_count[14]~45_combout\);

-- Location: FF_X40_Y15_N3
\u_spi_ee_config|read_idle_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[0]~15_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(0));

-- Location: LCCOMB_X40_Y15_N4
\u_spi_ee_config|read_idle_count[1]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[1]~17_combout\ = (\u_spi_ee_config|read_idle_count\(1) & (!\u_spi_ee_config|read_idle_count[0]~16\)) # (!\u_spi_ee_config|read_idle_count\(1) & ((\u_spi_ee_config|read_idle_count[0]~16\) # (GND)))
-- \u_spi_ee_config|read_idle_count[1]~18\ = CARRY((!\u_spi_ee_config|read_idle_count[0]~16\) # (!\u_spi_ee_config|read_idle_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(1),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[0]~16\,
	combout => \u_spi_ee_config|read_idle_count[1]~17_combout\,
	cout => \u_spi_ee_config|read_idle_count[1]~18\);

-- Location: FF_X40_Y15_N5
\u_spi_ee_config|read_idle_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[1]~17_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(1));

-- Location: LCCOMB_X40_Y15_N6
\u_spi_ee_config|read_idle_count[2]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[2]~19_combout\ = (\u_spi_ee_config|read_idle_count\(2) & (\u_spi_ee_config|read_idle_count[1]~18\ $ (GND))) # (!\u_spi_ee_config|read_idle_count\(2) & (!\u_spi_ee_config|read_idle_count[1]~18\ & VCC))
-- \u_spi_ee_config|read_idle_count[2]~20\ = CARRY((\u_spi_ee_config|read_idle_count\(2) & !\u_spi_ee_config|read_idle_count[1]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_idle_count\(2),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[1]~18\,
	combout => \u_spi_ee_config|read_idle_count[2]~19_combout\,
	cout => \u_spi_ee_config|read_idle_count[2]~20\);

-- Location: FF_X40_Y15_N7
\u_spi_ee_config|read_idle_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[2]~19_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(2));

-- Location: LCCOMB_X40_Y15_N8
\u_spi_ee_config|read_idle_count[3]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[3]~21_combout\ = (\u_spi_ee_config|read_idle_count\(3) & (!\u_spi_ee_config|read_idle_count[2]~20\)) # (!\u_spi_ee_config|read_idle_count\(3) & ((\u_spi_ee_config|read_idle_count[2]~20\) # (GND)))
-- \u_spi_ee_config|read_idle_count[3]~22\ = CARRY((!\u_spi_ee_config|read_idle_count[2]~20\) # (!\u_spi_ee_config|read_idle_count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(3),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[2]~20\,
	combout => \u_spi_ee_config|read_idle_count[3]~21_combout\,
	cout => \u_spi_ee_config|read_idle_count[3]~22\);

-- Location: FF_X40_Y15_N9
\u_spi_ee_config|read_idle_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[3]~21_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(3));

-- Location: LCCOMB_X40_Y15_N10
\u_spi_ee_config|read_idle_count[4]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[4]~23_combout\ = (\u_spi_ee_config|read_idle_count\(4) & (\u_spi_ee_config|read_idle_count[3]~22\ $ (GND))) # (!\u_spi_ee_config|read_idle_count\(4) & (!\u_spi_ee_config|read_idle_count[3]~22\ & VCC))
-- \u_spi_ee_config|read_idle_count[4]~24\ = CARRY((\u_spi_ee_config|read_idle_count\(4) & !\u_spi_ee_config|read_idle_count[3]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_idle_count\(4),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[3]~22\,
	combout => \u_spi_ee_config|read_idle_count[4]~23_combout\,
	cout => \u_spi_ee_config|read_idle_count[4]~24\);

-- Location: FF_X40_Y15_N11
\u_spi_ee_config|read_idle_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[4]~23_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(4));

-- Location: LCCOMB_X40_Y15_N12
\u_spi_ee_config|read_idle_count[5]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[5]~25_combout\ = (\u_spi_ee_config|read_idle_count\(5) & (!\u_spi_ee_config|read_idle_count[4]~24\)) # (!\u_spi_ee_config|read_idle_count\(5) & ((\u_spi_ee_config|read_idle_count[4]~24\) # (GND)))
-- \u_spi_ee_config|read_idle_count[5]~26\ = CARRY((!\u_spi_ee_config|read_idle_count[4]~24\) # (!\u_spi_ee_config|read_idle_count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_idle_count\(5),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[4]~24\,
	combout => \u_spi_ee_config|read_idle_count[5]~25_combout\,
	cout => \u_spi_ee_config|read_idle_count[5]~26\);

-- Location: FF_X40_Y15_N13
\u_spi_ee_config|read_idle_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[5]~25_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(5));

-- Location: LCCOMB_X40_Y15_N14
\u_spi_ee_config|read_idle_count[6]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[6]~27_combout\ = (\u_spi_ee_config|read_idle_count\(6) & (\u_spi_ee_config|read_idle_count[5]~26\ $ (GND))) # (!\u_spi_ee_config|read_idle_count\(6) & (!\u_spi_ee_config|read_idle_count[5]~26\ & VCC))
-- \u_spi_ee_config|read_idle_count[6]~28\ = CARRY((\u_spi_ee_config|read_idle_count\(6) & !\u_spi_ee_config|read_idle_count[5]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(6),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[5]~26\,
	combout => \u_spi_ee_config|read_idle_count[6]~27_combout\,
	cout => \u_spi_ee_config|read_idle_count[6]~28\);

-- Location: FF_X40_Y15_N15
\u_spi_ee_config|read_idle_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[6]~27_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(6));

-- Location: LCCOMB_X40_Y15_N16
\u_spi_ee_config|read_idle_count[7]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[7]~29_combout\ = (\u_spi_ee_config|read_idle_count\(7) & (!\u_spi_ee_config|read_idle_count[6]~28\)) # (!\u_spi_ee_config|read_idle_count\(7) & ((\u_spi_ee_config|read_idle_count[6]~28\) # (GND)))
-- \u_spi_ee_config|read_idle_count[7]~30\ = CARRY((!\u_spi_ee_config|read_idle_count[6]~28\) # (!\u_spi_ee_config|read_idle_count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(7),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[6]~28\,
	combout => \u_spi_ee_config|read_idle_count[7]~29_combout\,
	cout => \u_spi_ee_config|read_idle_count[7]~30\);

-- Location: FF_X40_Y15_N17
\u_spi_ee_config|read_idle_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[7]~29_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(7));

-- Location: LCCOMB_X40_Y15_N18
\u_spi_ee_config|read_idle_count[8]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[8]~31_combout\ = (\u_spi_ee_config|read_idle_count\(8) & (\u_spi_ee_config|read_idle_count[7]~30\ $ (GND))) # (!\u_spi_ee_config|read_idle_count\(8) & (!\u_spi_ee_config|read_idle_count[7]~30\ & VCC))
-- \u_spi_ee_config|read_idle_count[8]~32\ = CARRY((\u_spi_ee_config|read_idle_count\(8) & !\u_spi_ee_config|read_idle_count[7]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(8),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[7]~30\,
	combout => \u_spi_ee_config|read_idle_count[8]~31_combout\,
	cout => \u_spi_ee_config|read_idle_count[8]~32\);

-- Location: FF_X40_Y15_N19
\u_spi_ee_config|read_idle_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[8]~31_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(8));

-- Location: LCCOMB_X40_Y15_N20
\u_spi_ee_config|read_idle_count[9]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[9]~33_combout\ = (\u_spi_ee_config|read_idle_count\(9) & (!\u_spi_ee_config|read_idle_count[8]~32\)) # (!\u_spi_ee_config|read_idle_count\(9) & ((\u_spi_ee_config|read_idle_count[8]~32\) # (GND)))
-- \u_spi_ee_config|read_idle_count[9]~34\ = CARRY((!\u_spi_ee_config|read_idle_count[8]~32\) # (!\u_spi_ee_config|read_idle_count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(9),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[8]~32\,
	combout => \u_spi_ee_config|read_idle_count[9]~33_combout\,
	cout => \u_spi_ee_config|read_idle_count[9]~34\);

-- Location: FF_X40_Y15_N21
\u_spi_ee_config|read_idle_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[9]~33_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(9));

-- Location: LCCOMB_X40_Y15_N22
\u_spi_ee_config|read_idle_count[10]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[10]~35_combout\ = (\u_spi_ee_config|read_idle_count\(10) & (\u_spi_ee_config|read_idle_count[9]~34\ $ (GND))) # (!\u_spi_ee_config|read_idle_count\(10) & (!\u_spi_ee_config|read_idle_count[9]~34\ & VCC))
-- \u_spi_ee_config|read_idle_count[10]~36\ = CARRY((\u_spi_ee_config|read_idle_count\(10) & !\u_spi_ee_config|read_idle_count[9]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_idle_count\(10),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[9]~34\,
	combout => \u_spi_ee_config|read_idle_count[10]~35_combout\,
	cout => \u_spi_ee_config|read_idle_count[10]~36\);

-- Location: FF_X40_Y15_N23
\u_spi_ee_config|read_idle_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[10]~35_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(10));

-- Location: LCCOMB_X40_Y15_N24
\u_spi_ee_config|read_idle_count[11]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[11]~37_combout\ = (\u_spi_ee_config|read_idle_count\(11) & (!\u_spi_ee_config|read_idle_count[10]~36\)) # (!\u_spi_ee_config|read_idle_count\(11) & ((\u_spi_ee_config|read_idle_count[10]~36\) # (GND)))
-- \u_spi_ee_config|read_idle_count[11]~38\ = CARRY((!\u_spi_ee_config|read_idle_count[10]~36\) # (!\u_spi_ee_config|read_idle_count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(11),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[10]~36\,
	combout => \u_spi_ee_config|read_idle_count[11]~37_combout\,
	cout => \u_spi_ee_config|read_idle_count[11]~38\);

-- Location: FF_X40_Y15_N25
\u_spi_ee_config|read_idle_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[11]~37_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(11));

-- Location: LCCOMB_X40_Y15_N26
\u_spi_ee_config|read_idle_count[12]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[12]~39_combout\ = (\u_spi_ee_config|read_idle_count\(12) & (\u_spi_ee_config|read_idle_count[11]~38\ $ (GND))) # (!\u_spi_ee_config|read_idle_count\(12) & (!\u_spi_ee_config|read_idle_count[11]~38\ & VCC))
-- \u_spi_ee_config|read_idle_count[12]~40\ = CARRY((\u_spi_ee_config|read_idle_count\(12) & !\u_spi_ee_config|read_idle_count[11]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_idle_count\(12),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[11]~38\,
	combout => \u_spi_ee_config|read_idle_count[12]~39_combout\,
	cout => \u_spi_ee_config|read_idle_count[12]~40\);

-- Location: FF_X40_Y15_N27
\u_spi_ee_config|read_idle_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[12]~39_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(12));

-- Location: LCCOMB_X40_Y15_N28
\u_spi_ee_config|read_idle_count[13]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[13]~41_combout\ = (\u_spi_ee_config|read_idle_count\(13) & (!\u_spi_ee_config|read_idle_count[12]~40\)) # (!\u_spi_ee_config|read_idle_count\(13) & ((\u_spi_ee_config|read_idle_count[12]~40\) # (GND)))
-- \u_spi_ee_config|read_idle_count[13]~42\ = CARRY((!\u_spi_ee_config|read_idle_count[12]~40\) # (!\u_spi_ee_config|read_idle_count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(13),
	datad => VCC,
	cin => \u_spi_ee_config|read_idle_count[12]~40\,
	combout => \u_spi_ee_config|read_idle_count[13]~41_combout\,
	cout => \u_spi_ee_config|read_idle_count[13]~42\);

-- Location: FF_X40_Y15_N29
\u_spi_ee_config|read_idle_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[13]~41_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(13));

-- Location: LCCOMB_X40_Y15_N30
\u_spi_ee_config|read_idle_count[14]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[14]~43_combout\ = \u_spi_ee_config|read_idle_count\(14) $ (!\u_spi_ee_config|read_idle_count[13]~42\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_idle_count\(14),
	cin => \u_spi_ee_config|read_idle_count[13]~42\,
	combout => \u_spi_ee_config|read_idle_count[14]~43_combout\);

-- Location: FF_X40_Y15_N31
\u_spi_ee_config|read_idle_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_idle_count[14]~43_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sclr => \u_spi_ee_config|spi_go~q\,
	ena => \u_spi_ee_config|read_idle_count[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_idle_count\(14));

-- Location: LCCOMB_X36_Y16_N18
\u_spi_ee_config|clear_status~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~0_combout\ = (!\u_spi_ee_config|read_idle_count\(14) & ((\u_spi_ee_config|clear_status_d\(3)) # (!\G_SENSOR_INT~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G_SENSOR_INT~input_o\,
	datac => \u_spi_ee_config|clear_status_d\(3),
	datad => \u_spi_ee_config|read_idle_count\(14),
	combout => \u_spi_ee_config|clear_status~0_combout\);

-- Location: LCCOMB_X35_Y13_N8
\u_spi_ee_config|p2s_data[6]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[6]~11_combout\ = (\u_reset_delay|oRST_xhdl1~q\ & !\u_spi_ee_config|spi_go~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_reset_delay|oRST_xhdl1~q\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|p2s_data[6]~11_combout\);

-- Location: LCCOMB_X36_Y16_N14
\u_spi_ee_config|p2s_data[15]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[15]~12_combout\ = (\u_spi_ee_config|p2s_data[6]~11_combout\ & (((!\u_spi_ee_config|p2s_data~10_combout\) # (!\u_spi_ee_config|clear_status~0_combout\)) # (!\u_spi_ee_config|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|clear_status~0_combout\,
	datac => \u_spi_ee_config|p2s_data[6]~11_combout\,
	datad => \u_spi_ee_config|p2s_data~10_combout\,
	combout => \u_spi_ee_config|p2s_data[15]~12_combout\);

-- Location: FF_X32_Y18_N9
\u_spi_ee_config|p2s_data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|LessThan0~0_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(15));

-- Location: LCCOMB_X30_Y16_N12
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\ = (\u_spi_ee_config|p2s_data\(15) & (\u_spi_ee_config|u_spi_controller|spi_count\(3) & \u_reset_delay|oRST_xhdl1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|p2s_data\(15),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_reset_delay|oRST_xhdl1~q\,
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\);

-- Location: FF_X30_Y16_N11
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \I2C_SDAT~input_o\,
	sload => VCC,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0));

-- Location: LCCOMB_X30_Y16_N16
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0),
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~feeder_combout\);

-- Location: FF_X30_Y16_N17
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1));

-- Location: LCCOMB_X30_Y16_N22
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1),
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder_combout\);

-- Location: FF_X30_Y16_N23
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(2));

-- Location: FF_X30_Y16_N5
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(2),
	sload => VCC,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3));

-- Location: FF_X30_Y16_N19
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3),
	sload => VCC,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4));

-- Location: LCCOMB_X30_Y16_N8
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4),
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]~feeder_combout\);

-- Location: FF_X30_Y16_N9
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5));

-- Location: FF_X30_Y16_N27
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5),
	sload => VCC,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6));

-- Location: LCCOMB_X30_Y16_N26
\u_spi_ee_config|read_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_ready~0_combout\ = (\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6) & !\u_spi_ee_config|read_back~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6),
	datad => \u_spi_ee_config|read_back~q\,
	combout => \u_spi_ee_config|read_ready~0_combout\);

-- Location: LCCOMB_X36_Y16_N20
\u_spi_ee_config|read_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_ready~1_combout\ = (\u_reset_delay|oRST_xhdl1~q\ & ((\u_spi_ee_config|high_byte~0_combout\ & (\u_spi_ee_config|read_ready~0_combout\)) # (!\u_spi_ee_config|high_byte~0_combout\ & ((\u_spi_ee_config|read_ready~q\))))) # 
-- (!\u_reset_delay|oRST_xhdl1~q\ & (((\u_spi_ee_config|read_ready~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|oRST_xhdl1~q\,
	datab => \u_spi_ee_config|read_ready~0_combout\,
	datac => \u_spi_ee_config|read_ready~q\,
	datad => \u_spi_ee_config|high_byte~0_combout\,
	combout => \u_spi_ee_config|read_ready~1_combout\);

-- Location: FF_X36_Y16_N21
\u_spi_ee_config|read_ready\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|read_ready~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_ready~q\);

-- Location: LCCOMB_X36_Y16_N30
\u_spi_ee_config|p2s_data[15]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[15]~15_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|read_ready~q\ & (!\u_spi_ee_config|high_byte~q\ & \u_spi_ee_config|clear_status~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|read_ready~q\,
	datac => \u_spi_ee_config|high_byte~q\,
	datad => \u_spi_ee_config|clear_status~0_combout\,
	combout => \u_spi_ee_config|p2s_data[15]~15_combout\);

-- Location: LCCOMB_X40_Y18_N4
\u_spi_ee_config|spi_go~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|spi_go~0_combout\ = (\u_spi_ee_config|spi_go~q\ & (!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\)) # (!\u_spi_ee_config|spi_go~q\ & ((!\u_spi_ee_config|p2s_data[15]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001101010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datab => \u_spi_ee_config|p2s_data[15]~15_combout\,
	datac => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|spi_go~0_combout\);

-- Location: FF_X40_Y18_N5
\u_spi_ee_config|spi_go\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|spi_go~0_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|spi_go~q\);

-- Location: LCCOMB_X40_Y18_N16
\u_spi_ee_config|u_spi_controller|spi_count_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\ = (!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & ((\u_spi_ee_config|spi_go~q\) # (\u_spi_ee_config|u_spi_controller|spi_count_en~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\);

-- Location: FF_X40_Y18_N17
\u_spi_ee_config|u_spi_controller|spi_count_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|spi_count_en~q\);

-- Location: LCCOMB_X40_Y18_N0
\u_spi_ee_config|u_spi_controller|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Add0~0_combout\ = \u_spi_ee_config|u_spi_controller|spi_count\(3) $ (((\u_spi_ee_config|u_spi_controller|spi_count\(1) & (\u_spi_ee_config|u_spi_controller|spi_count\(2) & 
-- \u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Add0~0_combout\);

-- Location: LCCOMB_X40_Y18_N14
\u_spi_ee_config|u_spi_controller|spi_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & \u_spi_ee_config|u_spi_controller|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datad => \u_spi_ee_config|u_spi_controller|Add0~0_combout\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count~0_combout\);

-- Location: FF_X40_Y18_N15
\u_spi_ee_config|u_spi_controller|spi_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|spi_count~0_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|spi_count\(3));

-- Location: LCCOMB_X32_Y18_N2
\u_spi_ee_config|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux7~0_combout\ = (\u_spi_ee_config|ini_index\(1) & (!\u_spi_ee_config|ini_index\(3) & (\u_spi_ee_config|ini_index\(0)))) # (!\u_spi_ee_config|ini_index\(1) & (\u_spi_ee_config|ini_index\(3) & (!\u_spi_ee_config|ini_index\(0) & 
-- !\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux7~0_combout\);

-- Location: LCCOMB_X35_Y13_N4
\u_spi_ee_config|p2s_data[6]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[6]~16_combout\ = (\u_reset_delay|oRST_xhdl1~q\ & (!\u_spi_ee_config|LessThan0~0_combout\ & !\u_spi_ee_config|spi_go~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|oRST_xhdl1~q\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|p2s_data[6]~16_combout\);

-- Location: FF_X32_Y18_N3
\u_spi_ee_config|p2s_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux7~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(4));

-- Location: LCCOMB_X32_Y18_N4
\u_spi_ee_config|p2s_data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~13_combout\ = (\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(0)) # (\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|p2s_data~13_combout\);

-- Location: FF_X32_Y18_N5
\u_spi_ee_config|p2s_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~13_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(12));

-- Location: LCCOMB_X32_Y18_N22
\u_spi_ee_config|u_spi_controller|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (\u_spi_ee_config|p2s_data\(4) & ((\u_spi_ee_config|u_spi_controller|spi_count\(0))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- (((\u_spi_ee_config|p2s_data\(12)) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datab => \u_spi_ee_config|p2s_data\(4),
	datac => \u_spi_ee_config|p2s_data\(12),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~0_combout\);

-- Location: LCCOMB_X32_Y18_N0
\u_spi_ee_config|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux6~0_combout\ = (!\u_spi_ee_config|ini_index\(3) & (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(1) $ (!\u_spi_ee_config|ini_index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux6~0_combout\);

-- Location: FF_X32_Y18_N1
\u_spi_ee_config|p2s_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux6~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(5));

-- Location: LCCOMB_X40_Y18_N26
\u_spi_ee_config|u_spi_controller|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~1_combout\ = (\u_spi_ee_config|u_spi_controller|Mux0~0_combout\) # ((\u_spi_ee_config|p2s_data\(5) & !\u_spi_ee_config|u_spi_controller|spi_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|Mux0~0_combout\,
	datac => \u_spi_ee_config|p2s_data\(5),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~1_combout\);

-- Location: LCCOMB_X32_Y18_N16
\u_spi_ee_config|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux5~0_combout\ = (\u_spi_ee_config|ini_index\(0) & ((\u_spi_ee_config|ini_index\(1) & (!\u_spi_ee_config|ini_index\(3) & !\u_spi_ee_config|ini_index\(2))) # (!\u_spi_ee_config|ini_index\(1) & (\u_spi_ee_config|ini_index\(3) $ 
-- (\u_spi_ee_config|ini_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux5~0_combout\);

-- Location: FF_X32_Y18_N17
\u_spi_ee_config|p2s_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux5~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(6));

-- Location: LCCOMB_X40_Y18_N18
\u_spi_ee_config|u_spi_controller|Mux0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~7_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((\u_spi_ee_config|p2s_data\(6) & \u_spi_ee_config|u_spi_controller|spi_count\(0))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- (\u_spi_ee_config|p2s_data\(15) & ((!\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(15),
	datab => \u_spi_ee_config|p2s_data\(6),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~7_combout\);

-- Location: LCCOMB_X32_Y18_N10
\u_spi_ee_config|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux8~0_combout\ = (\u_spi_ee_config|ini_index\(2) & (((\u_spi_ee_config|ini_index\(3)) # (!\u_spi_ee_config|ini_index\(0))))) # (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(1) & ((\u_spi_ee_config|ini_index\(3)) # 
-- (\u_spi_ee_config|ini_index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux8~0_combout\);

-- Location: FF_X32_Y18_N11
\u_spi_ee_config|p2s_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux8~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(3));

-- Location: LCCOMB_X32_Y18_N24
\u_spi_ee_config|p2s_data~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~19_combout\ = (\u_spi_ee_config|ini_index\(3) & (!\u_spi_ee_config|ini_index\(0) & !\u_spi_ee_config|ini_index\(2))) # (!\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|p2s_data~19_combout\);

-- Location: FF_X32_Y18_N25
\u_spi_ee_config|p2s_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~19_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(11));

-- Location: LCCOMB_X32_Y18_N18
\u_spi_ee_config|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux2~0_combout\ = (!\u_spi_ee_config|ini_index\(1) & ((\u_spi_ee_config|ini_index\(3) & (\u_spi_ee_config|ini_index\(0) & !\u_spi_ee_config|ini_index\(2))) # (!\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux2~0_combout\);

-- Location: LCCOMB_X36_Y16_N4
\u_spi_ee_config|p2s_data~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~17_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & ((\u_spi_ee_config|read_ready~q\) # ((\u_spi_ee_config|high_byte~q\)))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (((!\u_spi_ee_config|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|read_ready~q\,
	datac => \u_spi_ee_config|high_byte~q\,
	datad => \u_spi_ee_config|Mux2~0_combout\,
	combout => \u_spi_ee_config|p2s_data~17_combout\);

-- Location: FF_X36_Y16_N5
\u_spi_ee_config|p2s_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~17_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(10));

-- Location: LCCOMB_X32_Y18_N12
\u_spi_ee_config|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux9~0_combout\ = (!\u_spi_ee_config|ini_index\(3) & (\u_spi_ee_config|ini_index\(0) & (\u_spi_ee_config|ini_index\(1) $ (\u_spi_ee_config|ini_index\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux9~0_combout\);

-- Location: FF_X32_Y18_N13
\u_spi_ee_config|p2s_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux9~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(2));

-- Location: LCCOMB_X32_Y18_N6
\u_spi_ee_config|u_spi_controller|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~2_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((\u_spi_ee_config|p2s_data\(2) & \u_spi_ee_config|u_spi_controller|spi_count\(0))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- ((\u_spi_ee_config|p2s_data\(10)) # ((!\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datab => \u_spi_ee_config|p2s_data\(10),
	datac => \u_spi_ee_config|p2s_data\(2),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~2_combout\);

-- Location: LCCOMB_X32_Y18_N26
\u_spi_ee_config|u_spi_controller|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~3_combout\ = (\u_spi_ee_config|u_spi_controller|Mux0~2_combout\ & (((\u_spi_ee_config|p2s_data\(11)) # (\u_spi_ee_config|u_spi_controller|spi_count\(0))))) # (!\u_spi_ee_config|u_spi_controller|Mux0~2_combout\ & 
-- (\u_spi_ee_config|p2s_data\(3) & ((!\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(3),
	datab => \u_spi_ee_config|p2s_data\(11),
	datac => \u_spi_ee_config|u_spi_controller|Mux0~2_combout\,
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~3_combout\);

-- Location: LCCOMB_X32_Y18_N14
\u_spi_ee_config|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux3~0_combout\ = (\u_spi_ee_config|ini_index\(0) & (\u_spi_ee_config|ini_index\(1) & (!\u_spi_ee_config|ini_index\(3)))) # (!\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(1) $ 
-- (\u_spi_ee_config|ini_index\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux3~0_combout\);

-- Location: LCCOMB_X36_Y16_N28
\u_spi_ee_config|p2s_data~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~18_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (((\u_spi_ee_config|high_byte~q\) # (\u_spi_ee_config|read_ready~q\)))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|Mux3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|Mux3~0_combout\,
	datac => \u_spi_ee_config|high_byte~q\,
	datad => \u_spi_ee_config|read_ready~q\,
	combout => \u_spi_ee_config|p2s_data~18_combout\);

-- Location: FF_X36_Y16_N29
\u_spi_ee_config|p2s_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~18_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(9));

-- Location: LCCOMB_X32_Y18_N20
\u_spi_ee_config|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux4~0_combout\ = (\u_spi_ee_config|ini_index\(3)) # ((\u_spi_ee_config|ini_index\(0) & ((!\u_spi_ee_config|ini_index\(2)) # (!\u_spi_ee_config|ini_index\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux4~0_combout\);

-- Location: LCCOMB_X36_Y16_N24
\u_spi_ee_config|p2s_data~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~14_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & ((\u_spi_ee_config|high_byte~q\))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|Mux4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|Mux4~0_combout\,
	datac => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|p2s_data~14_combout\);

-- Location: FF_X36_Y16_N25
\u_spi_ee_config|p2s_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~14_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(8));

-- Location: LCCOMB_X32_Y18_N30
\u_spi_ee_config|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux11~0_combout\ = (!\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(0) & ((!\u_spi_ee_config|ini_index\(2)))) # (!\u_spi_ee_config|ini_index\(0) & ((\u_spi_ee_config|ini_index\(1)) # (\u_spi_ee_config|ini_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux11~0_combout\);

-- Location: FF_X32_Y18_N31
\u_spi_ee_config|p2s_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux11~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(0));

-- Location: LCCOMB_X32_Y18_N28
\u_spi_ee_config|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux10~0_combout\ = (!\u_spi_ee_config|ini_index\(3) & (\u_spi_ee_config|ini_index\(0) & ((!\u_spi_ee_config|ini_index\(2)) # (!\u_spi_ee_config|ini_index\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux10~0_combout\);

-- Location: FF_X32_Y18_N29
\u_spi_ee_config|p2s_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux10~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(1));

-- Location: LCCOMB_X40_Y18_N20
\u_spi_ee_config|u_spi_controller|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~4_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & ((\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|p2s_data\(0))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- ((\u_spi_ee_config|p2s_data\(1)))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((!\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(0),
	datab => \u_spi_ee_config|p2s_data\(1),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~4_combout\);

-- Location: LCCOMB_X40_Y18_N22
\u_spi_ee_config|u_spi_controller|Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~5_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((\u_spi_ee_config|u_spi_controller|Mux0~4_combout\)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- ((\u_spi_ee_config|u_spi_controller|Mux0~4_combout\ & (\u_spi_ee_config|p2s_data\(9))) # (!\u_spi_ee_config|u_spi_controller|Mux0~4_combout\ & ((\u_spi_ee_config|p2s_data\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(9),
	datab => \u_spi_ee_config|p2s_data\(8),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|u_spi_controller|Mux0~4_combout\,
	combout => \u_spi_ee_config|u_spi_controller|Mux0~5_combout\);

-- Location: LCCOMB_X40_Y18_N8
\u_spi_ee_config|u_spi_controller|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~6_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(1) & (((\u_spi_ee_config|u_spi_controller|Mux0~5_combout\ & \u_spi_ee_config|u_spi_controller|spi_count\(2))))) # 
-- (!\u_spi_ee_config|u_spi_controller|spi_count\(1) & ((\u_spi_ee_config|u_spi_controller|Mux0~3_combout\) # ((!\u_spi_ee_config|u_spi_controller|spi_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datab => \u_spi_ee_config|u_spi_controller|Mux0~3_combout\,
	datac => \u_spi_ee_config|u_spi_controller|Mux0~5_combout\,
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~6_combout\);

-- Location: LCCOMB_X40_Y18_N28
\u_spi_ee_config|u_spi_controller|Mux0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~8_combout\ = (\u_spi_ee_config|u_spi_controller|Mux0~6_combout\ & (((\u_spi_ee_config|u_spi_controller|Mux0~7_combout\) # (\u_spi_ee_config|u_spi_controller|spi_count\(2))))) # 
-- (!\u_spi_ee_config|u_spi_controller|Mux0~6_combout\ & (\u_spi_ee_config|u_spi_controller|Mux0~1_combout\ & ((!\u_spi_ee_config|u_spi_controller|spi_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|Mux0~1_combout\,
	datab => \u_spi_ee_config|u_spi_controller|Mux0~7_combout\,
	datac => \u_spi_ee_config|u_spi_controller|Mux0~6_combout\,
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~8_combout\);

-- Location: LCCOMB_X40_Y18_N6
\u_spi_ee_config|u_spi_controller|temp_xhdl7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & ((!\u_spi_ee_config|u_spi_controller|spi_count\(3)) # (!\u_spi_ee_config|p2s_data\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(15),
	datab => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	combout => \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\);

-- Location: CLKCTRL_G19
\u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

-- Location: LCCOMB_X40_Y18_N10
\u_spi_ee_config|u_spi_controller|oSPI_CLK~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oSPI_CLK~0_combout\ = (GLOBAL(\u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\)) # (!\u_spi_ee_config|u_spi_controller|spi_count_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	datad => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	combout => \u_spi_ee_config|u_spi_controller|oSPI_CLK~0_combout\);

-- Location: FF_X36_Y16_N27
\u_spi_ee_config|high_byte_d\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|high_byte~q\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|high_byte_d~q\);

-- Location: FF_X36_Y16_N17
\u_spi_ee_config|read_back_d\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|read_back~q\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|read_back_d~q\);

-- Location: LCCOMB_X36_Y16_N16
\u_spi_ee_config|oDATA_H_xhdl2[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|oDATA_H_xhdl2[1]~0_combout\ = (\u_spi_ee_config|high_byte_d~q\ & (\u_spi_ee_config|p2s_data[6]~11_combout\ & (\u_spi_ee_config|read_back_d~q\ & \u_spi_ee_config|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte_d~q\,
	datab => \u_spi_ee_config|p2s_data[6]~11_combout\,
	datac => \u_spi_ee_config|read_back_d~q\,
	datad => \u_spi_ee_config|LessThan0~0_combout\,
	combout => \u_spi_ee_config|oDATA_H_xhdl2[1]~0_combout\);

-- Location: FF_X9_Y15_N11
\u_spi_ee_config|oDATA_H_xhdl2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_H_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_H_xhdl2\(0));

-- Location: FF_X9_Y15_N25
\u_spi_ee_config|oDATA_H_xhdl2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_H_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_H_xhdl2\(1));

-- Location: FF_X30_Y16_N7
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6),
	sload => VCC,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(7));

-- Location: LCCOMB_X30_Y16_N30
\u_spi_ee_config|low_byte_data[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_data[7]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(7),
	combout => \u_spi_ee_config|low_byte_data[7]~feeder_combout\);

-- Location: LCCOMB_X36_Y16_N26
\u_spi_ee_config|low_byte_data[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_data[7]~0_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|p2s_data[6]~11_combout\ & (!\u_spi_ee_config|high_byte_d~q\ & \u_spi_ee_config|read_back_d~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|p2s_data[6]~11_combout\,
	datac => \u_spi_ee_config|high_byte_d~q\,
	datad => \u_spi_ee_config|read_back_d~q\,
	combout => \u_spi_ee_config|low_byte_data[7]~0_combout\);

-- Location: FF_X30_Y16_N31
\u_spi_ee_config|low_byte_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_data[7]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_data\(7));

-- Location: FF_X9_Y15_N31
\u_spi_ee_config|oDATA_L_xhdl1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_data\(7),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_H_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_L_xhdl1\(7));

-- Location: LCCOMB_X9_Y15_N30
\u_led_driver|temp_xhdl6[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|temp_xhdl6[3]~2_combout\ = (\u_spi_ee_config|oDATA_H_xhdl2\(0) & (\u_spi_ee_config|oDATA_H_xhdl2\(1) & ((\u_spi_ee_config|oDATA_L_xhdl1\(7)) # (\G_SENSOR_INT~input_o\)))) # (!\u_spi_ee_config|oDATA_H_xhdl2\(0) & 
-- (!\u_spi_ee_config|oDATA_H_xhdl2\(1) & ((\G_SENSOR_INT~input_o\) # (!\u_spi_ee_config|oDATA_L_xhdl1\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_H_xhdl2\(0),
	datab => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	datac => \u_spi_ee_config|oDATA_L_xhdl1\(7),
	datad => \G_SENSOR_INT~input_o\,
	combout => \u_led_driver|temp_xhdl6[3]~2_combout\);

-- Location: FF_X25_Y14_N17
\u_led_driver|int2_d[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G_SENSOR_INT~input_o\,
	sload => VCC,
	ena => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_d\(0));

-- Location: LCCOMB_X29_Y14_N8
\u_led_driver|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~0_combout\ = \u_led_driver|int2_count\(0) $ (VCC)
-- \u_led_driver|Add0~1\ = CARRY(\u_led_driver|int2_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(0),
	datad => VCC,
	combout => \u_led_driver|Add0~0_combout\,
	cout => \u_led_driver|Add0~1\);

-- Location: LCCOMB_X35_Y14_N16
\u_led_driver|int2_d[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_d[1]~feeder_combout\ = \u_led_driver|int2_d\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_led_driver|int2_d\(0),
	combout => \u_led_driver|int2_d[1]~feeder_combout\);

-- Location: FF_X35_Y14_N17
\u_led_driver|int2_d[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_d[1]~feeder_combout\,
	ena => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_d\(1));

-- Location: LCCOMB_X25_Y14_N22
\u_led_driver|int2_count~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~24_combout\ = (\u_led_driver|Add0~0_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|Add0~0_combout\,
	datab => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~24_combout\);

-- Location: LCCOMB_X29_Y13_N16
\u_led_driver|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~40_combout\ = (\u_led_driver|int2_count\(20) & (\u_led_driver|Add0~39\ $ (GND))) # (!\u_led_driver|int2_count\(20) & (!\u_led_driver|Add0~39\ & VCC))
-- \u_led_driver|Add0~41\ = CARRY((\u_led_driver|int2_count\(20) & !\u_led_driver|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(20),
	datad => VCC,
	cin => \u_led_driver|Add0~39\,
	combout => \u_led_driver|Add0~40_combout\,
	cout => \u_led_driver|Add0~41\);

-- Location: LCCOMB_X29_Y13_N18
\u_led_driver|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~42_combout\ = (\u_led_driver|int2_count\(21) & (!\u_led_driver|Add0~41\)) # (!\u_led_driver|int2_count\(21) & ((\u_led_driver|Add0~41\) # (GND)))
-- \u_led_driver|Add0~43\ = CARRY((!\u_led_driver|Add0~41\) # (!\u_led_driver|int2_count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(21),
	datad => VCC,
	cin => \u_led_driver|Add0~41\,
	combout => \u_led_driver|Add0~42_combout\,
	cout => \u_led_driver|Add0~43\);

-- Location: LCCOMB_X29_Y13_N28
\u_led_driver|int2_count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~4_combout\ = (\u_led_driver|Add0~42_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_d\(1),
	datab => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|Add0~42_combout\,
	combout => \u_led_driver|int2_count~4_combout\);

-- Location: FF_X29_Y13_N29
\u_led_driver|int2_count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~4_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(21));

-- Location: LCCOMB_X29_Y13_N20
\u_led_driver|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~44_combout\ = (\u_led_driver|int2_count\(22) & (\u_led_driver|Add0~43\ $ (GND))) # (!\u_led_driver|int2_count\(22) & (!\u_led_driver|Add0~43\ & VCC))
-- \u_led_driver|Add0~45\ = CARRY((\u_led_driver|int2_count\(22) & !\u_led_driver|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(22),
	datad => VCC,
	cin => \u_led_driver|Add0~43\,
	combout => \u_led_driver|Add0~44_combout\,
	cout => \u_led_driver|Add0~45\);

-- Location: LCCOMB_X29_Y13_N26
\u_led_driver|int2_count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~3_combout\ = (\u_led_driver|Add0~44_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_d\(1),
	datab => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|Add0~44_combout\,
	combout => \u_led_driver|int2_count~3_combout\);

-- Location: FF_X29_Y13_N27
\u_led_driver|int2_count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~3_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(22));

-- Location: LCCOMB_X29_Y13_N22
\u_led_driver|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~46_combout\ = \u_led_driver|Add0~45\ $ (!\u_led_driver|int2_count\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_led_driver|int2_count\(23),
	cin => \u_led_driver|Add0~45\,
	combout => \u_led_driver|Add0~46_combout\);

-- Location: LCCOMB_X29_Y13_N24
\u_led_driver|int2_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~0_combout\ = (\u_led_driver|Add0~46_combout\ & (\u_led_driver|int2_d\(0) & ((!\u_led_driver|int2_d\(1))))) # (!\u_led_driver|Add0~46_combout\ & ((\u_led_driver|int2_count\(23)) # ((\u_led_driver|int2_d\(0) & 
-- !\u_led_driver|int2_d\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|Add0~46_combout\,
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|int2_count\(23),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~0_combout\);

-- Location: FF_X29_Y13_N25
\u_led_driver|int2_count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~0_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(23));

-- Location: LCCOMB_X25_Y14_N16
\u_led_driver|int2_count[14]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count[14]~2_combout\ = (\u_led_driver|int2_count\(23)) # ((\u_led_driver|int2_d\(0) & !\u_led_driver|int2_d\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(23),
	datac => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count[14]~2_combout\);

-- Location: FF_X25_Y14_N23
\u_led_driver|int2_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~24_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(0));

-- Location: LCCOMB_X29_Y14_N10
\u_led_driver|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~2_combout\ = (\u_led_driver|int2_count\(1) & (!\u_led_driver|Add0~1\)) # (!\u_led_driver|int2_count\(1) & ((\u_led_driver|Add0~1\) # (GND)))
-- \u_led_driver|Add0~3\ = CARRY((!\u_led_driver|Add0~1\) # (!\u_led_driver|int2_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(1),
	datad => VCC,
	cin => \u_led_driver|Add0~1\,
	combout => \u_led_driver|Add0~2_combout\,
	cout => \u_led_driver|Add0~3\);

-- Location: LCCOMB_X25_Y14_N4
\u_led_driver|int2_count~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~23_combout\ = (\u_led_driver|Add0~2_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|Add0~2_combout\,
	datab => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~23_combout\);

-- Location: FF_X25_Y14_N5
\u_led_driver|int2_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~23_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(1));

-- Location: LCCOMB_X29_Y14_N12
\u_led_driver|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~4_combout\ = (\u_led_driver|int2_count\(2) & (\u_led_driver|Add0~3\ $ (GND))) # (!\u_led_driver|int2_count\(2) & (!\u_led_driver|Add0~3\ & VCC))
-- \u_led_driver|Add0~5\ = CARRY((\u_led_driver|int2_count\(2) & !\u_led_driver|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(2),
	datad => VCC,
	cin => \u_led_driver|Add0~3\,
	combout => \u_led_driver|Add0~4_combout\,
	cout => \u_led_driver|Add0~5\);

-- Location: LCCOMB_X25_Y14_N10
\u_led_driver|int2_count~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~22_combout\ = (\u_led_driver|Add0~4_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~4_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~22_combout\);

-- Location: FF_X25_Y14_N11
\u_led_driver|int2_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~22_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(2));

-- Location: LCCOMB_X29_Y14_N14
\u_led_driver|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~6_combout\ = (\u_led_driver|int2_count\(3) & (!\u_led_driver|Add0~5\)) # (!\u_led_driver|int2_count\(3) & ((\u_led_driver|Add0~5\) # (GND)))
-- \u_led_driver|Add0~7\ = CARRY((!\u_led_driver|Add0~5\) # (!\u_led_driver|int2_count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(3),
	datad => VCC,
	cin => \u_led_driver|Add0~5\,
	combout => \u_led_driver|Add0~6_combout\,
	cout => \u_led_driver|Add0~7\);

-- Location: LCCOMB_X25_Y14_N24
\u_led_driver|int2_count~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~21_combout\ = (\u_led_driver|Add0~6_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|Add0~6_combout\,
	datab => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~21_combout\);

-- Location: FF_X25_Y14_N25
\u_led_driver|int2_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~21_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(3));

-- Location: LCCOMB_X29_Y14_N16
\u_led_driver|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~8_combout\ = (\u_led_driver|int2_count\(4) & (\u_led_driver|Add0~7\ $ (GND))) # (!\u_led_driver|int2_count\(4) & (!\u_led_driver|Add0~7\ & VCC))
-- \u_led_driver|Add0~9\ = CARRY((\u_led_driver|int2_count\(4) & !\u_led_driver|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(4),
	datad => VCC,
	cin => \u_led_driver|Add0~7\,
	combout => \u_led_driver|Add0~8_combout\,
	cout => \u_led_driver|Add0~9\);

-- Location: LCCOMB_X29_Y14_N6
\u_led_driver|int2_count~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~20_combout\ = (\u_led_driver|Add0~8_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|Add0~8_combout\,
	datac => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~20_combout\);

-- Location: FF_X29_Y14_N7
\u_led_driver|int2_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~20_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(4));

-- Location: LCCOMB_X29_Y14_N18
\u_led_driver|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~10_combout\ = (\u_led_driver|int2_count\(5) & (!\u_led_driver|Add0~9\)) # (!\u_led_driver|int2_count\(5) & ((\u_led_driver|Add0~9\) # (GND)))
-- \u_led_driver|Add0~11\ = CARRY((!\u_led_driver|Add0~9\) # (!\u_led_driver|int2_count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(5),
	datad => VCC,
	cin => \u_led_driver|Add0~9\,
	combout => \u_led_driver|Add0~10_combout\,
	cout => \u_led_driver|Add0~11\);

-- Location: LCCOMB_X29_Y14_N4
\u_led_driver|int2_count~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~19_combout\ = (\u_led_driver|Add0~10_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|Add0~10_combout\,
	datac => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~19_combout\);

-- Location: FF_X29_Y14_N5
\u_led_driver|int2_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~19_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(5));

-- Location: LCCOMB_X29_Y14_N20
\u_led_driver|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~12_combout\ = (\u_led_driver|int2_count\(6) & (\u_led_driver|Add0~11\ $ (GND))) # (!\u_led_driver|int2_count\(6) & (!\u_led_driver|Add0~11\ & VCC))
-- \u_led_driver|Add0~13\ = CARRY((\u_led_driver|int2_count\(6) & !\u_led_driver|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(6),
	datad => VCC,
	cin => \u_led_driver|Add0~11\,
	combout => \u_led_driver|Add0~12_combout\,
	cout => \u_led_driver|Add0~13\);

-- Location: LCCOMB_X29_Y14_N2
\u_led_driver|int2_count~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~18_combout\ = (\u_led_driver|Add0~12_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|Add0~12_combout\,
	datac => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~18_combout\);

-- Location: FF_X29_Y14_N3
\u_led_driver|int2_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~18_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(6));

-- Location: LCCOMB_X29_Y14_N22
\u_led_driver|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~14_combout\ = (\u_led_driver|int2_count\(7) & (!\u_led_driver|Add0~13\)) # (!\u_led_driver|int2_count\(7) & ((\u_led_driver|Add0~13\) # (GND)))
-- \u_led_driver|Add0~15\ = CARRY((!\u_led_driver|Add0~13\) # (!\u_led_driver|int2_count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(7),
	datad => VCC,
	cin => \u_led_driver|Add0~13\,
	combout => \u_led_driver|Add0~14_combout\,
	cout => \u_led_driver|Add0~15\);

-- Location: LCCOMB_X29_Y14_N0
\u_led_driver|int2_count~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~17_combout\ = (\u_led_driver|Add0~14_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~14_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~17_combout\);

-- Location: FF_X29_Y14_N1
\u_led_driver|int2_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~17_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(7));

-- Location: LCCOMB_X29_Y14_N24
\u_led_driver|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~16_combout\ = (\u_led_driver|int2_count\(8) & (\u_led_driver|Add0~15\ $ (GND))) # (!\u_led_driver|int2_count\(8) & (!\u_led_driver|Add0~15\ & VCC))
-- \u_led_driver|Add0~17\ = CARRY((\u_led_driver|int2_count\(8) & !\u_led_driver|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(8),
	datad => VCC,
	cin => \u_led_driver|Add0~15\,
	combout => \u_led_driver|Add0~16_combout\,
	cout => \u_led_driver|Add0~17\);

-- Location: LCCOMB_X35_Y14_N24
\u_led_driver|int2_count~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~16_combout\ = (\u_led_driver|Add0~16_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~16_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~16_combout\);

-- Location: FF_X35_Y14_N25
\u_led_driver|int2_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~16_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(8));

-- Location: LCCOMB_X29_Y14_N26
\u_led_driver|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~18_combout\ = (\u_led_driver|int2_count\(9) & (!\u_led_driver|Add0~17\)) # (!\u_led_driver|int2_count\(9) & ((\u_led_driver|Add0~17\) # (GND)))
-- \u_led_driver|Add0~19\ = CARRY((!\u_led_driver|Add0~17\) # (!\u_led_driver|int2_count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(9),
	datad => VCC,
	cin => \u_led_driver|Add0~17\,
	combout => \u_led_driver|Add0~18_combout\,
	cout => \u_led_driver|Add0~19\);

-- Location: LCCOMB_X25_Y14_N6
\u_led_driver|int2_count~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~15_combout\ = (\u_led_driver|Add0~18_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~18_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~15_combout\);

-- Location: FF_X25_Y14_N7
\u_led_driver|int2_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~15_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(9));

-- Location: LCCOMB_X29_Y14_N28
\u_led_driver|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~20_combout\ = (\u_led_driver|int2_count\(10) & (\u_led_driver|Add0~19\ $ (GND))) # (!\u_led_driver|int2_count\(10) & (!\u_led_driver|Add0~19\ & VCC))
-- \u_led_driver|Add0~21\ = CARRY((\u_led_driver|int2_count\(10) & !\u_led_driver|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(10),
	datad => VCC,
	cin => \u_led_driver|Add0~19\,
	combout => \u_led_driver|Add0~20_combout\,
	cout => \u_led_driver|Add0~21\);

-- Location: LCCOMB_X25_Y14_N28
\u_led_driver|int2_count~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~14_combout\ = (\u_led_driver|Add0~20_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~20_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~14_combout\);

-- Location: FF_X25_Y14_N29
\u_led_driver|int2_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~14_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(10));

-- Location: LCCOMB_X29_Y14_N30
\u_led_driver|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~22_combout\ = (\u_led_driver|int2_count\(11) & (!\u_led_driver|Add0~21\)) # (!\u_led_driver|int2_count\(11) & ((\u_led_driver|Add0~21\) # (GND)))
-- \u_led_driver|Add0~23\ = CARRY((!\u_led_driver|Add0~21\) # (!\u_led_driver|int2_count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(11),
	datad => VCC,
	cin => \u_led_driver|Add0~21\,
	combout => \u_led_driver|Add0~22_combout\,
	cout => \u_led_driver|Add0~23\);

-- Location: LCCOMB_X35_Y14_N6
\u_led_driver|int2_count~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~13_combout\ = (\u_led_driver|Add0~22_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~22_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~13_combout\);

-- Location: FF_X35_Y14_N7
\u_led_driver|int2_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~13_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(11));

-- Location: LCCOMB_X29_Y13_N0
\u_led_driver|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~24_combout\ = (\u_led_driver|int2_count\(12) & (\u_led_driver|Add0~23\ $ (GND))) # (!\u_led_driver|int2_count\(12) & (!\u_led_driver|Add0~23\ & VCC))
-- \u_led_driver|Add0~25\ = CARRY((\u_led_driver|int2_count\(12) & !\u_led_driver|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(12),
	datad => VCC,
	cin => \u_led_driver|Add0~23\,
	combout => \u_led_driver|Add0~24_combout\,
	cout => \u_led_driver|Add0~25\);

-- Location: LCCOMB_X25_Y14_N26
\u_led_driver|int2_count~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~12_combout\ = (\u_led_driver|Add0~24_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|Add0~24_combout\,
	datab => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~12_combout\);

-- Location: FF_X25_Y14_N27
\u_led_driver|int2_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~12_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(12));

-- Location: LCCOMB_X29_Y13_N2
\u_led_driver|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~26_combout\ = (\u_led_driver|int2_count\(13) & (!\u_led_driver|Add0~25\)) # (!\u_led_driver|int2_count\(13) & ((\u_led_driver|Add0~25\) # (GND)))
-- \u_led_driver|Add0~27\ = CARRY((!\u_led_driver|Add0~25\) # (!\u_led_driver|int2_count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(13),
	datad => VCC,
	cin => \u_led_driver|Add0~25\,
	combout => \u_led_driver|Add0~26_combout\,
	cout => \u_led_driver|Add0~27\);

-- Location: LCCOMB_X35_Y14_N4
\u_led_driver|int2_count~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~11_combout\ = (\u_led_driver|Add0~26_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~26_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~11_combout\);

-- Location: FF_X35_Y14_N5
\u_led_driver|int2_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~11_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(13));

-- Location: LCCOMB_X29_Y13_N4
\u_led_driver|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~28_combout\ = (\u_led_driver|int2_count\(14) & (\u_led_driver|Add0~27\ $ (GND))) # (!\u_led_driver|int2_count\(14) & (!\u_led_driver|Add0~27\ & VCC))
-- \u_led_driver|Add0~29\ = CARRY((\u_led_driver|int2_count\(14) & !\u_led_driver|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(14),
	datad => VCC,
	cin => \u_led_driver|Add0~27\,
	combout => \u_led_driver|Add0~28_combout\,
	cout => \u_led_driver|Add0~29\);

-- Location: LCCOMB_X25_Y14_N8
\u_led_driver|int2_count~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~10_combout\ = (\u_led_driver|Add0~28_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~28_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~10_combout\);

-- Location: FF_X25_Y14_N9
\u_led_driver|int2_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~10_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(14));

-- Location: LCCOMB_X29_Y13_N6
\u_led_driver|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~30_combout\ = (\u_led_driver|int2_count\(15) & (!\u_led_driver|Add0~29\)) # (!\u_led_driver|int2_count\(15) & ((\u_led_driver|Add0~29\) # (GND)))
-- \u_led_driver|Add0~31\ = CARRY((!\u_led_driver|Add0~29\) # (!\u_led_driver|int2_count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(15),
	datad => VCC,
	cin => \u_led_driver|Add0~29\,
	combout => \u_led_driver|Add0~30_combout\,
	cout => \u_led_driver|Add0~31\);

-- Location: LCCOMB_X25_Y14_N30
\u_led_driver|int2_count~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~9_combout\ = (\u_led_driver|Add0~30_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~30_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~9_combout\);

-- Location: FF_X25_Y14_N31
\u_led_driver|int2_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~9_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(15));

-- Location: LCCOMB_X29_Y13_N8
\u_led_driver|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~32_combout\ = (\u_led_driver|int2_count\(16) & (\u_led_driver|Add0~31\ $ (GND))) # (!\u_led_driver|int2_count\(16) & (!\u_led_driver|Add0~31\ & VCC))
-- \u_led_driver|Add0~33\ = CARRY((\u_led_driver|int2_count\(16) & !\u_led_driver|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(16),
	datad => VCC,
	cin => \u_led_driver|Add0~31\,
	combout => \u_led_driver|Add0~32_combout\,
	cout => \u_led_driver|Add0~33\);

-- Location: LCCOMB_X35_Y14_N2
\u_led_driver|int2_count~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~8_combout\ = (\u_led_driver|Add0~32_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|Add0~32_combout\,
	datab => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~8_combout\);

-- Location: FF_X35_Y14_N3
\u_led_driver|int2_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~8_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(16));

-- Location: LCCOMB_X29_Y13_N10
\u_led_driver|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~34_combout\ = (\u_led_driver|int2_count\(17) & (!\u_led_driver|Add0~33\)) # (!\u_led_driver|int2_count\(17) & ((\u_led_driver|Add0~33\) # (GND)))
-- \u_led_driver|Add0~35\ = CARRY((!\u_led_driver|Add0~33\) # (!\u_led_driver|int2_count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(17),
	datad => VCC,
	cin => \u_led_driver|Add0~33\,
	combout => \u_led_driver|Add0~34_combout\,
	cout => \u_led_driver|Add0~35\);

-- Location: LCCOMB_X29_Y13_N30
\u_led_driver|int2_count~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~7_combout\ = (\u_led_driver|Add0~34_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|Add0~34_combout\,
	datab => \u_led_driver|int2_d\(0),
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~7_combout\);

-- Location: FF_X29_Y13_N31
\u_led_driver|int2_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~7_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(17));

-- Location: LCCOMB_X29_Y13_N12
\u_led_driver|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~36_combout\ = (\u_led_driver|int2_count\(18) & (\u_led_driver|Add0~35\ $ (GND))) # (!\u_led_driver|int2_count\(18) & (!\u_led_driver|Add0~35\ & VCC))
-- \u_led_driver|Add0~37\ = CARRY((\u_led_driver|int2_count\(18) & !\u_led_driver|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_count\(18),
	datad => VCC,
	cin => \u_led_driver|Add0~35\,
	combout => \u_led_driver|Add0~36_combout\,
	cout => \u_led_driver|Add0~37\);

-- Location: LCCOMB_X25_Y14_N12
\u_led_driver|int2_count~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~6_combout\ = (\u_led_driver|Add0~36_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~36_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~6_combout\);

-- Location: FF_X25_Y14_N13
\u_led_driver|int2_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~6_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(18));

-- Location: LCCOMB_X29_Y13_N14
\u_led_driver|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|Add0~38_combout\ = (\u_led_driver|int2_count\(19) & (!\u_led_driver|Add0~37\)) # (!\u_led_driver|int2_count\(19) & ((\u_led_driver|Add0~37\) # (GND)))
-- \u_led_driver|Add0~39\ = CARRY((!\u_led_driver|Add0~37\) # (!\u_led_driver|int2_count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(19),
	datad => VCC,
	cin => \u_led_driver|Add0~37\,
	combout => \u_led_driver|Add0~38_combout\,
	cout => \u_led_driver|Add0~39\);

-- Location: LCCOMB_X25_Y14_N18
\u_led_driver|int2_count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~5_combout\ = (\u_led_driver|Add0~38_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~38_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~5_combout\);

-- Location: FF_X25_Y14_N19
\u_led_driver|int2_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~5_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(19));

-- Location: LCCOMB_X25_Y14_N0
\u_led_driver|int2_count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|int2_count~1_combout\ = (\u_led_driver|Add0~40_combout\ & ((\u_led_driver|int2_d\(1)) # (!\u_led_driver|int2_d\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_led_driver|int2_d\(0),
	datac => \u_led_driver|Add0~40_combout\,
	datad => \u_led_driver|int2_d\(1),
	combout => \u_led_driver|int2_count~1_combout\);

-- Location: FF_X25_Y14_N1
\u_led_driver|int2_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_led_driver|int2_count~1_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	ena => \u_led_driver|int2_count[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_led_driver|int2_count\(20));

-- Location: LCCOMB_X26_Y24_N16
\u_led_driver|oLED[0]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[0]~14_combout\ = (!\u_led_driver|int2_count\(20) & \u_led_driver|int2_count\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_led_driver|int2_count\(20),
	datad => \u_led_driver|int2_count\(23),
	combout => \u_led_driver|oLED[0]~14_combout\);

-- Location: LCCOMB_X26_Y24_N26
\u_led_driver|oLED[2]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[2]~15_combout\ = (\u_spi_ee_config|oDATA_H_xhdl2\(1) & !\u_led_driver|int2_count\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	datad => \u_led_driver|int2_count\(23),
	combout => \u_led_driver|oLED[2]~15_combout\);

-- Location: FF_X30_Y16_N29
\u_spi_ee_config|low_byte_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_data\(6));

-- Location: FF_X9_Y15_N21
\u_spi_ee_config|oDATA_L_xhdl1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_data\(6),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_H_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_L_xhdl1\(6));

-- Location: LCCOMB_X9_Y15_N10
\u_led_driver|temp_xhdl6[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|temp_xhdl6[2]~0_combout\ = (!\G_SENSOR_INT~input_o\ & ((\u_spi_ee_config|oDATA_L_xhdl1\(6) & ((!\u_spi_ee_config|oDATA_H_xhdl2\(1)) # (!\u_spi_ee_config|oDATA_H_xhdl2\(0)))) # (!\u_spi_ee_config|oDATA_L_xhdl1\(6) & 
-- ((\u_spi_ee_config|oDATA_H_xhdl2\(0)) # (\u_spi_ee_config|oDATA_H_xhdl2\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G_SENSOR_INT~input_o\,
	datab => \u_spi_ee_config|oDATA_L_xhdl1\(6),
	datac => \u_spi_ee_config|oDATA_H_xhdl2\(0),
	datad => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	combout => \u_led_driver|temp_xhdl6[2]~0_combout\);

-- Location: LCCOMB_X9_Y15_N8
\u_led_driver|temp_xhdl6[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|temp_xhdl6[2]~1_combout\ = (\u_led_driver|temp_xhdl6[2]~0_combout\) # ((\G_SENSOR_INT~input_o\ & (\u_spi_ee_config|oDATA_H_xhdl2\(1) $ (\u_spi_ee_config|oDATA_L_xhdl1\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G_SENSOR_INT~input_o\,
	datab => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	datac => \u_led_driver|temp_xhdl6[2]~0_combout\,
	datad => \u_spi_ee_config|oDATA_L_xhdl1\(7),
	combout => \u_led_driver|temp_xhdl6[2]~1_combout\);

-- Location: LCCOMB_X26_Y24_N20
\u_led_driver|oLED[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[0]~16_combout\ = (\u_led_driver|oLED[0]~14_combout\) # ((!\u_led_driver|temp_xhdl6[3]~2_combout\ & (\u_led_driver|oLED[2]~15_combout\ & \u_led_driver|temp_xhdl6[2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|temp_xhdl6[3]~2_combout\,
	datab => \u_led_driver|oLED[0]~14_combout\,
	datac => \u_led_driver|oLED[2]~15_combout\,
	datad => \u_led_driver|temp_xhdl6[2]~1_combout\,
	combout => \u_led_driver|oLED[0]~16_combout\);

-- Location: FF_X30_Y16_N25
\u_spi_ee_config|low_byte_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_data\(5));

-- Location: FF_X9_Y15_N27
\u_spi_ee_config|oDATA_L_xhdl1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_data\(5),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_H_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_L_xhdl1\(5));

-- Location: LCCOMB_X9_Y15_N26
\u_led_driver|temp_xhdl6[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|temp_xhdl6[1]~3_combout\ = (!\G_SENSOR_INT~input_o\ & ((\u_spi_ee_config|oDATA_H_xhdl2\(0) & ((!\u_spi_ee_config|oDATA_L_xhdl1\(5)) # (!\u_spi_ee_config|oDATA_H_xhdl2\(1)))) # (!\u_spi_ee_config|oDATA_H_xhdl2\(0) & 
-- ((\u_spi_ee_config|oDATA_H_xhdl2\(1)) # (\u_spi_ee_config|oDATA_L_xhdl1\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_H_xhdl2\(0),
	datab => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	datac => \u_spi_ee_config|oDATA_L_xhdl1\(5),
	datad => \G_SENSOR_INT~input_o\,
	combout => \u_led_driver|temp_xhdl6[1]~3_combout\);

-- Location: LCCOMB_X9_Y15_N20
\u_led_driver|temp_xhdl6[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|temp_xhdl6[1]~4_combout\ = (\u_led_driver|temp_xhdl6[1]~3_combout\) # ((\G_SENSOR_INT~input_o\ & (\u_spi_ee_config|oDATA_L_xhdl1\(6) $ (\u_spi_ee_config|oDATA_H_xhdl2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G_SENSOR_INT~input_o\,
	datab => \u_led_driver|temp_xhdl6[1]~3_combout\,
	datac => \u_spi_ee_config|oDATA_L_xhdl1\(6),
	datad => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	combout => \u_led_driver|temp_xhdl6[1]~4_combout\);

-- Location: LCCOMB_X26_Y24_N6
\u_led_driver|oLED[1]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[1]~17_combout\ = (\u_led_driver|oLED[2]~15_combout\ & (!\u_led_driver|temp_xhdl6[3]~2_combout\ & ((!\u_led_driver|temp_xhdl6[2]~1_combout\) # (!\u_led_driver|temp_xhdl6[1]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|temp_xhdl6[1]~4_combout\,
	datab => \u_led_driver|temp_xhdl6[2]~1_combout\,
	datac => \u_led_driver|oLED[2]~15_combout\,
	datad => \u_led_driver|temp_xhdl6[3]~2_combout\,
	combout => \u_led_driver|oLED[1]~17_combout\);

-- Location: LCCOMB_X26_Y24_N18
\u_led_driver|oLED[1]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[1]~25_combout\ = (\u_led_driver|oLED[1]~17_combout\) # ((!\u_led_driver|int2_count\(20) & \u_led_driver|int2_count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|oLED[1]~17_combout\,
	datac => \u_led_driver|int2_count\(20),
	datad => \u_led_driver|int2_count\(23),
	combout => \u_led_driver|oLED[1]~25_combout\);

-- Location: LCCOMB_X9_Y15_N28
\u_led_driver|oLED[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[2]~18_combout\ = (\u_led_driver|temp_xhdl6[2]~1_combout\ & ((\u_led_driver|temp_xhdl6[3]~2_combout\))) # (!\u_led_driver|temp_xhdl6[2]~1_combout\ & (!\u_led_driver|temp_xhdl6[1]~4_combout\ & !\u_led_driver|temp_xhdl6[3]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|temp_xhdl6[1]~4_combout\,
	datab => \u_led_driver|temp_xhdl6[2]~1_combout\,
	datac => \u_led_driver|temp_xhdl6[3]~2_combout\,
	combout => \u_led_driver|oLED[2]~18_combout\);

-- Location: LCCOMB_X9_Y15_N24
\u_led_driver|oLED[2]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[2]~28_combout\ = (\u_led_driver|int2_count\(23) & (!\u_led_driver|int2_count\(20))) # (!\u_led_driver|int2_count\(23) & (((\u_led_driver|oLED[2]~18_combout\ & \u_spi_ee_config|oDATA_H_xhdl2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(20),
	datab => \u_led_driver|oLED[2]~18_combout\,
	datac => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	datad => \u_led_driver|int2_count\(23),
	combout => \u_led_driver|oLED[2]~28_combout\);

-- Location: LCCOMB_X26_Y24_N10
\u_led_driver|oLED[6]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[6]~19_combout\ = (\u_led_driver|temp_xhdl6[3]~2_combout\ & !\u_led_driver|int2_count\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|temp_xhdl6[3]~2_combout\,
	datad => \u_led_driver|int2_count\(23),
	combout => \u_led_driver|oLED[6]~19_combout\);

-- Location: LCCOMB_X26_Y24_N12
\u_led_driver|oLED[3]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[3]~20_combout\ = (!\u_led_driver|oLED[0]~14_combout\ & ((\u_led_driver|temp_xhdl6[1]~4_combout\) # ((\u_led_driver|temp_xhdl6[2]~1_combout\) # (!\u_led_driver|oLED[6]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|temp_xhdl6[1]~4_combout\,
	datab => \u_led_driver|oLED[0]~14_combout\,
	datac => \u_led_driver|temp_xhdl6[2]~1_combout\,
	datad => \u_led_driver|oLED[6]~19_combout\,
	combout => \u_led_driver|oLED[3]~20_combout\);

-- Location: LCCOMB_X26_Y24_N24
\u_led_driver|temp_xhdl20[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|temp_xhdl20[3]~0_combout\ = \u_led_driver|temp_xhdl6[1]~4_combout\ $ (\u_led_driver|temp_xhdl6[2]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|temp_xhdl6[1]~4_combout\,
	datad => \u_led_driver|temp_xhdl6[2]~1_combout\,
	combout => \u_led_driver|temp_xhdl20[3]~0_combout\);

-- Location: LCCOMB_X26_Y24_N22
\u_led_driver|oLED[3]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[3]~21_combout\ = ((\u_led_driver|temp_xhdl20[3]~0_combout\ & (\u_led_driver|oLED[2]~15_combout\ & \u_led_driver|temp_xhdl6[3]~2_combout\))) # (!\u_led_driver|oLED[3]~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|oLED[3]~20_combout\,
	datab => \u_led_driver|temp_xhdl20[3]~0_combout\,
	datac => \u_led_driver|oLED[2]~15_combout\,
	datad => \u_led_driver|temp_xhdl6[3]~2_combout\,
	combout => \u_led_driver|oLED[3]~21_combout\);

-- Location: LCCOMB_X26_Y24_N0
\u_led_driver|oLED[4]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[4]~22_combout\ = ((\u_led_driver|temp_xhdl20[3]~0_combout\ & (!\u_spi_ee_config|oDATA_H_xhdl2\(1) & \u_led_driver|oLED[6]~19_combout\))) # (!\u_led_driver|oLED[3]~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|oLED[3]~20_combout\,
	datab => \u_led_driver|temp_xhdl20[3]~0_combout\,
	datac => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	datad => \u_led_driver|oLED[6]~19_combout\,
	combout => \u_led_driver|oLED[4]~22_combout\);

-- Location: LCCOMB_X9_Y15_N18
\u_led_driver|oLED[5]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[5]~26_combout\ = (\u_led_driver|int2_count\(23) & (\u_led_driver|int2_count\(20))) # (!\u_led_driver|int2_count\(23) & (((\u_spi_ee_config|oDATA_H_xhdl2\(1)) # (!\u_led_driver|oLED[2]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(20),
	datab => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	datac => \u_led_driver|int2_count\(23),
	datad => \u_led_driver|oLED[2]~18_combout\,
	combout => \u_led_driver|oLED[5]~26_combout\);

-- Location: LCCOMB_X9_Y15_N12
\u_led_driver|oLED[6]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[6]~27_combout\ = (\u_led_driver|int2_count\(23) & (!\u_led_driver|int2_count\(20))) # (!\u_led_driver|int2_count\(23) & (((!\u_spi_ee_config|oDATA_H_xhdl2\(1) & !\u_led_driver|temp_xhdl6[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|int2_count\(20),
	datab => \u_spi_ee_config|oDATA_H_xhdl2\(1),
	datac => \u_led_driver|temp_xhdl6[3]~2_combout\,
	datad => \u_led_driver|int2_count\(23),
	combout => \u_led_driver|oLED[6]~27_combout\);

-- Location: LCCOMB_X9_Y15_N22
\u_led_driver|oLED[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[6]~23_combout\ = ((\u_led_driver|temp_xhdl6[2]~1_combout\ & (\u_led_driver|temp_xhdl6[1]~4_combout\ & !\u_led_driver|int2_count\(23)))) # (!\u_led_driver|oLED[6]~27_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|oLED[6]~27_combout\,
	datab => \u_led_driver|temp_xhdl6[2]~1_combout\,
	datac => \u_led_driver|temp_xhdl6[1]~4_combout\,
	datad => \u_led_driver|int2_count\(23),
	combout => \u_led_driver|oLED[6]~23_combout\);

-- Location: LCCOMB_X9_Y15_N16
\u_led_driver|oLED[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_led_driver|oLED[7]~24_combout\ = ((!\u_led_driver|temp_xhdl6[2]~1_combout\ & !\u_led_driver|int2_count\(23))) # (!\u_led_driver|oLED[6]~27_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_led_driver|oLED[6]~27_combout\,
	datac => \u_led_driver|temp_xhdl6[2]~1_combout\,
	datad => \u_led_driver|int2_count\(23),
	combout => \u_led_driver|oLED[7]~24_combout\);

-- Location: IOIBUF_X0_Y16_N8
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);
END structure;


