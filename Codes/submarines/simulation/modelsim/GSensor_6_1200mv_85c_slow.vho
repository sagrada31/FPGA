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

-- DATE "04/01/2015 17:30:54"

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
	out_red : OUT std_logic;
	out_green : OUT std_logic;
	out_blue : OUT std_logic;
	out_h_sync : OUT std_logic;
	out_v_sync : OUT std_logic
	);
END gsensor;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- I2C_SCLK	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- G_SENSOR_CS_N	=>  Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- out_red	=>  Location: PIN_T15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- out_green	=>  Location: PIN_T13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- out_blue	=>  Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- out_h_sync	=>  Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- out_v_sync	=>  Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- I2C_SDAT	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CLOCK_50	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- G_SENSOR_INT	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
SIGNAL ww_out_red : std_logic;
SIGNAL ww_out_green : std_logic;
SIGNAL ww_out_blue : std_logic;
SIGNAL ww_out_h_sync : std_logic;
SIGNAL ww_out_v_sync : std_logic;
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
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Add0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[0]~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[1]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[1]~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[2]~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[3]~4_combout\ : std_logic;
SIGNAL \u_spi_ee_config|LessThan0~0_combout\ : std_logic;
SIGNAL \G_SENSOR_INT~input_o\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~0_combout\ : std_logic;
SIGNAL \I2C_SDAT~input_o\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[0]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[15]~8_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[4]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~q\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~q\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~13_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~q\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~q\ : std_logic;
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
SIGNAL \u_spi_ee_config|spi_go~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[15]~12_combout\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~q\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count_en~q\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux8~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[6]~6_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~14_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back_d~q\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[7]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte_d~q\ : std_logic;
SIGNAL \u_spi_ee_config|direction~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|direction~q\ : std_logic;
SIGNAL \u_spi_ee_config|Mux2~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~9_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux9~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux4~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~10_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux11~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux10~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~4_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux3~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~11_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~5_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~6_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux5~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~7_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux6~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~7_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux7~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~8_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\ : std_logic;
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oSPI_CLK~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan13~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan10~0_combout\ : std_logic;
SIGNAL \u_vga|Add7~0_combout\ : std_logic;
SIGNAL \u_vga|Add7~1\ : std_logic;
SIGNAL \u_vga|Add7~2_combout\ : std_logic;
SIGNAL \u_vga|Add7~3\ : std_logic;
SIGNAL \u_vga|Add7~4_combout\ : std_logic;
SIGNAL \u_vga|Add7~5\ : std_logic;
SIGNAL \u_vga|Add7~6_combout\ : std_logic;
SIGNAL \u_vga|Add7~7\ : std_logic;
SIGNAL \u_vga|Add7~8_combout\ : std_logic;
SIGNAL \u_vga|Equal0~0_combout\ : std_logic;
SIGNAL \u_vga|h_cnt~0_combout\ : std_logic;
SIGNAL \u_vga|Add7~9\ : std_logic;
SIGNAL \u_vga|Add7~10_combout\ : std_logic;
SIGNAL \u_vga|Add7~11\ : std_logic;
SIGNAL \u_vga|Add7~12_combout\ : std_logic;
SIGNAL \u_vga|Add7~13\ : std_logic;
SIGNAL \u_vga|Add7~14_combout\ : std_logic;
SIGNAL \u_vga|Add7~15\ : std_logic;
SIGNAL \u_vga|Add7~16_combout\ : std_logic;
SIGNAL \u_vga|Add7~17\ : std_logic;
SIGNAL \u_vga|Add7~18_combout\ : std_logic;
SIGNAL \u_vga|Add7~19\ : std_logic;
SIGNAL \u_vga|Add7~20_combout\ : std_logic;
SIGNAL \u_vga|h_cnt~1_combout\ : std_logic;
SIGNAL \u_vga|LessThan13~1_combout\ : std_logic;
SIGNAL \u_vga|horizontal_en~q\ : std_logic;
SIGNAL \u_vga|Add8~0_combout\ : std_logic;
SIGNAL \u_vga|Add8~15\ : std_logic;
SIGNAL \u_vga|Add8~16_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~0_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[4]~1_combout\ : std_logic;
SIGNAL \u_vga|LessThan14~3_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~14_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~15_combout\ : std_logic;
SIGNAL \u_vga|Add8~17\ : std_logic;
SIGNAL \u_vga|Add8~18_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[9]~2_combout\ : std_logic;
SIGNAL \u_vga|Add8~19\ : std_logic;
SIGNAL \u_vga|Add8~20_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[10]~11_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~16_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~17_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~10_combout\ : std_logic;
SIGNAL \u_vga|Add8~1\ : std_logic;
SIGNAL \u_vga|Add8~2_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~9_combout\ : std_logic;
SIGNAL \u_vga|Add8~3\ : std_logic;
SIGNAL \u_vga|Add8~4_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~8_combout\ : std_logic;
SIGNAL \u_vga|Add8~5\ : std_logic;
SIGNAL \u_vga|Add8~6_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~5_combout\ : std_logic;
SIGNAL \u_vga|Add8~7\ : std_logic;
SIGNAL \u_vga|Add8~8_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~7_combout\ : std_logic;
SIGNAL \u_vga|Add8~9\ : std_logic;
SIGNAL \u_vga|Add8~10_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~6_combout\ : std_logic;
SIGNAL \u_vga|Add8~11\ : std_logic;
SIGNAL \u_vga|Add8~12_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~3_combout\ : std_logic;
SIGNAL \u_vga|Add8~13\ : std_logic;
SIGNAL \u_vga|Add8~14_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~4_combout\ : std_logic;
SIGNAL \u_vga|LessThan14~1_combout\ : std_logic;
SIGNAL \u_vga|LessThan14~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan14~2_combout\ : std_logic;
SIGNAL \u_vga|vertical_en~feeder_combout\ : std_logic;
SIGNAL \u_vga|vertical_en~q\ : std_logic;
SIGNAL \u_vga|video_en~0_combout\ : std_logic;
SIGNAL \u_vga|video_en~q\ : std_logic;
SIGNAL \u_vga|vga_gen~1_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~2_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~3_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~4_combout\ : std_logic;
SIGNAL \u_vga|red_signal~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|oDATA_YH_xhdl2[1]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\ : std_logic;
SIGNAL \u_vga|Add1~15_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[5]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[7]~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[3]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[1]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Add0~0_combout\ : std_logic;
SIGNAL \u_vga|Add0~2\ : std_logic;
SIGNAL \u_vga|Add0~4\ : std_logic;
SIGNAL \u_vga|Add0~6\ : std_logic;
SIGNAL \u_vga|Add0~8\ : std_logic;
SIGNAL \u_vga|Add0~10\ : std_logic;
SIGNAL \u_vga|Add0~11_combout\ : std_logic;
SIGNAL \u_vga|Add0~9_combout\ : std_logic;
SIGNAL \u_vga|Add0~7_combout\ : std_logic;
SIGNAL \u_vga|Add0~5_combout\ : std_logic;
SIGNAL \u_vga|Add0~3_combout\ : std_logic;
SIGNAL \u_vga|Add1~7_combout\ : std_logic;
SIGNAL \u_vga|Add0~1_combout\ : std_logic;
SIGNAL \u_vga|Add3~1_cout\ : std_logic;
SIGNAL \u_vga|Add3~3_cout\ : std_logic;
SIGNAL \u_vga|magn_g_y[0]~0_combout\ : std_logic;
SIGNAL \u_vga|Add1~8\ : std_logic;
SIGNAL \u_vga|Add1~9_combout\ : std_logic;
SIGNAL \u_vga|magn_g_y[0]~1\ : std_logic;
SIGNAL \u_vga|magn_g_y[1]~2_combout\ : std_logic;
SIGNAL \u_vga|Add1~10\ : std_logic;
SIGNAL \u_vga|Add1~11_combout\ : std_logic;
SIGNAL \u_vga|magn_g_y[1]~3\ : std_logic;
SIGNAL \u_vga|magn_g_y[2]~4_combout\ : std_logic;
SIGNAL \u_vga|Add1~12\ : std_logic;
SIGNAL \u_vga|Add1~13_combout\ : std_logic;
SIGNAL \u_vga|magn_g_y[2]~5\ : std_logic;
SIGNAL \u_vga|magn_g_y[3]~6_combout\ : std_logic;
SIGNAL \u_vga|Add1~14\ : std_logic;
SIGNAL \u_vga|Add1~16\ : std_logic;
SIGNAL \u_vga|Add1~18\ : std_logic;
SIGNAL \u_vga|Add1~20\ : std_logic;
SIGNAL \u_vga|Add1~21_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[7]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Add0~12\ : std_logic;
SIGNAL \u_vga|Add0~14\ : std_logic;
SIGNAL \u_vga|Add0~16\ : std_logic;
SIGNAL \u_vga|Add0~17_combout\ : std_logic;
SIGNAL \u_vga|Add0~15_combout\ : std_logic;
SIGNAL \u_vga|Add0~13_combout\ : std_logic;
SIGNAL \u_vga|magn_g_y[3]~7\ : std_logic;
SIGNAL \u_vga|magn_g_y[4]~9\ : std_logic;
SIGNAL \u_vga|magn_g_y[5]~11\ : std_logic;
SIGNAL \u_vga|magn_g_y[6]~12_combout\ : std_logic;
SIGNAL \u_vga|Add1~19_combout\ : std_logic;
SIGNAL \u_vga|magn_g_y[5]~10_combout\ : std_logic;
SIGNAL \u_vga|Add1~17_combout\ : std_logic;
SIGNAL \u_vga|magn_g_y[4]~8_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|_~0_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|_~1_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][10]~combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][9]~combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][12]~0_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][8]~combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][11]~combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][7]~combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][6]~1_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][10]~2_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][9]~3_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][8]~5_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][4]~4_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][3]~6_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][7]~7_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][6]~8_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ : std_logic;
SIGNAL \u_vga|Add5~1\ : std_logic;
SIGNAL \u_vga|Add5~3\ : std_logic;
SIGNAL \u_vga|Add5~5\ : std_logic;
SIGNAL \u_vga|Add5~7\ : std_logic;
SIGNAL \u_vga|Add5~9\ : std_logic;
SIGNAL \u_vga|Add5~11\ : std_logic;
SIGNAL \u_vga|Add5~12_combout\ : std_logic;
SIGNAL \u_vga|left_bound[9]~0_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ : std_logic;
SIGNAL \u_vga|Add4~1_cout\ : std_logic;
SIGNAL \u_vga|Add4~3\ : std_logic;
SIGNAL \u_vga|Add4~5\ : std_logic;
SIGNAL \u_vga|Add4~7\ : std_logic;
SIGNAL \u_vga|Add4~9\ : std_logic;
SIGNAL \u_vga|Add4~11\ : std_logic;
SIGNAL \u_vga|Add4~13\ : std_logic;
SIGNAL \u_vga|Add4~15\ : std_logic;
SIGNAL \u_vga|Add4~16_combout\ : std_logic;
SIGNAL \u_vga|Add4~18_combout\ : std_logic;
SIGNAL \u_vga|Add5~10_combout\ : std_logic;
SIGNAL \u_vga|Add4~14_combout\ : std_logic;
SIGNAL \u_vga|Add4~19_combout\ : std_logic;
SIGNAL \u_vga|Add4~12_combout\ : std_logic;
SIGNAL \u_vga|Add5~8_combout\ : std_logic;
SIGNAL \u_vga|Add4~20_combout\ : std_logic;
SIGNAL \u_vga|Add5~6_combout\ : std_logic;
SIGNAL \u_vga|Add4~10_combout\ : std_logic;
SIGNAL \u_vga|Add4~21_combout\ : std_logic;
SIGNAL \u_vga|Add5~4_combout\ : std_logic;
SIGNAL \u_vga|Add4~8_combout\ : std_logic;
SIGNAL \u_vga|Add4~22_combout\ : std_logic;
SIGNAL \u_vga|Add5~2_combout\ : std_logic;
SIGNAL \u_vga|Add4~6_combout\ : std_logic;
SIGNAL \u_vga|Add4~23_combout\ : std_logic;
SIGNAL \u_vga|Add4~4_combout\ : std_logic;
SIGNAL \u_vga|Add5~0_combout\ : std_logic;
SIGNAL \u_vga|Add4~24_combout\ : std_logic;
SIGNAL \u_vga|Add4~2_combout\ : std_logic;
SIGNAL \u_vga|Add4~25_combout\ : std_logic;
SIGNAL \u_vga|LessThan3~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan3~18_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~0_combout\ : std_logic;
SIGNAL \u_vga|Add6~1\ : std_logic;
SIGNAL \u_vga|Add6~3\ : std_logic;
SIGNAL \u_vga|Add6~5\ : std_logic;
SIGNAL \u_vga|Add6~7\ : std_logic;
SIGNAL \u_vga|Add6~9\ : std_logic;
SIGNAL \u_vga|Add6~10_combout\ : std_logic;
SIGNAL \u_vga|Add6~8_combout\ : std_logic;
SIGNAL \u_vga|Add6~6_combout\ : std_logic;
SIGNAL \u_vga|Add6~4_combout\ : std_logic;
SIGNAL \u_vga|Add6~2_combout\ : std_logic;
SIGNAL \u_vga|Add6~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan4~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan4~18_combout\ : std_logic;
SIGNAL \u_vga|red_signal~1_combout\ : std_logic;
SIGNAL \u_vga|red_signal~q\ : std_logic;
SIGNAL \u_vga|out_red~0_combout\ : std_logic;
SIGNAL \u_vga|out_red~q\ : std_logic;
SIGNAL \u_vga|green_signal~0_combout\ : std_logic;
SIGNAL \u_vga|green_signal~1_combout\ : std_logic;
SIGNAL \u_vga|green_signal~q\ : std_logic;
SIGNAL \u_vga|out_green~0_combout\ : std_logic;
SIGNAL \u_vga|out_green~q\ : std_logic;
SIGNAL \u_vga|out_blue~0_combout\ : std_logic;
SIGNAL \u_vga|out_blue~q\ : std_logic;
SIGNAL \u_vga|vga_gen~5_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~6_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~7_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~8_combout\ : std_logic;
SIGNAL \u_vga|h_sync~q\ : std_logic;
SIGNAL \u_vga|out_h_sync~q\ : std_logic;
SIGNAL \u_vga|vga_gen~12_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~10_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~9_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~11_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~13_combout\ : std_logic;
SIGNAL \u_vga|v_sync~q\ : std_logic;
SIGNAL \u_vga|out_v_sync~feeder_combout\ : std_logic;
SIGNAL \u_vga|out_v_sync~q\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status_d\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_spi_ee_config|read_idle_count\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \u_reset_delay|cont\ : std_logic_vector(20 DOWNTO 0);
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|ini_index\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga|v_cnt\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \u_vga|h_cnt\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \u_spi_ee_config|oDATA_YH_xhdl2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_spi_ee_config|p2s_data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_spi_ee_config|oDATA_YL_xhdl1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_spi_ee_config|low_byte_dataY\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_reset_delay|ALT_INV_cont\ : std_logic_vector(20 DOWNTO 20);
SIGNAL \u_reset_delay|ALT_INV_oRST_xhdl1~q\ : std_logic;
SIGNAL \u_spi_ee_config|ALT_INV_spi_go~q\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_G_SENSOR_INT <= G_SENSOR_INT;
I2C_SCLK <= ww_I2C_SCLK;
G_SENSOR_CS_N <= ww_G_SENSOR_CS_N;
out_red <= ww_out_red;
out_green <= ww_out_green;
out_blue <= ww_out_blue;
out_h_sync <= ww_out_h_sync;
out_v_sync <= ww_out_v_sync;
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
\u_reset_delay|ALT_INV_cont\(20) <= NOT \u_reset_delay|cont\(20);
\u_reset_delay|ALT_INV_oRST_xhdl1~q\ <= NOT \u_reset_delay|oRST_xhdl1~q\;
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

-- Location: IOOBUF_X45_Y0_N16
\out_red~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga|out_red~q\,
	devoe => ww_devoe,
	o => ww_out_red);

-- Location: IOOBUF_X40_Y0_N16
\out_green~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga|out_green~q\,
	devoe => ww_devoe,
	o => ww_out_green);

-- Location: IOOBUF_X36_Y0_N9
\out_blue~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga|out_blue~q\,
	devoe => ww_devoe,
	o => ww_out_blue);

-- Location: IOOBUF_X36_Y0_N23
\out_h_sync~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga|out_h_sync~q\,
	devoe => ww_devoe,
	o => ww_out_h_sync);

-- Location: IOOBUF_X34_Y0_N2
\out_v_sync~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga|out_v_sync~q\,
	devoe => ww_devoe,
	o => ww_out_v_sync);

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

-- Location: LCCOMB_X52_Y12_N8
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

-- Location: FF_X52_Y12_N9
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

-- Location: LCCOMB_X52_Y12_N12
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

-- Location: FF_X52_Y12_N13
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

-- Location: LCCOMB_X52_Y12_N14
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

-- Location: FF_X52_Y12_N15
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

-- Location: LCCOMB_X52_Y12_N16
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

-- Location: FF_X52_Y12_N17
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

-- Location: LCCOMB_X52_Y12_N18
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

-- Location: FF_X52_Y12_N19
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

-- Location: LCCOMB_X52_Y12_N20
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

-- Location: FF_X52_Y12_N21
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

-- Location: LCCOMB_X52_Y12_N22
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

-- Location: FF_X52_Y12_N23
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

-- Location: LCCOMB_X52_Y12_N24
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

-- Location: FF_X52_Y12_N25
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

-- Location: LCCOMB_X52_Y12_N26
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

-- Location: FF_X52_Y12_N27
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

-- Location: LCCOMB_X52_Y12_N28
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

-- Location: FF_X52_Y12_N29
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

-- Location: LCCOMB_X52_Y12_N30
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

-- Location: FF_X52_Y12_N31
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

-- Location: LCCOMB_X52_Y11_N0
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

-- Location: FF_X52_Y11_N1
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

-- Location: LCCOMB_X52_Y11_N2
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

-- Location: FF_X52_Y11_N3
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

-- Location: LCCOMB_X52_Y11_N4
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

-- Location: FF_X52_Y11_N5
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

-- Location: LCCOMB_X52_Y11_N6
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

-- Location: FF_X52_Y11_N7
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

-- Location: LCCOMB_X52_Y11_N8
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

-- Location: FF_X52_Y11_N9
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

-- Location: LCCOMB_X52_Y11_N10
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

-- Location: FF_X52_Y11_N11
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

-- Location: LCCOMB_X52_Y11_N12
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

-- Location: FF_X52_Y11_N13
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

-- Location: LCCOMB_X52_Y11_N14
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

-- Location: FF_X52_Y11_N15
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

-- Location: LCCOMB_X52_Y11_N16
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

-- Location: FF_X52_Y11_N17
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

-- Location: LCCOMB_X52_Y11_N18
\u_reset_delay|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~38_combout\ = \u_reset_delay|cont\(20) $ (\u_reset_delay|Add0~37\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(20),
	cin => \u_reset_delay|Add0~37\,
	combout => \u_reset_delay|Add0~38_combout\);

-- Location: LCCOMB_X52_Y11_N22
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

-- Location: FF_X52_Y11_N23
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

-- Location: FF_X52_Y11_N29
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

-- Location: LCCOMB_X30_Y10_N6
\u_spi_ee_config|u_spi_controller|spi_count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~1_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & !\u_spi_ee_config|u_spi_controller|spi_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|spi_count~1_combout\);

-- Location: FF_X30_Y10_N7
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

-- Location: LCCOMB_X30_Y10_N20
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

-- Location: FF_X30_Y10_N21
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

-- Location: LCCOMB_X30_Y10_N26
\u_spi_ee_config|u_spi_controller|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Add0~0_combout\ = \u_spi_ee_config|u_spi_controller|spi_count\(3) $ (((\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|u_spi_controller|spi_count\(1) & 
-- \u_spi_ee_config|u_spi_controller|spi_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	combout => \u_spi_ee_config|u_spi_controller|Add0~0_combout\);

-- Location: LCCOMB_X30_Y10_N24
\u_spi_ee_config|u_spi_controller|spi_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & \u_spi_ee_config|u_spi_controller|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datac => \u_spi_ee_config|u_spi_controller|Add0~0_combout\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count~0_combout\);

-- Location: FF_X30_Y10_N25
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

-- Location: LCCOMB_X30_Y10_N16
\u_spi_ee_config|u_spi_controller|WideOr0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (\u_spi_ee_config|u_spi_controller|spi_count\(1) & 
-- \u_spi_ee_config|u_spi_controller|spi_count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	combout => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\);

-- Location: LCCOMB_X31_Y11_N18
\u_spi_ee_config|ini_index[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[0]~2_combout\ = \u_spi_ee_config|ini_index\(0) $ (((\u_spi_ee_config|spi_go~q\ & (!\u_spi_ee_config|LessThan0~0_combout\ & \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|spi_go~q\,
	datab => \u_spi_ee_config|LessThan0~0_combout\,
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	combout => \u_spi_ee_config|ini_index[0]~2_combout\);

-- Location: FF_X31_Y11_N19
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

-- Location: LCCOMB_X31_Y11_N0
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

-- Location: LCCOMB_X31_Y11_N12
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

-- Location: FF_X31_Y11_N13
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

-- Location: LCCOMB_X31_Y11_N8
\u_spi_ee_config|ini_index[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[2]~3_combout\ = \u_spi_ee_config|ini_index\(2) $ (((\u_spi_ee_config|ini_index\(1) & \u_spi_ee_config|ini_index[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(2),
	datad => \u_spi_ee_config|ini_index[1]~0_combout\,
	combout => \u_spi_ee_config|ini_index[2]~3_combout\);

-- Location: FF_X31_Y11_N9
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

-- Location: LCCOMB_X31_Y11_N30
\u_spi_ee_config|ini_index[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[3]~4_combout\ = \u_spi_ee_config|ini_index\(3) $ (((\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(1) & \u_spi_ee_config|ini_index[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(2),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index[1]~0_combout\,
	combout => \u_spi_ee_config|ini_index[3]~4_combout\);

-- Location: FF_X31_Y11_N31
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

-- Location: LCCOMB_X31_Y11_N4
\u_spi_ee_config|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|LessThan0~0_combout\ = (\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(2)) # ((\u_spi_ee_config|ini_index\(1) & \u_spi_ee_config|ini_index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(2),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(0),
	combout => \u_spi_ee_config|LessThan0~0_combout\);

-- Location: IOIBUF_X29_Y0_N1
\G_SENSOR_INT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_G_SENSOR_INT,
	o => \G_SENSOR_INT~input_o\);

-- Location: LCCOMB_X30_Y11_N24
\u_spi_ee_config|high_byte~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|high_byte~0_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|spi_go~q\ & \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datad => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	combout => \u_spi_ee_config|high_byte~0_combout\);

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

-- Location: LCCOMB_X29_Y11_N4
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[0]~feeder_combout\ = \I2C_SDAT~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2C_SDAT~input_o\,
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[0]~feeder_combout\);

-- Location: LCCOMB_X30_Y11_N22
\u_spi_ee_config|p2s_data[15]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[15]~8_combout\ = (!\u_spi_ee_config|p2s_data[15]~12_combout\ & (!\u_spi_ee_config|spi_go~q\ & \u_reset_delay|oRST_xhdl1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data[15]~12_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datad => \u_reset_delay|oRST_xhdl1~q\,
	combout => \u_spi_ee_config|p2s_data[15]~8_combout\);

-- Location: FF_X31_Y11_N17
\u_spi_ee_config|p2s_data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|LessThan0~0_combout\,
	sload => VCC,
	ena => \u_spi_ee_config|p2s_data[15]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(15));

-- Location: LCCOMB_X30_Y10_N0
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\ = (\u_spi_ee_config|p2s_data\(15) & (\u_spi_ee_config|u_spi_controller|spi_count\(3) & \u_reset_delay|oRST_xhdl1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(15),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_reset_delay|oRST_xhdl1~q\,
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\);

-- Location: FF_X29_Y11_N5
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[0]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0));

-- Location: FF_X29_Y11_N29
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0),
	sload => VCC,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1));

-- Location: LCCOMB_X29_Y11_N26
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

-- Location: FF_X29_Y11_N27
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(2));

-- Location: FF_X29_Y11_N11
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
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3));

-- Location: LCCOMB_X29_Y11_N22
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[4]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3),
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[4]~feeder_combout\);

-- Location: FF_X29_Y11_N23
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[4]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4));

-- Location: FF_X29_Y11_N19
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4),
	sload => VCC,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5));

-- Location: LCCOMB_X29_Y11_N8
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5),
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~feeder_combout\);

-- Location: FF_X29_Y11_N9
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6));

-- Location: LCCOMB_X30_Y11_N8
\u_spi_ee_config|read_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_ready~0_combout\ = (!\u_spi_ee_config|read_back~q\ & \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_back~q\,
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6),
	combout => \u_spi_ee_config|read_ready~0_combout\);

-- Location: LCCOMB_X30_Y11_N12
\u_spi_ee_config|read_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_ready~1_combout\ = (\u_spi_ee_config|high_byte~0_combout\ & ((\u_reset_delay|oRST_xhdl1~q\ & (\u_spi_ee_config|read_ready~0_combout\)) # (!\u_reset_delay|oRST_xhdl1~q\ & ((\u_spi_ee_config|read_ready~q\))))) # 
-- (!\u_spi_ee_config|high_byte~0_combout\ & (((\u_spi_ee_config|read_ready~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_ready~0_combout\,
	datab => \u_spi_ee_config|high_byte~0_combout\,
	datac => \u_spi_ee_config|read_ready~q\,
	datad => \u_reset_delay|oRST_xhdl1~q\,
	combout => \u_spi_ee_config|read_ready~1_combout\);

-- Location: FF_X30_Y11_N13
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

-- Location: LCCOMB_X30_Y11_N14
\u_spi_ee_config|high_byte~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|high_byte~1_combout\ = \u_spi_ee_config|high_byte~q\ $ (((\u_spi_ee_config|read_back~q\ & \u_spi_ee_config|high_byte~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_back~q\,
	datab => \u_spi_ee_config|high_byte~0_combout\,
	datac => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|high_byte~1_combout\);

-- Location: FF_X30_Y11_N15
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

-- Location: LCCOMB_X30_Y11_N20
\u_spi_ee_config|p2s_data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~13_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & ((\u_spi_ee_config|read_ready~q\) # (\u_spi_ee_config|high_byte~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_ready~q\,
	datac => \u_spi_ee_config|high_byte~q\,
	datad => \u_spi_ee_config|LessThan0~0_combout\,
	combout => \u_spi_ee_config|p2s_data~13_combout\);

-- Location: LCCOMB_X30_Y11_N18
\u_spi_ee_config|read_back~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_back~1_combout\ = (\u_spi_ee_config|spi_go~q\ & (!\u_spi_ee_config|high_byte~0_combout\ & (\u_spi_ee_config|read_back~q\))) # (!\u_spi_ee_config|spi_go~q\ & ((\u_spi_ee_config|p2s_data~13_combout\) # 
-- ((!\u_spi_ee_config|high_byte~0_combout\ & \u_spi_ee_config|read_back~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|spi_go~q\,
	datab => \u_spi_ee_config|high_byte~0_combout\,
	datac => \u_spi_ee_config|read_back~q\,
	datad => \u_spi_ee_config|p2s_data~13_combout\,
	combout => \u_spi_ee_config|read_back~1_combout\);

-- Location: FF_X30_Y11_N19
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

-- Location: LCCOMB_X30_Y11_N16
\u_spi_ee_config|read_back~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_back~0_combout\ = (!\u_spi_ee_config|high_byte~q\ & !\u_spi_ee_config|read_ready~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|high_byte~q\,
	datad => \u_spi_ee_config|read_ready~q\,
	combout => \u_spi_ee_config|read_back~0_combout\);

-- Location: LCCOMB_X30_Y11_N26
\u_spi_ee_config|clear_status~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~0_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|spi_go~0_combout\ & (\u_spi_ee_config|read_back~0_combout\ & !\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|spi_go~0_combout\,
	datac => \u_spi_ee_config|read_back~0_combout\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|clear_status~0_combout\);

-- Location: LCCOMB_X30_Y11_N4
\u_spi_ee_config|clear_status~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~1_combout\ = (\u_spi_ee_config|clear_status~0_combout\) # ((\u_spi_ee_config|clear_status~q\ & ((\u_spi_ee_config|read_back~q\) # (!\u_spi_ee_config|high_byte~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_back~q\,
	datab => \u_spi_ee_config|high_byte~0_combout\,
	datac => \u_spi_ee_config|clear_status~q\,
	datad => \u_spi_ee_config|clear_status~0_combout\,
	combout => \u_spi_ee_config|clear_status~1_combout\);

-- Location: FF_X30_Y11_N5
\u_spi_ee_config|clear_status\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|clear_status~1_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status~q\);

-- Location: FF_X30_Y11_N23
\u_spi_ee_config|clear_status_d[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|clear_status~q\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status_d\(0));

-- Location: FF_X30_Y11_N25
\u_spi_ee_config|clear_status_d[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|clear_status_d\(0),
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status_d\(1));

-- Location: FF_X30_Y11_N9
\u_spi_ee_config|clear_status_d[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|clear_status_d\(1),
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|clear_status_d\(2));

-- Location: FF_X30_Y11_N29
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

-- Location: LCCOMB_X32_Y11_N2
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

-- Location: LCCOMB_X31_Y11_N26
\u_spi_ee_config|read_idle_count[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[14]~45_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (((!\u_spi_ee_config|read_back~q\ & \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\)) # (!\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|spi_go~q\,
	datab => \u_spi_ee_config|read_back~q\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	combout => \u_spi_ee_config|read_idle_count[14]~45_combout\);

-- Location: FF_X32_Y11_N3
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

-- Location: LCCOMB_X32_Y11_N4
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

-- Location: FF_X32_Y11_N5
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

-- Location: LCCOMB_X32_Y11_N6
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

-- Location: FF_X32_Y11_N7
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

-- Location: LCCOMB_X32_Y11_N8
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

-- Location: FF_X32_Y11_N9
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

-- Location: LCCOMB_X32_Y11_N10
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

-- Location: FF_X32_Y11_N11
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

-- Location: LCCOMB_X32_Y11_N12
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

-- Location: FF_X32_Y11_N13
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

-- Location: LCCOMB_X32_Y11_N14
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

-- Location: FF_X32_Y11_N15
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

-- Location: LCCOMB_X32_Y11_N16
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

-- Location: FF_X32_Y11_N17
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

-- Location: LCCOMB_X32_Y11_N18
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

-- Location: FF_X32_Y11_N19
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

-- Location: LCCOMB_X32_Y11_N20
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

-- Location: FF_X32_Y11_N21
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

-- Location: LCCOMB_X32_Y11_N22
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

-- Location: FF_X32_Y11_N23
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

-- Location: LCCOMB_X32_Y11_N24
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

-- Location: FF_X32_Y11_N25
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

-- Location: LCCOMB_X32_Y11_N26
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

-- Location: FF_X32_Y11_N27
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

-- Location: LCCOMB_X32_Y11_N28
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

-- Location: FF_X32_Y11_N29
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

-- Location: LCCOMB_X32_Y11_N30
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

-- Location: FF_X32_Y11_N31
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

-- Location: LCCOMB_X30_Y11_N28
\u_spi_ee_config|spi_go~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|spi_go~0_combout\ = (!\u_spi_ee_config|read_idle_count\(14) & ((\u_spi_ee_config|clear_status_d\(3)) # (!\G_SENSOR_INT~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G_SENSOR_INT~input_o\,
	datac => \u_spi_ee_config|clear_status_d\(3),
	datad => \u_spi_ee_config|read_idle_count\(14),
	combout => \u_spi_ee_config|spi_go~0_combout\);

-- Location: LCCOMB_X30_Y11_N30
\u_spi_ee_config|p2s_data[15]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[15]~12_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|spi_go~0_combout\ & (!\u_spi_ee_config|high_byte~q\ & !\u_spi_ee_config|read_ready~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|spi_go~0_combout\,
	datac => \u_spi_ee_config|high_byte~q\,
	datad => \u_spi_ee_config|read_ready~q\,
	combout => \u_spi_ee_config|p2s_data[15]~12_combout\);

-- Location: LCCOMB_X30_Y10_N2
\u_spi_ee_config|spi_go~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|spi_go~1_combout\ = (\u_spi_ee_config|spi_go~q\ & ((!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\))) # (!\u_spi_ee_config|spi_go~q\ & (!\u_spi_ee_config|p2s_data[15]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data[15]~12_combout\,
	datac => \u_spi_ee_config|spi_go~q\,
	datad => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	combout => \u_spi_ee_config|spi_go~1_combout\);

-- Location: FF_X30_Y10_N3
\u_spi_ee_config|spi_go\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|spi_go~1_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|spi_go~q\);

-- Location: LCCOMB_X30_Y10_N4
\u_spi_ee_config|u_spi_controller|spi_count_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\ = (!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & ((\u_spi_ee_config|spi_go~q\) # (\u_spi_ee_config|u_spi_controller|spi_count_en~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datad => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\);

-- Location: FF_X30_Y10_N5
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

-- Location: LCCOMB_X30_Y10_N10
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

-- Location: FF_X30_Y10_N11
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

-- Location: LCCOMB_X31_Y10_N6
\u_spi_ee_config|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux8~0_combout\ = (\u_spi_ee_config|ini_index\(2) & (((\u_spi_ee_config|ini_index\(3))) # (!\u_spi_ee_config|ini_index\(0)))) # (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(1) & ((\u_spi_ee_config|ini_index\(0)) # 
-- (\u_spi_ee_config|ini_index\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux8~0_combout\);

-- Location: LCCOMB_X31_Y11_N2
\u_spi_ee_config|p2s_data[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[6]~6_combout\ = (\u_reset_delay|oRST_xhdl1~q\ & (!\u_spi_ee_config|LessThan0~0_combout\ & !\u_spi_ee_config|spi_go~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|oRST_xhdl1~q\,
	datab => \u_spi_ee_config|LessThan0~0_combout\,
	datac => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|p2s_data[6]~6_combout\);

-- Location: FF_X31_Y10_N7
\u_spi_ee_config|p2s_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux8~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(3));

-- Location: LCCOMB_X31_Y10_N4
\u_spi_ee_config|p2s_data~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~14_combout\ = (\u_spi_ee_config|ini_index\(3) & (!\u_spi_ee_config|ini_index\(0) & !\u_spi_ee_config|ini_index\(2))) # (!\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|p2s_data~14_combout\);

-- Location: FF_X31_Y10_N5
\u_spi_ee_config|p2s_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~14_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(11));

-- Location: FF_X30_Y11_N11
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

-- Location: LCCOMB_X30_Y11_N10
\u_spi_ee_config|low_byte_dataY[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[7]~0_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|spi_go~q\ & (\u_spi_ee_config|read_back_d~q\ & \u_reset_delay|oRST_xhdl1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|read_back_d~q\,
	datad => \u_reset_delay|oRST_xhdl1~q\,
	combout => \u_spi_ee_config|low_byte_dataY[7]~0_combout\);

-- Location: FF_X30_Y11_N3
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

-- Location: LCCOMB_X30_Y11_N6
\u_spi_ee_config|direction~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|direction~0_combout\ = \u_spi_ee_config|direction~q\ $ (((\u_spi_ee_config|low_byte_dataY[7]~0_combout\ & \u_spi_ee_config|high_byte_d~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|low_byte_dataY[7]~0_combout\,
	datac => \u_spi_ee_config|direction~q\,
	datad => \u_spi_ee_config|high_byte_d~q\,
	combout => \u_spi_ee_config|direction~0_combout\);

-- Location: FF_X30_Y11_N7
\u_spi_ee_config|direction\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|direction~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|direction~q\);

-- Location: LCCOMB_X31_Y11_N20
\u_spi_ee_config|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux2~0_combout\ = (!\u_spi_ee_config|ini_index\(1) & ((\u_spi_ee_config|ini_index\(2) & (!\u_spi_ee_config|ini_index\(3))) # (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(3) & \u_spi_ee_config|ini_index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(2),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(0),
	combout => \u_spi_ee_config|Mux2~0_combout\);

-- Location: LCCOMB_X31_Y11_N6
\u_spi_ee_config|p2s_data~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~9_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|read_back~0_combout\ & (\u_spi_ee_config|direction~q\))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (((!\u_spi_ee_config|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_back~0_combout\,
	datab => \u_spi_ee_config|direction~q\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|Mux2~0_combout\,
	combout => \u_spi_ee_config|p2s_data~9_combout\);

-- Location: FF_X31_Y11_N7
\u_spi_ee_config|p2s_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~9_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(10));

-- Location: LCCOMB_X31_Y10_N16
\u_spi_ee_config|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux9~0_combout\ = (\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(3) & (\u_spi_ee_config|ini_index\(1) $ (\u_spi_ee_config|ini_index\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux9~0_combout\);

-- Location: FF_X31_Y10_N17
\u_spi_ee_config|p2s_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux9~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(2));

-- Location: LCCOMB_X31_Y10_N2
\u_spi_ee_config|u_spi_controller|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~2_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((\u_spi_ee_config|u_spi_controller|spi_count\(0) & \u_spi_ee_config|p2s_data\(2))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- ((\u_spi_ee_config|p2s_data\(10)) # ((!\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(10),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datad => \u_spi_ee_config|p2s_data\(2),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~2_combout\);

-- Location: LCCOMB_X31_Y10_N14
\u_spi_ee_config|u_spi_controller|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~3_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & (((\u_spi_ee_config|u_spi_controller|Mux0~2_combout\)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- ((\u_spi_ee_config|u_spi_controller|Mux0~2_combout\ & ((\u_spi_ee_config|p2s_data\(11)))) # (!\u_spi_ee_config|u_spi_controller|Mux0~2_combout\ & (\u_spi_ee_config|p2s_data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(3),
	datab => \u_spi_ee_config|p2s_data\(11),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datad => \u_spi_ee_config|u_spi_controller|Mux0~2_combout\,
	combout => \u_spi_ee_config|u_spi_controller|Mux0~3_combout\);

-- Location: LCCOMB_X31_Y11_N22
\u_spi_ee_config|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux4~0_combout\ = (\u_spi_ee_config|ini_index\(3)) # ((\u_spi_ee_config|ini_index\(0) & ((!\u_spi_ee_config|ini_index\(1)) # (!\u_spi_ee_config|ini_index\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(2),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(0),
	combout => \u_spi_ee_config|Mux4~0_combout\);

-- Location: LCCOMB_X31_Y11_N28
\u_spi_ee_config|p2s_data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~10_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & ((\u_spi_ee_config|high_byte~q\))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|Mux4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|LessThan0~0_combout\,
	datac => \u_spi_ee_config|Mux4~0_combout\,
	datad => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|p2s_data~10_combout\);

-- Location: FF_X31_Y11_N29
\u_spi_ee_config|p2s_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~10_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(8));

-- Location: LCCOMB_X31_Y10_N10
\u_spi_ee_config|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux11~0_combout\ = (!\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(0) & ((!\u_spi_ee_config|ini_index\(2)))) # (!\u_spi_ee_config|ini_index\(0) & ((\u_spi_ee_config|ini_index\(1)) # (\u_spi_ee_config|ini_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux11~0_combout\);

-- Location: FF_X31_Y10_N11
\u_spi_ee_config|p2s_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux11~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(0));

-- Location: LCCOMB_X31_Y10_N20
\u_spi_ee_config|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux10~0_combout\ = (\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(3) & ((!\u_spi_ee_config|ini_index\(2)) # (!\u_spi_ee_config|ini_index\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux10~0_combout\);

-- Location: FF_X31_Y10_N21
\u_spi_ee_config|p2s_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux10~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(1));

-- Location: LCCOMB_X31_Y10_N8
\u_spi_ee_config|u_spi_controller|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~4_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & ((\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|p2s_data\(0))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- ((\u_spi_ee_config|p2s_data\(1)))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((!\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(0),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datad => \u_spi_ee_config|p2s_data\(1),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~4_combout\);

-- Location: LCCOMB_X31_Y11_N24
\u_spi_ee_config|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux3~0_combout\ = (\u_spi_ee_config|ini_index\(0) & (((\u_spi_ee_config|ini_index\(1) & !\u_spi_ee_config|ini_index\(3))))) # (!\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(1) $ 
-- (\u_spi_ee_config|ini_index\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(2),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(0),
	combout => \u_spi_ee_config|Mux3~0_combout\);

-- Location: LCCOMB_X31_Y11_N10
\u_spi_ee_config|p2s_data~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~11_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|read_back~0_combout\ & (!\u_spi_ee_config|direction~q\))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (((\u_spi_ee_config|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_back~0_combout\,
	datab => \u_spi_ee_config|direction~q\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|Mux3~0_combout\,
	combout => \u_spi_ee_config|p2s_data~11_combout\);

-- Location: FF_X31_Y11_N11
\u_spi_ee_config|p2s_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~11_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(9));

-- Location: LCCOMB_X31_Y10_N26
\u_spi_ee_config|u_spi_controller|Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~5_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((\u_spi_ee_config|u_spi_controller|Mux0~4_combout\)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- ((\u_spi_ee_config|u_spi_controller|Mux0~4_combout\ & ((\u_spi_ee_config|p2s_data\(9)))) # (!\u_spi_ee_config|u_spi_controller|Mux0~4_combout\ & (\u_spi_ee_config|p2s_data\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(8),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|u_spi_controller|Mux0~4_combout\,
	datad => \u_spi_ee_config|p2s_data\(9),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~5_combout\);

-- Location: LCCOMB_X30_Y10_N12
\u_spi_ee_config|u_spi_controller|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~6_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(1) & (\u_spi_ee_config|u_spi_controller|spi_count\(2) & ((\u_spi_ee_config|u_spi_controller|Mux0~5_combout\)))) # 
-- (!\u_spi_ee_config|u_spi_controller|spi_count\(1) & (((\u_spi_ee_config|u_spi_controller|Mux0~3_combout\)) # (!\u_spi_ee_config|u_spi_controller|spi_count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datac => \u_spi_ee_config|u_spi_controller|Mux0~3_combout\,
	datad => \u_spi_ee_config|u_spi_controller|Mux0~5_combout\,
	combout => \u_spi_ee_config|u_spi_controller|Mux0~6_combout\);

-- Location: LCCOMB_X31_Y10_N12
\u_spi_ee_config|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux5~0_combout\ = (\u_spi_ee_config|ini_index\(0) & ((\u_spi_ee_config|ini_index\(1) & (!\u_spi_ee_config|ini_index\(3) & !\u_spi_ee_config|ini_index\(2))) # (!\u_spi_ee_config|ini_index\(1) & (\u_spi_ee_config|ini_index\(3) $ 
-- (\u_spi_ee_config|ini_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux5~0_combout\);

-- Location: FF_X31_Y10_N13
\u_spi_ee_config|p2s_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux5~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(6));

-- Location: LCCOMB_X30_Y10_N22
\u_spi_ee_config|u_spi_controller|Mux0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~7_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (\u_spi_ee_config|p2s_data\(6)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & ((\u_spi_ee_config|p2s_data\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|p2s_data\(6),
	datad => \u_spi_ee_config|p2s_data\(15),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~7_combout\);

-- Location: LCCOMB_X31_Y10_N22
\u_spi_ee_config|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux6~0_combout\ = (!\u_spi_ee_config|ini_index\(3) & (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(0) $ (!\u_spi_ee_config|ini_index\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux6~0_combout\);

-- Location: FF_X31_Y10_N23
\u_spi_ee_config|p2s_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux6~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(5));

-- Location: LCCOMB_X31_Y10_N30
\u_spi_ee_config|p2s_data~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~7_combout\ = (\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(0)) # (\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|p2s_data~7_combout\);

-- Location: FF_X31_Y10_N31
\u_spi_ee_config|p2s_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|p2s_data~7_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(12));

-- Location: LCCOMB_X31_Y10_N24
\u_spi_ee_config|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux7~0_combout\ = (\u_spi_ee_config|ini_index\(0) & (\u_spi_ee_config|ini_index\(1) & (!\u_spi_ee_config|ini_index\(3)))) # (!\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(1) & (\u_spi_ee_config|ini_index\(3) & 
-- !\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(0),
	datab => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux7~0_combout\);

-- Location: FF_X31_Y10_N25
\u_spi_ee_config|p2s_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|Mux7~0_combout\,
	ena => \u_spi_ee_config|p2s_data[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(4));

-- Location: LCCOMB_X31_Y10_N0
\u_spi_ee_config|u_spi_controller|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((\u_spi_ee_config|u_spi_controller|spi_count\(0) & \u_spi_ee_config|p2s_data\(4))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- ((\u_spi_ee_config|p2s_data\(12)) # ((!\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(12),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datad => \u_spi_ee_config|p2s_data\(4),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~0_combout\);

-- Location: LCCOMB_X31_Y10_N28
\u_spi_ee_config|u_spi_controller|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~1_combout\ = (\u_spi_ee_config|u_spi_controller|Mux0~0_combout\) # ((\u_spi_ee_config|p2s_data\(5) & !\u_spi_ee_config|u_spi_controller|spi_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(5),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datad => \u_spi_ee_config|u_spi_controller|Mux0~0_combout\,
	combout => \u_spi_ee_config|u_spi_controller|Mux0~1_combout\);

-- Location: LCCOMB_X30_Y10_N28
\u_spi_ee_config|u_spi_controller|Mux0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~8_combout\ = (\u_spi_ee_config|u_spi_controller|Mux0~6_combout\ & ((\u_spi_ee_config|u_spi_controller|spi_count\(2)) # ((\u_spi_ee_config|u_spi_controller|Mux0~7_combout\)))) # 
-- (!\u_spi_ee_config|u_spi_controller|Mux0~6_combout\ & (!\u_spi_ee_config|u_spi_controller|spi_count\(2) & ((\u_spi_ee_config|u_spi_controller|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|Mux0~6_combout\,
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datac => \u_spi_ee_config|u_spi_controller|Mux0~7_combout\,
	datad => \u_spi_ee_config|u_spi_controller|Mux0~1_combout\,
	combout => \u_spi_ee_config|u_spi_controller|Mux0~8_combout\);

-- Location: LCCOMB_X30_Y10_N18
\u_spi_ee_config|u_spi_controller|temp_xhdl7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & ((!\u_spi_ee_config|p2s_data\(15)) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datad => \u_spi_ee_config|p2s_data\(15),
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

-- Location: LCCOMB_X1_Y24_N16
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

-- Location: LCCOMB_X36_Y11_N28
\u_vga|LessThan13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~0_combout\ = (!\u_vga|h_cnt\(6) & (!\u_vga|h_cnt\(7) & !\u_vga|h_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|h_cnt\(7),
	datad => \u_vga|h_cnt\(5),
	combout => \u_vga|LessThan13~0_combout\);

-- Location: LCCOMB_X36_Y9_N10
\u_vga|LessThan10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan10~0_combout\ = (!\u_vga|h_cnt\(4) & (!\u_vga|h_cnt\(9) & (!\u_vga|h_cnt\(8) & \u_vga|LessThan13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|h_cnt\(9),
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|LessThan13~0_combout\,
	combout => \u_vga|LessThan10~0_combout\);

-- Location: LCCOMB_X36_Y11_N6
\u_vga|Add7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~0_combout\ = \u_vga|h_cnt\(0) $ (VCC)
-- \u_vga|Add7~1\ = CARRY(\u_vga|h_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datad => VCC,
	combout => \u_vga|Add7~0_combout\,
	cout => \u_vga|Add7~1\);

-- Location: FF_X36_Y11_N7
\u_vga|h_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(0));

-- Location: LCCOMB_X36_Y11_N8
\u_vga|Add7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~2_combout\ = (\u_vga|h_cnt\(1) & (!\u_vga|Add7~1\)) # (!\u_vga|h_cnt\(1) & ((\u_vga|Add7~1\) # (GND)))
-- \u_vga|Add7~3\ = CARRY((!\u_vga|Add7~1\) # (!\u_vga|h_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(1),
	datad => VCC,
	cin => \u_vga|Add7~1\,
	combout => \u_vga|Add7~2_combout\,
	cout => \u_vga|Add7~3\);

-- Location: FF_X36_Y11_N9
\u_vga|h_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(1));

-- Location: LCCOMB_X36_Y11_N10
\u_vga|Add7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~4_combout\ = (\u_vga|h_cnt\(2) & (\u_vga|Add7~3\ $ (GND))) # (!\u_vga|h_cnt\(2) & (!\u_vga|Add7~3\ & VCC))
-- \u_vga|Add7~5\ = CARRY((\u_vga|h_cnt\(2) & !\u_vga|Add7~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datad => VCC,
	cin => \u_vga|Add7~3\,
	combout => \u_vga|Add7~4_combout\,
	cout => \u_vga|Add7~5\);

-- Location: FF_X36_Y11_N11
\u_vga|h_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(2));

-- Location: LCCOMB_X36_Y11_N12
\u_vga|Add7~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~6_combout\ = (\u_vga|h_cnt\(3) & (!\u_vga|Add7~5\)) # (!\u_vga|h_cnt\(3) & ((\u_vga|Add7~5\) # (GND)))
-- \u_vga|Add7~7\ = CARRY((!\u_vga|Add7~5\) # (!\u_vga|h_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datad => VCC,
	cin => \u_vga|Add7~5\,
	combout => \u_vga|Add7~6_combout\,
	cout => \u_vga|Add7~7\);

-- Location: FF_X36_Y11_N13
\u_vga|h_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(3));

-- Location: LCCOMB_X36_Y11_N14
\u_vga|Add7~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~8_combout\ = (\u_vga|h_cnt\(4) & (\u_vga|Add7~7\ $ (GND))) # (!\u_vga|h_cnt\(4) & (!\u_vga|Add7~7\ & VCC))
-- \u_vga|Add7~9\ = CARRY((\u_vga|h_cnt\(4) & !\u_vga|Add7~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datad => VCC,
	cin => \u_vga|Add7~7\,
	combout => \u_vga|Add7~8_combout\,
	cout => \u_vga|Add7~9\);

-- Location: LCCOMB_X36_Y11_N2
\u_vga|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal0~0_combout\ = (\u_vga|h_cnt\(2) & (\u_vga|h_cnt\(3) & (\u_vga|h_cnt\(1) & \u_vga|h_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|h_cnt\(0),
	combout => \u_vga|Equal0~0_combout\);

-- Location: LCCOMB_X36_Y9_N8
\u_vga|h_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|h_cnt~0_combout\ = (\u_vga|Add7~8_combout\ & (((!\u_vga|Equal0~0_combout\) # (!\u_vga|h_cnt\(10))) # (!\u_vga|LessThan10~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan10~0_combout\,
	datab => \u_vga|Add7~8_combout\,
	datac => \u_vga|h_cnt\(10),
	datad => \u_vga|Equal0~0_combout\,
	combout => \u_vga|h_cnt~0_combout\);

-- Location: FF_X36_Y9_N9
\u_vga|h_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|h_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(4));

-- Location: LCCOMB_X36_Y11_N16
\u_vga|Add7~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~10_combout\ = (\u_vga|h_cnt\(5) & (!\u_vga|Add7~9\)) # (!\u_vga|h_cnt\(5) & ((\u_vga|Add7~9\) # (GND)))
-- \u_vga|Add7~11\ = CARRY((!\u_vga|Add7~9\) # (!\u_vga|h_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|Add7~9\,
	combout => \u_vga|Add7~10_combout\,
	cout => \u_vga|Add7~11\);

-- Location: FF_X36_Y11_N17
\u_vga|h_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(5));

-- Location: LCCOMB_X36_Y11_N18
\u_vga|Add7~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~12_combout\ = (\u_vga|h_cnt\(6) & (\u_vga|Add7~11\ $ (GND))) # (!\u_vga|h_cnt\(6) & (!\u_vga|Add7~11\ & VCC))
-- \u_vga|Add7~13\ = CARRY((\u_vga|h_cnt\(6) & !\u_vga|Add7~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(6),
	datad => VCC,
	cin => \u_vga|Add7~11\,
	combout => \u_vga|Add7~12_combout\,
	cout => \u_vga|Add7~13\);

-- Location: FF_X36_Y11_N19
\u_vga|h_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(6));

-- Location: LCCOMB_X36_Y11_N20
\u_vga|Add7~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~14_combout\ = (\u_vga|h_cnt\(7) & (!\u_vga|Add7~13\)) # (!\u_vga|h_cnt\(7) & ((\u_vga|Add7~13\) # (GND)))
-- \u_vga|Add7~15\ = CARRY((!\u_vga|Add7~13\) # (!\u_vga|h_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|Add7~13\,
	combout => \u_vga|Add7~14_combout\,
	cout => \u_vga|Add7~15\);

-- Location: FF_X36_Y11_N21
\u_vga|h_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(7));

-- Location: LCCOMB_X36_Y11_N22
\u_vga|Add7~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~16_combout\ = (\u_vga|h_cnt\(8) & (\u_vga|Add7~15\ $ (GND))) # (!\u_vga|h_cnt\(8) & (!\u_vga|Add7~15\ & VCC))
-- \u_vga|Add7~17\ = CARRY((\u_vga|h_cnt\(8) & !\u_vga|Add7~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(8),
	datad => VCC,
	cin => \u_vga|Add7~15\,
	combout => \u_vga|Add7~16_combout\,
	cout => \u_vga|Add7~17\);

-- Location: FF_X36_Y11_N23
\u_vga|h_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(8));

-- Location: LCCOMB_X36_Y11_N24
\u_vga|Add7~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~18_combout\ = (\u_vga|h_cnt\(9) & (!\u_vga|Add7~17\)) # (!\u_vga|h_cnt\(9) & ((\u_vga|Add7~17\) # (GND)))
-- \u_vga|Add7~19\ = CARRY((!\u_vga|Add7~17\) # (!\u_vga|h_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datad => VCC,
	cin => \u_vga|Add7~17\,
	combout => \u_vga|Add7~18_combout\,
	cout => \u_vga|Add7~19\);

-- Location: FF_X36_Y11_N25
\u_vga|h_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(9));

-- Location: LCCOMB_X36_Y11_N26
\u_vga|Add7~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~20_combout\ = \u_vga|Add7~19\ $ (!\u_vga|h_cnt\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|h_cnt\(10),
	cin => \u_vga|Add7~19\,
	combout => \u_vga|Add7~20_combout\);

-- Location: LCCOMB_X36_Y9_N26
\u_vga|h_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|h_cnt~1_combout\ = (\u_vga|Add7~20_combout\ & (((!\u_vga|LessThan10~0_combout\) # (!\u_vga|h_cnt\(10))) # (!\u_vga|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add7~20_combout\,
	datab => \u_vga|Equal0~0_combout\,
	datac => \u_vga|h_cnt\(10),
	datad => \u_vga|LessThan10~0_combout\,
	combout => \u_vga|h_cnt~1_combout\);

-- Location: FF_X36_Y9_N27
\u_vga|h_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|h_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(10));

-- Location: LCCOMB_X36_Y9_N12
\u_vga|LessThan13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~1_combout\ = (!\u_vga|h_cnt\(10) & (((\u_vga|LessThan13~0_combout\) # (!\u_vga|h_cnt\(8))) # (!\u_vga|h_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(10),
	datab => \u_vga|h_cnt\(9),
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|LessThan13~0_combout\,
	combout => \u_vga|LessThan13~1_combout\);

-- Location: FF_X36_Y9_N13
\u_vga|horizontal_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|LessThan13~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|horizontal_en~q\);

-- Location: LCCOMB_X35_Y9_N2
\u_vga|Add8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~0_combout\ = \u_vga|v_cnt\(0) $ (VCC)
-- \u_vga|Add8~1\ = CARRY(\u_vga|v_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(0),
	datad => VCC,
	combout => \u_vga|Add8~0_combout\,
	cout => \u_vga|Add8~1\);

-- Location: LCCOMB_X35_Y9_N16
\u_vga|Add8~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~14_combout\ = (\u_vga|v_cnt\(7) & (!\u_vga|Add8~13\)) # (!\u_vga|v_cnt\(7) & ((\u_vga|Add8~13\) # (GND)))
-- \u_vga|Add8~15\ = CARRY((!\u_vga|Add8~13\) # (!\u_vga|v_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datad => VCC,
	cin => \u_vga|Add8~13\,
	combout => \u_vga|Add8~14_combout\,
	cout => \u_vga|Add8~15\);

-- Location: LCCOMB_X35_Y9_N18
\u_vga|Add8~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~16_combout\ = (\u_vga|v_cnt\(8) & (\u_vga|Add8~15\ $ (GND))) # (!\u_vga|v_cnt\(8) & (!\u_vga|Add8~15\ & VCC))
-- \u_vga|Add8~17\ = CARRY((\u_vga|v_cnt\(8) & !\u_vga|Add8~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(8),
	datad => VCC,
	cin => \u_vga|Add8~15\,
	combout => \u_vga|Add8~16_combout\,
	cout => \u_vga|Add8~17\);

-- Location: LCCOMB_X35_Y9_N24
\u_vga|v_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~0_combout\ = (\u_vga|Add8~16_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add8~16_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~0_combout\);

-- Location: LCCOMB_X36_Y9_N22
\u_vga|v_cnt[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[4]~1_combout\ = (\u_vga|h_cnt\(10) & ((\u_vga|LessThan10~0_combout\ & ((\u_vga|Equal0~0_combout\))) # (!\u_vga|LessThan10~0_combout\ & (!\u_vga|vga_gen~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan10~0_combout\,
	datab => \u_vga|vga_gen~16_combout\,
	datac => \u_vga|h_cnt\(10),
	datad => \u_vga|Equal0~0_combout\,
	combout => \u_vga|v_cnt[4]~1_combout\);

-- Location: FF_X35_Y9_N25
\u_vga|v_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~0_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(8));

-- Location: LCCOMB_X36_Y8_N6
\u_vga|LessThan14~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~3_combout\ = (\u_vga|v_cnt\(3) & \u_vga|v_cnt\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|v_cnt\(3),
	datad => \u_vga|v_cnt\(4),
	combout => \u_vga|LessThan14~3_combout\);

-- Location: LCCOMB_X36_Y9_N0
\u_vga|vga_gen~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~14_combout\ = ((!\u_vga|v_cnt\(1) & (!\u_vga|v_cnt\(2) & !\u_vga|v_cnt\(0)))) # (!\u_vga|LessThan14~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan14~3_combout\,
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(2),
	datad => \u_vga|v_cnt\(0),
	combout => \u_vga|vga_gen~14_combout\);

-- Location: LCCOMB_X36_Y8_N16
\u_vga|vga_gen~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~15_combout\ = ((!\u_vga|v_cnt\(6) & (!\u_vga|v_cnt\(5) & \u_vga|vga_gen~14_combout\))) # (!\u_vga|v_cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|vga_gen~14_combout\,
	combout => \u_vga|vga_gen~15_combout\);

-- Location: LCCOMB_X35_Y9_N20
\u_vga|Add8~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~18_combout\ = (\u_vga|v_cnt\(9) & (!\u_vga|Add8~17\)) # (!\u_vga|v_cnt\(9) & ((\u_vga|Add8~17\) # (GND)))
-- \u_vga|Add8~19\ = CARRY((!\u_vga|Add8~17\) # (!\u_vga|v_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(9),
	datad => VCC,
	cin => \u_vga|Add8~17\,
	combout => \u_vga|Add8~18_combout\,
	cout => \u_vga|Add8~19\);

-- Location: LCCOMB_X36_Y9_N18
\u_vga|v_cnt[9]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[9]~2_combout\ = (\u_vga|v_cnt[4]~1_combout\ & (\u_vga|Add8~18_combout\ & ((\u_vga|vga_gen~17_combout\)))) # (!\u_vga|v_cnt[4]~1_combout\ & (((\u_vga|v_cnt\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt[4]~1_combout\,
	datab => \u_vga|Add8~18_combout\,
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt[9]~2_combout\);

-- Location: FF_X36_Y9_N19
\u_vga|v_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt[9]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(9));

-- Location: LCCOMB_X35_Y9_N22
\u_vga|Add8~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~20_combout\ = \u_vga|v_cnt\(10) $ (!\u_vga|Add8~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(10),
	cin => \u_vga|Add8~19\,
	combout => \u_vga|Add8~20_combout\);

-- Location: LCCOMB_X36_Y9_N4
\u_vga|v_cnt[10]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[10]~11_combout\ = (\u_vga|v_cnt[4]~1_combout\ & (\u_vga|Add8~20_combout\ & ((\u_vga|vga_gen~17_combout\)))) # (!\u_vga|v_cnt[4]~1_combout\ & (((\u_vga|v_cnt\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt[4]~1_combout\,
	datab => \u_vga|Add8~20_combout\,
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt[10]~11_combout\);

-- Location: FF_X36_Y9_N5
\u_vga|v_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt[10]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(10));

-- Location: LCCOMB_X36_Y8_N18
\u_vga|vga_gen~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~16_combout\ = (!\u_vga|v_cnt\(10) & (((!\u_vga|v_cnt\(8) & \u_vga|vga_gen~15_combout\)) # (!\u_vga|v_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(8),
	datab => \u_vga|vga_gen~15_combout\,
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|v_cnt\(10),
	combout => \u_vga|vga_gen~16_combout\);

-- Location: LCCOMB_X36_Y9_N28
\u_vga|vga_gen~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~17_combout\ = (\u_vga|vga_gen~16_combout\) # (((\u_vga|LessThan10~0_combout\ & !\u_vga|Equal0~0_combout\)) # (!\u_vga|h_cnt\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan10~0_combout\,
	datab => \u_vga|vga_gen~16_combout\,
	datac => \u_vga|h_cnt\(10),
	datad => \u_vga|Equal0~0_combout\,
	combout => \u_vga|vga_gen~17_combout\);

-- Location: LCCOMB_X36_Y9_N2
\u_vga|v_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~10_combout\ = (\u_vga|Add8~0_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~0_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~10_combout\);

-- Location: FF_X36_Y9_N3
\u_vga|v_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~10_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(0));

-- Location: LCCOMB_X35_Y9_N4
\u_vga|Add8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~2_combout\ = (\u_vga|v_cnt\(1) & (!\u_vga|Add8~1\)) # (!\u_vga|v_cnt\(1) & ((\u_vga|Add8~1\) # (GND)))
-- \u_vga|Add8~3\ = CARRY((!\u_vga|Add8~1\) # (!\u_vga|v_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(1),
	datad => VCC,
	cin => \u_vga|Add8~1\,
	combout => \u_vga|Add8~2_combout\,
	cout => \u_vga|Add8~3\);

-- Location: LCCOMB_X36_Y9_N20
\u_vga|v_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~9_combout\ = (\u_vga|Add8~2_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add8~2_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~9_combout\);

-- Location: FF_X36_Y9_N21
\u_vga|v_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~9_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(1));

-- Location: LCCOMB_X35_Y9_N6
\u_vga|Add8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~4_combout\ = (\u_vga|v_cnt\(2) & (\u_vga|Add8~3\ $ (GND))) # (!\u_vga|v_cnt\(2) & (!\u_vga|Add8~3\ & VCC))
-- \u_vga|Add8~5\ = CARRY((\u_vga|v_cnt\(2) & !\u_vga|Add8~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(2),
	datad => VCC,
	cin => \u_vga|Add8~3\,
	combout => \u_vga|Add8~4_combout\,
	cout => \u_vga|Add8~5\);

-- Location: LCCOMB_X36_Y9_N14
\u_vga|v_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~8_combout\ = (\u_vga|Add8~4_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~8_combout\);

-- Location: FF_X36_Y9_N15
\u_vga|v_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~8_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(2));

-- Location: LCCOMB_X35_Y9_N8
\u_vga|Add8~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~6_combout\ = (\u_vga|v_cnt\(3) & (!\u_vga|Add8~5\)) # (!\u_vga|v_cnt\(3) & ((\u_vga|Add8~5\) # (GND)))
-- \u_vga|Add8~7\ = CARRY((!\u_vga|Add8~5\) # (!\u_vga|v_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(3),
	datad => VCC,
	cin => \u_vga|Add8~5\,
	combout => \u_vga|Add8~6_combout\,
	cout => \u_vga|Add8~7\);

-- Location: LCCOMB_X35_Y9_N0
\u_vga|v_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~5_combout\ = (\u_vga|Add8~6_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add8~6_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~5_combout\);

-- Location: FF_X35_Y9_N1
\u_vga|v_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~5_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(3));

-- Location: LCCOMB_X35_Y9_N10
\u_vga|Add8~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~8_combout\ = (\u_vga|v_cnt\(4) & (\u_vga|Add8~7\ $ (GND))) # (!\u_vga|v_cnt\(4) & (!\u_vga|Add8~7\ & VCC))
-- \u_vga|Add8~9\ = CARRY((\u_vga|v_cnt\(4) & !\u_vga|Add8~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(4),
	datad => VCC,
	cin => \u_vga|Add8~7\,
	combout => \u_vga|Add8~8_combout\,
	cout => \u_vga|Add8~9\);

-- Location: LCCOMB_X36_Y9_N16
\u_vga|v_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~7_combout\ = (\u_vga|Add8~8_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~8_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~7_combout\);

-- Location: FF_X36_Y9_N17
\u_vga|v_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~7_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(4));

-- Location: LCCOMB_X35_Y9_N12
\u_vga|Add8~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~10_combout\ = (\u_vga|v_cnt\(5) & (!\u_vga|Add8~9\)) # (!\u_vga|v_cnt\(5) & ((\u_vga|Add8~9\) # (GND)))
-- \u_vga|Add8~11\ = CARRY((!\u_vga|Add8~9\) # (!\u_vga|v_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datad => VCC,
	cin => \u_vga|Add8~9\,
	combout => \u_vga|Add8~10_combout\,
	cout => \u_vga|Add8~11\);

-- Location: LCCOMB_X36_Y9_N30
\u_vga|v_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~6_combout\ = (\u_vga|Add8~10_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~10_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~6_combout\);

-- Location: FF_X36_Y9_N31
\u_vga|v_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~6_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(5));

-- Location: LCCOMB_X35_Y9_N14
\u_vga|Add8~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~12_combout\ = (\u_vga|v_cnt\(6) & (\u_vga|Add8~11\ $ (GND))) # (!\u_vga|v_cnt\(6) & (!\u_vga|Add8~11\ & VCC))
-- \u_vga|Add8~13\ = CARRY((\u_vga|v_cnt\(6) & !\u_vga|Add8~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(6),
	datad => VCC,
	cin => \u_vga|Add8~11\,
	combout => \u_vga|Add8~12_combout\,
	cout => \u_vga|Add8~13\);

-- Location: LCCOMB_X35_Y9_N28
\u_vga|v_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~3_combout\ = (\u_vga|Add8~12_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add8~12_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~3_combout\);

-- Location: FF_X35_Y9_N29
\u_vga|v_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~3_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(6));

-- Location: LCCOMB_X35_Y9_N26
\u_vga|v_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~4_combout\ = (\u_vga|Add8~14_combout\ & \u_vga|vga_gen~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add8~14_combout\,
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|v_cnt~4_combout\);

-- Location: FF_X35_Y9_N27
\u_vga|v_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~4_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(7));

-- Location: LCCOMB_X36_Y8_N22
\u_vga|LessThan14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~1_combout\ = (\u_vga|v_cnt\(7)) # (\u_vga|v_cnt\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(8),
	combout => \u_vga|LessThan14~1_combout\);

-- Location: LCCOMB_X36_Y8_N28
\u_vga|LessThan14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~0_combout\ = (\u_vga|v_cnt\(6) & ((\u_vga|v_cnt\(5)) # ((\u_vga|v_cnt\(3) & \u_vga|v_cnt\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|v_cnt\(5),
	datac => \u_vga|v_cnt\(3),
	datad => \u_vga|v_cnt\(4),
	combout => \u_vga|LessThan14~0_combout\);

-- Location: LCCOMB_X36_Y8_N0
\u_vga|LessThan14~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~2_combout\ = (!\u_vga|v_cnt\(10) & (((!\u_vga|LessThan14~1_combout\ & !\u_vga|LessThan14~0_combout\)) # (!\u_vga|v_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan14~1_combout\,
	datab => \u_vga|LessThan14~0_combout\,
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|v_cnt\(10),
	combout => \u_vga|LessThan14~2_combout\);

-- Location: LCCOMB_X37_Y9_N28
\u_vga|vertical_en~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vertical_en~feeder_combout\ = \u_vga|LessThan14~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|LessThan14~2_combout\,
	combout => \u_vga|vertical_en~feeder_combout\);

-- Location: FF_X37_Y9_N29
\u_vga|vertical_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|vertical_en~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|vertical_en~q\);

-- Location: LCCOMB_X37_Y9_N18
\u_vga|video_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|video_en~0_combout\ = (\u_vga|horizontal_en~q\ & \u_vga|vertical_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|horizontal_en~q\,
	datad => \u_vga|vertical_en~q\,
	combout => \u_vga|video_en~0_combout\);

-- Location: FF_X37_Y9_N19
\u_vga|video_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|video_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|video_en~q\);

-- Location: LCCOMB_X36_Y9_N24
\u_vga|vga_gen~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~1_combout\ = (\u_vga|v_cnt\(4) & (\u_vga|v_cnt\(1) & (\u_vga|v_cnt\(2)))) # (!\u_vga|v_cnt\(4) & ((\u_vga|v_cnt\(1)) # ((\u_vga|v_cnt\(2)) # (\u_vga|v_cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(2),
	datad => \u_vga|v_cnt\(0),
	combout => \u_vga|vga_gen~1_combout\);

-- Location: LCCOMB_X36_Y8_N30
\u_vga|vga_gen~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~2_combout\ = (\u_vga|v_cnt\(5) & (!\u_vga|vga_gen~1_combout\ & (!\u_vga|v_cnt\(3) & !\u_vga|v_cnt\(4)))) # (!\u_vga|v_cnt\(5) & (\u_vga|v_cnt\(4) & ((\u_vga|vga_gen~1_combout\) # (\u_vga|v_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|vga_gen~1_combout\,
	datac => \u_vga|v_cnt\(3),
	datad => \u_vga|v_cnt\(4),
	combout => \u_vga|vga_gen~2_combout\);

-- Location: LCCOMB_X36_Y8_N26
\u_vga|vga_gen~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~3_combout\ = (\u_vga|v_cnt\(8)) # ((\u_vga|v_cnt\(7) & ((\u_vga|v_cnt\(6)) # (\u_vga|v_cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(8),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(6),
	datad => \u_vga|v_cnt\(5),
	combout => \u_vga|vga_gen~3_combout\);

-- Location: LCCOMB_X36_Y8_N24
\u_vga|vga_gen~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~4_combout\ = (((!\u_vga|vga_gen~3_combout\ & !\u_vga|v_cnt\(9))) # (!\u_vga|LessThan13~1_combout\)) # (!\u_vga|LessThan14~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~3_combout\,
	datab => \u_vga|LessThan14~2_combout\,
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|LessThan13~1_combout\,
	combout => \u_vga|vga_gen~4_combout\);

-- Location: LCCOMB_X36_Y8_N14
\u_vga|red_signal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~0_combout\ = ((\u_vga|h_cnt\(10)) # ((\u_vga|v_cnt\(10)) # (!\u_vga|vga_gen~4_combout\))) # (!\u_vga|vga_gen~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~2_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|vga_gen~4_combout\,
	combout => \u_vga|red_signal~0_combout\);

-- Location: LCCOMB_X29_Y12_N28
\u_spi_ee_config|oDATA_YH_xhdl2[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|oDATA_YH_xhdl2[1]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1),
	combout => \u_spi_ee_config|oDATA_YH_xhdl2[1]~feeder_combout\);

-- Location: LCCOMB_X30_Y11_N0
\u_spi_ee_config|oDATA_YH_xhdl2[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\ = (\u_spi_ee_config|direction~q\ & (\u_spi_ee_config|high_byte_d~q\ & \u_spi_ee_config|low_byte_dataY[7]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|direction~q\,
	datab => \u_spi_ee_config|high_byte_d~q\,
	datad => \u_spi_ee_config|low_byte_dataY[7]~0_combout\,
	combout => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\);

-- Location: FF_X29_Y12_N29
\u_spi_ee_config|oDATA_YH_xhdl2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|oDATA_YH_xhdl2[1]~feeder_combout\,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YH_xhdl2\(1));

-- Location: LCCOMB_X28_Y12_N10
\u_vga|Add1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~15_combout\ = ((\u_vga|magn_g_y[4]~8_combout\ $ (\u_vga|magn_g_y[5]~10_combout\ $ (!\u_vga|Add1~14\)))) # (GND)
-- \u_vga|Add1~16\ = CARRY((\u_vga|magn_g_y[4]~8_combout\ & ((\u_vga|magn_g_y[5]~10_combout\) # (!\u_vga|Add1~14\))) # (!\u_vga|magn_g_y[4]~8_combout\ & (\u_vga|magn_g_y[5]~10_combout\ & !\u_vga|Add1~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datab => \u_vga|magn_g_y[5]~10_combout\,
	datad => VCC,
	cin => \u_vga|Add1~14\,
	combout => \u_vga|Add1~15_combout\,
	cout => \u_vga|Add1~16\);

-- Location: LCCOMB_X29_Y11_N30
\u_spi_ee_config|low_byte_dataY[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[5]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5),
	combout => \u_spi_ee_config|low_byte_dataY[5]~feeder_combout\);

-- Location: LCCOMB_X30_Y11_N2
\u_spi_ee_config|low_byte_dataY[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[7]~1_combout\ = (\u_spi_ee_config|low_byte_dataY[7]~0_combout\ & (!\u_spi_ee_config|high_byte_d~q\ & \u_spi_ee_config|direction~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|low_byte_dataY[7]~0_combout\,
	datac => \u_spi_ee_config|high_byte_d~q\,
	datad => \u_spi_ee_config|direction~q\,
	combout => \u_spi_ee_config|low_byte_dataY[7]~1_combout\);

-- Location: FF_X29_Y11_N31
\u_spi_ee_config|low_byte_dataY[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_dataY[5]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(5));

-- Location: FF_X29_Y12_N19
\u_spi_ee_config|oDATA_YL_xhdl1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_dataY\(5),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(5));

-- Location: FF_X29_Y11_N17
\u_spi_ee_config|low_byte_dataY[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(4));

-- Location: FF_X29_Y12_N17
\u_spi_ee_config|oDATA_YL_xhdl1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_dataY\(4),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(4));

-- Location: LCCOMB_X29_Y11_N14
\u_spi_ee_config|low_byte_dataY[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[3]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3),
	combout => \u_spi_ee_config|low_byte_dataY[3]~feeder_combout\);

-- Location: FF_X29_Y11_N15
\u_spi_ee_config|low_byte_dataY[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_dataY[3]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(3));

-- Location: FF_X29_Y12_N15
\u_spi_ee_config|oDATA_YL_xhdl1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_dataY\(3),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(3));

-- Location: FF_X29_Y11_N1
\u_spi_ee_config|low_byte_dataY[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(2),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(2));

-- Location: FF_X29_Y12_N13
\u_spi_ee_config|oDATA_YL_xhdl1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_dataY\(2),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(2));

-- Location: LCCOMB_X29_Y12_N30
\u_spi_ee_config|low_byte_dataY[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[1]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1),
	combout => \u_spi_ee_config|low_byte_dataY[1]~feeder_combout\);

-- Location: FF_X29_Y12_N31
\u_spi_ee_config|low_byte_dataY[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_dataY[1]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(1));

-- Location: FF_X29_Y12_N11
\u_spi_ee_config|oDATA_YL_xhdl1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_dataY\(1),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(1));

-- Location: FF_X29_Y12_N5
\u_spi_ee_config|low_byte_dataY[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(0));

-- Location: FF_X29_Y12_N7
\u_spi_ee_config|oDATA_YL_xhdl1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_dataY\(0),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(0));

-- Location: LCCOMB_X29_Y12_N6
\u_vga|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~0_combout\ = \u_spi_ee_config|oDATA_YL_xhdl1\(0) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|oDATA_YL_xhdl1\(0),
	datad => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	combout => \u_vga|Add0~0_combout\);

-- Location: LCCOMB_X29_Y12_N8
\u_vga|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~1_combout\ = (\u_vga|Add0~0_combout\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (VCC))) # (!\u_vga|Add0~0_combout\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & VCC))
-- \u_vga|Add0~2\ = CARRY((\u_vga|Add0~0_combout\ & \u_spi_ee_config|oDATA_YH_xhdl2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add0~0_combout\,
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	combout => \u_vga|Add0~1_combout\,
	cout => \u_vga|Add0~2\);

-- Location: LCCOMB_X29_Y12_N10
\u_vga|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~3_combout\ = (\u_vga|Add0~2\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(1) $ ((!\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add0~2\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(1) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (GND)))
-- \u_vga|Add0~4\ = CARRY((\u_spi_ee_config|oDATA_YL_xhdl1\(1) $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (!\u_vga|Add0~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(1),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add0~2\,
	combout => \u_vga|Add0~3_combout\,
	cout => \u_vga|Add0~4\);

-- Location: LCCOMB_X29_Y12_N12
\u_vga|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~5_combout\ = (\u_vga|Add0~4\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(2) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add0~4\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(2) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (VCC))))
-- \u_vga|Add0~6\ = CARRY((!\u_vga|Add0~4\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(2) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(2),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add0~4\,
	combout => \u_vga|Add0~5_combout\,
	cout => \u_vga|Add0~6\);

-- Location: LCCOMB_X29_Y12_N14
\u_vga|Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~7_combout\ = (\u_vga|Add0~6\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ ((!\u_spi_ee_config|oDATA_YL_xhdl1\(3))))) # (!\u_vga|Add0~6\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(3))) # (GND)))
-- \u_vga|Add0~8\ = CARRY((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (!\u_spi_ee_config|oDATA_YL_xhdl1\(3))) # (!\u_vga|Add0~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(3),
	datad => VCC,
	cin => \u_vga|Add0~6\,
	combout => \u_vga|Add0~7_combout\,
	cout => \u_vga|Add0~8\);

-- Location: LCCOMB_X29_Y12_N16
\u_vga|Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~9_combout\ = (\u_vga|Add0~8\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(4))))) # (!\u_vga|Add0~8\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(4) $ (VCC))))
-- \u_vga|Add0~10\ = CARRY((!\u_vga|Add0~8\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(4),
	datad => VCC,
	cin => \u_vga|Add0~8\,
	combout => \u_vga|Add0~9_combout\,
	cout => \u_vga|Add0~10\);

-- Location: LCCOMB_X29_Y12_N18
\u_vga|Add0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~11_combout\ = (\u_vga|Add0~10\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ ((!\u_spi_ee_config|oDATA_YL_xhdl1\(5))))) # (!\u_vga|Add0~10\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(5))) # (GND)))
-- \u_vga|Add0~12\ = CARRY((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (!\u_spi_ee_config|oDATA_YL_xhdl1\(5))) # (!\u_vga|Add0~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(5),
	datad => VCC,
	cin => \u_vga|Add0~10\,
	combout => \u_vga|Add0~11_combout\,
	cout => \u_vga|Add0~12\);

-- Location: LCCOMB_X28_Y12_N2
\u_vga|Add1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~7_combout\ = (\u_vga|magn_g_y[1]~2_combout\ & (\u_vga|magn_g_y[0]~0_combout\ $ (VCC))) # (!\u_vga|magn_g_y[1]~2_combout\ & (\u_vga|magn_g_y[0]~0_combout\ & VCC))
-- \u_vga|Add1~8\ = CARRY((\u_vga|magn_g_y[1]~2_combout\ & \u_vga|magn_g_y[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[1]~2_combout\,
	datab => \u_vga|magn_g_y[0]~0_combout\,
	datad => VCC,
	combout => \u_vga|Add1~7_combout\,
	cout => \u_vga|Add1~8\);

-- Location: LCCOMB_X30_Y12_N0
\u_vga|Add3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add3~1_cout\ = CARRY((\u_vga|Add0~1_combout\ & \u_vga|magn_g_y[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add0~1_combout\,
	datab => \u_vga|magn_g_y[0]~0_combout\,
	datad => VCC,
	cout => \u_vga|Add3~1_cout\);

-- Location: LCCOMB_X30_Y12_N2
\u_vga|Add3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add3~3_cout\ = CARRY((\u_vga|Add0~3_combout\ & (!\u_vga|Add1~7_combout\ & !\u_vga|Add3~1_cout\)) # (!\u_vga|Add0~3_combout\ & ((!\u_vga|Add3~1_cout\) # (!\u_vga|Add1~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add0~3_combout\,
	datab => \u_vga|Add1~7_combout\,
	datad => VCC,
	cin => \u_vga|Add3~1_cout\,
	cout => \u_vga|Add3~3_cout\);

-- Location: LCCOMB_X30_Y12_N4
\u_vga|magn_g_y[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|magn_g_y[0]~0_combout\ = ((\u_vga|Add0~5_combout\ $ (\u_vga|Add1~9_combout\ $ (!\u_vga|Add3~3_cout\)))) # (GND)
-- \u_vga|magn_g_y[0]~1\ = CARRY((\u_vga|Add0~5_combout\ & ((\u_vga|Add1~9_combout\) # (!\u_vga|Add3~3_cout\))) # (!\u_vga|Add0~5_combout\ & (\u_vga|Add1~9_combout\ & !\u_vga|Add3~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add0~5_combout\,
	datab => \u_vga|Add1~9_combout\,
	datad => VCC,
	cin => \u_vga|Add3~3_cout\,
	combout => \u_vga|magn_g_y[0]~0_combout\,
	cout => \u_vga|magn_g_y[0]~1\);

-- Location: LCCOMB_X28_Y12_N4
\u_vga|Add1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~9_combout\ = (\u_vga|magn_g_y[2]~4_combout\ & ((\u_vga|magn_g_y[1]~2_combout\ & (\u_vga|Add1~8\ & VCC)) # (!\u_vga|magn_g_y[1]~2_combout\ & (!\u_vga|Add1~8\)))) # (!\u_vga|magn_g_y[2]~4_combout\ & ((\u_vga|magn_g_y[1]~2_combout\ & 
-- (!\u_vga|Add1~8\)) # (!\u_vga|magn_g_y[1]~2_combout\ & ((\u_vga|Add1~8\) # (GND)))))
-- \u_vga|Add1~10\ = CARRY((\u_vga|magn_g_y[2]~4_combout\ & (!\u_vga|magn_g_y[1]~2_combout\ & !\u_vga|Add1~8\)) # (!\u_vga|magn_g_y[2]~4_combout\ & ((!\u_vga|Add1~8\) # (!\u_vga|magn_g_y[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[2]~4_combout\,
	datab => \u_vga|magn_g_y[1]~2_combout\,
	datad => VCC,
	cin => \u_vga|Add1~8\,
	combout => \u_vga|Add1~9_combout\,
	cout => \u_vga|Add1~10\);

-- Location: LCCOMB_X30_Y12_N6
\u_vga|magn_g_y[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|magn_g_y[1]~2_combout\ = (\u_vga|Add0~7_combout\ & ((\u_vga|Add1~11_combout\ & (\u_vga|magn_g_y[0]~1\ & VCC)) # (!\u_vga|Add1~11_combout\ & (!\u_vga|magn_g_y[0]~1\)))) # (!\u_vga|Add0~7_combout\ & ((\u_vga|Add1~11_combout\ & 
-- (!\u_vga|magn_g_y[0]~1\)) # (!\u_vga|Add1~11_combout\ & ((\u_vga|magn_g_y[0]~1\) # (GND)))))
-- \u_vga|magn_g_y[1]~3\ = CARRY((\u_vga|Add0~7_combout\ & (!\u_vga|Add1~11_combout\ & !\u_vga|magn_g_y[0]~1\)) # (!\u_vga|Add0~7_combout\ & ((!\u_vga|magn_g_y[0]~1\) # (!\u_vga|Add1~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add0~7_combout\,
	datab => \u_vga|Add1~11_combout\,
	datad => VCC,
	cin => \u_vga|magn_g_y[0]~1\,
	combout => \u_vga|magn_g_y[1]~2_combout\,
	cout => \u_vga|magn_g_y[1]~3\);

-- Location: LCCOMB_X28_Y12_N6
\u_vga|Add1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~11_combout\ = ((\u_vga|magn_g_y[2]~4_combout\ $ (\u_vga|magn_g_y[3]~6_combout\ $ (!\u_vga|Add1~10\)))) # (GND)
-- \u_vga|Add1~12\ = CARRY((\u_vga|magn_g_y[2]~4_combout\ & ((\u_vga|magn_g_y[3]~6_combout\) # (!\u_vga|Add1~10\))) # (!\u_vga|magn_g_y[2]~4_combout\ & (\u_vga|magn_g_y[3]~6_combout\ & !\u_vga|Add1~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[2]~4_combout\,
	datab => \u_vga|magn_g_y[3]~6_combout\,
	datad => VCC,
	cin => \u_vga|Add1~10\,
	combout => \u_vga|Add1~11_combout\,
	cout => \u_vga|Add1~12\);

-- Location: LCCOMB_X30_Y12_N8
\u_vga|magn_g_y[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|magn_g_y[2]~4_combout\ = ((\u_vga|Add0~9_combout\ $ (\u_vga|Add1~13_combout\ $ (!\u_vga|magn_g_y[1]~3\)))) # (GND)
-- \u_vga|magn_g_y[2]~5\ = CARRY((\u_vga|Add0~9_combout\ & ((\u_vga|Add1~13_combout\) # (!\u_vga|magn_g_y[1]~3\))) # (!\u_vga|Add0~9_combout\ & (\u_vga|Add1~13_combout\ & !\u_vga|magn_g_y[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add0~9_combout\,
	datab => \u_vga|Add1~13_combout\,
	datad => VCC,
	cin => \u_vga|magn_g_y[1]~3\,
	combout => \u_vga|magn_g_y[2]~4_combout\,
	cout => \u_vga|magn_g_y[2]~5\);

-- Location: LCCOMB_X28_Y12_N8
\u_vga|Add1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~13_combout\ = (\u_vga|magn_g_y[4]~8_combout\ & ((\u_vga|magn_g_y[3]~6_combout\ & (\u_vga|Add1~12\ & VCC)) # (!\u_vga|magn_g_y[3]~6_combout\ & (!\u_vga|Add1~12\)))) # (!\u_vga|magn_g_y[4]~8_combout\ & ((\u_vga|magn_g_y[3]~6_combout\ & 
-- (!\u_vga|Add1~12\)) # (!\u_vga|magn_g_y[3]~6_combout\ & ((\u_vga|Add1~12\) # (GND)))))
-- \u_vga|Add1~14\ = CARRY((\u_vga|magn_g_y[4]~8_combout\ & (!\u_vga|magn_g_y[3]~6_combout\ & !\u_vga|Add1~12\)) # (!\u_vga|magn_g_y[4]~8_combout\ & ((!\u_vga|Add1~12\) # (!\u_vga|magn_g_y[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datab => \u_vga|magn_g_y[3]~6_combout\,
	datad => VCC,
	cin => \u_vga|Add1~12\,
	combout => \u_vga|Add1~13_combout\,
	cout => \u_vga|Add1~14\);

-- Location: LCCOMB_X30_Y12_N10
\u_vga|magn_g_y[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|magn_g_y[3]~6_combout\ = (\u_vga|Add1~15_combout\ & ((\u_vga|Add0~11_combout\ & (\u_vga|magn_g_y[2]~5\ & VCC)) # (!\u_vga|Add0~11_combout\ & (!\u_vga|magn_g_y[2]~5\)))) # (!\u_vga|Add1~15_combout\ & ((\u_vga|Add0~11_combout\ & 
-- (!\u_vga|magn_g_y[2]~5\)) # (!\u_vga|Add0~11_combout\ & ((\u_vga|magn_g_y[2]~5\) # (GND)))))
-- \u_vga|magn_g_y[3]~7\ = CARRY((\u_vga|Add1~15_combout\ & (!\u_vga|Add0~11_combout\ & !\u_vga|magn_g_y[2]~5\)) # (!\u_vga|Add1~15_combout\ & ((!\u_vga|magn_g_y[2]~5\) # (!\u_vga|Add0~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add1~15_combout\,
	datab => \u_vga|Add0~11_combout\,
	datad => VCC,
	cin => \u_vga|magn_g_y[2]~5\,
	combout => \u_vga|magn_g_y[3]~6_combout\,
	cout => \u_vga|magn_g_y[3]~7\);

-- Location: LCCOMB_X28_Y12_N12
\u_vga|Add1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~17_combout\ = (\u_vga|magn_g_y[5]~10_combout\ & ((\u_vga|magn_g_y[6]~12_combout\ & (\u_vga|Add1~16\ & VCC)) # (!\u_vga|magn_g_y[6]~12_combout\ & (!\u_vga|Add1~16\)))) # (!\u_vga|magn_g_y[5]~10_combout\ & ((\u_vga|magn_g_y[6]~12_combout\ & 
-- (!\u_vga|Add1~16\)) # (!\u_vga|magn_g_y[6]~12_combout\ & ((\u_vga|Add1~16\) # (GND)))))
-- \u_vga|Add1~18\ = CARRY((\u_vga|magn_g_y[5]~10_combout\ & (!\u_vga|magn_g_y[6]~12_combout\ & !\u_vga|Add1~16\)) # (!\u_vga|magn_g_y[5]~10_combout\ & ((!\u_vga|Add1~16\) # (!\u_vga|magn_g_y[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[5]~10_combout\,
	datab => \u_vga|magn_g_y[6]~12_combout\,
	datad => VCC,
	cin => \u_vga|Add1~16\,
	combout => \u_vga|Add1~17_combout\,
	cout => \u_vga|Add1~18\);

-- Location: LCCOMB_X28_Y12_N14
\u_vga|Add1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~19_combout\ = (\u_vga|magn_g_y[6]~12_combout\ & (\u_vga|Add1~18\ $ (GND))) # (!\u_vga|magn_g_y[6]~12_combout\ & (!\u_vga|Add1~18\ & VCC))
-- \u_vga|Add1~20\ = CARRY((\u_vga|magn_g_y[6]~12_combout\ & !\u_vga|Add1~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[6]~12_combout\,
	datad => VCC,
	cin => \u_vga|Add1~18\,
	combout => \u_vga|Add1~19_combout\,
	cout => \u_vga|Add1~20\);

-- Location: LCCOMB_X28_Y12_N16
\u_vga|Add1~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~21_combout\ = \u_vga|Add1~20\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|Add1~20\,
	combout => \u_vga|Add1~21_combout\);

-- Location: FF_X29_Y12_N25
\u_spi_ee_config|oDATA_YH_xhdl2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YH_xhdl2\(0));

-- Location: FF_X29_Y11_N21
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
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(7));

-- Location: LCCOMB_X29_Y11_N6
\u_spi_ee_config|low_byte_dataY[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[7]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(7),
	combout => \u_spi_ee_config|low_byte_dataY[7]~feeder_combout\);

-- Location: FF_X29_Y11_N7
\u_spi_ee_config|low_byte_dataY[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_dataY[7]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(7));

-- Location: FF_X29_Y12_N23
\u_spi_ee_config|oDATA_YL_xhdl1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_dataY\(7),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(7));

-- Location: FF_X29_Y11_N25
\u_spi_ee_config|low_byte_dataY[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(6));

-- Location: FF_X29_Y12_N21
\u_spi_ee_config|oDATA_YL_xhdl1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|low_byte_dataY\(6),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(6));

-- Location: LCCOMB_X29_Y12_N20
\u_vga|Add0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~13_combout\ = (\u_vga|Add0~12\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(6))))) # (!\u_vga|Add0~12\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(6) $ (VCC))))
-- \u_vga|Add0~14\ = CARRY((!\u_vga|Add0~12\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(6),
	datad => VCC,
	cin => \u_vga|Add0~12\,
	combout => \u_vga|Add0~13_combout\,
	cout => \u_vga|Add0~14\);

-- Location: LCCOMB_X29_Y12_N22
\u_vga|Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~15_combout\ = (\u_vga|Add0~14\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(7) $ ((!\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add0~14\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(7) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (GND)))
-- \u_vga|Add0~16\ = CARRY((\u_spi_ee_config|oDATA_YL_xhdl1\(7) $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (!\u_vga|Add0~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(7),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add0~14\,
	combout => \u_vga|Add0~15_combout\,
	cout => \u_vga|Add0~16\);

-- Location: LCCOMB_X29_Y12_N24
\u_vga|Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~17_combout\ = \u_spi_ee_config|oDATA_YH_xhdl2\(0) $ (\u_vga|Add0~16\ $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(0),
	datad => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	cin => \u_vga|Add0~16\,
	combout => \u_vga|Add0~17_combout\);

-- Location: LCCOMB_X30_Y12_N12
\u_vga|magn_g_y[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|magn_g_y[4]~8_combout\ = ((\u_vga|Add1~17_combout\ $ (\u_vga|Add0~13_combout\ $ (!\u_vga|magn_g_y[3]~7\)))) # (GND)
-- \u_vga|magn_g_y[4]~9\ = CARRY((\u_vga|Add1~17_combout\ & ((\u_vga|Add0~13_combout\) # (!\u_vga|magn_g_y[3]~7\))) # (!\u_vga|Add1~17_combout\ & (\u_vga|Add0~13_combout\ & !\u_vga|magn_g_y[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add1~17_combout\,
	datab => \u_vga|Add0~13_combout\,
	datad => VCC,
	cin => \u_vga|magn_g_y[3]~7\,
	combout => \u_vga|magn_g_y[4]~8_combout\,
	cout => \u_vga|magn_g_y[4]~9\);

-- Location: LCCOMB_X30_Y12_N14
\u_vga|magn_g_y[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|magn_g_y[5]~10_combout\ = (\u_vga|Add1~19_combout\ & ((\u_vga|Add0~15_combout\ & (\u_vga|magn_g_y[4]~9\ & VCC)) # (!\u_vga|Add0~15_combout\ & (!\u_vga|magn_g_y[4]~9\)))) # (!\u_vga|Add1~19_combout\ & ((\u_vga|Add0~15_combout\ & 
-- (!\u_vga|magn_g_y[4]~9\)) # (!\u_vga|Add0~15_combout\ & ((\u_vga|magn_g_y[4]~9\) # (GND)))))
-- \u_vga|magn_g_y[5]~11\ = CARRY((\u_vga|Add1~19_combout\ & (!\u_vga|Add0~15_combout\ & !\u_vga|magn_g_y[4]~9\)) # (!\u_vga|Add1~19_combout\ & ((!\u_vga|magn_g_y[4]~9\) # (!\u_vga|Add0~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add1~19_combout\,
	datab => \u_vga|Add0~15_combout\,
	datad => VCC,
	cin => \u_vga|magn_g_y[4]~9\,
	combout => \u_vga|magn_g_y[5]~10_combout\,
	cout => \u_vga|magn_g_y[5]~11\);

-- Location: LCCOMB_X30_Y12_N16
\u_vga|magn_g_y[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|magn_g_y[6]~12_combout\ = \u_vga|Add1~21_combout\ $ (\u_vga|magn_g_y[5]~11\ $ (!\u_vga|Add0~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add1~21_combout\,
	datad => \u_vga|Add0~17_combout\,
	cin => \u_vga|magn_g_y[5]~11\,
	combout => \u_vga|magn_g_y[6]~12_combout\);

-- Location: LCCOMB_X29_Y12_N26
\u_vga|Mult0|mult_core|_~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|_~0_combout\ = (!\u_vga|magn_g_y[4]~8_combout\ & (\u_vga|magn_g_y[5]~10_combout\ & \u_vga|magn_g_y[6]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|magn_g_y[4]~8_combout\,
	datac => \u_vga|magn_g_y[5]~10_combout\,
	datad => \u_vga|magn_g_y[6]~12_combout\,
	combout => \u_vga|Mult0|mult_core|_~0_combout\);

-- Location: LCCOMB_X32_Y12_N24
\u_vga|Mult0|mult_core|_~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|_~1_combout\ = (\u_vga|magn_g_y[4]~8_combout\ & (\u_vga|magn_g_y[6]~12_combout\ & \u_vga|magn_g_y[5]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datac => \u_vga|magn_g_y[6]~12_combout\,
	datad => \u_vga|magn_g_y[5]~10_combout\,
	combout => \u_vga|Mult0|mult_core|_~1_combout\);

-- Location: LCCOMB_X30_Y12_N18
\u_vga|Mult0|mult_core|romout[1][10]\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][10]~combout\ = (\u_vga|magn_g_y[5]~10_combout\ & (\u_vga|magn_g_y[4]~8_combout\ & !\u_vga|magn_g_y[6]~12_combout\)) # (!\u_vga|magn_g_y[5]~10_combout\ & ((\u_vga|magn_g_y[6]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datac => \u_vga|magn_g_y[5]~10_combout\,
	datad => \u_vga|magn_g_y[6]~12_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][10]~combout\);

-- Location: LCCOMB_X31_Y12_N4
\u_vga|Mult0|mult_core|romout[1][9]\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][9]~combout\ = (\u_vga|magn_g_y[4]~8_combout\ & (\u_vga|magn_g_y[6]~12_combout\)) # (!\u_vga|magn_g_y[4]~8_combout\ & (!\u_vga|magn_g_y[6]~12_combout\ & \u_vga|magn_g_y[5]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datac => \u_vga|magn_g_y[6]~12_combout\,
	datad => \u_vga|magn_g_y[5]~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][9]~combout\);

-- Location: LCCOMB_X29_Y12_N0
\u_vga|Mult0|mult_core|romout[0][12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][12]~0_combout\ = (\u_vga|magn_g_y[3]~6_combout\ & ((\u_vga|magn_g_y[2]~4_combout\) # ((\u_vga|magn_g_y[0]~0_combout\ & \u_vga|magn_g_y[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[0]~0_combout\,
	datab => \u_vga|magn_g_y[2]~4_combout\,
	datac => \u_vga|magn_g_y[3]~6_combout\,
	datad => \u_vga|magn_g_y[1]~2_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][12]~0_combout\);

-- Location: LCCOMB_X31_Y12_N2
\u_vga|Mult0|mult_core|romout[1][8]\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][8]~combout\ = (!\u_vga|magn_g_y[5]~10_combout\ & ((\u_vga|magn_g_y[4]~8_combout\) # (\u_vga|magn_g_y[6]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datac => \u_vga|magn_g_y[6]~12_combout\,
	datad => \u_vga|magn_g_y[5]~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][8]~combout\);

-- Location: LCCOMB_X30_Y12_N28
\u_vga|Mult0|mult_core|romout[0][11]\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][11]~combout\ = (\u_vga|magn_g_y[2]~4_combout\ & (\u_vga|magn_g_y[1]~2_combout\ & ((!\u_vga|magn_g_y[3]~6_combout\)))) # (!\u_vga|magn_g_y[2]~4_combout\ & (\u_vga|magn_g_y[3]~6_combout\ & ((!\u_vga|magn_g_y[0]~0_combout\) # 
-- (!\u_vga|magn_g_y[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[1]~2_combout\,
	datab => \u_vga|magn_g_y[0]~0_combout\,
	datac => \u_vga|magn_g_y[2]~4_combout\,
	datad => \u_vga|magn_g_y[3]~6_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][11]~combout\);

-- Location: LCCOMB_X31_Y12_N28
\u_vga|Mult0|mult_core|romout[1][7]\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][7]~combout\ = (!\u_vga|magn_g_y[4]~8_combout\ & ((\u_vga|magn_g_y[6]~12_combout\) # (\u_vga|magn_g_y[5]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datac => \u_vga|magn_g_y[6]~12_combout\,
	datad => \u_vga|magn_g_y[5]~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][7]~combout\);

-- Location: LCCOMB_X31_Y12_N6
\u_vga|Mult0|mult_core|romout[1][6]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][6]~1_combout\ = (\u_vga|magn_g_y[4]~8_combout\) # ((\u_vga|magn_g_y[6]~12_combout\) # (\u_vga|magn_g_y[5]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datac => \u_vga|magn_g_y[6]~12_combout\,
	datad => \u_vga|magn_g_y[5]~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][6]~1_combout\);

-- Location: LCCOMB_X30_Y12_N30
\u_vga|Mult0|mult_core|romout[0][10]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][10]~2_combout\ = (\u_vga|magn_g_y[1]~2_combout\ & (\u_vga|magn_g_y[3]~6_combout\ $ (((\u_vga|magn_g_y[0]~0_combout\ & !\u_vga|magn_g_y[2]~4_combout\))))) # (!\u_vga|magn_g_y[1]~2_combout\ & ((\u_vga|magn_g_y[2]~4_combout\ 
-- & ((!\u_vga|magn_g_y[3]~6_combout\))) # (!\u_vga|magn_g_y[2]~4_combout\ & (\u_vga|magn_g_y[0]~0_combout\ & \u_vga|magn_g_y[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[1]~2_combout\,
	datab => \u_vga|magn_g_y[0]~0_combout\,
	datac => \u_vga|magn_g_y[2]~4_combout\,
	datad => \u_vga|magn_g_y[3]~6_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][10]~2_combout\);

-- Location: LCCOMB_X30_Y12_N24
\u_vga|Mult0|mult_core|romout[0][9]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][9]~3_combout\ = (\u_vga|magn_g_y[0]~0_combout\ & (((\u_vga|magn_g_y[2]~4_combout\)))) # (!\u_vga|magn_g_y[0]~0_combout\ & (!\u_vga|magn_g_y[2]~4_combout\ & ((\u_vga|magn_g_y[1]~2_combout\) # 
-- (\u_vga|magn_g_y[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[1]~2_combout\,
	datab => \u_vga|magn_g_y[0]~0_combout\,
	datac => \u_vga|magn_g_y[2]~4_combout\,
	datad => \u_vga|magn_g_y[3]~6_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][9]~3_combout\);

-- Location: LCCOMB_X30_Y12_N26
\u_vga|Mult0|mult_core|romout[0][8]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][8]~5_combout\ = (!\u_vga|magn_g_y[1]~2_combout\ & ((\u_vga|magn_g_y[0]~0_combout\) # ((\u_vga|magn_g_y[2]~4_combout\) # (\u_vga|magn_g_y[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[1]~2_combout\,
	datab => \u_vga|magn_g_y[0]~0_combout\,
	datac => \u_vga|magn_g_y[2]~4_combout\,
	datad => \u_vga|magn_g_y[3]~6_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][8]~5_combout\);

-- Location: LCCOMB_X31_Y12_N0
\u_vga|Mult0|mult_core|romout[1][4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][4]~4_combout\ = \u_vga|magn_g_y[6]~12_combout\ $ (((\u_vga|magn_g_y[4]~8_combout\) # (\u_vga|magn_g_y[5]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datac => \u_vga|magn_g_y[6]~12_combout\,
	datad => \u_vga|magn_g_y[5]~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][4]~4_combout\);

-- Location: LCCOMB_X31_Y12_N30
\u_vga|Mult0|mult_core|romout[1][3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][3]~6_combout\ = \u_vga|magn_g_y[4]~8_combout\ $ (\u_vga|magn_g_y[5]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datad => \u_vga|magn_g_y[5]~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][3]~6_combout\);

-- Location: LCCOMB_X30_Y12_N20
\u_vga|Mult0|mult_core|romout[0][7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][7]~7_combout\ = (!\u_vga|magn_g_y[0]~0_combout\ & ((\u_vga|magn_g_y[1]~2_combout\) # ((\u_vga|magn_g_y[2]~4_combout\) # (\u_vga|magn_g_y[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[1]~2_combout\,
	datab => \u_vga|magn_g_y[0]~0_combout\,
	datac => \u_vga|magn_g_y[2]~4_combout\,
	datad => \u_vga|magn_g_y[3]~6_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][7]~7_combout\);

-- Location: LCCOMB_X30_Y12_N22
\u_vga|Mult0|mult_core|romout[0][6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][6]~8_combout\ = (\u_vga|magn_g_y[1]~2_combout\) # ((\u_vga|magn_g_y[0]~0_combout\) # ((\u_vga|magn_g_y[2]~4_combout\) # (\u_vga|magn_g_y[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[1]~2_combout\,
	datab => \u_vga|magn_g_y[0]~0_combout\,
	datac => \u_vga|magn_g_y[2]~4_combout\,
	datad => \u_vga|magn_g_y[3]~6_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][6]~8_combout\);

-- Location: LCCOMB_X31_Y12_N8
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\ = CARRY((\u_vga|magn_g_y[4]~8_combout\ & \u_vga|Mult0|mult_core|romout[0][6]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y[4]~8_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][6]~8_combout\,
	datad => VCC,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\);

-- Location: LCCOMB_X31_Y12_N10
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\ = CARRY((\u_vga|Mult0|mult_core|romout[1][3]~6_combout\ & (!\u_vga|Mult0|mult_core|romout[0][7]~7_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\)) # 
-- (!\u_vga|Mult0|mult_core|romout[1][3]~6_combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\) # (!\u_vga|Mult0|mult_core|romout[0][7]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][3]~6_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][7]~7_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\);

-- Location: LCCOMB_X31_Y12_N12
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ = ((\u_vga|Mult0|mult_core|romout[0][8]~5_combout\ $ (\u_vga|Mult0|mult_core|romout[1][4]~4_combout\ $ (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ = CARRY((\u_vga|Mult0|mult_core|romout[0][8]~5_combout\ & ((\u_vga|Mult0|mult_core|romout[1][4]~4_combout\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\))) # 
-- (!\u_vga|Mult0|mult_core|romout[0][8]~5_combout\ & (\u_vga|Mult0|mult_core|romout[1][4]~4_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][8]~5_combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][4]~4_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\);

-- Location: LCCOMB_X31_Y12_N14
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ = (\u_vga|Mult0|mult_core|romout[1][6]~1_combout\ & ((\u_vga|Mult0|mult_core|romout[0][9]~3_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ & VCC)) # 
-- (!\u_vga|Mult0|mult_core|romout[0][9]~3_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)))) # (!\u_vga|Mult0|mult_core|romout[1][6]~1_combout\ & ((\u_vga|Mult0|mult_core|romout[0][9]~3_combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # (!\u_vga|Mult0|mult_core|romout[0][9]~3_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ = CARRY((\u_vga|Mult0|mult_core|romout[1][6]~1_combout\ & (!\u_vga|Mult0|mult_core|romout[0][9]~3_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # 
-- (!\u_vga|Mult0|mult_core|romout[1][6]~1_combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (!\u_vga|Mult0|mult_core|romout[0][9]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][6]~1_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][9]~3_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\);

-- Location: LCCOMB_X31_Y12_N16
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ = ((\u_vga|Mult0|mult_core|romout[1][6]~1_combout\ $ (\u_vga|Mult0|mult_core|romout[0][10]~2_combout\ $ (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ = CARRY((\u_vga|Mult0|mult_core|romout[1][6]~1_combout\ & ((\u_vga|Mult0|mult_core|romout[0][10]~2_combout\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\))) # 
-- (!\u_vga|Mult0|mult_core|romout[1][6]~1_combout\ & (\u_vga|Mult0|mult_core|romout[0][10]~2_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][6]~1_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][10]~2_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\);

-- Location: LCCOMB_X31_Y12_N18
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ = (\u_vga|Mult0|mult_core|romout[0][11]~combout\ & ((\u_vga|Mult0|mult_core|romout[1][7]~combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ & VCC)) # 
-- (!\u_vga|Mult0|mult_core|romout[1][7]~combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)))) # (!\u_vga|Mult0|mult_core|romout[0][11]~combout\ & ((\u_vga|Mult0|mult_core|romout[1][7]~combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # (!\u_vga|Mult0|mult_core|romout[1][7]~combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ = CARRY((\u_vga|Mult0|mult_core|romout[0][11]~combout\ & (!\u_vga|Mult0|mult_core|romout[1][7]~combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # 
-- (!\u_vga|Mult0|mult_core|romout[0][11]~combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (!\u_vga|Mult0|mult_core|romout[1][7]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][11]~combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][7]~combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\);

-- Location: LCCOMB_X31_Y12_N20
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ = ((\u_vga|Mult0|mult_core|romout[0][12]~0_combout\ $ (\u_vga|Mult0|mult_core|romout[1][8]~combout\ $ (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ = CARRY((\u_vga|Mult0|mult_core|romout[0][12]~0_combout\ & ((\u_vga|Mult0|mult_core|romout[1][8]~combout\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\))) # 
-- (!\u_vga|Mult0|mult_core|romout[0][12]~0_combout\ & (\u_vga|Mult0|mult_core|romout[1][8]~combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][12]~0_combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][8]~combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\);

-- Location: LCCOMB_X31_Y12_N22
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ = (\u_vga|Mult0|mult_core|romout[1][9]~combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\)) # (!\u_vga|Mult0|mult_core|romout[1][9]~combout\ & 
-- ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\) # (GND)))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ = CARRY((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\) # (!\u_vga|Mult0|mult_core|romout[1][9]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|romout[1][9]~combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\);

-- Location: LCCOMB_X31_Y12_N24
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ = (\u_vga|Mult0|mult_core|romout[1][10]~combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ $ (GND))) # (!\u_vga|Mult0|mult_core|romout[1][10]~combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ & VCC))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ = CARRY((\u_vga|Mult0|mult_core|romout[1][10]~combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|romout[1][10]~combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\);

-- Location: LCCOMB_X31_Y12_N26
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ = \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ $ (((\u_vga|Mult0|mult_core|_~0_combout\) # (\u_vga|Mult0|mult_core|_~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|_~0_combout\,
	datad => \u_vga|Mult0|mult_core|_~1_combout\,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\);

-- Location: LCCOMB_X32_Y12_N6
\u_vga|Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~0_combout\ = \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ $ (VCC)
-- \u_vga|Add5~1\ = CARRY(\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	datad => VCC,
	combout => \u_vga|Add5~0_combout\,
	cout => \u_vga|Add5~1\);

-- Location: LCCOMB_X32_Y12_N8
\u_vga|Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~2_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & (\u_vga|Add5~1\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & (!\u_vga|Add5~1\))
-- \u_vga|Add5~3\ = CARRY((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & !\u_vga|Add5~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	datad => VCC,
	cin => \u_vga|Add5~1\,
	combout => \u_vga|Add5~2_combout\,
	cout => \u_vga|Add5~3\);

-- Location: LCCOMB_X32_Y12_N10
\u_vga|Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~4_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ & ((GND) # (!\u_vga|Add5~3\))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ & (\u_vga|Add5~3\ $ (GND)))
-- \u_vga|Add5~5\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\) # (!\u_vga|Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	datad => VCC,
	cin => \u_vga|Add5~3\,
	combout => \u_vga|Add5~4_combout\,
	cout => \u_vga|Add5~5\);

-- Location: LCCOMB_X32_Y12_N12
\u_vga|Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~6_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & (\u_vga|Add5~5\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & (!\u_vga|Add5~5\))
-- \u_vga|Add5~7\ = CARRY((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & !\u_vga|Add5~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	datad => VCC,
	cin => \u_vga|Add5~5\,
	combout => \u_vga|Add5~6_combout\,
	cout => \u_vga|Add5~7\);

-- Location: LCCOMB_X32_Y12_N14
\u_vga|Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~8_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ & ((GND) # (!\u_vga|Add5~7\))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ & (\u_vga|Add5~7\ $ (GND)))
-- \u_vga|Add5~9\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\) # (!\u_vga|Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	datad => VCC,
	cin => \u_vga|Add5~7\,
	combout => \u_vga|Add5~8_combout\,
	cout => \u_vga|Add5~9\);

-- Location: LCCOMB_X32_Y12_N16
\u_vga|Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~10_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ & (!\u_vga|Add5~9\)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ & ((\u_vga|Add5~9\) # (GND)))
-- \u_vga|Add5~11\ = CARRY((!\u_vga|Add5~9\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\,
	datad => VCC,
	cin => \u_vga|Add5~9\,
	combout => \u_vga|Add5~10_combout\,
	cout => \u_vga|Add5~11\);

-- Location: LCCOMB_X32_Y12_N18
\u_vga|Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~12_combout\ = !\u_vga|Add5~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|Add5~11\,
	combout => \u_vga|Add5~12_combout\);

-- Location: LCCOMB_X37_Y12_N4
\u_vga|left_bound[9]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[9]~0_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & \u_vga|Add5~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => \u_vga|Add5~12_combout\,
	combout => \u_vga|left_bound[9]~0_combout\);

-- Location: LCCOMB_X35_Y12_N10
\u_vga|Add4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~1_cout\ = CARRY(!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	datad => VCC,
	cout => \u_vga|Add4~1_cout\);

-- Location: LCCOMB_X35_Y12_N12
\u_vga|Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~2_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ & ((\u_vga|Add4~1_cout\) # (GND))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ & (!\u_vga|Add4~1_cout\))
-- \u_vga|Add4~3\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\) # (!\u_vga|Add4~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	datad => VCC,
	cin => \u_vga|Add4~1_cout\,
	combout => \u_vga|Add4~2_combout\,
	cout => \u_vga|Add4~3\);

-- Location: LCCOMB_X35_Y12_N14
\u_vga|Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~4_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ & (\u_vga|Add4~3\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ & ((GND) # (!\u_vga|Add4~3\)))
-- \u_vga|Add4~5\ = CARRY((!\u_vga|Add4~3\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	datad => VCC,
	cin => \u_vga|Add4~3\,
	combout => \u_vga|Add4~4_combout\,
	cout => \u_vga|Add4~5\);

-- Location: LCCOMB_X35_Y12_N16
\u_vga|Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~6_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & (!\u_vga|Add4~5\)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & (\u_vga|Add4~5\ & VCC))
-- \u_vga|Add4~7\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & !\u_vga|Add4~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	datad => VCC,
	cin => \u_vga|Add4~5\,
	combout => \u_vga|Add4~6_combout\,
	cout => \u_vga|Add4~7\);

-- Location: LCCOMB_X35_Y12_N18
\u_vga|Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~8_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ & (\u_vga|Add4~7\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ & ((GND) # (!\u_vga|Add4~7\)))
-- \u_vga|Add4~9\ = CARRY((!\u_vga|Add4~7\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	datad => VCC,
	cin => \u_vga|Add4~7\,
	combout => \u_vga|Add4~8_combout\,
	cout => \u_vga|Add4~9\);

-- Location: LCCOMB_X35_Y12_N20
\u_vga|Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~10_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & (!\u_vga|Add4~9\)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & (\u_vga|Add4~9\ & VCC))
-- \u_vga|Add4~11\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & !\u_vga|Add4~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	datad => VCC,
	cin => \u_vga|Add4~9\,
	combout => \u_vga|Add4~10_combout\,
	cout => \u_vga|Add4~11\);

-- Location: LCCOMB_X35_Y12_N22
\u_vga|Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~12_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ & (\u_vga|Add4~11\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ & ((GND) # (!\u_vga|Add4~11\)))
-- \u_vga|Add4~13\ = CARRY((!\u_vga|Add4~11\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	datad => VCC,
	cin => \u_vga|Add4~11\,
	combout => \u_vga|Add4~12_combout\,
	cout => \u_vga|Add4~13\);

-- Location: LCCOMB_X35_Y12_N24
\u_vga|Add4~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~14_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ & ((\u_vga|Add4~13\) # (GND))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ & (!\u_vga|Add4~13\))
-- \u_vga|Add4~15\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\) # (!\u_vga|Add4~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\,
	datad => VCC,
	cin => \u_vga|Add4~13\,
	combout => \u_vga|Add4~14_combout\,
	cout => \u_vga|Add4~15\);

-- Location: LCCOMB_X35_Y12_N26
\u_vga|Add4~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~16_combout\ = !\u_vga|Add4~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|Add4~15\,
	combout => \u_vga|Add4~16_combout\);

-- Location: LCCOMB_X37_Y12_N2
\u_vga|Add4~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~18_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & ((!\u_vga|Add5~12_combout\))) # (!\u_spi_ee_config|oDATA_YH_xhdl2\(1) & (\u_vga|Add4~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datac => \u_vga|Add4~16_combout\,
	datad => \u_vga|Add5~12_combout\,
	combout => \u_vga|Add4~18_combout\);

-- Location: LCCOMB_X35_Y12_N4
\u_vga|Add4~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~19_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & (\u_vga|Add5~10_combout\)) # (!\u_spi_ee_config|oDATA_YH_xhdl2\(1) & ((\u_vga|Add4~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datac => \u_vga|Add5~10_combout\,
	datad => \u_vga|Add4~14_combout\,
	combout => \u_vga|Add4~19_combout\);

-- Location: LCCOMB_X35_Y12_N30
\u_vga|Add4~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~20_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & ((\u_vga|Add5~8_combout\))) # (!\u_spi_ee_config|oDATA_YH_xhdl2\(1) & (\u_vga|Add4~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datac => \u_vga|Add4~12_combout\,
	datad => \u_vga|Add5~8_combout\,
	combout => \u_vga|Add4~20_combout\);

-- Location: LCCOMB_X35_Y12_N0
\u_vga|Add4~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~21_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & (\u_vga|Add5~6_combout\)) # (!\u_spi_ee_config|oDATA_YH_xhdl2\(1) & ((\u_vga|Add4~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Add4~10_combout\,
	combout => \u_vga|Add4~21_combout\);

-- Location: LCCOMB_X35_Y12_N6
\u_vga|Add4~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~22_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & (\u_vga|Add5~4_combout\)) # (!\u_spi_ee_config|oDATA_YH_xhdl2\(1) & ((\u_vga|Add4~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datac => \u_vga|Add5~4_combout\,
	datad => \u_vga|Add4~8_combout\,
	combout => \u_vga|Add4~22_combout\);

-- Location: LCCOMB_X35_Y12_N8
\u_vga|Add4~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~23_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & (\u_vga|Add5~2_combout\)) # (!\u_spi_ee_config|oDATA_YH_xhdl2\(1) & ((\u_vga|Add4~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|Add4~6_combout\,
	combout => \u_vga|Add4~23_combout\);

-- Location: LCCOMB_X35_Y12_N28
\u_vga|Add4~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~24_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & ((\u_vga|Add5~0_combout\))) # (!\u_spi_ee_config|oDATA_YH_xhdl2\(1) & (\u_vga|Add4~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datac => \u_vga|Add4~4_combout\,
	datad => \u_vga|Add5~0_combout\,
	combout => \u_vga|Add4~24_combout\);

-- Location: LCCOMB_X35_Y12_N2
\u_vga|Add4~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~25_combout\ = (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\)) # (!\u_spi_ee_config|oDATA_YH_xhdl2\(1) & ((\u_vga|Add4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	datac => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => \u_vga|Add4~2_combout\,
	combout => \u_vga|Add4~25_combout\);

-- Location: LCCOMB_X37_Y12_N6
\u_vga|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~1_cout\ = CARRY((!\u_vga|h_cnt\(0) & \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	datad => VCC,
	cout => \u_vga|LessThan3~1_cout\);

-- Location: LCCOMB_X37_Y12_N8
\u_vga|LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~3_cout\ = CARRY((\u_vga|h_cnt\(1) & ((!\u_vga|LessThan3~1_cout\) # (!\u_vga|Add4~25_combout\))) # (!\u_vga|h_cnt\(1) & (!\u_vga|Add4~25_combout\ & !\u_vga|LessThan3~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|Add4~25_combout\,
	datad => VCC,
	cin => \u_vga|LessThan3~1_cout\,
	cout => \u_vga|LessThan3~3_cout\);

-- Location: LCCOMB_X37_Y12_N10
\u_vga|LessThan3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~5_cout\ = CARRY((\u_vga|Add4~24_combout\ & ((!\u_vga|LessThan3~3_cout\) # (!\u_vga|h_cnt\(2)))) # (!\u_vga|Add4~24_combout\ & (!\u_vga|h_cnt\(2) & !\u_vga|LessThan3~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~24_combout\,
	datab => \u_vga|h_cnt\(2),
	datad => VCC,
	cin => \u_vga|LessThan3~3_cout\,
	cout => \u_vga|LessThan3~5_cout\);

-- Location: LCCOMB_X37_Y12_N12
\u_vga|LessThan3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~7_cout\ = CARRY((\u_vga|h_cnt\(3) & ((!\u_vga|LessThan3~5_cout\) # (!\u_vga|Add4~23_combout\))) # (!\u_vga|h_cnt\(3) & (!\u_vga|Add4~23_combout\ & !\u_vga|LessThan3~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|Add4~23_combout\,
	datad => VCC,
	cin => \u_vga|LessThan3~5_cout\,
	cout => \u_vga|LessThan3~7_cout\);

-- Location: LCCOMB_X37_Y12_N14
\u_vga|LessThan3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~9_cout\ = CARRY((\u_vga|Add4~22_combout\ & ((!\u_vga|LessThan3~7_cout\) # (!\u_vga|h_cnt\(4)))) # (!\u_vga|Add4~22_combout\ & (!\u_vga|h_cnt\(4) & !\u_vga|LessThan3~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~22_combout\,
	datab => \u_vga|h_cnt\(4),
	datad => VCC,
	cin => \u_vga|LessThan3~7_cout\,
	cout => \u_vga|LessThan3~9_cout\);

-- Location: LCCOMB_X37_Y12_N16
\u_vga|LessThan3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~11_cout\ = CARRY((\u_vga|Add4~21_combout\ & (\u_vga|h_cnt\(5) & !\u_vga|LessThan3~9_cout\)) # (!\u_vga|Add4~21_combout\ & ((\u_vga|h_cnt\(5)) # (!\u_vga|LessThan3~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~21_combout\,
	datab => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|LessThan3~9_cout\,
	cout => \u_vga|LessThan3~11_cout\);

-- Location: LCCOMB_X37_Y12_N18
\u_vga|LessThan3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~13_cout\ = CARRY((\u_vga|Add4~20_combout\ & ((!\u_vga|LessThan3~11_cout\) # (!\u_vga|h_cnt\(6)))) # (!\u_vga|Add4~20_combout\ & (!\u_vga|h_cnt\(6) & !\u_vga|LessThan3~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~20_combout\,
	datab => \u_vga|h_cnt\(6),
	datad => VCC,
	cin => \u_vga|LessThan3~11_cout\,
	cout => \u_vga|LessThan3~13_cout\);

-- Location: LCCOMB_X37_Y12_N20
\u_vga|LessThan3~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~15_cout\ = CARRY((\u_vga|Add4~19_combout\ & (\u_vga|h_cnt\(7) & !\u_vga|LessThan3~13_cout\)) # (!\u_vga|Add4~19_combout\ & ((\u_vga|h_cnt\(7)) # (!\u_vga|LessThan3~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~19_combout\,
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|LessThan3~13_cout\,
	cout => \u_vga|LessThan3~15_cout\);

-- Location: LCCOMB_X37_Y12_N22
\u_vga|LessThan3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~17_cout\ = CARRY((\u_vga|h_cnt\(8) & (\u_vga|Add4~18_combout\ & !\u_vga|LessThan3~15_cout\)) # (!\u_vga|h_cnt\(8) & ((\u_vga|Add4~18_combout\) # (!\u_vga|LessThan3~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|Add4~18_combout\,
	datad => VCC,
	cin => \u_vga|LessThan3~15_cout\,
	cout => \u_vga|LessThan3~17_cout\);

-- Location: LCCOMB_X37_Y12_N24
\u_vga|LessThan3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~18_combout\ = (\u_vga|left_bound[9]~0_combout\ & ((\u_vga|LessThan3~17_cout\) # (!\u_vga|h_cnt\(9)))) # (!\u_vga|left_bound[9]~0_combout\ & (\u_vga|LessThan3~17_cout\ & !\u_vga|h_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|left_bound[9]~0_combout\,
	datad => \u_vga|h_cnt\(9),
	cin => \u_vga|LessThan3~17_cout\,
	combout => \u_vga|LessThan3~18_combout\);

-- Location: LCCOMB_X36_Y8_N20
\u_vga|vga_gen~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~0_combout\ = (\u_vga|v_cnt\(9)) # (((\u_vga|v_cnt\(6)) # (\u_vga|v_cnt\(8))) # (!\u_vga|v_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(6),
	datad => \u_vga|v_cnt\(8),
	combout => \u_vga|vga_gen~0_combout\);

-- Location: LCCOMB_X36_Y12_N20
\u_vga|Add6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add6~0_combout\ = (\u_vga|Add4~23_combout\ & (\u_vga|Add4~22_combout\ $ (VCC))) # (!\u_vga|Add4~23_combout\ & (\u_vga|Add4~22_combout\ & VCC))
-- \u_vga|Add6~1\ = CARRY((\u_vga|Add4~23_combout\ & \u_vga|Add4~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~23_combout\,
	datab => \u_vga|Add4~22_combout\,
	datad => VCC,
	combout => \u_vga|Add6~0_combout\,
	cout => \u_vga|Add6~1\);

-- Location: LCCOMB_X36_Y12_N22
\u_vga|Add6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add6~2_combout\ = (\u_vga|Add4~21_combout\ & (\u_vga|Add6~1\ & VCC)) # (!\u_vga|Add4~21_combout\ & (!\u_vga|Add6~1\))
-- \u_vga|Add6~3\ = CARRY((!\u_vga|Add4~21_combout\ & !\u_vga|Add6~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~21_combout\,
	datad => VCC,
	cin => \u_vga|Add6~1\,
	combout => \u_vga|Add6~2_combout\,
	cout => \u_vga|Add6~3\);

-- Location: LCCOMB_X36_Y12_N24
\u_vga|Add6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add6~4_combout\ = (\u_vga|Add4~20_combout\ & (\u_vga|Add6~3\ $ (GND))) # (!\u_vga|Add4~20_combout\ & (!\u_vga|Add6~3\ & VCC))
-- \u_vga|Add6~5\ = CARRY((\u_vga|Add4~20_combout\ & !\u_vga|Add6~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add4~20_combout\,
	datad => VCC,
	cin => \u_vga|Add6~3\,
	combout => \u_vga|Add6~4_combout\,
	cout => \u_vga|Add6~5\);

-- Location: LCCOMB_X36_Y12_N26
\u_vga|Add6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add6~6_combout\ = (\u_vga|Add4~19_combout\ & (!\u_vga|Add6~5\)) # (!\u_vga|Add4~19_combout\ & ((\u_vga|Add6~5\) # (GND)))
-- \u_vga|Add6~7\ = CARRY((!\u_vga|Add6~5\) # (!\u_vga|Add4~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add4~19_combout\,
	datad => VCC,
	cin => \u_vga|Add6~5\,
	combout => \u_vga|Add6~6_combout\,
	cout => \u_vga|Add6~7\);

-- Location: LCCOMB_X36_Y12_N28
\u_vga|Add6~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add6~8_combout\ = (\u_vga|Add4~18_combout\ & (\u_vga|Add6~7\ $ (GND))) # (!\u_vga|Add4~18_combout\ & (!\u_vga|Add6~7\ & VCC))
-- \u_vga|Add6~9\ = CARRY((\u_vga|Add4~18_combout\ & !\u_vga|Add6~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~18_combout\,
	datad => VCC,
	cin => \u_vga|Add6~7\,
	combout => \u_vga|Add6~8_combout\,
	cout => \u_vga|Add6~9\);

-- Location: LCCOMB_X36_Y12_N30
\u_vga|Add6~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add6~10_combout\ = \u_vga|Add6~9\ $ (((\u_spi_ee_config|oDATA_YH_xhdl2\(1) & \u_vga|Add5~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => \u_vga|Add5~12_combout\,
	cin => \u_vga|Add6~9\,
	combout => \u_vga|Add6~10_combout\);

-- Location: LCCOMB_X36_Y12_N0
\u_vga|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~1_cout\ = CARRY((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ & \u_vga|h_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	datab => \u_vga|h_cnt\(0),
	datad => VCC,
	cout => \u_vga|LessThan4~1_cout\);

-- Location: LCCOMB_X36_Y12_N2
\u_vga|LessThan4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~3_cout\ = CARRY((\u_vga|h_cnt\(1) & (\u_vga|Add4~25_combout\ & !\u_vga|LessThan4~1_cout\)) # (!\u_vga|h_cnt\(1) & ((\u_vga|Add4~25_combout\) # (!\u_vga|LessThan4~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|Add4~25_combout\,
	datad => VCC,
	cin => \u_vga|LessThan4~1_cout\,
	cout => \u_vga|LessThan4~3_cout\);

-- Location: LCCOMB_X36_Y12_N4
\u_vga|LessThan4~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~5_cout\ = CARRY((\u_vga|h_cnt\(2) & ((!\u_vga|LessThan4~3_cout\) # (!\u_vga|Add4~24_combout\))) # (!\u_vga|h_cnt\(2) & (!\u_vga|Add4~24_combout\ & !\u_vga|LessThan4~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|Add4~24_combout\,
	datad => VCC,
	cin => \u_vga|LessThan4~3_cout\,
	cout => \u_vga|LessThan4~5_cout\);

-- Location: LCCOMB_X36_Y12_N6
\u_vga|LessThan4~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~7_cout\ = CARRY((\u_vga|Add4~23_combout\ & (!\u_vga|h_cnt\(3) & !\u_vga|LessThan4~5_cout\)) # (!\u_vga|Add4~23_combout\ & ((!\u_vga|LessThan4~5_cout\) # (!\u_vga|h_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~23_combout\,
	datab => \u_vga|h_cnt\(3),
	datad => VCC,
	cin => \u_vga|LessThan4~5_cout\,
	cout => \u_vga|LessThan4~7_cout\);

-- Location: LCCOMB_X36_Y12_N8
\u_vga|LessThan4~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~9_cout\ = CARRY((\u_vga|h_cnt\(4) & ((!\u_vga|LessThan4~7_cout\) # (!\u_vga|Add6~0_combout\))) # (!\u_vga|h_cnt\(4) & (!\u_vga|Add6~0_combout\ & !\u_vga|LessThan4~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|Add6~0_combout\,
	datad => VCC,
	cin => \u_vga|LessThan4~7_cout\,
	cout => \u_vga|LessThan4~9_cout\);

-- Location: LCCOMB_X36_Y12_N10
\u_vga|LessThan4~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~11_cout\ = CARRY((\u_vga|Add6~2_combout\ & ((!\u_vga|LessThan4~9_cout\) # (!\u_vga|h_cnt\(5)))) # (!\u_vga|Add6~2_combout\ & (!\u_vga|h_cnt\(5) & !\u_vga|LessThan4~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add6~2_combout\,
	datab => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|LessThan4~9_cout\,
	cout => \u_vga|LessThan4~11_cout\);

-- Location: LCCOMB_X36_Y12_N12
\u_vga|LessThan4~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~13_cout\ = CARRY((\u_vga|h_cnt\(6) & ((!\u_vga|LessThan4~11_cout\) # (!\u_vga|Add6~4_combout\))) # (!\u_vga|h_cnt\(6) & (!\u_vga|Add6~4_combout\ & !\u_vga|LessThan4~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|Add6~4_combout\,
	datad => VCC,
	cin => \u_vga|LessThan4~11_cout\,
	cout => \u_vga|LessThan4~13_cout\);

-- Location: LCCOMB_X36_Y12_N14
\u_vga|LessThan4~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~15_cout\ = CARRY((\u_vga|Add6~6_combout\ & ((!\u_vga|LessThan4~13_cout\) # (!\u_vga|h_cnt\(7)))) # (!\u_vga|Add6~6_combout\ & (!\u_vga|h_cnt\(7) & !\u_vga|LessThan4~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add6~6_combout\,
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|LessThan4~13_cout\,
	cout => \u_vga|LessThan4~15_cout\);

-- Location: LCCOMB_X36_Y12_N16
\u_vga|LessThan4~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~17_cout\ = CARRY((\u_vga|h_cnt\(8) & ((!\u_vga|LessThan4~15_cout\) # (!\u_vga|Add6~8_combout\))) # (!\u_vga|h_cnt\(8) & (!\u_vga|Add6~8_combout\ & !\u_vga|LessThan4~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|Add6~8_combout\,
	datad => VCC,
	cin => \u_vga|LessThan4~15_cout\,
	cout => \u_vga|LessThan4~17_cout\);

-- Location: LCCOMB_X36_Y12_N18
\u_vga|LessThan4~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~18_combout\ = (\u_vga|Add6~10_combout\ & (\u_vga|h_cnt\(9) & \u_vga|LessThan4~17_cout\)) # (!\u_vga|Add6~10_combout\ & ((\u_vga|h_cnt\(9)) # (\u_vga|LessThan4~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add6~10_combout\,
	datab => \u_vga|h_cnt\(9),
	cin => \u_vga|LessThan4~17_cout\,
	combout => \u_vga|LessThan4~18_combout\);

-- Location: LCCOMB_X37_Y12_N28
\u_vga|red_signal~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~1_combout\ = (!\u_vga|red_signal~0_combout\ & (!\u_vga|LessThan3~18_combout\ & (!\u_vga|vga_gen~0_combout\ & !\u_vga|LessThan4~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~0_combout\,
	datab => \u_vga|LessThan3~18_combout\,
	datac => \u_vga|vga_gen~0_combout\,
	datad => \u_vga|LessThan4~18_combout\,
	combout => \u_vga|red_signal~1_combout\);

-- Location: FF_X37_Y12_N29
\u_vga|red_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|red_signal~1_combout\,
	ena => \u_vga|LessThan14~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|red_signal~q\);

-- Location: LCCOMB_X37_Y9_N24
\u_vga|out_red~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_red~0_combout\ = (\u_vga|video_en~q\ & \u_vga|red_signal~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|video_en~q\,
	datad => \u_vga|red_signal~q\,
	combout => \u_vga|out_red~0_combout\);

-- Location: FF_X37_Y9_N25
\u_vga|out_red\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|out_red~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|out_red~q\);

-- Location: LCCOMB_X36_Y8_N4
\u_vga|green_signal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~0_combout\ = ((\u_vga|h_cnt\(10)) # ((\u_vga|v_cnt\(10)) # (\u_vga|vga_gen~0_combout\))) # (!\u_vga|vga_gen~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~2_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|vga_gen~0_combout\,
	combout => \u_vga|green_signal~0_combout\);

-- Location: LCCOMB_X37_Y12_N26
\u_vga|green_signal~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~1_combout\ = (\u_vga|vga_gen~4_combout\ & ((\u_vga|green_signal~0_combout\) # ((\u_vga|LessThan3~18_combout\) # (\u_vga|LessThan4~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|green_signal~0_combout\,
	datab => \u_vga|LessThan3~18_combout\,
	datac => \u_vga|vga_gen~4_combout\,
	datad => \u_vga|LessThan4~18_combout\,
	combout => \u_vga|green_signal~1_combout\);

-- Location: FF_X37_Y12_N27
\u_vga|green_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|green_signal~1_combout\,
	ena => \u_vga|LessThan14~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|green_signal~q\);

-- Location: LCCOMB_X37_Y9_N22
\u_vga|out_green~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_green~0_combout\ = (\u_vga|video_en~q\ & \u_vga|green_signal~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|video_en~q\,
	datac => \u_vga|green_signal~q\,
	combout => \u_vga|out_green~0_combout\);

-- Location: FF_X37_Y9_N23
\u_vga|out_green\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|out_green~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|out_green~q\);

-- Location: LCCOMB_X37_Y9_N0
\u_vga|out_blue~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_blue~0_combout\ = (\u_vga|video_en~q\ & !\u_vga|red_signal~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|video_en~q\,
	datad => \u_vga|red_signal~q\,
	combout => \u_vga|out_blue~0_combout\);

-- Location: FF_X37_Y9_N1
\u_vga|out_blue\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|out_blue~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|out_blue~q\);

-- Location: LCCOMB_X37_Y11_N4
\u_vga|vga_gen~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~5_combout\ = (\u_vga|h_cnt\(9) & (!\u_vga|h_cnt\(10) & \u_vga|h_cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datac => \u_vga|h_cnt\(10),
	datad => \u_vga|h_cnt\(8),
	combout => \u_vga|vga_gen~5_combout\);

-- Location: LCCOMB_X36_Y11_N4
\u_vga|vga_gen~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~6_combout\ = (!\u_vga|h_cnt\(3) & (((!\u_vga|h_cnt\(0)) # (!\u_vga|h_cnt\(1))) # (!\u_vga|h_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|h_cnt\(0),
	combout => \u_vga|vga_gen~6_combout\);

-- Location: LCCOMB_X36_Y11_N0
\u_vga|vga_gen~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~7_combout\ = (\u_vga|h_cnt\(5)) # ((\u_vga|h_cnt\(4) & ((\u_vga|h_cnt\(7)) # (!\u_vga|vga_gen~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|h_cnt\(7),
	datac => \u_vga|vga_gen~6_combout\,
	datad => \u_vga|h_cnt\(5),
	combout => \u_vga|vga_gen~7_combout\);

-- Location: LCCOMB_X36_Y11_N30
\u_vga|vga_gen~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~8_combout\ = (\u_vga|h_cnt\(7) $ (((!\u_vga|vga_gen~7_combout\) # (!\u_vga|h_cnt\(6))))) # (!\u_vga|vga_gen~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~5_combout\,
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|vga_gen~7_combout\,
	datad => \u_vga|h_cnt\(7),
	combout => \u_vga|vga_gen~8_combout\);

-- Location: FF_X36_Y11_N31
\u_vga|h_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|vga_gen~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_sync~q\);

-- Location: FF_X36_Y11_N29
\u_vga|out_h_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|h_sync~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|out_h_sync~q\);

-- Location: LCCOMB_X35_Y9_N30
\u_vga|vga_gen~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~12_combout\ = (\u_vga|v_cnt\(8)) # ((\u_vga|v_cnt\(2) & (\u_vga|v_cnt\(7))) # (!\u_vga|v_cnt\(2) & ((\u_vga|v_cnt\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datab => \u_vga|v_cnt\(8),
	datac => \u_vga|v_cnt\(2),
	datad => \u_vga|v_cnt\(6),
	combout => \u_vga|vga_gen~12_combout\);

-- Location: LCCOMB_X36_Y9_N6
\u_vga|vga_gen~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~10_combout\ = (\u_vga|v_cnt\(4)) # ((\u_vga|v_cnt\(3)) # ((\u_vga|v_cnt\(1) & \u_vga|v_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(3),
	datad => \u_vga|v_cnt\(0),
	combout => \u_vga|vga_gen~10_combout\);

-- Location: LCCOMB_X36_Y8_N10
\u_vga|vga_gen~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~9_combout\ = (!\u_vga|v_cnt\(7) & (((!\u_vga|v_cnt\(4)) # (!\u_vga|v_cnt\(3))) # (!\u_vga|v_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(3),
	datad => \u_vga|v_cnt\(4),
	combout => \u_vga|vga_gen~9_combout\);

-- Location: LCCOMB_X36_Y8_N12
\u_vga|vga_gen~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~11_combout\ = (\u_vga|vga_gen~9_combout\) # ((!\u_vga|v_cnt\(6) & ((\u_vga|vga_gen~10_combout\) # (\u_vga|v_cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|vga_gen~10_combout\,
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|vga_gen~9_combout\,
	combout => \u_vga|vga_gen~11_combout\);

-- Location: LCCOMB_X35_Y8_N18
\u_vga|vga_gen~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~13_combout\ = (\u_vga|vga_gen~12_combout\) # ((\u_vga|v_cnt\(10)) # ((\u_vga|vga_gen~11_combout\) # (!\u_vga|v_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~12_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|vga_gen~11_combout\,
	datad => \u_vga|v_cnt\(9),
	combout => \u_vga|vga_gen~13_combout\);

-- Location: FF_X35_Y8_N19
\u_vga|v_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|vga_gen~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_sync~q\);

-- Location: LCCOMB_X35_Y8_N24
\u_vga|out_v_sync~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_v_sync~feeder_combout\ = \u_vga|v_sync~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|v_sync~q\,
	combout => \u_vga|out_v_sync~feeder_combout\);

-- Location: FF_X35_Y8_N25
\u_vga|out_v_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|out_v_sync~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|out_v_sync~q\);

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


