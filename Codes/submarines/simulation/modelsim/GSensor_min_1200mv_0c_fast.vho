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

-- DATE "04/20/2015 19:31:26"

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
	I2C_SDAT : BUFFER std_logic;
	I2C_SCLK : BUFFER std_logic;
	G_SENSOR_CS_N : BUFFER std_logic;
	out_red : BUFFER std_logic;
	out_green : BUFFER std_logic;
	out_blue : BUFFER std_logic;
	out_h_sync : BUFFER std_logic;
	out_v_sync : BUFFER std_logic
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
-- G_SENSOR_INT	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
SIGNAL ww_I2C_SDAT : std_logic;
SIGNAL ww_I2C_SCLK : std_logic;
SIGNAL ww_G_SENSOR_CS_N : std_logic;
SIGNAL ww_out_red : std_logic;
SIGNAL ww_out_green : std_logic;
SIGNAL ww_out_blue : std_logic;
SIGNAL ww_out_h_sync : std_logic;
SIGNAL ww_out_v_sync : std_logic;
SIGNAL \u_spipll|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_spipll|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_vga|v_sync~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
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
SIGNAL \u_spi_ee_config|high_byte~0_combout\ : std_logic;
SIGNAL \I2C_SDAT~input_o\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[0]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[15]~8_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[3]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~q\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~13_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~q\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~q\ : std_logic;
SIGNAL \G_SENSOR_INT~input_o\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~q\ : std_logic;
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
SIGNAL \u_spi_ee_config|spi_go~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[15]~12_combout\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~q\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count_en~q\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Add0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[0]~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[2]~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|LessThan0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[1]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[1]~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[3]~4_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~7_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux7~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[6]~6_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux6~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux5~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~7_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux11~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux10~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~4_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux4~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~10_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte_d~q\ : std_logic;
SIGNAL \u_spi_ee_config|read_back_d~q\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[7]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|direction~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|direction~q\ : std_logic;
SIGNAL \u_spi_ee_config|Mux3~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~11_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~5_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux8~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux9~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux2~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~9_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~14_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~6_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~8_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\ : std_logic;
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oSPI_CLK~0_combout\ : std_logic;
SIGNAL \u_vga|Add19~0_combout\ : std_logic;
SIGNAL \u_vga|Add19~1\ : std_logic;
SIGNAL \u_vga|Add19~2_combout\ : std_logic;
SIGNAL \u_vga|Add19~3\ : std_logic;
SIGNAL \u_vga|Add19~4_combout\ : std_logic;
SIGNAL \u_vga|Add19~5\ : std_logic;
SIGNAL \u_vga|Add19~6_combout\ : std_logic;
SIGNAL \u_vga|Add19~7\ : std_logic;
SIGNAL \u_vga|Add19~8_combout\ : std_logic;
SIGNAL \u_vga|Add19~9\ : std_logic;
SIGNAL \u_vga|Add19~10_combout\ : std_logic;
SIGNAL \u_vga|Add19~11\ : std_logic;
SIGNAL \u_vga|Add19~12_combout\ : std_logic;
SIGNAL \u_vga|Add19~13\ : std_logic;
SIGNAL \u_vga|Add19~14_combout\ : std_logic;
SIGNAL \u_vga|Add19~15\ : std_logic;
SIGNAL \u_vga|Add19~16_combout\ : std_logic;
SIGNAL \u_vga|Add19~17\ : std_logic;
SIGNAL \u_vga|Add19~18_combout\ : std_logic;
SIGNAL \u_vga|Add19~19\ : std_logic;
SIGNAL \u_vga|Add19~20_combout\ : std_logic;
SIGNAL \u_vga|h_cnt~1_combout\ : std_logic;
SIGNAL \u_vga|LessThan23~2_combout\ : std_logic;
SIGNAL \u_vga|LessThan23~0_combout\ : std_logic;
SIGNAL \u_vga|Equal14~0_combout\ : std_logic;
SIGNAL \u_vga|h_cnt~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan23~1_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~47_combout\ : std_logic;
SIGNAL \u_vga|Add20~0_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~11_combout\ : std_logic;
SIGNAL \u_vga|Add20~1\ : std_logic;
SIGNAL \u_vga|Add20~2_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~9_combout\ : std_logic;
SIGNAL \u_vga|Add20~3\ : std_logic;
SIGNAL \u_vga|Add20~4_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~8_combout\ : std_logic;
SIGNAL \u_vga|Add20~5\ : std_logic;
SIGNAL \u_vga|Add20~6_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~7_combout\ : std_logic;
SIGNAL \u_vga|Add20~7\ : std_logic;
SIGNAL \u_vga|Add20~8_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~6_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~0_combout\ : std_logic;
SIGNAL \u_vga|Add20~9\ : std_logic;
SIGNAL \u_vga|Add20~11\ : std_logic;
SIGNAL \u_vga|Add20~12_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~5_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~32_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~48_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~50_combout\ : std_logic;
SIGNAL \u_vga|Add20~13\ : std_logic;
SIGNAL \u_vga|Add20~14_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~4_combout\ : std_logic;
SIGNAL \u_vga|Add20~15\ : std_logic;
SIGNAL \u_vga|Add20~16_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~3_combout\ : std_logic;
SIGNAL \u_vga|Add20~17\ : std_logic;
SIGNAL \u_vga|Add20~18_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[9]~2_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~49_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[7]~0_combout\ : std_logic;
SIGNAL \u_vga|Add20~19\ : std_logic;
SIGNAL \u_vga|Add20~20_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[10]~1_combout\ : std_logic;
SIGNAL \u_vga|Add20~10_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~10_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~7_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~6_combout\ : std_logic;
SIGNAL \u_vga|Mux2~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan17~0_combout\ : std_logic;
SIGNAL \u_vga|Equal7~0_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~4_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~5_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~8_combout\ : std_logic;
SIGNAL \u_vga|Equal8~0_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~9_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~10_combout\ : std_logic;
SIGNAL \u_vga|red_signal~2_combout\ : std_logic;
SIGNAL \u_vga|LessThan26~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan4~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan4~1_combout\ : std_logic;
SIGNAL \u_vga|red_signal~6_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~45_combout\ : std_logic;
SIGNAL \u_vga|Equal7~1_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~43_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~44_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~1_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~46_combout\ : std_logic;
SIGNAL \u_vga|v_sync~q\ : std_logic;
SIGNAL \u_vga|v_sync~clkctrl_outclk\ : std_logic;
SIGNAL \u_vga|Add9~16_combout\ : std_logic;
SIGNAL \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[7]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[7]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[7]~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[6]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[5]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[4]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[2]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Add8~0_combout\ : std_logic;
SIGNAL \u_vga|Add8~2\ : std_logic;
SIGNAL \u_vga|Add8~4\ : std_logic;
SIGNAL \u_vga|Add8~6\ : std_logic;
SIGNAL \u_vga|Add8~8\ : std_logic;
SIGNAL \u_vga|Add8~10\ : std_logic;
SIGNAL \u_vga|Add8~12\ : std_logic;
SIGNAL \u_vga|Add8~14\ : std_logic;
SIGNAL \u_vga|Add8~16\ : std_logic;
SIGNAL \u_vga|Add8~17_combout\ : std_logic;
SIGNAL \u_vga|Add8~15_combout\ : std_logic;
SIGNAL \u_vga|Add8~13_combout\ : std_logic;
SIGNAL \u_vga|Add8~11_combout\ : std_logic;
SIGNAL \u_vga|Add8~9_combout\ : std_logic;
SIGNAL \u_vga|Add8~7_combout\ : std_logic;
SIGNAL \u_vga|Add8~5_combout\ : std_logic;
SIGNAL \u_vga|Add8~3_combout\ : std_logic;
SIGNAL \u_vga|Add9~0_combout\ : std_logic;
SIGNAL \u_vga|Add8~1_combout\ : std_logic;
SIGNAL \u_vga|Add10~1_cout\ : std_logic;
SIGNAL \u_vga|Add10~3_cout\ : std_logic;
SIGNAL \u_vga|Add10~4_combout\ : std_logic;
SIGNAL \u_vga|Add9~1\ : std_logic;
SIGNAL \u_vga|Add9~2_combout\ : std_logic;
SIGNAL \u_vga|Add10~5\ : std_logic;
SIGNAL \u_vga|Add10~6_combout\ : std_logic;
SIGNAL \u_vga|Add9~3\ : std_logic;
SIGNAL \u_vga|Add9~4_combout\ : std_logic;
SIGNAL \u_vga|Add10~7\ : std_logic;
SIGNAL \u_vga|Add10~8_combout\ : std_logic;
SIGNAL \u_vga|Add9~5\ : std_logic;
SIGNAL \u_vga|Add9~6_combout\ : std_logic;
SIGNAL \u_vga|Add10~9\ : std_logic;
SIGNAL \u_vga|Add10~10_combout\ : std_logic;
SIGNAL \u_vga|Add9~7\ : std_logic;
SIGNAL \u_vga|Add9~8_combout\ : std_logic;
SIGNAL \u_vga|Add10~11\ : std_logic;
SIGNAL \u_vga|Add10~12_combout\ : std_logic;
SIGNAL \u_vga|Add9~9\ : std_logic;
SIGNAL \u_vga|Add9~10_combout\ : std_logic;
SIGNAL \u_vga|Add10~13\ : std_logic;
SIGNAL \u_vga|Add10~14_combout\ : std_logic;
SIGNAL \u_vga|Add9~11\ : std_logic;
SIGNAL \u_vga|Add9~12_combout\ : std_logic;
SIGNAL \u_vga|Add10~15\ : std_logic;
SIGNAL \u_vga|Add10~16_combout\ : std_logic;
SIGNAL \u_vga|Add9~13\ : std_logic;
SIGNAL \u_vga|Add9~14_combout\ : std_logic;
SIGNAL \u_vga|Add10~17\ : std_logic;
SIGNAL \u_vga|Add10~18_combout\ : std_logic;
SIGNAL \u_vga|Add9~15\ : std_logic;
SIGNAL \u_vga|Add9~17\ : std_logic;
SIGNAL \u_vga|Add9~18_combout\ : std_logic;
SIGNAL \u_vga|Add10~19\ : std_logic;
SIGNAL \u_vga|Add10~20_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][12]~0_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][11]~combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][10]~1_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][9]~2_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][12]~4_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][8]~3_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][7]~5_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][11]~combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][6]~6_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][10]~7_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][9]~9_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][5]~8_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][8]~11_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][4]~10_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][7]~13_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][3]~12_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][6]~14_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~13\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ : std_logic;
SIGNAL \u_vga|left_boat[0]~11\ : std_logic;
SIGNAL \u_vga|left_boat[1]~13\ : std_logic;
SIGNAL \u_vga|left_boat[2]~15\ : std_logic;
SIGNAL \u_vga|left_boat[3]~17\ : std_logic;
SIGNAL \u_vga|left_boat[4]~19\ : std_logic;
SIGNAL \u_vga|left_boat[5]~21\ : std_logic;
SIGNAL \u_vga|left_boat[6]~23\ : std_logic;
SIGNAL \u_vga|left_boat[7]~25\ : std_logic;
SIGNAL \u_vga|left_boat[8]~27\ : std_logic;
SIGNAL \u_vga|left_boat[9]~28_combout\ : std_logic;
SIGNAL \u_vga|Add12~1\ : std_logic;
SIGNAL \u_vga|Add12~3\ : std_logic;
SIGNAL \u_vga|Add12~5\ : std_logic;
SIGNAL \u_vga|Add12~7\ : std_logic;
SIGNAL \u_vga|Add12~9\ : std_logic;
SIGNAL \u_vga|Add12~11\ : std_logic;
SIGNAL \u_vga|Add12~13\ : std_logic;
SIGNAL \u_vga|Add12~14_combout\ : std_logic;
SIGNAL \u_vga|left_boat[8]~26_combout\ : std_logic;
SIGNAL \u_vga|Add12~12_combout\ : std_logic;
SIGNAL \u_vga|left_boat[7]~24_combout\ : std_logic;
SIGNAL \u_vga|Add12~10_combout\ : std_logic;
SIGNAL \u_vga|left_boat[6]~22_combout\ : std_logic;
SIGNAL \u_vga|Add12~8_combout\ : std_logic;
SIGNAL \u_vga|left_boat[5]~20_combout\ : std_logic;
SIGNAL \u_vga|Add12~6_combout\ : std_logic;
SIGNAL \u_vga|left_boat[4]~18_combout\ : std_logic;
SIGNAL \u_vga|Add12~4_combout\ : std_logic;
SIGNAL \u_vga|left_boat[3]~16_combout\ : std_logic;
SIGNAL \u_vga|Add12~2_combout\ : std_logic;
SIGNAL \u_vga|left_boat[2]~14_combout\ : std_logic;
SIGNAL \u_vga|Add12~0_combout\ : std_logic;
SIGNAL \u_vga|left_boat[1]~12_combout\ : std_logic;
SIGNAL \u_vga|left_boat[0]~10_combout\ : std_logic;
SIGNAL \u_vga|LessThan7~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan7~18_combout\ : std_logic;
SIGNAL \u_vga|right_boat[4]~7\ : std_logic;
SIGNAL \u_vga|right_boat[5]~9\ : std_logic;
SIGNAL \u_vga|right_boat[6]~11\ : std_logic;
SIGNAL \u_vga|right_boat[7]~13\ : std_logic;
SIGNAL \u_vga|right_boat[8]~15\ : std_logic;
SIGNAL \u_vga|right_boat[9]~16_combout\ : std_logic;
SIGNAL \u_vga|right_boat[8]~14_combout\ : std_logic;
SIGNAL \u_vga|right_boat[7]~12_combout\ : std_logic;
SIGNAL \u_vga|right_boat[6]~10_combout\ : std_logic;
SIGNAL \u_vga|right_boat[5]~8_combout\ : std_logic;
SIGNAL \u_vga|right_boat[4]~6_combout\ : std_logic;
SIGNAL \u_vga|right_boat[3]~18_combout\ : std_logic;
SIGNAL \u_vga|LessThan8~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan8~18_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~33_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~34_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~35_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~36_combout\ : std_logic;
SIGNAL \u_vga|LessThan3~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan3~1_combout\ : std_logic;
SIGNAL \u_vga|LessThan3~2_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~37_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~38_combout\ : std_logic;
SIGNAL \u_vga|Equal7~3_combout\ : std_logic;
SIGNAL \u_vga|Equal7~2_combout\ : std_logic;
SIGNAL \u_vga|Equal7~4_combout\ : std_logic;
SIGNAL \u_vga|red_signal~7_combout\ : std_logic;
SIGNAL \u_vga|red_signal~8_combout\ : std_logic;
SIGNAL \u_vga|LessThan1~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan1~1_combout\ : std_logic;
SIGNAL \u_vga|Add5~1\ : std_logic;
SIGNAL \u_vga|Add5~3\ : std_logic;
SIGNAL \u_vga|Add5~4_combout\ : std_logic;
SIGNAL \u_vga|Add5~0_combout\ : std_logic;
SIGNAL \u_vga|Add5~2_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~0_combout\ : std_logic;
SIGNAL \u_vga|Add5~5\ : std_logic;
SIGNAL \u_vga|Add5~7\ : std_logic;
SIGNAL \u_vga|Add5~8_combout\ : std_logic;
SIGNAL \u_vga|Add5~6_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[0]~7_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~4_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~2_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~39_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~3_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~5_combout\ : std_logic;
SIGNAL \u_vga|Equal4~0_combout\ : std_logic;
SIGNAL \u_vga|Equal4~1_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[1]~11_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[10]~0_combout\ : std_logic;
SIGNAL \u_vga|read_sub~0_combout\ : std_logic;
SIGNAL \u_vga|read_sub~q\ : std_logic;
SIGNAL \u_vga|current_submarine[1]~6_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[1]~12_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[0]~8\ : std_logic;
SIGNAL \u_vga|current_submarine[1]~9_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[1]~10\ : std_logic;
SIGNAL \u_vga|current_submarine[2]~13_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[2]~14\ : std_logic;
SIGNAL \u_vga|current_submarine[3]~15_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[3]~16\ : std_logic;
SIGNAL \u_vga|current_submarine[4]~17_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[4]~18\ : std_logic;
SIGNAL \u_vga|current_submarine[5]~19_combout\ : std_logic;
SIGNAL \u_vga|submarines[48]~49_combout\ : std_logic;
SIGNAL \u_vga|Mux0~31_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~12_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~5_combout\ : std_logic;
SIGNAL \u_vga|submarines[40]~22_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~6_combout\ : std_logic;
SIGNAL \u_vga|submarines[42]~30_combout\ : std_logic;
SIGNAL \u_vga|Mux0~2_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~13_combout\ : std_logic;
SIGNAL \u_vga|submarines[41]~20_combout\ : std_logic;
SIGNAL \u_vga|submarines[43]~28_combout\ : std_logic;
SIGNAL \u_vga|Mux0~3_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~14_combout\ : std_logic;
SIGNAL \u_vga|submarines[33]~25_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~4_combout\ : std_logic;
SIGNAL \u_vga|submarines[35]~17_combout\ : std_logic;
SIGNAL \u_vga|submarines[32]~26_combout\ : std_logic;
SIGNAL \u_vga|submarines[34]~18_combout\ : std_logic;
SIGNAL \u_vga|Mux0~4_combout\ : std_logic;
SIGNAL \u_vga|Mux0~5_combout\ : std_logic;
SIGNAL \u_vga|Mux0~6_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~9_combout\ : std_logic;
SIGNAL \u_vga|submarines[38]~16_combout\ : std_logic;
SIGNAL \u_vga|submarines[39]~19_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~10_combout\ : std_logic;
SIGNAL \u_vga|submarines[37]~27_combout\ : std_logic;
SIGNAL \u_vga|submarines[36]~24_combout\ : std_logic;
SIGNAL \u_vga|Mux0~0_combout\ : std_logic;
SIGNAL \u_vga|Mux0~1_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~11_combout\ : std_logic;
SIGNAL \u_vga|submarines[47]~31_combout\ : std_logic;
SIGNAL \u_vga|submarines[46]~29_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~8_combout\ : std_logic;
SIGNAL \u_vga|submarines[45]~23_combout\ : std_logic;
SIGNAL \u_vga|submarines[44]~21_combout\ : std_logic;
SIGNAL \u_vga|Mux0~7_combout\ : std_logic;
SIGNAL \u_vga|Mux0~8_combout\ : std_logic;
SIGNAL \u_vga|Mux0~9_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~15_combout\ : std_logic;
SIGNAL \u_vga|submarines[12]~32_combout\ : std_logic;
SIGNAL \u_vga|submarines[14]~44_combout\ : std_logic;
SIGNAL \u_vga|Mux0~27_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~16_combout\ : std_logic;
SIGNAL \u_vga|submarines[13]~35_combout\ : std_logic;
SIGNAL \u_vga|submarines[15]~47_combout\ : std_logic;
SIGNAL \u_vga|Mux0~28_combout\ : std_logic;
SIGNAL \u_vga|submarines[10]~46_combout\ : std_logic;
SIGNAL \u_vga|submarines[9]~33_combout\ : std_logic;
SIGNAL \u_vga|submarines[8]~34_combout\ : std_logic;
SIGNAL \u_vga|Mux0~20_combout\ : std_logic;
SIGNAL \u_vga|submarines[11]~45_combout\ : std_logic;
SIGNAL \u_vga|Mux0~21_combout\ : std_logic;
SIGNAL \u_vga|submarines[2]~38_combout\ : std_logic;
SIGNAL \u_vga|submarines[1]~40_combout\ : std_logic;
SIGNAL \u_vga|submarines[0]~42_combout\ : std_logic;
SIGNAL \u_vga|Mux0~24_combout\ : std_logic;
SIGNAL \u_vga|submarines[3]~36_combout\ : std_logic;
SIGNAL \u_vga|Mux0~25_combout\ : std_logic;
SIGNAL \u_vga|submarines[6]~37_combout\ : std_logic;
SIGNAL \u_vga|submarines[4]~41_combout\ : std_logic;
SIGNAL \u_vga|Mux0~22_combout\ : std_logic;
SIGNAL \u_vga|submarines[7]~39_combout\ : std_logic;
SIGNAL \u_vga|submarines[5]~43_combout\ : std_logic;
SIGNAL \u_vga|Mux0~23_combout\ : std_logic;
SIGNAL \u_vga|Mux0~26_combout\ : std_logic;
SIGNAL \u_vga|Mux0~29_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~7_combout\ : std_logic;
SIGNAL \u_vga|submarines[30]~7_combout\ : std_logic;
SIGNAL \u_vga|submarines[18]~8_combout\ : std_logic;
SIGNAL \u_vga|submarines[26]~11_combout\ : std_logic;
SIGNAL \u_vga|Mux0~10_combout\ : std_logic;
SIGNAL \u_vga|submarines[22]~5_combout\ : std_logic;
SIGNAL \u_vga|Mux0~11_combout\ : std_logic;
SIGNAL \u_vga|submarines[16]~10_combout\ : std_logic;
SIGNAL \u_vga|submarines[24]~9_combout\ : std_logic;
SIGNAL \u_vga|Mux0~14_combout\ : std_logic;
SIGNAL \u_vga|submarines[20]~6_combout\ : std_logic;
SIGNAL \u_vga|submarines[28]~4_combout\ : std_logic;
SIGNAL \u_vga|Mux0~15_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~3_combout\ : std_logic;
SIGNAL \u_vga|submarines[17]~2_combout\ : std_logic;
SIGNAL \u_vga|submarines[21]~14_combout\ : std_logic;
SIGNAL \u_vga|Mux0~12_combout\ : std_logic;
SIGNAL \u_vga|submarines[29]~12_combout\ : std_logic;
SIGNAL \u_vga|submarines[25]~1_combout\ : std_logic;
SIGNAL \u_vga|Mux0~13_combout\ : std_logic;
SIGNAL \u_vga|Mux0~16_combout\ : std_logic;
SIGNAL \u_vga|submarines[31]~15_combout\ : std_logic;
SIGNAL \u_vga|submarines[19]~0_combout\ : std_logic;
SIGNAL \u_vga|submarines[23]~13_combout\ : std_logic;
SIGNAL \u_vga|Mux0~17_combout\ : std_logic;
SIGNAL \u_vga|submarines[27]~3_combout\ : std_logic;
SIGNAL \u_vga|Mux0~18_combout\ : std_logic;
SIGNAL \u_vga|Mux0~19_combout\ : std_logic;
SIGNAL \u_vga|Mux0~30_combout\ : std_logic;
SIGNAL \u_vga|Mux0~32_combout\ : std_logic;
SIGNAL \u_vga|update_submarines~0_combout\ : std_logic;
SIGNAL \u_vga|update_submarines~1_combout\ : std_logic;
SIGNAL \u_vga|update_submarines~q\ : std_logic;
SIGNAL \u_vga|Mux1~31_combout\ : std_logic;
SIGNAL \u_vga|Mux1~12_combout\ : std_logic;
SIGNAL \u_vga|Mux1~13_combout\ : std_logic;
SIGNAL \u_vga|Mux1~14_combout\ : std_logic;
SIGNAL \u_vga|Mux1~15_combout\ : std_logic;
SIGNAL \u_vga|Mux1~16_combout\ : std_logic;
SIGNAL \u_vga|Mux1~10_combout\ : std_logic;
SIGNAL \u_vga|Mux1~11_combout\ : std_logic;
SIGNAL \u_vga|Mux1~17_combout\ : std_logic;
SIGNAL \u_vga|Mux1~18_combout\ : std_logic;
SIGNAL \u_vga|Mux1~19_combout\ : std_logic;
SIGNAL \u_vga|Mux1~20_combout\ : std_logic;
SIGNAL \u_vga|Mux1~21_combout\ : std_logic;
SIGNAL \u_vga|Mux1~22_combout\ : std_logic;
SIGNAL \u_vga|Mux1~23_combout\ : std_logic;
SIGNAL \u_vga|Mux1~24_combout\ : std_logic;
SIGNAL \u_vga|Mux1~25_combout\ : std_logic;
SIGNAL \u_vga|Mux1~26_combout\ : std_logic;
SIGNAL \u_vga|Mux1~27_combout\ : std_logic;
SIGNAL \u_vga|Mux1~28_combout\ : std_logic;
SIGNAL \u_vga|Mux1~29_combout\ : std_logic;
SIGNAL \u_vga|Mux1~30_combout\ : std_logic;
SIGNAL \u_vga|Mux1~7_combout\ : std_logic;
SIGNAL \u_vga|Mux1~8_combout\ : std_logic;
SIGNAL \u_vga|Mux1~0_combout\ : std_logic;
SIGNAL \u_vga|Mux1~1_combout\ : std_logic;
SIGNAL \u_vga|Mux1~4_combout\ : std_logic;
SIGNAL \u_vga|Mux1~5_combout\ : std_logic;
SIGNAL \u_vga|Mux1~2_combout\ : std_logic;
SIGNAL \u_vga|Mux1~3_combout\ : std_logic;
SIGNAL \u_vga|Mux1~6_combout\ : std_logic;
SIGNAL \u_vga|Mux1~9_combout\ : std_logic;
SIGNAL \u_vga|Mux1~32_combout\ : std_logic;
SIGNAL \u_vga|Add4~0_combout\ : std_logic;
SIGNAL \u_vga|current_rocket~3_combout\ : std_logic;
SIGNAL \u_vga|current_rocket[0]~1_combout\ : std_logic;
SIGNAL \u_vga|Add4~1\ : std_logic;
SIGNAL \u_vga|Add4~2_combout\ : std_logic;
SIGNAL \u_vga|current_rocket~0_combout\ : std_logic;
SIGNAL \u_vga|Add4~3\ : std_logic;
SIGNAL \u_vga|Add4~4_combout\ : std_logic;
SIGNAL \u_vga|Add4~5\ : std_logic;
SIGNAL \u_vga|Add4~6_combout\ : std_logic;
SIGNAL \u_vga|current_rocket~2_combout\ : std_logic;
SIGNAL \u_vga|Equal5~0_combout\ : std_logic;
SIGNAL \u_vga|Add4~7\ : std_logic;
SIGNAL \u_vga|Add4~8_combout\ : std_logic;
SIGNAL \u_vga|Add4~9\ : std_logic;
SIGNAL \u_vga|Add4~10_combout\ : std_logic;
SIGNAL \u_vga|Add4~11\ : std_logic;
SIGNAL \u_vga|Add4~12_combout\ : std_logic;
SIGNAL \u_vga|current_rocket~4_combout\ : std_logic;
SIGNAL \u_vga|Equal5~1_combout\ : std_logic;
SIGNAL \u_vga|update_rockets~3_combout\ : std_logic;
SIGNAL \u_vga|update_rockets~2_combout\ : std_logic;
SIGNAL \u_vga|update_rockets~q\ : std_logic;
SIGNAL \u_vga|nb_submarines[0]~4_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[1]~0_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[2]~1_combout\ : std_logic;
SIGNAL \u_vga|Add0~0_combout\ : std_logic;
SIGNAL \u_vga|cycle_cnt~1_combout\ : std_logic;
SIGNAL \u_vga|Add0~1\ : std_logic;
SIGNAL \u_vga|Add0~2_combout\ : std_logic;
SIGNAL \u_vga|Add0~3\ : std_logic;
SIGNAL \u_vga|Add0~4_combout\ : std_logic;
SIGNAL \u_vga|cycle_cnt~0_combout\ : std_logic;
SIGNAL \u_vga|Add0~5\ : std_logic;
SIGNAL \u_vga|Add0~6_combout\ : std_logic;
SIGNAL \u_vga|Add0~7\ : std_logic;
SIGNAL \u_vga|Add0~8_combout\ : std_logic;
SIGNAL \u_vga|Add0~9\ : std_logic;
SIGNAL \u_vga|Add0~10_combout\ : std_logic;
SIGNAL \u_vga|cycle_cnt~2_combout\ : std_logic;
SIGNAL \u_vga|Add0~11\ : std_logic;
SIGNAL \u_vga|Add0~12_combout\ : std_logic;
SIGNAL \u_vga|cycle_cnt~3_combout\ : std_logic;
SIGNAL \u_vga|Equal6~0_combout\ : std_logic;
SIGNAL \u_vga|Equal6~1_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[1]~2_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[3]~3_combout\ : std_logic;
SIGNAL \u_vga|wr_en_a_sub~0_combout\ : std_logic;
SIGNAL \u_vga|generate_subarine~5_combout\ : std_logic;
SIGNAL \u_vga|generate_subarine~2_combout\ : std_logic;
SIGNAL \u_vga|generate_subarine~3_combout\ : std_logic;
SIGNAL \u_vga|generate_subarine~4_combout\ : std_logic;
SIGNAL \u_vga|generate_subarine~q\ : std_logic;
SIGNAL \u_vga|Decoder0~1_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~2_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~17_combout\ : std_logic;
SIGNAL \u_vga|submarines[49]~48_combout\ : std_logic;
SIGNAL \u_vga|Mux2~32_combout\ : std_logic;
SIGNAL \u_vga|Mux2~3_combout\ : std_logic;
SIGNAL \u_vga|Mux2~4_combout\ : std_logic;
SIGNAL \u_vga|Mux2~5_combout\ : std_logic;
SIGNAL \u_vga|Mux2~6_combout\ : std_logic;
SIGNAL \u_vga|Mux2~7_combout\ : std_logic;
SIGNAL \u_vga|Mux2~8_combout\ : std_logic;
SIGNAL \u_vga|Mux2~9_combout\ : std_logic;
SIGNAL \u_vga|Mux2~1_combout\ : std_logic;
SIGNAL \u_vga|Mux2~2_combout\ : std_logic;
SIGNAL \u_vga|Mux2~10_combout\ : std_logic;
SIGNAL \u_vga|Mux2~25_combout\ : std_logic;
SIGNAL \u_vga|Mux2~26_combout\ : std_logic;
SIGNAL \u_vga|Mux2~23_combout\ : std_logic;
SIGNAL \u_vga|Mux2~24_combout\ : std_logic;
SIGNAL \u_vga|Mux2~27_combout\ : std_logic;
SIGNAL \u_vga|Mux2~21_combout\ : std_logic;
SIGNAL \u_vga|Mux2~22_combout\ : std_logic;
SIGNAL \u_vga|Mux2~28_combout\ : std_logic;
SIGNAL \u_vga|Mux2~29_combout\ : std_logic;
SIGNAL \u_vga|Mux2~30_combout\ : std_logic;
SIGNAL \u_vga|Mux2~11_combout\ : std_logic;
SIGNAL \u_vga|Mux2~12_combout\ : std_logic;
SIGNAL \u_vga|Mux2~18_combout\ : std_logic;
SIGNAL \u_vga|Mux2~19_combout\ : std_logic;
SIGNAL \u_vga|Mux2~13_combout\ : std_logic;
SIGNAL \u_vga|Mux2~14_combout\ : std_logic;
SIGNAL \u_vga|Mux2~15_combout\ : std_logic;
SIGNAL \u_vga|Mux2~16_combout\ : std_logic;
SIGNAL \u_vga|Mux2~17_combout\ : std_logic;
SIGNAL \u_vga|Mux2~20_combout\ : std_logic;
SIGNAL \u_vga|Mux2~31_combout\ : std_logic;
SIGNAL \u_vga|Mux2~33_combout\ : std_logic;
SIGNAL \u_vga|Equal8~2_combout\ : std_logic;
SIGNAL \u_vga|Equal8~1_combout\ : std_logic;
SIGNAL \u_vga|Equal8~3_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~11_combout\ : std_logic;
SIGNAL \u_vga|Add14~0_combout\ : std_logic;
SIGNAL \u_vga|Add14~13\ : std_logic;
SIGNAL \u_vga|Add14~14_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~12_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~13_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~15_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~14_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~16_combout\ : std_logic;
SIGNAL \u_vga|current_line~0_combout\ : std_logic;
SIGNAL \u_vga|current_line~1_combout\ : std_logic;
SIGNAL \u_vga|Add14~1\ : std_logic;
SIGNAL \u_vga|Add14~2_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~19_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~17_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~18_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~20_combout\ : std_logic;
SIGNAL \u_vga|current_line~2_combout\ : std_logic;
SIGNAL \u_vga|Add14~3\ : std_logic;
SIGNAL \u_vga|Add14~4_combout\ : std_logic;
SIGNAL \u_vga|current_line~6_combout\ : std_logic;
SIGNAL \u_vga|Add14~5\ : std_logic;
SIGNAL \u_vga|Add14~6_combout\ : std_logic;
SIGNAL \u_vga|current_line~5_combout\ : std_logic;
SIGNAL \u_vga|current_line[6]~9_combout\ : std_logic;
SIGNAL \u_vga|Add14~7\ : std_logic;
SIGNAL \u_vga|Add14~8_combout\ : std_logic;
SIGNAL \u_vga|current_line~7_combout\ : std_logic;
SIGNAL \u_vga|current_line[7]~8_combout\ : std_logic;
SIGNAL \u_vga|Add14~9\ : std_logic;
SIGNAL \u_vga|Add14~10_combout\ : std_logic;
SIGNAL \u_vga|current_line~4_combout\ : std_logic;
SIGNAL \u_vga|Add14~11\ : std_logic;
SIGNAL \u_vga|Add14~12_combout\ : std_logic;
SIGNAL \u_vga|current_line~3_combout\ : std_logic;
SIGNAL \u_vga|Add16~1\ : std_logic;
SIGNAL \u_vga|Add16~3\ : std_logic;
SIGNAL \u_vga|Add16~5\ : std_logic;
SIGNAL \u_vga|Add16~7\ : std_logic;
SIGNAL \u_vga|Add16~9\ : std_logic;
SIGNAL \u_vga|Add16~11\ : std_logic;
SIGNAL \u_vga|Add16~12_combout\ : std_logic;
SIGNAL \u_vga|Add16~10_combout\ : std_logic;
SIGNAL \u_vga|Add16~8_combout\ : std_logic;
SIGNAL \u_vga|Add16~6_combout\ : std_logic;
SIGNAL \u_vga|Add16~4_combout\ : std_logic;
SIGNAL \u_vga|Add16~2_combout\ : std_logic;
SIGNAL \u_vga|Add16~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan12~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan12~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan12~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan12~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan12~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan12~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan12~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan12~14_combout\ : std_logic;
SIGNAL \u_vga|generate_rocket~0_combout\ : std_logic;
SIGNAL \u_vga|generate_rocket~q\ : std_logic;
SIGNAL \u_vga|wr_en_a_sub~2_combout\ : std_logic;
SIGNAL \u_vga|wr_en_a_sub~3_combout\ : std_logic;
SIGNAL \u_vga|wr_en_a_sub~1_combout\ : std_logic;
SIGNAL \u_vga|wr_en_a_sub~4_combout\ : std_logic;
SIGNAL \u_vga|wr_en_a_sub~q\ : std_logic;
SIGNAL \u_vga|address_a_sub[0]~6_combout\ : std_logic;
SIGNAL \u_vga|address_a_sub[0]~8_combout\ : std_logic;
SIGNAL \u_vga|address_a_sub[0]~7\ : std_logic;
SIGNAL \u_vga|address_a_sub[1]~9_combout\ : std_logic;
SIGNAL \u_vga|address_a_sub[1]~10\ : std_logic;
SIGNAL \u_vga|address_a_sub[2]~11_combout\ : std_logic;
SIGNAL \u_vga|address_a_sub[2]~12\ : std_logic;
SIGNAL \u_vga|address_a_sub[3]~13_combout\ : std_logic;
SIGNAL \u_vga|address_a_sub[3]~14\ : std_logic;
SIGNAL \u_vga|address_a_sub[4]~15_combout\ : std_logic;
SIGNAL \u_vga|address_a_sub[4]~16\ : std_logic;
SIGNAL \u_vga|address_a_sub[5]~17_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \u_vga|address_b_sub[0]~feeder_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~26_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~27_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~52_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~28_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~29_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~30_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~21_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~22_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~23_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~51_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~24_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~31_combout\ : std_logic;
SIGNAL \u_vga|address_b_sub[0]~0_combout\ : std_logic;
SIGNAL \u_vga|address_b_sub[1]~feeder_combout\ : std_logic;
SIGNAL \u_vga|address_b_sub[2]~feeder_combout\ : std_logic;
SIGNAL \u_vga|address_b_sub[3]~1_combout\ : std_logic;
SIGNAL \u_vga|Add15~0_combout\ : std_logic;
SIGNAL \u_vga|Add15~1_combout\ : std_logic;
SIGNAL \u_vga|sign_g_y~q\ : std_logic;
SIGNAL \u_vga|Add2~19\ : std_logic;
SIGNAL \u_vga|Add2~20_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[9]~10_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~27_combout\ : std_logic;
SIGNAL \u_vga|Add2~21\ : std_logic;
SIGNAL \u_vga|Add2~22_combout\ : std_logic;
SIGNAL \u_vga|Add1~21\ : std_logic;
SIGNAL \u_vga|Add1~22_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~1_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~6_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[11]~7_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[11]~8_combout\ : std_logic;
SIGNAL \u_vga|Add1~1\ : std_logic;
SIGNAL \u_vga|Add1~3\ : std_logic;
SIGNAL \u_vga|Add1~5\ : std_logic;
SIGNAL \u_vga|Add1~7\ : std_logic;
SIGNAL \u_vga|Add1~9\ : std_logic;
SIGNAL \u_vga|Add1~11\ : std_logic;
SIGNAL \u_vga|Add1~13\ : std_logic;
SIGNAL \u_vga|Add1~15\ : std_logic;
SIGNAL \u_vga|Add1~17\ : std_logic;
SIGNAL \u_vga|Add1~19\ : std_logic;
SIGNAL \u_vga|Add1~20_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~28_combout\ : std_logic;
SIGNAL \u_vga|Add2~1\ : std_logic;
SIGNAL \u_vga|Add2~3\ : std_logic;
SIGNAL \u_vga|Add2~5\ : std_logic;
SIGNAL \u_vga|Add2~7\ : std_logic;
SIGNAL \u_vga|Add2~9\ : std_logic;
SIGNAL \u_vga|Add2~11\ : std_logic;
SIGNAL \u_vga|Add2~13\ : std_logic;
SIGNAL \u_vga|Add2~15\ : std_logic;
SIGNAL \u_vga|Add2~17\ : std_logic;
SIGNAL \u_vga|Add2~18_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~11_combout\ : std_logic;
SIGNAL \u_vga|Add1~18_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~12_combout\ : std_logic;
SIGNAL \u_vga|Add2~16_combout\ : std_logic;
SIGNAL \u_vga|Add1~16_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~13_combout\ : std_logic;
SIGNAL \u_vga|Add2~14_combout\ : std_logic;
SIGNAL \u_vga|Add1~14_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~14_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~15_combout\ : std_logic;
SIGNAL \u_vga|Add2~12_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~16_combout\ : std_logic;
SIGNAL \u_vga|Add1~12_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~17_combout\ : std_logic;
SIGNAL \u_vga|Add2~10_combout\ : std_logic;
SIGNAL \u_vga|Add1~10_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~18_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~19_combout\ : std_logic;
SIGNAL \u_vga|Add1~8_combout\ : std_logic;
SIGNAL \u_vga|Add2~8_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~20_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~21_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[9]~9_combout\ : std_logic;
SIGNAL \u_vga|Add2~6_combout\ : std_logic;
SIGNAL \u_vga|Add1~6_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~22_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~23_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[11]~4_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[11]~2_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[11]~3_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub[11]~5_combout\ : std_logic;
SIGNAL \u_vga|Add1~4_combout\ : std_logic;
SIGNAL \u_vga|Add2~4_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~24_combout\ : std_logic;
SIGNAL \u_vga|Add2~2_combout\ : std_logic;
SIGNAL \u_vga|Add1~2_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~25_combout\ : std_logic;
SIGNAL \u_vga|Add2~0_combout\ : std_logic;
SIGNAL \u_vga|Add1~0_combout\ : std_logic;
SIGNAL \u_vga|data_a_sub~26_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~10_combout\ : std_logic;
SIGNAL \u_vga|red_signal~3_combout\ : std_logic;
SIGNAL \u_vga|LessThan11~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan11~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan11~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan11~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan11~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan11~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan11~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan11~14_combout\ : std_logic;
SIGNAL \u_vga|red_signal~4_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~0_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~1_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~2_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~3_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~4_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~5_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~6_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~7_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~8_combout\ : std_logic;
SIGNAL \u_vga|data_sub_disp~9_combout\ : std_logic;
SIGNAL \u_vga|LessThan13~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan13~18_combout\ : std_logic;
SIGNAL \u_vga|Add18~1\ : std_logic;
SIGNAL \u_vga|Add18~3\ : std_logic;
SIGNAL \u_vga|Add18~5\ : std_logic;
SIGNAL \u_vga|Add18~7\ : std_logic;
SIGNAL \u_vga|Add18~9\ : std_logic;
SIGNAL \u_vga|Add18~10_combout\ : std_logic;
SIGNAL \u_vga|Add18~8_combout\ : std_logic;
SIGNAL \u_vga|Add18~6_combout\ : std_logic;
SIGNAL \u_vga|Add18~4_combout\ : std_logic;
SIGNAL \u_vga|Add18~2_combout\ : std_logic;
SIGNAL \u_vga|Add18~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan14~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan14~18_combout\ : std_logic;
SIGNAL \u_vga|red_signal~5_combout\ : std_logic;
SIGNAL \u_vga|red_signal~9_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~25_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~2_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~3_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~11_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~4_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~64_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~10_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~11_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~63_combout\ : std_logic;
SIGNAL \u_vga|Mux3~27_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~65_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~14_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~66_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~6_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~62_combout\ : std_logic;
SIGNAL \u_vga|Mux3~28_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~9_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~52_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~54_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~53_combout\ : std_logic;
SIGNAL \u_vga|Mux3~22_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~55_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~56_combout\ : std_logic;
SIGNAL \u_vga|Mux3~23_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~10_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~60_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~61_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~57_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~58_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~59_combout\ : std_logic;
SIGNAL \u_vga|Mux3~24_combout\ : std_logic;
SIGNAL \u_vga|Mux3~25_combout\ : std_logic;
SIGNAL \u_vga|Mux3~26_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~8_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~47_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~50_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~51_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~49_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~48_combout\ : std_logic;
SIGNAL \u_vga|Mux3~20_combout\ : std_logic;
SIGNAL \u_vga|Mux3~21_combout\ : std_logic;
SIGNAL \u_vga|Mux3~29_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~7_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~32_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~33_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~34_combout\ : std_logic;
SIGNAL \u_vga|Mux3~12_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~6_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~35_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~36_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~31_combout\ : std_logic;
SIGNAL \u_vga|Mux3~13_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~39_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~38_combout\ : std_logic;
SIGNAL \u_vga|Mux3~14_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~40_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~37_combout\ : std_logic;
SIGNAL \u_vga|Mux3~15_combout\ : std_logic;
SIGNAL \u_vga|Mux3~16_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~5_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~28_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~29_combout\ : std_logic;
SIGNAL \u_vga|Mux3~10_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~4_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~30_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~27_combout\ : std_logic;
SIGNAL \u_vga|Mux3~11_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~44_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~42_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~43_combout\ : std_logic;
SIGNAL \u_vga|Mux3~17_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~45_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~46_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~41_combout\ : std_logic;
SIGNAL \u_vga|Mux3~18_combout\ : std_logic;
SIGNAL \u_vga|Mux3~19_combout\ : std_logic;
SIGNAL \u_vga|Mux3~30_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~12_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~69_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~68_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~67_combout\ : std_logic;
SIGNAL \u_vga|Mux3~31_combout\ : std_logic;
SIGNAL \u_vga|Mux3~32_combout\ : std_logic;
SIGNAL \u_vga|Mux3~33_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~2_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~12_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~17_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~70_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~18_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~3_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~13_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~15_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~16_combout\ : std_logic;
SIGNAL \u_vga|Mux3~2_combout\ : std_logic;
SIGNAL \u_vga|Mux3~3_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~21_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~20_combout\ : std_logic;
SIGNAL \u_vga|Mux3~4_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~22_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~19_combout\ : std_logic;
SIGNAL \u_vga|Mux3~5_combout\ : std_logic;
SIGNAL \u_vga|Mux3~6_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~0_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~26_combout\ : std_logic;
SIGNAL \u_vga|Decoder1~1_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~25_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~24_combout\ : std_logic;
SIGNAL \u_vga|Mux3~7_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~23_combout\ : std_logic;
SIGNAL \u_vga|Mux3~8_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~5_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~9_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~8_combout\ : std_logic;
SIGNAL \u_vga|submarines_debug~7_combout\ : std_logic;
SIGNAL \u_vga|Mux3~0_combout\ : std_logic;
SIGNAL \u_vga|Mux3~1_combout\ : std_logic;
SIGNAL \u_vga|Mux3~9_combout\ : std_logic;
SIGNAL \u_vga|Mux3~34_combout\ : std_logic;
SIGNAL \u_vga|red_signal~10_combout\ : std_logic;
SIGNAL \u_vga|red_signal~q\ : std_logic;
SIGNAL \u_vga|horizontal_en~q\ : std_logic;
SIGNAL \u_vga|vertical_en~q\ : std_logic;
SIGNAL \u_vga|video_en~0_combout\ : std_logic;
SIGNAL \u_vga|video_en~q\ : std_logic;
SIGNAL \u_vga|out_red~0_combout\ : std_logic;
SIGNAL \u_vga|out_red~q\ : std_logic;
SIGNAL \u_vga|green_signal~0_combout\ : std_logic;
SIGNAL \u_vga|green_signal~1_combout\ : std_logic;
SIGNAL \u_vga|red_signal~11_combout\ : std_logic;
SIGNAL \u_vga|green_signal~2_combout\ : std_logic;
SIGNAL \u_vga|green_signal~q\ : std_logic;
SIGNAL \u_vga|out_green~0_combout\ : std_logic;
SIGNAL \u_vga|out_green~q\ : std_logic;
SIGNAL \u_vga|blue_signal~0_combout\ : std_logic;
SIGNAL \u_vga|blue_signal~1_combout\ : std_logic;
SIGNAL \u_vga|blue_signal~q\ : std_logic;
SIGNAL \u_vga|out_blue~0_combout\ : std_logic;
SIGNAL \u_vga|out_blue~q\ : std_logic;
SIGNAL \u_vga|vga_gen~40_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~41_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~42_combout\ : std_logic;
SIGNAL \u_vga|h_sync~q\ : std_logic;
SIGNAL \u_vga|out_h_sync~q\ : std_logic;
SIGNAL \u_vga|out_v_sync~feeder_combout\ : std_logic;
SIGNAL \u_vga|out_v_sync~q\ : std_logic;
SIGNAL \u_vga|current_submarine\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \u_vga|old_magn_g_y\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_ram_sub|altsyncram_component|auto_generated|q_b\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|current_line\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_spi_ee_config|read_idle_count\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \u_vga|left_boat\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_ram_sub|altsyncram_component|auto_generated|q_a\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|right_boat\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_vga|data_a_sub\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_spi_ee_config|oDATA_YL_xhdl1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga|address_a_sub\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|clear_status_d\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|ini_index\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_reset_delay|cont\ : std_logic_vector(20 DOWNTO 0);
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga|h_cnt\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \u_vga|v_cnt\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \u_vga|submarines_debug\ : std_logic_vector(50 DOWNTO 0);
SIGNAL \u_vga|submarines\ : std_logic_vector(49 DOWNTO 0);
SIGNAL \u_vga|data_sub_disp\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|address_b_sub\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \u_spi_ee_config|p2s_data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|magn_g_y\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_vga|cycle_cnt\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \u_vga|nb_submarines\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|oDATA_YH_xhdl2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga|current_rocket\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \u_spi_ee_config|low_byte_dataY\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga|ALT_INV_v_sync~clkctrl_outclk\ : std_logic;
SIGNAL \u_vga|ALT_INV_update_submarines~q\ : std_logic;
SIGNAL \u_reset_delay|ALT_INV_cont\ : std_logic_vector(20 DOWNTO 20);
SIGNAL \u_reset_delay|ALT_INV_oRST_xhdl1~q\ : std_logic;
SIGNAL \u_spi_ee_config|ALT_INV_spi_go~q\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_G_SENSOR_INT <= G_SENSOR_INT;
I2C_SDAT <= ww_I2C_SDAT;
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

\u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & \u_vga|data_a_sub\(11) & \u_vga|data_a_sub\(10) & \u_vga|data_a_sub\(9) & \u_vga|data_a_sub\(8) & \u_vga|data_a_sub\(7) & 
\u_vga|data_a_sub\(6) & \u_vga|data_a_sub\(5) & \u_vga|data_a_sub\(4) & \u_vga|data_a_sub\(3) & \u_vga|data_a_sub\(2) & \u_vga|data_a_sub\(1) & \u_vga|data_a_sub\(0));

\u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & 
\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\u_vga|address_a_sub\(5) & \u_vga|address_a_sub\(4) & \u_vga|address_a_sub\(3) & \u_vga|address_a_sub\(2) & \u_vga|address_a_sub\(1) & \u_vga|address_a_sub\(0));

\u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\u_vga|address_b_sub\(5) & \u_vga|address_b_sub\(4) & \u_vga|address_b_sub\(3) & \u_vga|address_b_sub\(2) & \u_vga|address_b_sub\(1) & \u_vga|address_b_sub\(0));

\u_ram_sub|altsyncram_component|auto_generated|q_a\(0) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(1) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(2) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(3) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(4) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(5) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(7) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(8) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(9) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\u_ram_sub|altsyncram_component|auto_generated|q_a\(11) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);

\u_ram_sub|altsyncram_component|auto_generated|q_b\(0) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(1) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(2) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(3) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(4) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(5) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(6) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(7) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(8) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(9) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(9);
\u_ram_sub|altsyncram_component|auto_generated|q_b\(11) <= \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(11);

\u_vga|v_sync~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_vga|v_sync~q\);

\u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_spipll|altpll_component|auto_generated|wire_pll1_clk\(1));

\u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_spipll|altpll_component|auto_generated|wire_pll1_clk\(0));

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\u_vga|ALT_INV_v_sync~clkctrl_outclk\ <= NOT \u_vga|v_sync~clkctrl_outclk\;
\u_vga|ALT_INV_update_submarines~q\ <= NOT \u_vga|update_submarines~q\;
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
	o => ww_I2C_SDAT);

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

-- Location: LCCOMB_X18_Y14_N8
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

-- Location: FF_X18_Y14_N9
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

-- Location: LCCOMB_X18_Y14_N12
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

-- Location: FF_X18_Y14_N13
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

-- Location: LCCOMB_X18_Y14_N14
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

-- Location: FF_X18_Y14_N15
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

-- Location: LCCOMB_X18_Y14_N16
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

-- Location: FF_X18_Y14_N17
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

-- Location: LCCOMB_X18_Y14_N18
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

-- Location: FF_X18_Y14_N19
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

-- Location: LCCOMB_X18_Y14_N20
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

-- Location: FF_X18_Y14_N21
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

-- Location: LCCOMB_X18_Y14_N22
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

-- Location: FF_X18_Y14_N23
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

-- Location: LCCOMB_X18_Y14_N24
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

-- Location: FF_X18_Y14_N25
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

-- Location: LCCOMB_X18_Y14_N26
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

-- Location: FF_X18_Y14_N27
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

-- Location: LCCOMB_X18_Y14_N28
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

-- Location: FF_X18_Y14_N29
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

-- Location: LCCOMB_X18_Y14_N30
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

-- Location: FF_X18_Y14_N31
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

-- Location: LCCOMB_X18_Y13_N0
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

-- Location: FF_X18_Y13_N1
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

-- Location: LCCOMB_X18_Y13_N2
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

-- Location: FF_X18_Y13_N3
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

-- Location: LCCOMB_X18_Y13_N4
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

-- Location: FF_X18_Y13_N5
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

-- Location: LCCOMB_X18_Y13_N6
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

-- Location: FF_X18_Y13_N7
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

-- Location: LCCOMB_X18_Y13_N8
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

-- Location: FF_X18_Y13_N9
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

-- Location: LCCOMB_X18_Y13_N10
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

-- Location: FF_X18_Y13_N11
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

-- Location: LCCOMB_X18_Y13_N12
\u_reset_delay|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~32_combout\ = (\u_reset_delay|cont\(17) & (\u_reset_delay|Add0~31\ $ (GND))) # (!\u_reset_delay|cont\(17) & (!\u_reset_delay|Add0~31\ & VCC))
-- \u_reset_delay|Add0~33\ = CARRY((\u_reset_delay|cont\(17) & !\u_reset_delay|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_reset_delay|cont\(17),
	datad => VCC,
	cin => \u_reset_delay|Add0~31\,
	combout => \u_reset_delay|Add0~32_combout\,
	cout => \u_reset_delay|Add0~33\);

-- Location: FF_X18_Y13_N13
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

-- Location: LCCOMB_X18_Y13_N14
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

-- Location: FF_X18_Y13_N15
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

-- Location: LCCOMB_X18_Y13_N16
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

-- Location: FF_X18_Y13_N17
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

-- Location: LCCOMB_X18_Y13_N18
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

-- Location: LCCOMB_X18_Y13_N20
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

-- Location: FF_X18_Y13_N21
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

-- Location: FF_X17_Y14_N19
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
	pll_compensation_delay => 3323,
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

-- Location: LCCOMB_X16_Y16_N22
\u_spi_ee_config|high_byte~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|high_byte~0_combout\ = (\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & (\u_spi_ee_config|LessThan0~0_combout\ & \u_spi_ee_config|spi_go~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|high_byte~0_combout\);

-- Location: IOIBUF_X0_Y23_N1
\I2C_SDAT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I2C_SDAT,
	o => \I2C_SDAT~input_o\);

-- Location: LCCOMB_X17_Y16_N6
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

-- Location: LCCOMB_X17_Y14_N18
\u_spi_ee_config|p2s_data[15]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[15]~8_combout\ = (!\u_spi_ee_config|spi_go~q\ & (\u_reset_delay|oRST_xhdl1~q\ & !\u_spi_ee_config|p2s_data[15]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_reset_delay|oRST_xhdl1~q\,
	datad => \u_spi_ee_config|p2s_data[15]~12_combout\,
	combout => \u_spi_ee_config|p2s_data[15]~8_combout\);

-- Location: FF_X17_Y15_N31
\u_spi_ee_config|p2s_data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|LessThan0~0_combout\,
	ena => \u_spi_ee_config|p2s_data[15]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|p2s_data\(15));

-- Location: LCCOMB_X17_Y16_N28
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (\u_reset_delay|oRST_xhdl1~q\ & \u_spi_ee_config|p2s_data\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datab => \u_reset_delay|oRST_xhdl1~q\,
	datad => \u_spi_ee_config|p2s_data\(15),
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\);

-- Location: FF_X17_Y16_N7
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

-- Location: LCCOMB_X17_Y16_N16
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

-- Location: FF_X17_Y16_N17
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1));

-- Location: LCCOMB_X17_Y16_N12
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

-- Location: FF_X17_Y16_N13
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

-- Location: LCCOMB_X17_Y16_N14
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[3]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(2),
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[3]~feeder_combout\);

-- Location: FF_X17_Y16_N15
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[3]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3));

-- Location: FF_X17_Y16_N11
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
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4));

-- Location: LCCOMB_X17_Y16_N18
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

-- Location: FF_X17_Y16_N19
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5));

-- Location: FF_X17_Y16_N21
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
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6));

-- Location: LCCOMB_X16_Y16_N18
\u_spi_ee_config|high_byte~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|high_byte~1_combout\ = \u_spi_ee_config|high_byte~q\ $ (((\u_spi_ee_config|high_byte~0_combout\ & \u_spi_ee_config|read_back~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~0_combout\,
	datab => \u_spi_ee_config|read_back~q\,
	datac => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|high_byte~1_combout\);

-- Location: FF_X16_Y16_N19
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

-- Location: LCCOMB_X16_Y16_N30
\u_spi_ee_config|p2s_data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~13_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & ((\u_spi_ee_config|read_ready~q\) # (\u_spi_ee_config|high_byte~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_ready~q\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|p2s_data~13_combout\);

-- Location: LCCOMB_X16_Y16_N28
\u_spi_ee_config|read_back~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_back~1_combout\ = (\u_spi_ee_config|p2s_data~13_combout\ & (((!\u_spi_ee_config|high_byte~0_combout\ & \u_spi_ee_config|read_back~q\)) # (!\u_spi_ee_config|spi_go~q\))) # (!\u_spi_ee_config|p2s_data~13_combout\ & 
-- (!\u_spi_ee_config|high_byte~0_combout\ & (\u_spi_ee_config|read_back~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data~13_combout\,
	datab => \u_spi_ee_config|high_byte~0_combout\,
	datac => \u_spi_ee_config|read_back~q\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|read_back~1_combout\);

-- Location: FF_X16_Y16_N29
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

-- Location: LCCOMB_X17_Y16_N20
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

-- Location: LCCOMB_X16_Y16_N20
\u_spi_ee_config|read_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_ready~1_combout\ = (\u_spi_ee_config|high_byte~0_combout\ & ((\u_reset_delay|oRST_xhdl1~q\ & ((\u_spi_ee_config|read_ready~0_combout\))) # (!\u_reset_delay|oRST_xhdl1~q\ & (\u_spi_ee_config|read_ready~q\)))) # 
-- (!\u_spi_ee_config|high_byte~0_combout\ & (((\u_spi_ee_config|read_ready~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~0_combout\,
	datab => \u_reset_delay|oRST_xhdl1~q\,
	datac => \u_spi_ee_config|read_ready~q\,
	datad => \u_spi_ee_config|read_ready~0_combout\,
	combout => \u_spi_ee_config|read_ready~1_combout\);

-- Location: FF_X16_Y16_N21
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

-- Location: IOIBUF_X0_Y12_N8
\G_SENSOR_INT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_G_SENSOR_INT,
	o => \G_SENSOR_INT~input_o\);

-- Location: LCCOMB_X17_Y14_N14
\u_spi_ee_config|read_back~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_back~0_combout\ = (!\u_spi_ee_config|read_ready~q\ & !\u_spi_ee_config|high_byte~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|read_ready~q\,
	datad => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|read_back~0_combout\);

-- Location: LCCOMB_X17_Y14_N16
\u_spi_ee_config|clear_status~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~0_combout\ = (!\u_spi_ee_config|spi_go~0_combout\ & (!\u_spi_ee_config|spi_go~q\ & (\u_spi_ee_config|LessThan0~0_combout\ & \u_spi_ee_config|read_back~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|spi_go~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|read_back~0_combout\,
	combout => \u_spi_ee_config|clear_status~0_combout\);

-- Location: LCCOMB_X16_Y16_N4
\u_spi_ee_config|clear_status~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~1_combout\ = (\u_spi_ee_config|clear_status~0_combout\) # ((\u_spi_ee_config|clear_status~q\ & ((\u_spi_ee_config|read_back~q\) # (!\u_spi_ee_config|high_byte~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~0_combout\,
	datab => \u_spi_ee_config|read_back~q\,
	datac => \u_spi_ee_config|clear_status~q\,
	datad => \u_spi_ee_config|clear_status~0_combout\,
	combout => \u_spi_ee_config|clear_status~1_combout\);

-- Location: FF_X16_Y16_N5
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

-- Location: FF_X16_Y16_N11
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

-- Location: LCCOMB_X16_Y16_N0
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

-- Location: FF_X16_Y16_N1
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

-- Location: LCCOMB_X16_Y16_N2
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

-- Location: FF_X16_Y16_N3
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

-- Location: FF_X17_Y14_N13
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

-- Location: LCCOMB_X16_Y14_N2
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

-- Location: LCCOMB_X17_Y15_N16
\u_spi_ee_config|read_idle_count[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[14]~45_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (((\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & !\u_spi_ee_config|read_back~q\)) # (!\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datad => \u_spi_ee_config|read_back~q\,
	combout => \u_spi_ee_config|read_idle_count[14]~45_combout\);

-- Location: FF_X16_Y14_N3
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

-- Location: LCCOMB_X16_Y14_N4
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

-- Location: FF_X16_Y14_N5
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

-- Location: LCCOMB_X16_Y14_N6
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

-- Location: FF_X16_Y14_N7
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

-- Location: LCCOMB_X16_Y14_N8
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

-- Location: FF_X16_Y14_N9
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

-- Location: LCCOMB_X16_Y14_N10
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

-- Location: FF_X16_Y14_N11
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

-- Location: LCCOMB_X16_Y14_N12
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

-- Location: FF_X16_Y14_N13
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

-- Location: LCCOMB_X16_Y14_N14
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

-- Location: FF_X16_Y14_N15
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

-- Location: LCCOMB_X16_Y14_N16
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

-- Location: FF_X16_Y14_N17
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

-- Location: LCCOMB_X16_Y14_N18
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

-- Location: FF_X16_Y14_N19
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

-- Location: LCCOMB_X16_Y14_N20
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

-- Location: FF_X16_Y14_N21
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

-- Location: LCCOMB_X16_Y14_N22
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

-- Location: FF_X16_Y14_N23
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

-- Location: LCCOMB_X16_Y14_N24
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

-- Location: FF_X16_Y14_N25
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

-- Location: LCCOMB_X16_Y14_N26
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

-- Location: FF_X16_Y14_N27
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

-- Location: LCCOMB_X16_Y14_N28
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

-- Location: FF_X16_Y14_N29
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

-- Location: LCCOMB_X16_Y14_N30
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

-- Location: FF_X16_Y14_N31
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

-- Location: LCCOMB_X17_Y14_N12
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

-- Location: LCCOMB_X17_Y14_N26
\u_spi_ee_config|p2s_data[15]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[15]~12_combout\ = (!\u_spi_ee_config|read_ready~q\ & (!\u_spi_ee_config|high_byte~q\ & (\u_spi_ee_config|LessThan0~0_combout\ & \u_spi_ee_config|spi_go~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_ready~q\,
	datab => \u_spi_ee_config|high_byte~q\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|spi_go~0_combout\,
	combout => \u_spi_ee_config|p2s_data[15]~12_combout\);

-- Location: LCCOMB_X17_Y14_N24
\u_spi_ee_config|spi_go~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|spi_go~1_combout\ = (\u_spi_ee_config|spi_go~q\ & ((!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\))) # (!\u_spi_ee_config|spi_go~q\ & (!\u_spi_ee_config|p2s_data[15]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|p2s_data[15]~12_combout\,
	datac => \u_spi_ee_config|spi_go~q\,
	datad => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	combout => \u_spi_ee_config|spi_go~1_combout\);

-- Location: FF_X17_Y14_N25
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

-- Location: LCCOMB_X16_Y16_N8
\u_spi_ee_config|u_spi_controller|spi_count_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\ = (!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & ((\u_spi_ee_config|u_spi_controller|spi_count_en~q\) # (\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\);

-- Location: FF_X16_Y16_N9
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

-- Location: LCCOMB_X16_Y16_N12
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

-- Location: FF_X16_Y16_N13
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

-- Location: LCCOMB_X16_Y16_N16
\u_spi_ee_config|u_spi_controller|spi_count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~3_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & (\u_spi_ee_config|u_spi_controller|spi_count\(0) $ (\u_spi_ee_config|u_spi_controller|spi_count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	combout => \u_spi_ee_config|u_spi_controller|spi_count~3_combout\);

-- Location: FF_X16_Y16_N17
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

-- Location: LCCOMB_X16_Y16_N14
\u_spi_ee_config|u_spi_controller|spi_count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~2_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & (\u_spi_ee_config|u_spi_controller|spi_count\(2) $ (((\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- \u_spi_ee_config|u_spi_controller|spi_count\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datad => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count~2_combout\);

-- Location: FF_X16_Y16_N15
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

-- Location: LCCOMB_X16_Y16_N24
\u_spi_ee_config|u_spi_controller|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Add0~0_combout\ = \u_spi_ee_config|u_spi_controller|spi_count\(3) $ (((\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|u_spi_controller|spi_count\(1) & 
-- \u_spi_ee_config|u_spi_controller|spi_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	combout => \u_spi_ee_config|u_spi_controller|Add0~0_combout\);

-- Location: LCCOMB_X16_Y16_N26
\u_spi_ee_config|u_spi_controller|spi_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~0_combout\ = (\u_spi_ee_config|u_spi_controller|Add0~0_combout\ & \u_spi_ee_config|u_spi_controller|spi_count_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|Add0~0_combout\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count~0_combout\);

-- Location: FF_X16_Y16_N27
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

-- Location: LCCOMB_X17_Y16_N30
\u_spi_ee_config|u_spi_controller|WideOr0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|u_spi_controller|spi_count\(1) & 
-- \u_spi_ee_config|u_spi_controller|spi_count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	combout => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\);

-- Location: LCCOMB_X17_Y15_N8
\u_spi_ee_config|ini_index[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[0]~2_combout\ = \u_spi_ee_config|ini_index\(0) $ (((\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & (\u_spi_ee_config|spi_go~q\ & !\u_spi_ee_config|LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|LessThan0~0_combout\,
	combout => \u_spi_ee_config|ini_index[0]~2_combout\);

-- Location: FF_X17_Y15_N9
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

-- Location: LCCOMB_X17_Y15_N18
\u_spi_ee_config|ini_index[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[2]~3_combout\ = \u_spi_ee_config|ini_index\(2) $ (((\u_spi_ee_config|ini_index\(1) & \u_spi_ee_config|ini_index[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datac => \u_spi_ee_config|ini_index\(2),
	datad => \u_spi_ee_config|ini_index[1]~0_combout\,
	combout => \u_spi_ee_config|ini_index[2]~3_combout\);

-- Location: FF_X17_Y15_N19
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

-- Location: LCCOMB_X17_Y15_N30
\u_spi_ee_config|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|LessThan0~0_combout\ = (\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(2)) # ((\u_spi_ee_config|ini_index\(0) & \u_spi_ee_config|ini_index\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(3),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(1),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|LessThan0~0_combout\);

-- Location: LCCOMB_X17_Y15_N2
\u_spi_ee_config|ini_index[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[1]~0_combout\ = (!\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|ini_index\(0) & (\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & \u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|ini_index[1]~0_combout\);

-- Location: LCCOMB_X16_Y16_N6
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

-- Location: FF_X16_Y16_N7
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

-- Location: LCCOMB_X17_Y15_N12
\u_spi_ee_config|ini_index[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[3]~4_combout\ = \u_spi_ee_config|ini_index\(3) $ (((\u_spi_ee_config|ini_index\(1) & (\u_spi_ee_config|ini_index\(2) & \u_spi_ee_config|ini_index[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(2),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index[1]~0_combout\,
	combout => \u_spi_ee_config|ini_index[3]~4_combout\);

-- Location: FF_X17_Y15_N13
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

-- Location: LCCOMB_X16_Y15_N10
\u_spi_ee_config|p2s_data~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~7_combout\ = (\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(0)) # (\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|p2s_data~7_combout\);

-- Location: FF_X16_Y15_N11
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

-- Location: LCCOMB_X16_Y15_N8
\u_spi_ee_config|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux7~0_combout\ = (\u_spi_ee_config|ini_index\(1) & (\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(3)))) # (!\u_spi_ee_config|ini_index\(1) & (!\u_spi_ee_config|ini_index\(0) & (\u_spi_ee_config|ini_index\(3) & 
-- !\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux7~0_combout\);

-- Location: LCCOMB_X16_Y14_N0
\u_spi_ee_config|p2s_data[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[6]~6_combout\ = (\u_reset_delay|oRST_xhdl1~q\ & (!\u_spi_ee_config|spi_go~q\ & !\u_spi_ee_config|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|oRST_xhdl1~q\,
	datac => \u_spi_ee_config|spi_go~q\,
	datad => \u_spi_ee_config|LessThan0~0_combout\,
	combout => \u_spi_ee_config|p2s_data[6]~6_combout\);

-- Location: FF_X16_Y15_N9
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

-- Location: LCCOMB_X16_Y15_N4
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

-- Location: LCCOMB_X16_Y15_N6
\u_spi_ee_config|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux6~0_combout\ = (!\u_spi_ee_config|ini_index\(3) & (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(1) $ (!\u_spi_ee_config|ini_index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux6~0_combout\);

-- Location: FF_X16_Y15_N7
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

-- Location: LCCOMB_X16_Y15_N24
\u_spi_ee_config|u_spi_controller|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~1_combout\ = (\u_spi_ee_config|u_spi_controller|Mux0~0_combout\) # ((!\u_spi_ee_config|u_spi_controller|spi_count\(0) & \u_spi_ee_config|p2s_data\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|Mux0~0_combout\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datad => \u_spi_ee_config|p2s_data\(5),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~1_combout\);

-- Location: LCCOMB_X16_Y15_N22
\u_spi_ee_config|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux5~0_combout\ = (\u_spi_ee_config|ini_index\(0) & ((\u_spi_ee_config|ini_index\(1) & (!\u_spi_ee_config|ini_index\(3) & !\u_spi_ee_config|ini_index\(2))) # (!\u_spi_ee_config|ini_index\(1) & (\u_spi_ee_config|ini_index\(3) $ 
-- (\u_spi_ee_config|ini_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux5~0_combout\);

-- Location: FF_X16_Y15_N23
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

-- Location: LCCOMB_X17_Y16_N2
\u_spi_ee_config|u_spi_controller|Mux0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~7_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (\u_spi_ee_config|p2s_data\(6) & (\u_spi_ee_config|u_spi_controller|spi_count\(0)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- (((!\u_spi_ee_config|u_spi_controller|spi_count\(0) & \u_spi_ee_config|p2s_data\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datab => \u_spi_ee_config|p2s_data\(6),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datad => \u_spi_ee_config|p2s_data\(15),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~7_combout\);

-- Location: LCCOMB_X16_Y15_N14
\u_spi_ee_config|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux11~0_combout\ = (!\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(0) & ((!\u_spi_ee_config|ini_index\(2)))) # (!\u_spi_ee_config|ini_index\(0) & ((\u_spi_ee_config|ini_index\(1)) # (\u_spi_ee_config|ini_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux11~0_combout\);

-- Location: FF_X16_Y15_N15
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

-- Location: LCCOMB_X16_Y15_N20
\u_spi_ee_config|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux10~0_combout\ = (\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(3) & ((!\u_spi_ee_config|ini_index\(2)) # (!\u_spi_ee_config|ini_index\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux10~0_combout\);

-- Location: FF_X16_Y15_N21
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

-- Location: LCCOMB_X16_Y15_N0
\u_spi_ee_config|u_spi_controller|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~4_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|p2s_data\(0) & (\u_spi_ee_config|u_spi_controller|spi_count\(3)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- (((\u_spi_ee_config|p2s_data\(1)) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|p2s_data\(0),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|p2s_data\(1),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~4_combout\);

-- Location: LCCOMB_X17_Y15_N6
\u_spi_ee_config|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux4~0_combout\ = (\u_spi_ee_config|ini_index\(3)) # ((\u_spi_ee_config|ini_index\(0) & ((!\u_spi_ee_config|ini_index\(2)) # (!\u_spi_ee_config|ini_index\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(3),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(1),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux4~0_combout\);

-- Location: LCCOMB_X17_Y15_N22
\u_spi_ee_config|p2s_data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~10_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & ((\u_spi_ee_config|high_byte~q\))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|Mux4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|Mux4~0_combout\,
	datac => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|p2s_data~10_combout\);

-- Location: FF_X17_Y15_N23
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

-- Location: FF_X17_Y15_N11
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

-- Location: FF_X17_Y15_N29
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

-- Location: LCCOMB_X17_Y15_N28
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

-- Location: LCCOMB_X17_Y15_N26
\u_spi_ee_config|direction~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|direction~0_combout\ = \u_spi_ee_config|direction~q\ $ (((\u_spi_ee_config|high_byte_d~q\ & \u_spi_ee_config|low_byte_dataY[7]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte_d~q\,
	datab => \u_spi_ee_config|low_byte_dataY[7]~0_combout\,
	datac => \u_spi_ee_config|direction~q\,
	combout => \u_spi_ee_config|direction~0_combout\);

-- Location: FF_X17_Y15_N27
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

-- Location: LCCOMB_X17_Y15_N0
\u_spi_ee_config|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux3~0_combout\ = (\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(3) & (\u_spi_ee_config|ini_index\(1)))) # (!\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(3) $ 
-- (\u_spi_ee_config|ini_index\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(3),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(1),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux3~0_combout\);

-- Location: LCCOMB_X17_Y15_N24
\u_spi_ee_config|p2s_data~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~11_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|read_back~0_combout\ & (!\u_spi_ee_config|direction~q\))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (((\u_spi_ee_config|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|read_back~0_combout\,
	datac => \u_spi_ee_config|direction~q\,
	datad => \u_spi_ee_config|Mux3~0_combout\,
	combout => \u_spi_ee_config|p2s_data~11_combout\);

-- Location: FF_X17_Y15_N25
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

-- Location: LCCOMB_X16_Y15_N26
\u_spi_ee_config|u_spi_controller|Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~5_combout\ = (\u_spi_ee_config|u_spi_controller|Mux0~4_combout\ & (((\u_spi_ee_config|u_spi_controller|spi_count\(3)) # (\u_spi_ee_config|p2s_data\(9))))) # (!\u_spi_ee_config|u_spi_controller|Mux0~4_combout\ & 
-- (\u_spi_ee_config|p2s_data\(8) & (!\u_spi_ee_config|u_spi_controller|spi_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|Mux0~4_combout\,
	datab => \u_spi_ee_config|p2s_data\(8),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|p2s_data\(9),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~5_combout\);

-- Location: LCCOMB_X16_Y15_N2
\u_spi_ee_config|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux8~0_combout\ = (\u_spi_ee_config|ini_index\(2) & (((\u_spi_ee_config|ini_index\(3)) # (!\u_spi_ee_config|ini_index\(0))))) # (!\u_spi_ee_config|ini_index\(2) & (\u_spi_ee_config|ini_index\(1) & ((\u_spi_ee_config|ini_index\(0)) # 
-- (\u_spi_ee_config|ini_index\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux8~0_combout\);

-- Location: FF_X16_Y15_N3
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

-- Location: LCCOMB_X16_Y15_N28
\u_spi_ee_config|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux9~0_combout\ = (\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|ini_index\(3) & (\u_spi_ee_config|ini_index\(1) $ (\u_spi_ee_config|ini_index\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(1),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(3),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux9~0_combout\);

-- Location: FF_X16_Y15_N29
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

-- Location: LCCOMB_X17_Y15_N20
\u_spi_ee_config|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|Mux2~0_combout\ = (!\u_spi_ee_config|ini_index\(1) & ((\u_spi_ee_config|ini_index\(3) & (\u_spi_ee_config|ini_index\(0) & !\u_spi_ee_config|ini_index\(2))) # (!\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|ini_index\(3),
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|ini_index\(1),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|Mux2~0_combout\);

-- Location: LCCOMB_X17_Y15_N4
\u_spi_ee_config|p2s_data~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~9_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|direction~q\ & ((!\u_spi_ee_config|read_back~0_combout\)))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (((!\u_spi_ee_config|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|direction~q\,
	datab => \u_spi_ee_config|Mux2~0_combout\,
	datac => \u_spi_ee_config|read_back~0_combout\,
	datad => \u_spi_ee_config|LessThan0~0_combout\,
	combout => \u_spi_ee_config|p2s_data~9_combout\);

-- Location: FF_X17_Y15_N5
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

-- Location: LCCOMB_X16_Y15_N30
\u_spi_ee_config|u_spi_controller|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~2_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & ((\u_spi_ee_config|u_spi_controller|spi_count\(3) & (\u_spi_ee_config|p2s_data\(2))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- ((\u_spi_ee_config|p2s_data\(10)))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & (((!\u_spi_ee_config|u_spi_controller|spi_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|p2s_data\(2),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|p2s_data\(10),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~2_combout\);

-- Location: LCCOMB_X16_Y15_N16
\u_spi_ee_config|p2s_data~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~14_combout\ = (\u_spi_ee_config|ini_index\(3) & (!\u_spi_ee_config|ini_index\(0) & !\u_spi_ee_config|ini_index\(2))) # (!\u_spi_ee_config|ini_index\(3) & ((\u_spi_ee_config|ini_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|ini_index\(3),
	datac => \u_spi_ee_config|ini_index\(0),
	datad => \u_spi_ee_config|ini_index\(2),
	combout => \u_spi_ee_config|p2s_data~14_combout\);

-- Location: FF_X16_Y15_N17
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

-- Location: LCCOMB_X16_Y15_N18
\u_spi_ee_config|u_spi_controller|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~3_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & (((\u_spi_ee_config|u_spi_controller|Mux0~2_combout\)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- ((\u_spi_ee_config|u_spi_controller|Mux0~2_combout\ & ((\u_spi_ee_config|p2s_data\(11)))) # (!\u_spi_ee_config|u_spi_controller|Mux0~2_combout\ & (\u_spi_ee_config|p2s_data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datab => \u_spi_ee_config|p2s_data\(3),
	datac => \u_spi_ee_config|u_spi_controller|Mux0~2_combout\,
	datad => \u_spi_ee_config|p2s_data\(11),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~3_combout\);

-- Location: LCCOMB_X16_Y15_N12
\u_spi_ee_config|u_spi_controller|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~6_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(2) & ((\u_spi_ee_config|u_spi_controller|spi_count\(1) & (\u_spi_ee_config|u_spi_controller|Mux0~5_combout\)) # 
-- (!\u_spi_ee_config|u_spi_controller|spi_count\(1) & ((\u_spi_ee_config|u_spi_controller|Mux0~3_combout\))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(2) & (((!\u_spi_ee_config|u_spi_controller|spi_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|Mux0~5_combout\,
	datab => \u_spi_ee_config|u_spi_controller|Mux0~3_combout\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~6_combout\);

-- Location: LCCOMB_X17_Y16_N4
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

-- Location: LCCOMB_X17_Y16_N8
\u_spi_ee_config|u_spi_controller|temp_xhdl7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & ((!\u_spi_ee_config|p2s_data\(15)) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
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

-- Location: LCCOMB_X17_Y16_N22
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

-- Location: LCCOMB_X25_Y22_N0
\u_vga|Add19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~0_combout\ = \u_vga|h_cnt\(0) $ (VCC)
-- \u_vga|Add19~1\ = CARRY(\u_vga|h_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(0),
	datad => VCC,
	combout => \u_vga|Add19~0_combout\,
	cout => \u_vga|Add19~1\);

-- Location: FF_X25_Y22_N1
\u_vga|h_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add19~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(0));

-- Location: LCCOMB_X25_Y22_N2
\u_vga|Add19~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~2_combout\ = (\u_vga|h_cnt\(1) & (!\u_vga|Add19~1\)) # (!\u_vga|h_cnt\(1) & ((\u_vga|Add19~1\) # (GND)))
-- \u_vga|Add19~3\ = CARRY((!\u_vga|Add19~1\) # (!\u_vga|h_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(1),
	datad => VCC,
	cin => \u_vga|Add19~1\,
	combout => \u_vga|Add19~2_combout\,
	cout => \u_vga|Add19~3\);

-- Location: FF_X25_Y22_N3
\u_vga|h_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add19~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(1));

-- Location: LCCOMB_X25_Y22_N4
\u_vga|Add19~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~4_combout\ = (\u_vga|h_cnt\(2) & (\u_vga|Add19~3\ $ (GND))) # (!\u_vga|h_cnt\(2) & (!\u_vga|Add19~3\ & VCC))
-- \u_vga|Add19~5\ = CARRY((\u_vga|h_cnt\(2) & !\u_vga|Add19~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(2),
	datad => VCC,
	cin => \u_vga|Add19~3\,
	combout => \u_vga|Add19~4_combout\,
	cout => \u_vga|Add19~5\);

-- Location: FF_X25_Y22_N5
\u_vga|h_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add19~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(2));

-- Location: LCCOMB_X25_Y22_N6
\u_vga|Add19~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~6_combout\ = (\u_vga|h_cnt\(3) & (!\u_vga|Add19~5\)) # (!\u_vga|h_cnt\(3) & ((\u_vga|Add19~5\) # (GND)))
-- \u_vga|Add19~7\ = CARRY((!\u_vga|Add19~5\) # (!\u_vga|h_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datad => VCC,
	cin => \u_vga|Add19~5\,
	combout => \u_vga|Add19~6_combout\,
	cout => \u_vga|Add19~7\);

-- Location: FF_X25_Y22_N23
\u_vga|h_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|Add19~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(3));

-- Location: LCCOMB_X25_Y22_N8
\u_vga|Add19~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~8_combout\ = (\u_vga|h_cnt\(4) & (\u_vga|Add19~7\ $ (GND))) # (!\u_vga|h_cnt\(4) & (!\u_vga|Add19~7\ & VCC))
-- \u_vga|Add19~9\ = CARRY((\u_vga|h_cnt\(4) & !\u_vga|Add19~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datad => VCC,
	cin => \u_vga|Add19~7\,
	combout => \u_vga|Add19~8_combout\,
	cout => \u_vga|Add19~9\);

-- Location: LCCOMB_X25_Y22_N10
\u_vga|Add19~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~10_combout\ = (\u_vga|h_cnt\(5) & (!\u_vga|Add19~9\)) # (!\u_vga|h_cnt\(5) & ((\u_vga|Add19~9\) # (GND)))
-- \u_vga|Add19~11\ = CARRY((!\u_vga|Add19~9\) # (!\u_vga|h_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|Add19~9\,
	combout => \u_vga|Add19~10_combout\,
	cout => \u_vga|Add19~11\);

-- Location: FF_X25_Y22_N27
\u_vga|h_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|Add19~10_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(5));

-- Location: LCCOMB_X25_Y22_N12
\u_vga|Add19~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~12_combout\ = (\u_vga|h_cnt\(6) & (\u_vga|Add19~11\ $ (GND))) # (!\u_vga|h_cnt\(6) & (!\u_vga|Add19~11\ & VCC))
-- \u_vga|Add19~13\ = CARRY((\u_vga|h_cnt\(6) & !\u_vga|Add19~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datad => VCC,
	cin => \u_vga|Add19~11\,
	combout => \u_vga|Add19~12_combout\,
	cout => \u_vga|Add19~13\);

-- Location: FF_X25_Y22_N25
\u_vga|h_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|Add19~12_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(6));

-- Location: LCCOMB_X25_Y22_N14
\u_vga|Add19~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~14_combout\ = (\u_vga|h_cnt\(7) & (!\u_vga|Add19~13\)) # (!\u_vga|h_cnt\(7) & ((\u_vga|Add19~13\) # (GND)))
-- \u_vga|Add19~15\ = CARRY((!\u_vga|Add19~13\) # (!\u_vga|h_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|Add19~13\,
	combout => \u_vga|Add19~14_combout\,
	cout => \u_vga|Add19~15\);

-- Location: FF_X25_Y22_N15
\u_vga|h_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add19~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(7));

-- Location: LCCOMB_X25_Y22_N16
\u_vga|Add19~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~16_combout\ = (\u_vga|h_cnt\(8) & (\u_vga|Add19~15\ $ (GND))) # (!\u_vga|h_cnt\(8) & (!\u_vga|Add19~15\ & VCC))
-- \u_vga|Add19~17\ = CARRY((\u_vga|h_cnt\(8) & !\u_vga|Add19~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(8),
	datad => VCC,
	cin => \u_vga|Add19~15\,
	combout => \u_vga|Add19~16_combout\,
	cout => \u_vga|Add19~17\);

-- Location: FF_X25_Y22_N17
\u_vga|h_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add19~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(8));

-- Location: LCCOMB_X25_Y22_N18
\u_vga|Add19~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~18_combout\ = (\u_vga|h_cnt\(9) & (!\u_vga|Add19~17\)) # (!\u_vga|h_cnt\(9) & ((\u_vga|Add19~17\) # (GND)))
-- \u_vga|Add19~19\ = CARRY((!\u_vga|Add19~17\) # (!\u_vga|h_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datad => VCC,
	cin => \u_vga|Add19~17\,
	combout => \u_vga|Add19~18_combout\,
	cout => \u_vga|Add19~19\);

-- Location: FF_X25_Y22_N19
\u_vga|h_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add19~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(9));

-- Location: LCCOMB_X25_Y22_N20
\u_vga|Add19~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~20_combout\ = \u_vga|Add19~19\ $ (!\u_vga|h_cnt\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|h_cnt\(10),
	cin => \u_vga|Add19~19\,
	combout => \u_vga|Add19~20_combout\);

-- Location: LCCOMB_X25_Y22_N28
\u_vga|h_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|h_cnt~1_combout\ = (\u_vga|Add19~20_combout\ & \u_vga|Equal14~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add19~20_combout\,
	datad => \u_vga|Equal14~0_combout\,
	combout => \u_vga|h_cnt~1_combout\);

-- Location: FF_X25_Y22_N29
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

-- Location: LCCOMB_X21_Y22_N28
\u_vga|LessThan23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan23~2_combout\ = (\u_vga|h_cnt\(3) & (\u_vga|h_cnt\(1) & (\u_vga|h_cnt\(0) & \u_vga|h_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|h_cnt\(0),
	datad => \u_vga|h_cnt\(2),
	combout => \u_vga|LessThan23~2_combout\);

-- Location: LCCOMB_X26_Y22_N2
\u_vga|LessThan23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan23~0_combout\ = (!\u_vga|h_cnt\(7) & (!\u_vga|h_cnt\(6) & !\u_vga|h_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(7),
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|h_cnt\(5),
	combout => \u_vga|LessThan23~0_combout\);

-- Location: LCCOMB_X26_Y22_N26
\u_vga|Equal14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal14~0_combout\ = (((!\u_vga|LessThan23~0_combout\) # (!\u_vga|LessThan23~2_combout\)) # (!\u_vga|h_cnt\(10))) # (!\u_vga|LessThan23~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan23~1_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|LessThan23~2_combout\,
	datad => \u_vga|LessThan23~0_combout\,
	combout => \u_vga|Equal14~0_combout\);

-- Location: LCCOMB_X25_Y22_N30
\u_vga|h_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|h_cnt~0_combout\ = (\u_vga|Add19~8_combout\ & \u_vga|Equal14~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add19~8_combout\,
	datad => \u_vga|Equal14~0_combout\,
	combout => \u_vga|h_cnt~0_combout\);

-- Location: FF_X25_Y22_N31
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

-- Location: LCCOMB_X26_Y22_N6
\u_vga|LessThan23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan23~1_combout\ = (!\u_vga|h_cnt\(4) & (!\u_vga|h_cnt\(8) & !\u_vga|h_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|h_cnt\(9),
	combout => \u_vga|LessThan23~1_combout\);

-- Location: LCCOMB_X26_Y22_N8
\u_vga|vga_gen~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~47_combout\ = ((\u_vga|LessThan23~1_combout\ & (!\u_vga|LessThan23~2_combout\ & \u_vga|LessThan23~0_combout\))) # (!\u_vga|h_cnt\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan23~1_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|LessThan23~2_combout\,
	datad => \u_vga|LessThan23~0_combout\,
	combout => \u_vga|vga_gen~47_combout\);

-- Location: LCCOMB_X27_Y24_N6
\u_vga|Add20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~0_combout\ = \u_vga|v_cnt\(0) $ (VCC)
-- \u_vga|Add20~1\ = CARRY(\u_vga|v_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(0),
	datad => VCC,
	combout => \u_vga|Add20~0_combout\,
	cout => \u_vga|Add20~1\);

-- Location: LCCOMB_X28_Y24_N12
\u_vga|v_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~11_combout\ = (\u_vga|Add20~0_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~47_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|Add20~0_combout\,
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt~11_combout\);

-- Location: FF_X28_Y24_N13
\u_vga|v_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~11_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(0));

-- Location: LCCOMB_X27_Y24_N8
\u_vga|Add20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~2_combout\ = (\u_vga|v_cnt\(1) & (!\u_vga|Add20~1\)) # (!\u_vga|v_cnt\(1) & ((\u_vga|Add20~1\) # (GND)))
-- \u_vga|Add20~3\ = CARRY((!\u_vga|Add20~1\) # (!\u_vga|v_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(1),
	datad => VCC,
	cin => \u_vga|Add20~1\,
	combout => \u_vga|Add20~2_combout\,
	cout => \u_vga|Add20~3\);

-- Location: LCCOMB_X28_Y24_N0
\u_vga|v_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~9_combout\ = (\u_vga|Add20~2_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add20~2_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|vga_gen~47_combout\,
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt~9_combout\);

-- Location: FF_X28_Y24_N1
\u_vga|v_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~9_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(1));

-- Location: LCCOMB_X27_Y24_N10
\u_vga|Add20~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~4_combout\ = (\u_vga|v_cnt\(2) & (\u_vga|Add20~3\ $ (GND))) # (!\u_vga|v_cnt\(2) & (!\u_vga|Add20~3\ & VCC))
-- \u_vga|Add20~5\ = CARRY((\u_vga|v_cnt\(2) & !\u_vga|Add20~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(2),
	datad => VCC,
	cin => \u_vga|Add20~3\,
	combout => \u_vga|Add20~4_combout\,
	cout => \u_vga|Add20~5\);

-- Location: LCCOMB_X28_Y24_N14
\u_vga|v_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~8_combout\ = (\u_vga|Add20~4_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add20~4_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|vga_gen~47_combout\,
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt~8_combout\);

-- Location: FF_X28_Y24_N15
\u_vga|v_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~8_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(2));

-- Location: LCCOMB_X27_Y24_N12
\u_vga|Add20~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~6_combout\ = (\u_vga|v_cnt\(3) & (!\u_vga|Add20~5\)) # (!\u_vga|v_cnt\(3) & ((\u_vga|Add20~5\) # (GND)))
-- \u_vga|Add20~7\ = CARRY((!\u_vga|Add20~5\) # (!\u_vga|v_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(3),
	datad => VCC,
	cin => \u_vga|Add20~5\,
	combout => \u_vga|Add20~6_combout\,
	cout => \u_vga|Add20~7\);

-- Location: LCCOMB_X27_Y24_N0
\u_vga|v_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~7_combout\ = (\u_vga|Add20~6_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add20~6_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|vga_gen~49_combout\,
	datad => \u_vga|vga_gen~47_combout\,
	combout => \u_vga|v_cnt~7_combout\);

-- Location: FF_X27_Y24_N1
\u_vga|v_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~7_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(3));

-- Location: LCCOMB_X27_Y24_N14
\u_vga|Add20~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~8_combout\ = (\u_vga|v_cnt\(4) & (\u_vga|Add20~7\ $ (GND))) # (!\u_vga|v_cnt\(4) & (!\u_vga|Add20~7\ & VCC))
-- \u_vga|Add20~9\ = CARRY((\u_vga|v_cnt\(4) & !\u_vga|Add20~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(4),
	datad => VCC,
	cin => \u_vga|Add20~7\,
	combout => \u_vga|Add20~8_combout\,
	cout => \u_vga|Add20~9\);

-- Location: LCCOMB_X28_Y24_N28
\u_vga|v_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~6_combout\ = (\u_vga|Add20~8_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add20~8_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|vga_gen~47_combout\,
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt~6_combout\);

-- Location: FF_X28_Y24_N29
\u_vga|v_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~6_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(4));

-- Location: LCCOMB_X26_Y23_N0
\u_vga|update_elements_position~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~0_combout\ = (\u_vga|v_cnt\(4) & \u_vga|v_cnt\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datad => \u_vga|v_cnt\(3),
	combout => \u_vga|update_elements_position~0_combout\);

-- Location: LCCOMB_X27_Y24_N16
\u_vga|Add20~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~10_combout\ = (\u_vga|v_cnt\(5) & (!\u_vga|Add20~9\)) # (!\u_vga|v_cnt\(5) & ((\u_vga|Add20~9\) # (GND)))
-- \u_vga|Add20~11\ = CARRY((!\u_vga|Add20~9\) # (!\u_vga|v_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(5),
	datad => VCC,
	cin => \u_vga|Add20~9\,
	combout => \u_vga|Add20~10_combout\,
	cout => \u_vga|Add20~11\);

-- Location: LCCOMB_X27_Y24_N18
\u_vga|Add20~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~12_combout\ = (\u_vga|v_cnt\(6) & (\u_vga|Add20~11\ $ (GND))) # (!\u_vga|v_cnt\(6) & (!\u_vga|Add20~11\ & VCC))
-- \u_vga|Add20~13\ = CARRY((\u_vga|v_cnt\(6) & !\u_vga|Add20~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datad => VCC,
	cin => \u_vga|Add20~11\,
	combout => \u_vga|Add20~12_combout\,
	cout => \u_vga|Add20~13\);

-- Location: LCCOMB_X28_Y24_N26
\u_vga|v_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~5_combout\ = (\u_vga|Add20~12_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~47_combout\,
	datab => \u_vga|Add20~12_combout\,
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt~5_combout\);

-- Location: FF_X28_Y24_N27
\u_vga|v_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~5_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(6));

-- Location: LCCOMB_X27_Y24_N28
\u_vga|vga_gen~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~32_combout\ = (!\u_vga|v_cnt\(1) & (!\u_vga|v_cnt\(0) & !\u_vga|v_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(0),
	datad => \u_vga|v_cnt\(2),
	combout => \u_vga|vga_gen~32_combout\);

-- Location: LCCOMB_X26_Y24_N2
\u_vga|vga_gen~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~48_combout\ = (!\u_vga|v_cnt\(5) & (!\u_vga|v_cnt\(6) & ((\u_vga|vga_gen~32_combout\) # (!\u_vga|update_elements_position~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|update_elements_position~0_combout\,
	datac => \u_vga|v_cnt\(6),
	datad => \u_vga|vga_gen~32_combout\,
	combout => \u_vga|vga_gen~48_combout\);

-- Location: LCCOMB_X28_Y24_N4
\u_vga|vga_gen~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~50_combout\ = (\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~47_combout\,
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|vga_gen~50_combout\);

-- Location: LCCOMB_X27_Y24_N20
\u_vga|Add20~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~14_combout\ = (\u_vga|v_cnt\(7) & (!\u_vga|Add20~13\)) # (!\u_vga|v_cnt\(7) & ((\u_vga|Add20~13\) # (GND)))
-- \u_vga|Add20~15\ = CARRY((!\u_vga|Add20~13\) # (!\u_vga|v_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datad => VCC,
	cin => \u_vga|Add20~13\,
	combout => \u_vga|Add20~14_combout\,
	cout => \u_vga|Add20~15\);

-- Location: LCCOMB_X28_Y24_N16
\u_vga|v_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~4_combout\ = (\u_vga|Add20~14_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~47_combout\,
	datab => \u_vga|Add20~14_combout\,
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt~4_combout\);

-- Location: FF_X28_Y24_N17
\u_vga|v_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~4_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(7));

-- Location: LCCOMB_X27_Y24_N22
\u_vga|Add20~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~16_combout\ = (\u_vga|v_cnt\(8) & (\u_vga|Add20~15\ $ (GND))) # (!\u_vga|v_cnt\(8) & (!\u_vga|Add20~15\ & VCC))
-- \u_vga|Add20~17\ = CARRY((\u_vga|v_cnt\(8) & !\u_vga|Add20~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(8),
	datad => VCC,
	cin => \u_vga|Add20~15\,
	combout => \u_vga|Add20~16_combout\,
	cout => \u_vga|Add20~17\);

-- Location: LCCOMB_X28_Y24_N20
\u_vga|v_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~3_combout\ = (\u_vga|Add20~16_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~47_combout\,
	datab => \u_vga|Add20~16_combout\,
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt~3_combout\);

-- Location: FF_X28_Y24_N21
\u_vga|v_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~3_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(8));

-- Location: LCCOMB_X27_Y24_N24
\u_vga|Add20~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~18_combout\ = (\u_vga|v_cnt\(9) & (!\u_vga|Add20~17\)) # (!\u_vga|v_cnt\(9) & ((\u_vga|Add20~17\) # (GND)))
-- \u_vga|Add20~19\ = CARRY((!\u_vga|Add20~17\) # (!\u_vga|v_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datad => VCC,
	cin => \u_vga|Add20~17\,
	combout => \u_vga|Add20~18_combout\,
	cout => \u_vga|Add20~19\);

-- Location: LCCOMB_X28_Y24_N2
\u_vga|v_cnt[9]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[9]~2_combout\ = (\u_vga|v_cnt[7]~0_combout\ & (\u_vga|vga_gen~50_combout\ & ((\u_vga|Add20~18_combout\)))) # (!\u_vga|v_cnt[7]~0_combout\ & (((\u_vga|v_cnt\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt[7]~0_combout\,
	datab => \u_vga|vga_gen~50_combout\,
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|Add20~18_combout\,
	combout => \u_vga|v_cnt[9]~2_combout\);

-- Location: FF_X28_Y24_N3
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

-- Location: LCCOMB_X29_Y24_N2
\u_vga|vga_gen~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~49_combout\ = ((!\u_vga|v_cnt\(8) & ((\u_vga|vga_gen~48_combout\) # (!\u_vga|v_cnt\(7))))) # (!\u_vga|v_cnt\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~48_combout\,
	datab => \u_vga|v_cnt\(9),
	datac => \u_vga|v_cnt\(7),
	datad => \u_vga|v_cnt\(8),
	combout => \u_vga|vga_gen~49_combout\);

-- Location: LCCOMB_X28_Y24_N22
\u_vga|v_cnt[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[7]~0_combout\ = ((!\u_vga|vga_gen~47_combout\ & ((\u_vga|v_cnt\(10)) # (!\u_vga|vga_gen~49_combout\)))) # (!\u_vga|Equal14~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~47_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|Equal14~0_combout\,
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt[7]~0_combout\);

-- Location: LCCOMB_X27_Y24_N26
\u_vga|Add20~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add20~20_combout\ = \u_vga|v_cnt\(10) $ (!\u_vga|Add20~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(10),
	cin => \u_vga|Add20~19\,
	combout => \u_vga|Add20~20_combout\);

-- Location: LCCOMB_X28_Y24_N8
\u_vga|v_cnt[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[10]~1_combout\ = (\u_vga|v_cnt[7]~0_combout\ & (\u_vga|vga_gen~50_combout\ & ((\u_vga|Add20~20_combout\)))) # (!\u_vga|v_cnt[7]~0_combout\ & (((\u_vga|v_cnt\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt[7]~0_combout\,
	datab => \u_vga|vga_gen~50_combout\,
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|Add20~20_combout\,
	combout => \u_vga|v_cnt[10]~1_combout\);

-- Location: FF_X28_Y24_N9
\u_vga|v_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(10));

-- Location: LCCOMB_X28_Y24_N10
\u_vga|v_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~10_combout\ = (\u_vga|Add20~10_combout\ & ((\u_vga|vga_gen~47_combout\) # ((!\u_vga|v_cnt\(10) & \u_vga|vga_gen~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~47_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|Add20~10_combout\,
	datad => \u_vga|vga_gen~49_combout\,
	combout => \u_vga|v_cnt~10_combout\);

-- Location: FF_X28_Y24_N11
\u_vga|v_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~10_combout\,
	ena => \u_vga|v_cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(5));

-- Location: LCCOMB_X26_Y24_N6
\u_vga|vga_gen~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~7_combout\ = (\u_vga|v_cnt\(5) & (((!\u_vga|v_cnt\(1) & !\u_vga|v_cnt\(2))) # (!\u_vga|v_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|v_cnt\(3),
	datac => \u_vga|v_cnt\(1),
	datad => \u_vga|v_cnt\(2),
	combout => \u_vga|vga_gen~7_combout\);

-- Location: LCCOMB_X26_Y24_N4
\u_vga|vga_gen~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~6_combout\ = (!\u_vga|v_cnt\(5) & (\u_vga|update_elements_position~0_combout\ & (\u_vga|v_cnt\(1) & \u_vga|v_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|update_elements_position~0_combout\,
	datac => \u_vga|v_cnt\(1),
	datad => \u_vga|v_cnt\(2),
	combout => \u_vga|vga_gen~6_combout\);

-- Location: LCCOMB_X26_Y22_N10
\u_vga|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~0_combout\ = (!\u_vga|h_cnt\(4) & (!\u_vga|h_cnt\(6) & !\u_vga|h_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|h_cnt\(5),
	combout => \u_vga|Mux2~0_combout\);

-- Location: LCCOMB_X26_Y22_N4
\u_vga|LessThan17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan17~0_combout\ = (\u_vga|h_cnt\(7) & (\u_vga|h_cnt\(8) & !\u_vga|Mux2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(7),
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|Mux2~0_combout\,
	combout => \u_vga|LessThan17~0_combout\);

-- Location: LCCOMB_X28_Y24_N6
\u_vga|Equal7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal7~0_combout\ = (!\u_vga|v_cnt\(9) & (!\u_vga|v_cnt\(10) & !\u_vga|v_cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(9),
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|v_cnt\(8),
	combout => \u_vga|Equal7~0_combout\);

-- Location: LCCOMB_X26_Y24_N24
\u_vga|vga_gen~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~4_combout\ = (!\u_vga|v_cnt\(6) & (!\u_vga|v_cnt\(7) & !\u_vga|h_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|h_cnt\(9),
	combout => \u_vga|vga_gen~4_combout\);

-- Location: LCCOMB_X26_Y24_N10
\u_vga|vga_gen~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~5_combout\ = (!\u_vga|LessThan17~0_combout\ & (\u_vga|Equal7~0_combout\ & (!\u_vga|h_cnt\(10) & \u_vga|vga_gen~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan17~0_combout\,
	datab => \u_vga|Equal7~0_combout\,
	datac => \u_vga|h_cnt\(10),
	datad => \u_vga|vga_gen~4_combout\,
	combout => \u_vga|vga_gen~5_combout\);

-- Location: LCCOMB_X26_Y24_N8
\u_vga|vga_gen~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~8_combout\ = (\u_vga|vga_gen~5_combout\ & ((\u_vga|vga_gen~6_combout\) # ((\u_vga|vga_gen~7_combout\ & !\u_vga|v_cnt\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~7_combout\,
	datab => \u_vga|vga_gen~6_combout\,
	datac => \u_vga|v_cnt\(4),
	datad => \u_vga|vga_gen~5_combout\,
	combout => \u_vga|vga_gen~8_combout\);

-- Location: LCCOMB_X18_Y22_N28
\u_vga|Equal8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal8~0_combout\ = (!\u_vga|h_cnt\(0) & !\u_vga|h_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(0),
	datac => \u_vga|h_cnt\(1),
	combout => \u_vga|Equal8~0_combout\);

-- Location: LCCOMB_X26_Y24_N18
\u_vga|vga_gen~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~9_combout\ = (\u_vga|v_cnt\(3) & (!\u_vga|v_cnt\(4) & ((\u_vga|v_cnt\(1)) # (\u_vga|v_cnt\(2))))) # (!\u_vga|v_cnt\(3) & (\u_vga|v_cnt\(4) & ((!\u_vga|v_cnt\(2)) # (!\u_vga|v_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(1),
	datab => \u_vga|v_cnt\(3),
	datac => \u_vga|v_cnt\(4),
	datad => \u_vga|v_cnt\(2),
	combout => \u_vga|vga_gen~9_combout\);

-- Location: LCCOMB_X26_Y24_N12
\u_vga|vga_gen~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~10_combout\ = (!\u_vga|v_cnt\(5) & (\u_vga|vga_gen~9_combout\ & \u_vga|vga_gen~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|vga_gen~9_combout\,
	datad => \u_vga|vga_gen~5_combout\,
	combout => \u_vga|vga_gen~10_combout\);

-- Location: LCCOMB_X27_Y22_N12
\u_vga|red_signal~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~2_combout\ = (!\u_vga|h_cnt\(2) & (\u_vga|Equal8~0_combout\ & ((\u_vga|vga_gen~8_combout\) # (\u_vga|vga_gen~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~8_combout\,
	datab => \u_vga|h_cnt\(2),
	datac => \u_vga|Equal8~0_combout\,
	datad => \u_vga|vga_gen~10_combout\,
	combout => \u_vga|red_signal~2_combout\);

-- Location: LCCOMB_X26_Y22_N0
\u_vga|LessThan26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan26~0_combout\ = (!\u_vga|h_cnt\(10) & (((\u_vga|LessThan23~0_combout\) # (!\u_vga|h_cnt\(8))) # (!\u_vga|h_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(9),
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|LessThan23~0_combout\,
	combout => \u_vga|LessThan26~0_combout\);

-- Location: LCCOMB_X26_Y24_N22
\u_vga|LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~0_combout\ = (\u_vga|v_cnt\(5) & ((\u_vga|v_cnt\(3)) # ((\u_vga|v_cnt\(4)) # (!\u_vga|vga_gen~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|v_cnt\(3),
	datac => \u_vga|v_cnt\(4),
	datad => \u_vga|vga_gen~32_combout\,
	combout => \u_vga|LessThan4~0_combout\);

-- Location: LCCOMB_X26_Y24_N16
\u_vga|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan4~1_combout\ = ((\u_vga|v_cnt\(7) & ((\u_vga|v_cnt\(6)) # (\u_vga|LessThan4~0_combout\)))) # (!\u_vga|Equal7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|Equal7~0_combout\,
	datad => \u_vga|LessThan4~0_combout\,
	combout => \u_vga|LessThan4~1_combout\);

-- Location: LCCOMB_X27_Y22_N10
\u_vga|red_signal~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~6_combout\ = (\u_vga|red_signal~q\ & ((\u_vga|LessThan4~1_combout\) # (!\u_vga|LessThan26~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan26~0_combout\,
	datab => \u_vga|LessThan4~1_combout\,
	datac => \u_vga|red_signal~q\,
	combout => \u_vga|red_signal~6_combout\);

-- Location: LCCOMB_X26_Y23_N6
\u_vga|vga_gen~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~45_combout\ = (\u_vga|v_cnt\(2) & (\u_vga|v_cnt\(7))) # (!\u_vga|v_cnt\(2) & ((\u_vga|v_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(6),
	datad => \u_vga|v_cnt\(2),
	combout => \u_vga|vga_gen~45_combout\);

-- Location: LCCOMB_X27_Y24_N2
\u_vga|Equal7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal7~1_combout\ = (!\u_vga|v_cnt\(3) & (!\u_vga|v_cnt\(5) & !\u_vga|v_cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(3),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|v_cnt\(4),
	combout => \u_vga|Equal7~1_combout\);

-- Location: LCCOMB_X27_Y24_N4
\u_vga|vga_gen~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~43_combout\ = (!\u_vga|v_cnt\(6) & (((\u_vga|v_cnt\(1) & \u_vga|v_cnt\(0))) # (!\u_vga|Equal7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(0),
	datad => \u_vga|Equal7~1_combout\,
	combout => \u_vga|vga_gen~43_combout\);

-- Location: LCCOMB_X26_Y23_N4
\u_vga|vga_gen~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~44_combout\ = (!\u_vga|v_cnt\(7) & (((!\u_vga|v_cnt\(3)) # (!\u_vga|v_cnt\(5))) # (!\u_vga|v_cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|v_cnt\(3),
	combout => \u_vga|vga_gen~44_combout\);

-- Location: LCCOMB_X29_Y24_N24
\u_vga|update_elements_position~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~1_combout\ = (!\u_vga|v_cnt\(10) & (!\u_vga|v_cnt\(8) & \u_vga|v_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(10),
	datab => \u_vga|v_cnt\(8),
	datad => \u_vga|v_cnt\(9),
	combout => \u_vga|update_elements_position~1_combout\);

-- Location: LCCOMB_X26_Y23_N10
\u_vga|vga_gen~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~46_combout\ = (\u_vga|vga_gen~45_combout\) # ((\u_vga|vga_gen~43_combout\) # ((\u_vga|vga_gen~44_combout\) # (!\u_vga|update_elements_position~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~45_combout\,
	datab => \u_vga|vga_gen~43_combout\,
	datac => \u_vga|vga_gen~44_combout\,
	datad => \u_vga|update_elements_position~1_combout\,
	combout => \u_vga|vga_gen~46_combout\);

-- Location: FF_X26_Y23_N11
\u_vga|v_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \u_vga|vga_gen~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_sync~q\);

-- Location: CLKCTRL_G10
\u_vga|v_sync~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_vga|v_sync~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_vga|v_sync~clkctrl_outclk\);

-- Location: FF_X19_Y19_N27
\u_vga|old_magn_g_y[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(8));

-- Location: LCCOMB_X20_Y19_N16
\u_vga|Add9~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~16_combout\ = (\u_vga|old_magn_g_y\(8) & (\u_vga|Add9~15\ $ (GND))) # (!\u_vga|old_magn_g_y\(8) & (!\u_vga|Add9~15\ & VCC))
-- \u_vga|Add9~17\ = CARRY((\u_vga|old_magn_g_y\(8) & !\u_vga|Add9~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(8),
	datad => VCC,
	cin => \u_vga|Add9~15\,
	combout => \u_vga|Add9~16_combout\,
	cout => \u_vga|Add9~17\);

-- Location: LCCOMB_X17_Y15_N14
\u_spi_ee_config|oDATA_YH_xhdl2[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\ = (\u_spi_ee_config|high_byte_d~q\ & (\u_spi_ee_config|direction~q\ & \u_spi_ee_config|low_byte_dataY[7]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte_d~q\,
	datac => \u_spi_ee_config|direction~q\,
	datad => \u_spi_ee_config|low_byte_dataY[7]~0_combout\,
	combout => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\);

-- Location: FF_X18_Y16_N17
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YH_xhdl2\(0));

-- Location: FF_X18_Y16_N1
\u_spi_ee_config|oDATA_YH_xhdl2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1),
	sload => VCC,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YH_xhdl2\(1));

-- Location: LCCOMB_X17_Y16_N24
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[7]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6),
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[7]~feeder_combout\);

-- Location: FF_X17_Y16_N25
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[7]~feeder_combout\,
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(7));

-- Location: LCCOMB_X18_Y16_N20
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

-- Location: LCCOMB_X17_Y15_N10
\u_spi_ee_config|low_byte_dataY[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[7]~1_combout\ = (\u_spi_ee_config|direction~q\ & (!\u_spi_ee_config|high_byte_d~q\ & \u_spi_ee_config|low_byte_dataY[7]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|direction~q\,
	datac => \u_spi_ee_config|high_byte_d~q\,
	datad => \u_spi_ee_config|low_byte_dataY[7]~0_combout\,
	combout => \u_spi_ee_config|low_byte_dataY[7]~1_combout\);

-- Location: FF_X18_Y16_N21
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

-- Location: FF_X18_Y16_N15
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(7));

-- Location: LCCOMB_X17_Y16_N0
\u_spi_ee_config|low_byte_dataY[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[6]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6),
	combout => \u_spi_ee_config|low_byte_dataY[6]~feeder_combout\);

-- Location: FF_X17_Y16_N1
\u_spi_ee_config|low_byte_dataY[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_dataY[6]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(6));

-- Location: FF_X18_Y16_N13
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(6));

-- Location: LCCOMB_X18_Y16_N26
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

-- Location: FF_X18_Y16_N27
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

-- Location: FF_X18_Y16_N11
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(5));

-- Location: LCCOMB_X17_Y16_N26
\u_spi_ee_config|low_byte_dataY[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[4]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(4),
	combout => \u_spi_ee_config|low_byte_dataY[4]~feeder_combout\);

-- Location: FF_X17_Y16_N27
\u_spi_ee_config|low_byte_dataY[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_dataY[4]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(4));

-- Location: FF_X18_Y16_N9
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(4));

-- Location: FF_X18_Y16_N25
\u_spi_ee_config|low_byte_dataY[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(3),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(3));

-- Location: FF_X18_Y16_N7
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(3));

-- Location: LCCOMB_X18_Y16_N22
\u_spi_ee_config|low_byte_dataY[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[2]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(2),
	combout => \u_spi_ee_config|low_byte_dataY[2]~feeder_combout\);

-- Location: FF_X18_Y16_N23
\u_spi_ee_config|low_byte_dataY[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_dataY[2]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(2));

-- Location: FF_X18_Y16_N5
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(2));

-- Location: FF_X18_Y16_N29
\u_spi_ee_config|low_byte_dataY[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(1),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(1));

-- Location: FF_X18_Y16_N3
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(1));

-- Location: FF_X18_Y16_N31
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

-- Location: FF_X18_Y16_N19
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
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YL_xhdl1\(0));

-- Location: LCCOMB_X18_Y16_N18
\u_vga|Add8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~0_combout\ = \u_spi_ee_config|oDATA_YL_xhdl1\(0) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|oDATA_YL_xhdl1\(0),
	datad => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	combout => \u_vga|Add8~0_combout\);

-- Location: LCCOMB_X18_Y16_N0
\u_vga|Add8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~1_combout\ = (\u_vga|Add8~0_combout\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (VCC))) # (!\u_vga|Add8~0_combout\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & VCC))
-- \u_vga|Add8~2\ = CARRY((\u_vga|Add8~0_combout\ & \u_spi_ee_config|oDATA_YH_xhdl2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~0_combout\,
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	combout => \u_vga|Add8~1_combout\,
	cout => \u_vga|Add8~2\);

-- Location: LCCOMB_X18_Y16_N2
\u_vga|Add8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~3_combout\ = (\u_vga|Add8~2\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ ((!\u_spi_ee_config|oDATA_YL_xhdl1\(1))))) # (!\u_vga|Add8~2\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(1))) # (GND)))
-- \u_vga|Add8~4\ = CARRY((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (!\u_spi_ee_config|oDATA_YL_xhdl1\(1))) # (!\u_vga|Add8~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(1),
	datad => VCC,
	cin => \u_vga|Add8~2\,
	combout => \u_vga|Add8~3_combout\,
	cout => \u_vga|Add8~4\);

-- Location: LCCOMB_X18_Y16_N4
\u_vga|Add8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~5_combout\ = (\u_vga|Add8~4\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(2))))) # (!\u_vga|Add8~4\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(2) $ (VCC))))
-- \u_vga|Add8~6\ = CARRY((!\u_vga|Add8~4\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(2),
	datad => VCC,
	cin => \u_vga|Add8~4\,
	combout => \u_vga|Add8~5_combout\,
	cout => \u_vga|Add8~6\);

-- Location: LCCOMB_X18_Y16_N6
\u_vga|Add8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~7_combout\ = (\u_vga|Add8~6\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(3) $ ((!\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add8~6\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(3) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (GND)))
-- \u_vga|Add8~8\ = CARRY((\u_spi_ee_config|oDATA_YL_xhdl1\(3) $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (!\u_vga|Add8~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(3),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add8~6\,
	combout => \u_vga|Add8~7_combout\,
	cout => \u_vga|Add8~8\);

-- Location: LCCOMB_X18_Y16_N8
\u_vga|Add8~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~9_combout\ = (\u_vga|Add8~8\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(4) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add8~8\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(4) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (VCC))))
-- \u_vga|Add8~10\ = CARRY((!\u_vga|Add8~8\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(4) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(4),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add8~8\,
	combout => \u_vga|Add8~9_combout\,
	cout => \u_vga|Add8~10\);

-- Location: LCCOMB_X18_Y16_N10
\u_vga|Add8~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~11_combout\ = (\u_vga|Add8~10\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(5) $ ((!\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add8~10\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(5) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (GND)))
-- \u_vga|Add8~12\ = CARRY((\u_spi_ee_config|oDATA_YL_xhdl1\(5) $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (!\u_vga|Add8~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(5),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add8~10\,
	combout => \u_vga|Add8~11_combout\,
	cout => \u_vga|Add8~12\);

-- Location: LCCOMB_X18_Y16_N12
\u_vga|Add8~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~13_combout\ = (\u_vga|Add8~12\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(6) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add8~12\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(6) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (VCC))))
-- \u_vga|Add8~14\ = CARRY((!\u_vga|Add8~12\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(6) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(6),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add8~12\,
	combout => \u_vga|Add8~13_combout\,
	cout => \u_vga|Add8~14\);

-- Location: LCCOMB_X18_Y16_N14
\u_vga|Add8~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~15_combout\ = (\u_vga|Add8~14\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(7) $ ((!\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add8~14\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(7) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (GND)))
-- \u_vga|Add8~16\ = CARRY((\u_spi_ee_config|oDATA_YL_xhdl1\(7) $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (!\u_vga|Add8~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(7),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add8~14\,
	combout => \u_vga|Add8~15_combout\,
	cout => \u_vga|Add8~16\);

-- Location: LCCOMB_X18_Y16_N16
\u_vga|Add8~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~17_combout\ = \u_spi_ee_config|oDATA_YH_xhdl2\(0) $ (\u_vga|Add8~16\ $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(0),
	datad => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	cin => \u_vga|Add8~16\,
	combout => \u_vga|Add8~17_combout\);

-- Location: LCCOMB_X20_Y19_N0
\u_vga|Add9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~0_combout\ = (\u_vga|magn_g_y\(1) & (\u_vga|magn_g_y\(0) $ (VCC))) # (!\u_vga|magn_g_y\(1) & (\u_vga|magn_g_y\(0) & VCC))
-- \u_vga|Add9~1\ = CARRY((\u_vga|magn_g_y\(1) & \u_vga|magn_g_y\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(1),
	datab => \u_vga|magn_g_y\(0),
	datad => VCC,
	combout => \u_vga|Add9~0_combout\,
	cout => \u_vga|Add9~1\);

-- Location: LCCOMB_X19_Y19_N6
\u_vga|Add10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~1_cout\ = CARRY((\u_vga|magn_g_y\(0) & \u_vga|Add8~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Add8~1_combout\,
	datad => VCC,
	cout => \u_vga|Add10~1_cout\);

-- Location: LCCOMB_X19_Y19_N8
\u_vga|Add10~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~3_cout\ = CARRY((\u_vga|Add8~3_combout\ & (!\u_vga|Add9~0_combout\ & !\u_vga|Add10~1_cout\)) # (!\u_vga|Add8~3_combout\ & ((!\u_vga|Add10~1_cout\) # (!\u_vga|Add9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~3_combout\,
	datab => \u_vga|Add9~0_combout\,
	datad => VCC,
	cin => \u_vga|Add10~1_cout\,
	cout => \u_vga|Add10~3_cout\);

-- Location: LCCOMB_X19_Y19_N10
\u_vga|Add10~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~4_combout\ = ((\u_vga|Add8~5_combout\ $ (\u_vga|Add9~2_combout\ $ (!\u_vga|Add10~3_cout\)))) # (GND)
-- \u_vga|Add10~5\ = CARRY((\u_vga|Add8~5_combout\ & ((\u_vga|Add9~2_combout\) # (!\u_vga|Add10~3_cout\))) # (!\u_vga|Add8~5_combout\ & (\u_vga|Add9~2_combout\ & !\u_vga|Add10~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~5_combout\,
	datab => \u_vga|Add9~2_combout\,
	datad => VCC,
	cin => \u_vga|Add10~3_cout\,
	combout => \u_vga|Add10~4_combout\,
	cout => \u_vga|Add10~5\);

-- Location: FF_X19_Y19_N11
\u_vga|magn_g_y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|magn_g_y\(0));

-- Location: LCCOMB_X20_Y19_N2
\u_vga|Add9~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~2_combout\ = (\u_vga|magn_g_y\(1) & ((\u_vga|magn_g_y\(2) & (\u_vga|Add9~1\ & VCC)) # (!\u_vga|magn_g_y\(2) & (!\u_vga|Add9~1\)))) # (!\u_vga|magn_g_y\(1) & ((\u_vga|magn_g_y\(2) & (!\u_vga|Add9~1\)) # (!\u_vga|magn_g_y\(2) & ((\u_vga|Add9~1\) 
-- # (GND)))))
-- \u_vga|Add9~3\ = CARRY((\u_vga|magn_g_y\(1) & (!\u_vga|magn_g_y\(2) & !\u_vga|Add9~1\)) # (!\u_vga|magn_g_y\(1) & ((!\u_vga|Add9~1\) # (!\u_vga|magn_g_y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(1),
	datab => \u_vga|magn_g_y\(2),
	datad => VCC,
	cin => \u_vga|Add9~1\,
	combout => \u_vga|Add9~2_combout\,
	cout => \u_vga|Add9~3\);

-- Location: LCCOMB_X19_Y19_N12
\u_vga|Add10~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~6_combout\ = (\u_vga|Add9~4_combout\ & ((\u_vga|Add8~7_combout\ & (\u_vga|Add10~5\ & VCC)) # (!\u_vga|Add8~7_combout\ & (!\u_vga|Add10~5\)))) # (!\u_vga|Add9~4_combout\ & ((\u_vga|Add8~7_combout\ & (!\u_vga|Add10~5\)) # 
-- (!\u_vga|Add8~7_combout\ & ((\u_vga|Add10~5\) # (GND)))))
-- \u_vga|Add10~7\ = CARRY((\u_vga|Add9~4_combout\ & (!\u_vga|Add8~7_combout\ & !\u_vga|Add10~5\)) # (!\u_vga|Add9~4_combout\ & ((!\u_vga|Add10~5\) # (!\u_vga|Add8~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add9~4_combout\,
	datab => \u_vga|Add8~7_combout\,
	datad => VCC,
	cin => \u_vga|Add10~5\,
	combout => \u_vga|Add10~6_combout\,
	cout => \u_vga|Add10~7\);

-- Location: FF_X19_Y19_N13
\u_vga|magn_g_y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|magn_g_y\(1));

-- Location: LCCOMB_X20_Y19_N4
\u_vga|Add9~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~4_combout\ = ((\u_vga|magn_g_y\(3) $ (\u_vga|magn_g_y\(2) $ (!\u_vga|Add9~3\)))) # (GND)
-- \u_vga|Add9~5\ = CARRY((\u_vga|magn_g_y\(3) & ((\u_vga|magn_g_y\(2)) # (!\u_vga|Add9~3\))) # (!\u_vga|magn_g_y\(3) & (\u_vga|magn_g_y\(2) & !\u_vga|Add9~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(3),
	datab => \u_vga|magn_g_y\(2),
	datad => VCC,
	cin => \u_vga|Add9~3\,
	combout => \u_vga|Add9~4_combout\,
	cout => \u_vga|Add9~5\);

-- Location: LCCOMB_X19_Y19_N14
\u_vga|Add10~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~8_combout\ = ((\u_vga|Add9~6_combout\ $ (\u_vga|Add8~9_combout\ $ (!\u_vga|Add10~7\)))) # (GND)
-- \u_vga|Add10~9\ = CARRY((\u_vga|Add9~6_combout\ & ((\u_vga|Add8~9_combout\) # (!\u_vga|Add10~7\))) # (!\u_vga|Add9~6_combout\ & (\u_vga|Add8~9_combout\ & !\u_vga|Add10~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add9~6_combout\,
	datab => \u_vga|Add8~9_combout\,
	datad => VCC,
	cin => \u_vga|Add10~7\,
	combout => \u_vga|Add10~8_combout\,
	cout => \u_vga|Add10~9\);

-- Location: FF_X19_Y19_N15
\u_vga|magn_g_y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|magn_g_y\(2));

-- Location: LCCOMB_X20_Y19_N6
\u_vga|Add9~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~6_combout\ = (\u_vga|magn_g_y\(3) & ((\u_vga|magn_g_y\(4) & (\u_vga|Add9~5\ & VCC)) # (!\u_vga|magn_g_y\(4) & (!\u_vga|Add9~5\)))) # (!\u_vga|magn_g_y\(3) & ((\u_vga|magn_g_y\(4) & (!\u_vga|Add9~5\)) # (!\u_vga|magn_g_y\(4) & ((\u_vga|Add9~5\) 
-- # (GND)))))
-- \u_vga|Add9~7\ = CARRY((\u_vga|magn_g_y\(3) & (!\u_vga|magn_g_y\(4) & !\u_vga|Add9~5\)) # (!\u_vga|magn_g_y\(3) & ((!\u_vga|Add9~5\) # (!\u_vga|magn_g_y\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(3),
	datab => \u_vga|magn_g_y\(4),
	datad => VCC,
	cin => \u_vga|Add9~5\,
	combout => \u_vga|Add9~6_combout\,
	cout => \u_vga|Add9~7\);

-- Location: LCCOMB_X19_Y19_N16
\u_vga|Add10~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~10_combout\ = (\u_vga|Add9~8_combout\ & ((\u_vga|Add8~11_combout\ & (\u_vga|Add10~9\ & VCC)) # (!\u_vga|Add8~11_combout\ & (!\u_vga|Add10~9\)))) # (!\u_vga|Add9~8_combout\ & ((\u_vga|Add8~11_combout\ & (!\u_vga|Add10~9\)) # 
-- (!\u_vga|Add8~11_combout\ & ((\u_vga|Add10~9\) # (GND)))))
-- \u_vga|Add10~11\ = CARRY((\u_vga|Add9~8_combout\ & (!\u_vga|Add8~11_combout\ & !\u_vga|Add10~9\)) # (!\u_vga|Add9~8_combout\ & ((!\u_vga|Add10~9\) # (!\u_vga|Add8~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add9~8_combout\,
	datab => \u_vga|Add8~11_combout\,
	datad => VCC,
	cin => \u_vga|Add10~9\,
	combout => \u_vga|Add10~10_combout\,
	cout => \u_vga|Add10~11\);

-- Location: FF_X19_Y19_N17
\u_vga|magn_g_y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|magn_g_y\(3));

-- Location: LCCOMB_X20_Y19_N8
\u_vga|Add9~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~8_combout\ = ((\u_vga|magn_g_y\(5) $ (\u_vga|magn_g_y\(4) $ (!\u_vga|Add9~7\)))) # (GND)
-- \u_vga|Add9~9\ = CARRY((\u_vga|magn_g_y\(5) & ((\u_vga|magn_g_y\(4)) # (!\u_vga|Add9~7\))) # (!\u_vga|magn_g_y\(5) & (\u_vga|magn_g_y\(4) & !\u_vga|Add9~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(5),
	datab => \u_vga|magn_g_y\(4),
	datad => VCC,
	cin => \u_vga|Add9~7\,
	combout => \u_vga|Add9~8_combout\,
	cout => \u_vga|Add9~9\);

-- Location: LCCOMB_X19_Y19_N18
\u_vga|Add10~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~12_combout\ = ((\u_vga|Add8~13_combout\ $ (\u_vga|Add9~10_combout\ $ (!\u_vga|Add10~11\)))) # (GND)
-- \u_vga|Add10~13\ = CARRY((\u_vga|Add8~13_combout\ & ((\u_vga|Add9~10_combout\) # (!\u_vga|Add10~11\))) # (!\u_vga|Add8~13_combout\ & (\u_vga|Add9~10_combout\ & !\u_vga|Add10~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~13_combout\,
	datab => \u_vga|Add9~10_combout\,
	datad => VCC,
	cin => \u_vga|Add10~11\,
	combout => \u_vga|Add10~12_combout\,
	cout => \u_vga|Add10~13\);

-- Location: FF_X19_Y19_N19
\u_vga|magn_g_y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|magn_g_y\(4));

-- Location: LCCOMB_X20_Y19_N10
\u_vga|Add9~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~10_combout\ = (\u_vga|magn_g_y\(5) & ((\u_vga|old_magn_g_y\(6) & (\u_vga|Add9~9\ & VCC)) # (!\u_vga|old_magn_g_y\(6) & (!\u_vga|Add9~9\)))) # (!\u_vga|magn_g_y\(5) & ((\u_vga|old_magn_g_y\(6) & (!\u_vga|Add9~9\)) # (!\u_vga|old_magn_g_y\(6) & 
-- ((\u_vga|Add9~9\) # (GND)))))
-- \u_vga|Add9~11\ = CARRY((\u_vga|magn_g_y\(5) & (!\u_vga|old_magn_g_y\(6) & !\u_vga|Add9~9\)) # (!\u_vga|magn_g_y\(5) & ((!\u_vga|Add9~9\) # (!\u_vga|old_magn_g_y\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(5),
	datab => \u_vga|old_magn_g_y\(6),
	datad => VCC,
	cin => \u_vga|Add9~9\,
	combout => \u_vga|Add9~10_combout\,
	cout => \u_vga|Add9~11\);

-- Location: LCCOMB_X19_Y19_N20
\u_vga|Add10~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~14_combout\ = (\u_vga|Add8~15_combout\ & ((\u_vga|Add9~12_combout\ & (\u_vga|Add10~13\ & VCC)) # (!\u_vga|Add9~12_combout\ & (!\u_vga|Add10~13\)))) # (!\u_vga|Add8~15_combout\ & ((\u_vga|Add9~12_combout\ & (!\u_vga|Add10~13\)) # 
-- (!\u_vga|Add9~12_combout\ & ((\u_vga|Add10~13\) # (GND)))))
-- \u_vga|Add10~15\ = CARRY((\u_vga|Add8~15_combout\ & (!\u_vga|Add9~12_combout\ & !\u_vga|Add10~13\)) # (!\u_vga|Add8~15_combout\ & ((!\u_vga|Add10~13\) # (!\u_vga|Add9~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~15_combout\,
	datab => \u_vga|Add9~12_combout\,
	datad => VCC,
	cin => \u_vga|Add10~13\,
	combout => \u_vga|Add10~14_combout\,
	cout => \u_vga|Add10~15\);

-- Location: FF_X19_Y19_N21
\u_vga|magn_g_y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|magn_g_y\(5));

-- Location: LCCOMB_X20_Y19_N12
\u_vga|Add9~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~12_combout\ = ((\u_vga|old_magn_g_y\(6) $ (\u_vga|old_magn_g_y\(7) $ (!\u_vga|Add9~11\)))) # (GND)
-- \u_vga|Add9~13\ = CARRY((\u_vga|old_magn_g_y\(6) & ((\u_vga|old_magn_g_y\(7)) # (!\u_vga|Add9~11\))) # (!\u_vga|old_magn_g_y\(6) & (\u_vga|old_magn_g_y\(7) & !\u_vga|Add9~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(6),
	datab => \u_vga|old_magn_g_y\(7),
	datad => VCC,
	cin => \u_vga|Add9~11\,
	combout => \u_vga|Add9~12_combout\,
	cout => \u_vga|Add9~13\);

-- Location: LCCOMB_X19_Y19_N22
\u_vga|Add10~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~16_combout\ = ((\u_vga|Add8~17_combout\ $ (\u_vga|Add9~14_combout\ $ (!\u_vga|Add10~15\)))) # (GND)
-- \u_vga|Add10~17\ = CARRY((\u_vga|Add8~17_combout\ & ((\u_vga|Add9~14_combout\) # (!\u_vga|Add10~15\))) # (!\u_vga|Add8~17_combout\ & (\u_vga|Add9~14_combout\ & !\u_vga|Add10~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~17_combout\,
	datab => \u_vga|Add9~14_combout\,
	datad => VCC,
	cin => \u_vga|Add10~15\,
	combout => \u_vga|Add10~16_combout\,
	cout => \u_vga|Add10~17\);

-- Location: FF_X19_Y19_N23
\u_vga|old_magn_g_y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(6));

-- Location: LCCOMB_X20_Y19_N14
\u_vga|Add9~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~14_combout\ = (\u_vga|old_magn_g_y\(8) & ((\u_vga|old_magn_g_y\(7) & (\u_vga|Add9~13\ & VCC)) # (!\u_vga|old_magn_g_y\(7) & (!\u_vga|Add9~13\)))) # (!\u_vga|old_magn_g_y\(8) & ((\u_vga|old_magn_g_y\(7) & (!\u_vga|Add9~13\)) # 
-- (!\u_vga|old_magn_g_y\(7) & ((\u_vga|Add9~13\) # (GND)))))
-- \u_vga|Add9~15\ = CARRY((\u_vga|old_magn_g_y\(8) & (!\u_vga|old_magn_g_y\(7) & !\u_vga|Add9~13\)) # (!\u_vga|old_magn_g_y\(8) & ((!\u_vga|Add9~13\) # (!\u_vga|old_magn_g_y\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(8),
	datab => \u_vga|old_magn_g_y\(7),
	datad => VCC,
	cin => \u_vga|Add9~13\,
	combout => \u_vga|Add9~14_combout\,
	cout => \u_vga|Add9~15\);

-- Location: LCCOMB_X19_Y19_N24
\u_vga|Add10~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~18_combout\ = (\u_vga|Add9~16_combout\ & (!\u_vga|Add10~17\)) # (!\u_vga|Add9~16_combout\ & ((\u_vga|Add10~17\) # (GND)))
-- \u_vga|Add10~19\ = CARRY((!\u_vga|Add10~17\) # (!\u_vga|Add9~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add9~16_combout\,
	datad => VCC,
	cin => \u_vga|Add10~17\,
	combout => \u_vga|Add10~18_combout\,
	cout => \u_vga|Add10~19\);

-- Location: FF_X19_Y19_N25
\u_vga|old_magn_g_y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|Add10~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(7));

-- Location: LCCOMB_X20_Y19_N18
\u_vga|Add9~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add9~18_combout\ = \u_vga|Add9~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|Add9~17\,
	combout => \u_vga|Add9~18_combout\);

-- Location: LCCOMB_X19_Y19_N26
\u_vga|Add10~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add10~20_combout\ = \u_vga|Add10~19\ $ (!\u_vga|Add9~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|Add9~18_combout\,
	cin => \u_vga|Add10~19\,
	combout => \u_vga|Add10~20_combout\);

-- Location: LCCOMB_X19_Y21_N24
\u_vga|Mult0|mult_core|romout[1][12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][12]~0_combout\ = (\u_vga|Add10~18_combout\ & ((\u_vga|Add10~16_combout\) # ((\u_vga|Add10~12_combout\ & \u_vga|Add10~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datab => \u_vga|Add10~12_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][12]~0_combout\);

-- Location: LCCOMB_X19_Y21_N10
\u_vga|Mult0|mult_core|romout[1][11]\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][11]~combout\ = (\u_vga|Add10~16_combout\ & (((\u_vga|Add10~14_combout\ & !\u_vga|Add10~18_combout\)))) # (!\u_vga|Add10~16_combout\ & (\u_vga|Add10~18_combout\ & ((!\u_vga|Add10~14_combout\) # 
-- (!\u_vga|Add10~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datab => \u_vga|Add10~12_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][11]~combout\);

-- Location: LCCOMB_X19_Y21_N20
\u_vga|Mult0|mult_core|romout[1][10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][10]~1_combout\ = (\u_vga|Add10~16_combout\ & ((\u_vga|Add10~14_combout\ $ (!\u_vga|Add10~18_combout\)))) # (!\u_vga|Add10~16_combout\ & ((\u_vga|Add10~12_combout\ & (\u_vga|Add10~14_combout\ $ (\u_vga|Add10~18_combout\))) 
-- # (!\u_vga|Add10~12_combout\ & (\u_vga|Add10~14_combout\ & \u_vga|Add10~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datab => \u_vga|Add10~12_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][10]~1_combout\);

-- Location: LCCOMB_X19_Y21_N6
\u_vga|Mult0|mult_core|romout[1][9]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][9]~2_combout\ = (\u_vga|Add10~16_combout\ & (\u_vga|Add10~12_combout\)) # (!\u_vga|Add10~16_combout\ & (!\u_vga|Add10~12_combout\ & ((\u_vga|Add10~14_combout\) # (\u_vga|Add10~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datab => \u_vga|Add10~12_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][9]~2_combout\);

-- Location: LCCOMB_X18_Y19_N0
\u_vga|Mult0|mult_core|romout[0][12]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][12]~4_combout\ = (\u_vga|Add10~10_combout\ & ((\u_vga|Add10~8_combout\) # ((\u_vga|Add10~4_combout\ & \u_vga|Add10~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~4_combout\,
	datab => \u_vga|Add10~8_combout\,
	datac => \u_vga|Add10~6_combout\,
	datad => \u_vga|Add10~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][12]~4_combout\);

-- Location: LCCOMB_X19_Y21_N0
\u_vga|Mult0|mult_core|romout[1][8]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][8]~3_combout\ = (!\u_vga|Add10~14_combout\ & ((\u_vga|Add10~16_combout\) # ((\u_vga|Add10~12_combout\) # (\u_vga|Add10~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datab => \u_vga|Add10~12_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][8]~3_combout\);

-- Location: LCCOMB_X19_Y21_N2
\u_vga|Mult0|mult_core|romout[1][7]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][7]~5_combout\ = (!\u_vga|Add10~12_combout\ & ((\u_vga|Add10~16_combout\) # ((\u_vga|Add10~14_combout\) # (\u_vga|Add10~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datab => \u_vga|Add10~12_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][7]~5_combout\);

-- Location: LCCOMB_X18_Y19_N10
\u_vga|Mult0|mult_core|romout[0][11]\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][11]~combout\ = (\u_vga|Add10~8_combout\ & (((\u_vga|Add10~6_combout\ & !\u_vga|Add10~10_combout\)))) # (!\u_vga|Add10~8_combout\ & (\u_vga|Add10~10_combout\ & ((!\u_vga|Add10~6_combout\) # (!\u_vga|Add10~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~4_combout\,
	datab => \u_vga|Add10~8_combout\,
	datac => \u_vga|Add10~6_combout\,
	datad => \u_vga|Add10~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][11]~combout\);

-- Location: LCCOMB_X19_Y21_N4
\u_vga|Mult0|mult_core|romout[1][6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][6]~6_combout\ = (\u_vga|Add10~16_combout\) # ((\u_vga|Add10~12_combout\) # ((\u_vga|Add10~14_combout\) # (\u_vga|Add10~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datab => \u_vga|Add10~12_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][6]~6_combout\);

-- Location: LCCOMB_X18_Y19_N12
\u_vga|Mult0|mult_core|romout[0][10]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][10]~7_combout\ = (\u_vga|Add10~4_combout\ & (\u_vga|Add10~8_combout\ $ (\u_vga|Add10~6_combout\ $ (\u_vga|Add10~10_combout\)))) # (!\u_vga|Add10~4_combout\ & ((\u_vga|Add10~6_combout\ & ((\u_vga|Add10~10_combout\))) # 
-- (!\u_vga|Add10~6_combout\ & (\u_vga|Add10~8_combout\ & !\u_vga|Add10~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~4_combout\,
	datab => \u_vga|Add10~8_combout\,
	datac => \u_vga|Add10~6_combout\,
	datad => \u_vga|Add10~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][10]~7_combout\);

-- Location: LCCOMB_X18_Y19_N14
\u_vga|Mult0|mult_core|romout[0][9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][9]~9_combout\ = (\u_vga|Add10~4_combout\ & (\u_vga|Add10~8_combout\)) # (!\u_vga|Add10~4_combout\ & (!\u_vga|Add10~8_combout\ & ((\u_vga|Add10~6_combout\) # (\u_vga|Add10~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~4_combout\,
	datab => \u_vga|Add10~8_combout\,
	datac => \u_vga|Add10~6_combout\,
	datad => \u_vga|Add10~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][9]~9_combout\);

-- Location: LCCOMB_X19_Y21_N22
\u_vga|Mult0|mult_core|romout[1][5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][5]~8_combout\ = \u_vga|Add10~18_combout\ $ (((\u_vga|Add10~16_combout\) # ((\u_vga|Add10~12_combout\) # (\u_vga|Add10~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datab => \u_vga|Add10~12_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][5]~8_combout\);

-- Location: LCCOMB_X18_Y19_N16
\u_vga|Mult0|mult_core|romout[0][8]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][8]~11_combout\ = (!\u_vga|Add10~6_combout\ & ((\u_vga|Add10~4_combout\) # ((\u_vga|Add10~8_combout\) # (\u_vga|Add10~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~4_combout\,
	datab => \u_vga|Add10~8_combout\,
	datac => \u_vga|Add10~6_combout\,
	datad => \u_vga|Add10~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][8]~11_combout\);

-- Location: LCCOMB_X19_Y21_N16
\u_vga|Mult0|mult_core|romout[1][4]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][4]~10_combout\ = \u_vga|Add10~16_combout\ $ (((\u_vga|Add10~14_combout\) # (\u_vga|Add10~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~16_combout\,
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~12_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][4]~10_combout\);

-- Location: LCCOMB_X18_Y19_N2
\u_vga|Mult0|mult_core|romout[0][7]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][7]~13_combout\ = (!\u_vga|Add10~4_combout\ & ((\u_vga|Add10~8_combout\) # ((\u_vga|Add10~6_combout\) # (\u_vga|Add10~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~4_combout\,
	datab => \u_vga|Add10~8_combout\,
	datac => \u_vga|Add10~6_combout\,
	datad => \u_vga|Add10~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][7]~13_combout\);

-- Location: LCCOMB_X19_Y21_N18
\u_vga|Mult0|mult_core|romout[1][3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][3]~12_combout\ = \u_vga|Add10~14_combout\ $ (\u_vga|Add10~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add10~14_combout\,
	datad => \u_vga|Add10~12_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][3]~12_combout\);

-- Location: LCCOMB_X18_Y19_N4
\u_vga|Mult0|mult_core|romout[0][6]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][6]~14_combout\ = (\u_vga|Add10~4_combout\) # ((\u_vga|Add10~8_combout\) # ((\u_vga|Add10~6_combout\) # (\u_vga|Add10~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~4_combout\,
	datab => \u_vga|Add10~8_combout\,
	datac => \u_vga|Add10~6_combout\,
	datad => \u_vga|Add10~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][6]~14_combout\);

-- Location: LCCOMB_X18_Y21_N8
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\ = CARRY((\u_vga|Add10~12_combout\ & \u_vga|Mult0|mult_core|romout[0][6]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~12_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][6]~14_combout\,
	datad => VCC,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\);

-- Location: LCCOMB_X18_Y21_N10
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\ = CARRY((\u_vga|Mult0|mult_core|romout[0][7]~13_combout\ & (!\u_vga|Mult0|mult_core|romout[1][3]~12_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\)) # 
-- (!\u_vga|Mult0|mult_core|romout[0][7]~13_combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\) # (!\u_vga|Mult0|mult_core|romout[1][3]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][7]~13_combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][3]~12_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\);

-- Location: LCCOMB_X18_Y21_N12
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ = ((\u_vga|Mult0|mult_core|romout[0][8]~11_combout\ $ (\u_vga|Mult0|mult_core|romout[1][4]~10_combout\ $ (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ = CARRY((\u_vga|Mult0|mult_core|romout[0][8]~11_combout\ & ((\u_vga|Mult0|mult_core|romout[1][4]~10_combout\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\))) # 
-- (!\u_vga|Mult0|mult_core|romout[0][8]~11_combout\ & (\u_vga|Mult0|mult_core|romout[1][4]~10_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][8]~11_combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][4]~10_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\);

-- Location: LCCOMB_X18_Y21_N14
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ = (\u_vga|Mult0|mult_core|romout[0][9]~9_combout\ & ((\u_vga|Mult0|mult_core|romout[1][5]~8_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ & VCC)) # 
-- (!\u_vga|Mult0|mult_core|romout[1][5]~8_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)))) # (!\u_vga|Mult0|mult_core|romout[0][9]~9_combout\ & ((\u_vga|Mult0|mult_core|romout[1][5]~8_combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # (!\u_vga|Mult0|mult_core|romout[1][5]~8_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ = CARRY((\u_vga|Mult0|mult_core|romout[0][9]~9_combout\ & (!\u_vga|Mult0|mult_core|romout[1][5]~8_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # 
-- (!\u_vga|Mult0|mult_core|romout[0][9]~9_combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (!\u_vga|Mult0|mult_core|romout[1][5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][9]~9_combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][5]~8_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\);

-- Location: LCCOMB_X18_Y21_N16
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ = ((\u_vga|Mult0|mult_core|romout[1][6]~6_combout\ $ (\u_vga|Mult0|mult_core|romout[0][10]~7_combout\ $ (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ = CARRY((\u_vga|Mult0|mult_core|romout[1][6]~6_combout\ & ((\u_vga|Mult0|mult_core|romout[0][10]~7_combout\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\))) # 
-- (!\u_vga|Mult0|mult_core|romout[1][6]~6_combout\ & (\u_vga|Mult0|mult_core|romout[0][10]~7_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][6]~6_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][10]~7_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\);

-- Location: LCCOMB_X18_Y21_N18
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ = (\u_vga|Mult0|mult_core|romout[1][7]~5_combout\ & ((\u_vga|Mult0|mult_core|romout[0][11]~combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ & VCC)) # 
-- (!\u_vga|Mult0|mult_core|romout[0][11]~combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)))) # (!\u_vga|Mult0|mult_core|romout[1][7]~5_combout\ & ((\u_vga|Mult0|mult_core|romout[0][11]~combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # (!\u_vga|Mult0|mult_core|romout[0][11]~combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ = CARRY((\u_vga|Mult0|mult_core|romout[1][7]~5_combout\ & (!\u_vga|Mult0|mult_core|romout[0][11]~combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # 
-- (!\u_vga|Mult0|mult_core|romout[1][7]~5_combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (!\u_vga|Mult0|mult_core|romout[0][11]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][7]~5_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][11]~combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\);

-- Location: LCCOMB_X18_Y21_N20
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ = ((\u_vga|Mult0|mult_core|romout[0][12]~4_combout\ $ (\u_vga|Mult0|mult_core|romout[1][8]~3_combout\ $ (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ = CARRY((\u_vga|Mult0|mult_core|romout[0][12]~4_combout\ & ((\u_vga|Mult0|mult_core|romout[1][8]~3_combout\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\))) # 
-- (!\u_vga|Mult0|mult_core|romout[0][12]~4_combout\ & (\u_vga|Mult0|mult_core|romout[1][8]~3_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][12]~4_combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][8]~3_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\);

-- Location: LCCOMB_X18_Y21_N22
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ = (\u_vga|Mult0|mult_core|romout[1][9]~2_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\)) # (!\u_vga|Mult0|mult_core|romout[1][9]~2_combout\ & 
-- ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\) # (GND)))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ = CARRY((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\) # (!\u_vga|Mult0|mult_core|romout[1][9]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][9]~2_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\);

-- Location: LCCOMB_X18_Y21_N24
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ = (\u_vga|Mult0|mult_core|romout[1][10]~1_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ $ (GND))) # (!\u_vga|Mult0|mult_core|romout[1][10]~1_combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ & VCC))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ = CARRY((\u_vga|Mult0|mult_core|romout[1][10]~1_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][10]~1_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\);

-- Location: LCCOMB_X18_Y21_N26
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ = (\u_vga|Mult0|mult_core|romout[1][11]~combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\)) # (!\u_vga|Mult0|mult_core|romout[1][11]~combout\ & 
-- ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\) # (GND)))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\ = CARRY((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\) # (!\u_vga|Mult0|mult_core|romout[1][11]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|romout[1][11]~combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\);

-- Location: LCCOMB_X18_Y21_N28
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ = \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\ $ (!\u_vga|Mult0|mult_core|romout[1][12]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|Mult0|mult_core|romout[1][12]~0_combout\,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\);

-- Location: LCCOMB_X17_Y22_N0
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ = (\u_vga|Add10~20_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ $ (VCC))) # (!\u_vga|Add10~20_combout\ & 
-- (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ & VCC))
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\ = CARRY((\u_vga|Add10~20_combout\ & \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	datad => VCC,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\);

-- Location: LCCOMB_X17_Y22_N2
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ = (\u_vga|Add10~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & 
-- (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\)))) # 
-- (!\u_vga|Add10~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\)) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & ((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\ = CARRY((\u_vga|Add10~20_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\)) # (!\u_vga|Add10~20_combout\ & ((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\);

-- Location: LCCOMB_X17_Y22_N4
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ = ((\u_vga|Add10~20_combout\ $ (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ $ 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\ = CARRY((\u_vga|Add10~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\) # 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\))) # (!\u_vga|Add10~20_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\);

-- Location: LCCOMB_X17_Y22_N6
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ = (\u_vga|Add10~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & 
-- (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\)))) # 
-- (!\u_vga|Add10~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\)) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & ((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\ = CARRY((\u_vga|Add10~20_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\)) # (!\u_vga|Add10~20_combout\ & ((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\);

-- Location: LCCOMB_X17_Y22_N8
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ = ((\u_vga|Add10~20_combout\ $ (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ $ 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\ = CARRY((\u_vga|Add10~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\) # 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\))) # (!\u_vga|Add10~20_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\);

-- Location: LCCOMB_X17_Y22_N10
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\)) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ & ((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\) # (GND)))
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\ = CARRY((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\);

-- Location: LCCOMB_X17_Y22_N12
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ = ((\u_vga|Add10~20_combout\ $ (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ $ 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~13\ = CARRY((\u_vga|Add10~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\) # 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\))) # (!\u_vga|Add10~20_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add10~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~13\);

-- Location: LCCOMB_X17_Y22_N14
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\ = \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~13\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\);

-- Location: LCCOMB_X18_Y22_N0
\u_vga|left_boat[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[0]~10_combout\ = \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ $ (GND)
-- \u_vga|left_boat[0]~11\ = CARRY(!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	datad => VCC,
	combout => \u_vga|left_boat[0]~10_combout\,
	cout => \u_vga|left_boat[0]~11\);

-- Location: LCCOMB_X18_Y22_N2
\u_vga|left_boat[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[1]~12_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ & ((\u_vga|left_boat[0]~11\) # (GND))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ & (!\u_vga|left_boat[0]~11\))
-- \u_vga|left_boat[1]~13\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\) # (!\u_vga|left_boat[0]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	datad => VCC,
	cin => \u_vga|left_boat[0]~11\,
	combout => \u_vga|left_boat[1]~12_combout\,
	cout => \u_vga|left_boat[1]~13\);

-- Location: LCCOMB_X18_Y22_N4
\u_vga|left_boat[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[2]~14_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ & (\u_vga|left_boat[1]~13\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ & ((GND) # 
-- (!\u_vga|left_boat[1]~13\)))
-- \u_vga|left_boat[2]~15\ = CARRY((!\u_vga|left_boat[1]~13\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\,
	datad => VCC,
	cin => \u_vga|left_boat[1]~13\,
	combout => \u_vga|left_boat[2]~14_combout\,
	cout => \u_vga|left_boat[2]~15\);

-- Location: LCCOMB_X18_Y22_N6
\u_vga|left_boat[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[3]~16_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & (!\u_vga|left_boat[2]~15\)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & 
-- (\u_vga|left_boat[2]~15\ & VCC))
-- \u_vga|left_boat[3]~17\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & !\u_vga|left_boat[2]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\,
	datad => VCC,
	cin => \u_vga|left_boat[2]~15\,
	combout => \u_vga|left_boat[3]~16_combout\,
	cout => \u_vga|left_boat[3]~17\);

-- Location: LCCOMB_X18_Y22_N8
\u_vga|left_boat[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[4]~18_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ & (\u_vga|left_boat[3]~17\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ & ((GND) # 
-- (!\u_vga|left_boat[3]~17\)))
-- \u_vga|left_boat[4]~19\ = CARRY((!\u_vga|left_boat[3]~17\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\,
	datad => VCC,
	cin => \u_vga|left_boat[3]~17\,
	combout => \u_vga|left_boat[4]~18_combout\,
	cout => \u_vga|left_boat[4]~19\);

-- Location: LCCOMB_X18_Y22_N10
\u_vga|left_boat[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[5]~20_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & (!\u_vga|left_boat[4]~19\)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & 
-- (\u_vga|left_boat[4]~19\ & VCC))
-- \u_vga|left_boat[5]~21\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & !\u_vga|left_boat[4]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\,
	datad => VCC,
	cin => \u_vga|left_boat[4]~19\,
	combout => \u_vga|left_boat[5]~20_combout\,
	cout => \u_vga|left_boat[5]~21\);

-- Location: LCCOMB_X18_Y22_N12
\u_vga|left_boat[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[6]~22_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ & (\u_vga|left_boat[5]~21\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ & ((GND) # 
-- (!\u_vga|left_boat[5]~21\)))
-- \u_vga|left_boat[6]~23\ = CARRY((!\u_vga|left_boat[5]~21\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\,
	datad => VCC,
	cin => \u_vga|left_boat[5]~21\,
	combout => \u_vga|left_boat[6]~22_combout\,
	cout => \u_vga|left_boat[6]~23\);

-- Location: LCCOMB_X18_Y22_N14
\u_vga|left_boat[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[7]~24_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ & ((\u_vga|left_boat[6]~23\) # (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ & 
-- (!\u_vga|left_boat[6]~23\))
-- \u_vga|left_boat[7]~25\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\) # (!\u_vga|left_boat[6]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\,
	datad => VCC,
	cin => \u_vga|left_boat[6]~23\,
	combout => \u_vga|left_boat[7]~24_combout\,
	cout => \u_vga|left_boat[7]~25\);

-- Location: LCCOMB_X18_Y22_N16
\u_vga|left_boat[8]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[8]~26_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ & (\u_vga|left_boat[7]~25\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ & ((GND) # 
-- (!\u_vga|left_boat[7]~25\)))
-- \u_vga|left_boat[8]~27\ = CARRY((!\u_vga|left_boat[7]~25\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\,
	datad => VCC,
	cin => \u_vga|left_boat[7]~25\,
	combout => \u_vga|left_boat[8]~26_combout\,
	cout => \u_vga|left_boat[8]~27\);

-- Location: LCCOMB_X18_Y22_N18
\u_vga|left_boat[9]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_boat[9]~28_combout\ = \u_vga|left_boat[8]~27\ $ (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\,
	cin => \u_vga|left_boat[8]~27\,
	combout => \u_vga|left_boat[9]~28_combout\);

-- Location: LCCOMB_X17_Y22_N16
\u_vga|Add12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~0_combout\ = \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ $ (VCC)
-- \u_vga|Add12~1\ = CARRY(\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\,
	datad => VCC,
	combout => \u_vga|Add12~0_combout\,
	cout => \u_vga|Add12~1\);

-- Location: LCCOMB_X17_Y22_N18
\u_vga|Add12~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~2_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & (\u_vga|Add12~1\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & (!\u_vga|Add12~1\))
-- \u_vga|Add12~3\ = CARRY((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & !\u_vga|Add12~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\,
	datad => VCC,
	cin => \u_vga|Add12~1\,
	combout => \u_vga|Add12~2_combout\,
	cout => \u_vga|Add12~3\);

-- Location: LCCOMB_X17_Y22_N20
\u_vga|Add12~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~4_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ & ((GND) # (!\u_vga|Add12~3\))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ & (\u_vga|Add12~3\ $ (GND)))
-- \u_vga|Add12~5\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\) # (!\u_vga|Add12~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\,
	datad => VCC,
	cin => \u_vga|Add12~3\,
	combout => \u_vga|Add12~4_combout\,
	cout => \u_vga|Add12~5\);

-- Location: LCCOMB_X17_Y22_N22
\u_vga|Add12~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~6_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & (\u_vga|Add12~5\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & (!\u_vga|Add12~5\))
-- \u_vga|Add12~7\ = CARRY((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & !\u_vga|Add12~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\,
	datad => VCC,
	cin => \u_vga|Add12~5\,
	combout => \u_vga|Add12~6_combout\,
	cout => \u_vga|Add12~7\);

-- Location: LCCOMB_X17_Y22_N24
\u_vga|Add12~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~8_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ & ((GND) # (!\u_vga|Add12~7\))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ & (\u_vga|Add12~7\ $ (GND)))
-- \u_vga|Add12~9\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\) # (!\u_vga|Add12~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\,
	datad => VCC,
	cin => \u_vga|Add12~7\,
	combout => \u_vga|Add12~8_combout\,
	cout => \u_vga|Add12~9\);

-- Location: LCCOMB_X17_Y22_N26
\u_vga|Add12~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~10_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ & (!\u_vga|Add12~9\)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ & ((\u_vga|Add12~9\) # (GND)))
-- \u_vga|Add12~11\ = CARRY((!\u_vga|Add12~9\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\,
	datad => VCC,
	cin => \u_vga|Add12~9\,
	combout => \u_vga|Add12~10_combout\,
	cout => \u_vga|Add12~11\);

-- Location: LCCOMB_X17_Y22_N28
\u_vga|Add12~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~12_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ & ((GND) # (!\u_vga|Add12~11\))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ & (\u_vga|Add12~11\ $ 
-- (GND)))
-- \u_vga|Add12~13\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\) # (!\u_vga|Add12~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\,
	datad => VCC,
	cin => \u_vga|Add12~11\,
	combout => \u_vga|Add12~12_combout\,
	cout => \u_vga|Add12~13\);

-- Location: LCCOMB_X17_Y22_N30
\u_vga|Add12~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~14_combout\ = \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\ $ (\u_vga|Add12~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\,
	cin => \u_vga|Add12~13\,
	combout => \u_vga|Add12~14_combout\);

-- Location: FF_X18_Y22_N19
\u_vga|left_boat[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[9]~28_combout\,
	asdata => \u_vga|Add12~14_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(9));

-- Location: FF_X18_Y22_N17
\u_vga|left_boat[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[8]~26_combout\,
	asdata => \u_vga|Add12~12_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(8));

-- Location: FF_X18_Y22_N15
\u_vga|left_boat[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[7]~24_combout\,
	asdata => \u_vga|Add12~10_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(7));

-- Location: FF_X18_Y22_N13
\u_vga|left_boat[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[6]~22_combout\,
	asdata => \u_vga|Add12~8_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(6));

-- Location: FF_X18_Y22_N11
\u_vga|left_boat[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[5]~20_combout\,
	asdata => \u_vga|Add12~6_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(5));

-- Location: FF_X18_Y22_N9
\u_vga|left_boat[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[4]~18_combout\,
	asdata => \u_vga|Add12~4_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(4));

-- Location: FF_X18_Y22_N7
\u_vga|left_boat[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[3]~16_combout\,
	asdata => \u_vga|Add12~2_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(3));

-- Location: FF_X18_Y22_N5
\u_vga|left_boat[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[2]~14_combout\,
	asdata => \u_vga|Add12~0_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(2));

-- Location: FF_X18_Y22_N3
\u_vga|left_boat[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[1]~12_combout\,
	asdata => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(1));

-- Location: FF_X18_Y22_N1
\u_vga|left_boat[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_boat[0]~10_combout\,
	asdata => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_boat\(0));

-- Location: LCCOMB_X21_Y22_N2
\u_vga|LessThan7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~1_cout\ = CARRY((\u_vga|left_boat\(0) & !\u_vga|h_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(0),
	datab => \u_vga|h_cnt\(0),
	datad => VCC,
	cout => \u_vga|LessThan7~1_cout\);

-- Location: LCCOMB_X21_Y22_N4
\u_vga|LessThan7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~3_cout\ = CARRY((\u_vga|left_boat\(1) & (\u_vga|h_cnt\(1) & !\u_vga|LessThan7~1_cout\)) # (!\u_vga|left_boat\(1) & ((\u_vga|h_cnt\(1)) # (!\u_vga|LessThan7~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(1),
	datab => \u_vga|h_cnt\(1),
	datad => VCC,
	cin => \u_vga|LessThan7~1_cout\,
	cout => \u_vga|LessThan7~3_cout\);

-- Location: LCCOMB_X21_Y22_N6
\u_vga|LessThan7~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~5_cout\ = CARRY((\u_vga|left_boat\(2) & ((!\u_vga|LessThan7~3_cout\) # (!\u_vga|h_cnt\(2)))) # (!\u_vga|left_boat\(2) & (!\u_vga|h_cnt\(2) & !\u_vga|LessThan7~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(2),
	datab => \u_vga|h_cnt\(2),
	datad => VCC,
	cin => \u_vga|LessThan7~3_cout\,
	cout => \u_vga|LessThan7~5_cout\);

-- Location: LCCOMB_X21_Y22_N8
\u_vga|LessThan7~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~7_cout\ = CARRY((\u_vga|h_cnt\(3) & ((!\u_vga|LessThan7~5_cout\) # (!\u_vga|left_boat\(3)))) # (!\u_vga|h_cnt\(3) & (!\u_vga|left_boat\(3) & !\u_vga|LessThan7~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|left_boat\(3),
	datad => VCC,
	cin => \u_vga|LessThan7~5_cout\,
	cout => \u_vga|LessThan7~7_cout\);

-- Location: LCCOMB_X21_Y22_N10
\u_vga|LessThan7~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~9_cout\ = CARRY((\u_vga|left_boat\(4) & ((!\u_vga|LessThan7~7_cout\) # (!\u_vga|h_cnt\(4)))) # (!\u_vga|left_boat\(4) & (!\u_vga|h_cnt\(4) & !\u_vga|LessThan7~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(4),
	datab => \u_vga|h_cnt\(4),
	datad => VCC,
	cin => \u_vga|LessThan7~7_cout\,
	cout => \u_vga|LessThan7~9_cout\);

-- Location: LCCOMB_X21_Y22_N12
\u_vga|LessThan7~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~11_cout\ = CARRY((\u_vga|left_boat\(5) & (\u_vga|h_cnt\(5) & !\u_vga|LessThan7~9_cout\)) # (!\u_vga|left_boat\(5) & ((\u_vga|h_cnt\(5)) # (!\u_vga|LessThan7~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(5),
	datab => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|LessThan7~9_cout\,
	cout => \u_vga|LessThan7~11_cout\);

-- Location: LCCOMB_X21_Y22_N14
\u_vga|LessThan7~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~13_cout\ = CARRY((\u_vga|h_cnt\(6) & (\u_vga|left_boat\(6) & !\u_vga|LessThan7~11_cout\)) # (!\u_vga|h_cnt\(6) & ((\u_vga|left_boat\(6)) # (!\u_vga|LessThan7~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|left_boat\(6),
	datad => VCC,
	cin => \u_vga|LessThan7~11_cout\,
	cout => \u_vga|LessThan7~13_cout\);

-- Location: LCCOMB_X21_Y22_N16
\u_vga|LessThan7~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~15_cout\ = CARRY((\u_vga|h_cnt\(7) & ((!\u_vga|LessThan7~13_cout\) # (!\u_vga|left_boat\(7)))) # (!\u_vga|h_cnt\(7) & (!\u_vga|left_boat\(7) & !\u_vga|LessThan7~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(7),
	datab => \u_vga|left_boat\(7),
	datad => VCC,
	cin => \u_vga|LessThan7~13_cout\,
	cout => \u_vga|LessThan7~15_cout\);

-- Location: LCCOMB_X21_Y22_N18
\u_vga|LessThan7~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~17_cout\ = CARRY((\u_vga|left_boat\(8) & ((!\u_vga|LessThan7~15_cout\) # (!\u_vga|h_cnt\(8)))) # (!\u_vga|left_boat\(8) & (!\u_vga|h_cnt\(8) & !\u_vga|LessThan7~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(8),
	datab => \u_vga|h_cnt\(8),
	datad => VCC,
	cin => \u_vga|LessThan7~15_cout\,
	cout => \u_vga|LessThan7~17_cout\);

-- Location: LCCOMB_X21_Y22_N20
\u_vga|LessThan7~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~18_combout\ = (\u_vga|h_cnt\(9) & (\u_vga|LessThan7~17_cout\ & \u_vga|left_boat\(9))) # (!\u_vga|h_cnt\(9) & ((\u_vga|LessThan7~17_cout\) # (\u_vga|left_boat\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datad => \u_vga|left_boat\(9),
	cin => \u_vga|LessThan7~17_cout\,
	combout => \u_vga|LessThan7~18_combout\);

-- Location: LCCOMB_X20_Y22_N0
\u_vga|right_boat[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_boat[4]~6_combout\ = (\u_vga|left_boat\(3) & (\u_vga|left_boat\(4) $ (VCC))) # (!\u_vga|left_boat\(3) & (\u_vga|left_boat\(4) & VCC))
-- \u_vga|right_boat[4]~7\ = CARRY((\u_vga|left_boat\(3) & \u_vga|left_boat\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(3),
	datab => \u_vga|left_boat\(4),
	datad => VCC,
	combout => \u_vga|right_boat[4]~6_combout\,
	cout => \u_vga|right_boat[4]~7\);

-- Location: LCCOMB_X20_Y22_N2
\u_vga|right_boat[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_boat[5]~8_combout\ = (\u_vga|left_boat\(5) & (\u_vga|right_boat[4]~7\ & VCC)) # (!\u_vga|left_boat\(5) & (!\u_vga|right_boat[4]~7\))
-- \u_vga|right_boat[5]~9\ = CARRY((!\u_vga|left_boat\(5) & !\u_vga|right_boat[4]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|left_boat\(5),
	datad => VCC,
	cin => \u_vga|right_boat[4]~7\,
	combout => \u_vga|right_boat[5]~8_combout\,
	cout => \u_vga|right_boat[5]~9\);

-- Location: LCCOMB_X20_Y22_N4
\u_vga|right_boat[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_boat[6]~10_combout\ = (\u_vga|left_boat\(6) & (\u_vga|right_boat[5]~9\ $ (GND))) # (!\u_vga|left_boat\(6) & (!\u_vga|right_boat[5]~9\ & VCC))
-- \u_vga|right_boat[6]~11\ = CARRY((\u_vga|left_boat\(6) & !\u_vga|right_boat[5]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(6),
	datad => VCC,
	cin => \u_vga|right_boat[5]~9\,
	combout => \u_vga|right_boat[6]~10_combout\,
	cout => \u_vga|right_boat[6]~11\);

-- Location: LCCOMB_X20_Y22_N6
\u_vga|right_boat[7]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_boat[7]~12_combout\ = (\u_vga|left_boat\(7) & (!\u_vga|right_boat[6]~11\)) # (!\u_vga|left_boat\(7) & ((\u_vga|right_boat[6]~11\) # (GND)))
-- \u_vga|right_boat[7]~13\ = CARRY((!\u_vga|right_boat[6]~11\) # (!\u_vga|left_boat\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|left_boat\(7),
	datad => VCC,
	cin => \u_vga|right_boat[6]~11\,
	combout => \u_vga|right_boat[7]~12_combout\,
	cout => \u_vga|right_boat[7]~13\);

-- Location: LCCOMB_X20_Y22_N8
\u_vga|right_boat[8]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_boat[8]~14_combout\ = (\u_vga|left_boat\(8) & (\u_vga|right_boat[7]~13\ $ (GND))) # (!\u_vga|left_boat\(8) & (!\u_vga|right_boat[7]~13\ & VCC))
-- \u_vga|right_boat[8]~15\ = CARRY((\u_vga|left_boat\(8) & !\u_vga|right_boat[7]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(8),
	datad => VCC,
	cin => \u_vga|right_boat[7]~13\,
	combout => \u_vga|right_boat[8]~14_combout\,
	cout => \u_vga|right_boat[8]~15\);

-- Location: LCCOMB_X20_Y22_N10
\u_vga|right_boat[9]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_boat[9]~16_combout\ = \u_vga|left_boat\(9) $ (\u_vga|right_boat[8]~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_boat\(9),
	cin => \u_vga|right_boat[8]~15\,
	combout => \u_vga|right_boat[9]~16_combout\);

-- Location: FF_X20_Y22_N11
\u_vga|right_boat[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|right_boat[9]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(9));

-- Location: FF_X20_Y22_N9
\u_vga|right_boat[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|right_boat[8]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(8));

-- Location: FF_X20_Y22_N7
\u_vga|right_boat[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|right_boat[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(7));

-- Location: FF_X20_Y22_N5
\u_vga|right_boat[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|right_boat[6]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(6));

-- Location: FF_X20_Y22_N3
\u_vga|right_boat[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|right_boat[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(5));

-- Location: FF_X20_Y22_N1
\u_vga|right_boat[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|right_boat[4]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(4));

-- Location: LCCOMB_X18_Y22_N22
\u_vga|right_boat[3]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_boat[3]~18_combout\ = !\u_vga|left_boat\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|left_boat\(3),
	combout => \u_vga|right_boat[3]~18_combout\);

-- Location: FF_X18_Y22_N23
\u_vga|right_boat[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|right_boat[3]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(3));

-- Location: FF_X20_Y22_N17
\u_vga|right_boat[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|left_boat\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(2));

-- Location: FF_X20_Y22_N15
\u_vga|right_boat[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|left_boat\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(1));

-- Location: FF_X20_Y22_N13
\u_vga|right_boat[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|left_boat\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_boat\(0));

-- Location: LCCOMB_X20_Y22_N12
\u_vga|LessThan8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~1_cout\ = CARRY((!\u_vga|right_boat\(0) & \u_vga|h_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_boat\(0),
	datab => \u_vga|h_cnt\(0),
	datad => VCC,
	cout => \u_vga|LessThan8~1_cout\);

-- Location: LCCOMB_X20_Y22_N14
\u_vga|LessThan8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~3_cout\ = CARRY((\u_vga|h_cnt\(1) & (\u_vga|right_boat\(1) & !\u_vga|LessThan8~1_cout\)) # (!\u_vga|h_cnt\(1) & ((\u_vga|right_boat\(1)) # (!\u_vga|LessThan8~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|right_boat\(1),
	datad => VCC,
	cin => \u_vga|LessThan8~1_cout\,
	cout => \u_vga|LessThan8~3_cout\);

-- Location: LCCOMB_X20_Y22_N16
\u_vga|LessThan8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~5_cout\ = CARRY((\u_vga|h_cnt\(2) & ((!\u_vga|LessThan8~3_cout\) # (!\u_vga|right_boat\(2)))) # (!\u_vga|h_cnt\(2) & (!\u_vga|right_boat\(2) & !\u_vga|LessThan8~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|right_boat\(2),
	datad => VCC,
	cin => \u_vga|LessThan8~3_cout\,
	cout => \u_vga|LessThan8~5_cout\);

-- Location: LCCOMB_X20_Y22_N18
\u_vga|LessThan8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~7_cout\ = CARRY((\u_vga|right_boat\(3) & ((!\u_vga|LessThan8~5_cout\) # (!\u_vga|h_cnt\(3)))) # (!\u_vga|right_boat\(3) & (!\u_vga|h_cnt\(3) & !\u_vga|LessThan8~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_boat\(3),
	datab => \u_vga|h_cnt\(3),
	datad => VCC,
	cin => \u_vga|LessThan8~5_cout\,
	cout => \u_vga|LessThan8~7_cout\);

-- Location: LCCOMB_X20_Y22_N20
\u_vga|LessThan8~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~9_cout\ = CARRY((\u_vga|h_cnt\(4) & ((!\u_vga|LessThan8~7_cout\) # (!\u_vga|right_boat\(4)))) # (!\u_vga|h_cnt\(4) & (!\u_vga|right_boat\(4) & !\u_vga|LessThan8~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|right_boat\(4),
	datad => VCC,
	cin => \u_vga|LessThan8~7_cout\,
	cout => \u_vga|LessThan8~9_cout\);

-- Location: LCCOMB_X20_Y22_N22
\u_vga|LessThan8~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~11_cout\ = CARRY((\u_vga|right_boat\(5) & ((!\u_vga|LessThan8~9_cout\) # (!\u_vga|h_cnt\(5)))) # (!\u_vga|right_boat\(5) & (!\u_vga|h_cnt\(5) & !\u_vga|LessThan8~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_boat\(5),
	datab => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|LessThan8~9_cout\,
	cout => \u_vga|LessThan8~11_cout\);

-- Location: LCCOMB_X20_Y22_N24
\u_vga|LessThan8~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~13_cout\ = CARRY((\u_vga|h_cnt\(6) & ((!\u_vga|LessThan8~11_cout\) # (!\u_vga|right_boat\(6)))) # (!\u_vga|h_cnt\(6) & (!\u_vga|right_boat\(6) & !\u_vga|LessThan8~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|right_boat\(6),
	datad => VCC,
	cin => \u_vga|LessThan8~11_cout\,
	cout => \u_vga|LessThan8~13_cout\);

-- Location: LCCOMB_X20_Y22_N26
\u_vga|LessThan8~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~15_cout\ = CARRY((\u_vga|right_boat\(7) & ((!\u_vga|LessThan8~13_cout\) # (!\u_vga|h_cnt\(7)))) # (!\u_vga|right_boat\(7) & (!\u_vga|h_cnt\(7) & !\u_vga|LessThan8~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_boat\(7),
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|LessThan8~13_cout\,
	cout => \u_vga|LessThan8~15_cout\);

-- Location: LCCOMB_X20_Y22_N28
\u_vga|LessThan8~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~17_cout\ = CARRY((\u_vga|right_boat\(8) & (\u_vga|h_cnt\(8) & !\u_vga|LessThan8~15_cout\)) # (!\u_vga|right_boat\(8) & ((\u_vga|h_cnt\(8)) # (!\u_vga|LessThan8~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_boat\(8),
	datab => \u_vga|h_cnt\(8),
	datad => VCC,
	cin => \u_vga|LessThan8~15_cout\,
	cout => \u_vga|LessThan8~17_cout\);

-- Location: LCCOMB_X20_Y22_N30
\u_vga|LessThan8~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~18_combout\ = (\u_vga|h_cnt\(9) & ((\u_vga|LessThan8~17_cout\) # (!\u_vga|right_boat\(9)))) # (!\u_vga|h_cnt\(9) & (\u_vga|LessThan8~17_cout\ & !\u_vga|right_boat\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datad => \u_vga|right_boat\(9),
	cin => \u_vga|LessThan8~17_cout\,
	combout => \u_vga|LessThan8~18_combout\);

-- Location: LCCOMB_X26_Y24_N26
\u_vga|vga_gen~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~33_combout\ = (!\u_vga|LessThan7~18_combout\ & (!\u_vga|h_cnt\(10) & (!\u_vga|LessThan8~18_combout\ & \u_vga|v_cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan7~18_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|LessThan8~18_combout\,
	datad => \u_vga|v_cnt\(7),
	combout => \u_vga|vga_gen~33_combout\);

-- Location: LCCOMB_X26_Y24_N28
\u_vga|vga_gen~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~34_combout\ = (\u_vga|v_cnt\(4) & ((\u_vga|v_cnt\(3)) # ((\u_vga|v_cnt\(1) & \u_vga|v_cnt\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(1),
	datab => \u_vga|v_cnt\(3),
	datac => \u_vga|v_cnt\(4),
	datad => \u_vga|v_cnt\(2),
	combout => \u_vga|vga_gen~34_combout\);

-- Location: LCCOMB_X26_Y24_N30
\u_vga|vga_gen~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~35_combout\ = (!\u_vga|v_cnt\(5) & !\u_vga|v_cnt\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datac => \u_vga|v_cnt\(6),
	combout => \u_vga|vga_gen~35_combout\);

-- Location: LCCOMB_X26_Y24_N0
\u_vga|vga_gen~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~36_combout\ = (\u_vga|vga_gen~33_combout\ & (!\u_vga|LessThan4~1_combout\ & ((\u_vga|vga_gen~34_combout\) # (!\u_vga|vga_gen~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~33_combout\,
	datab => \u_vga|vga_gen~34_combout\,
	datac => \u_vga|vga_gen~35_combout\,
	datad => \u_vga|LessThan4~1_combout\,
	combout => \u_vga|vga_gen~36_combout\);

-- Location: LCCOMB_X26_Y23_N12
\u_vga|LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~0_combout\ = (\u_vga|v_cnt\(6) & ((\u_vga|v_cnt\(5)) # ((\u_vga|v_cnt\(4) & \u_vga|v_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datab => \u_vga|v_cnt\(6),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|v_cnt\(3),
	combout => \u_vga|LessThan3~0_combout\);

-- Location: LCCOMB_X26_Y23_N24
\u_vga|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~1_combout\ = (\u_vga|v_cnt\(8)) # (\u_vga|v_cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(8),
	datac => \u_vga|v_cnt\(7),
	combout => \u_vga|LessThan3~1_combout\);

-- Location: LCCOMB_X26_Y23_N26
\u_vga|LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan3~2_combout\ = (!\u_vga|v_cnt\(10) & (((!\u_vga|LessThan3~0_combout\ & !\u_vga|LessThan3~1_combout\)) # (!\u_vga|v_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan3~0_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|LessThan3~1_combout\,
	combout => \u_vga|LessThan3~2_combout\);

-- Location: LCCOMB_X26_Y23_N18
\u_vga|vga_gen~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~37_combout\ = ((!\u_vga|v_cnt\(5) & !\u_vga|v_cnt\(6))) # (!\u_vga|v_cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(6),
	combout => \u_vga|vga_gen~37_combout\);

-- Location: LCCOMB_X26_Y23_N8
\u_vga|vga_gen~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~38_combout\ = ((!\u_vga|v_cnt\(9) & (!\u_vga|v_cnt\(8) & \u_vga|vga_gen~37_combout\))) # (!\u_vga|LessThan3~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datab => \u_vga|LessThan3~2_combout\,
	datac => \u_vga|v_cnt\(8),
	datad => \u_vga|vga_gen~37_combout\,
	combout => \u_vga|vga_gen~38_combout\);

-- Location: LCCOMB_X28_Y24_N24
\u_vga|Equal7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal7~3_combout\ = (\u_vga|v_cnt\(6) & \u_vga|v_cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|v_cnt\(6),
	datad => \u_vga|v_cnt\(7),
	combout => \u_vga|Equal7~3_combout\);

-- Location: LCCOMB_X28_Y24_N30
\u_vga|Equal7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal7~2_combout\ = (\u_vga|v_cnt\(1) & (\u_vga|v_cnt\(2) & \u_vga|v_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(2),
	datad => \u_vga|v_cnt\(0),
	combout => \u_vga|Equal7~2_combout\);

-- Location: LCCOMB_X27_Y23_N16
\u_vga|Equal7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal7~4_combout\ = (\u_vga|Equal7~3_combout\ & (\u_vga|Equal7~2_combout\ & (\u_vga|Equal7~0_combout\ & \u_vga|Equal7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal7~3_combout\,
	datab => \u_vga|Equal7~2_combout\,
	datac => \u_vga|Equal7~0_combout\,
	datad => \u_vga|Equal7~1_combout\,
	combout => \u_vga|Equal7~4_combout\);

-- Location: LCCOMB_X27_Y22_N20
\u_vga|red_signal~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~7_combout\ = (\u_vga|LessThan26~0_combout\ & ((\u_vga|Equal7~4_combout\) # (!\u_vga|vga_gen~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|vga_gen~38_combout\,
	datac => \u_vga|LessThan26~0_combout\,
	datad => \u_vga|Equal7~4_combout\,
	combout => \u_vga|red_signal~7_combout\);

-- Location: LCCOMB_X27_Y22_N6
\u_vga|red_signal~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~8_combout\ = (!\u_vga|vga_gen~10_combout\ & (!\u_vga|red_signal~7_combout\ & ((\u_vga|red_signal~6_combout\) # (\u_vga|vga_gen~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~6_combout\,
	datab => \u_vga|vga_gen~10_combout\,
	datac => \u_vga|vga_gen~36_combout\,
	datad => \u_vga|red_signal~7_combout\,
	combout => \u_vga|red_signal~8_combout\);

-- Location: LCCOMB_X20_Y19_N30
\u_vga|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan1~0_combout\ = (\u_vga|magn_g_y\(4) & ((\u_vga|magn_g_y\(2)) # ((\u_vga|magn_g_y\(3)) # (\u_vga|magn_g_y\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(2),
	datab => \u_vga|magn_g_y\(4),
	datac => \u_vga|magn_g_y\(3),
	datad => \u_vga|magn_g_y\(1),
	combout => \u_vga|LessThan1~0_combout\);

-- Location: LCCOMB_X19_Y19_N0
\u_vga|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan1~1_combout\ = (\u_vga|magn_g_y\(5) & \u_vga|LessThan1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|magn_g_y\(5),
	datac => \u_vga|LessThan1~0_combout\,
	combout => \u_vga|LessThan1~1_combout\);

-- Location: LCCOMB_X20_Y19_N20
\u_vga|Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~0_combout\ = (\u_vga|LessThan1~1_combout\ & (\u_vga|magn_g_y\(1) $ (VCC))) # (!\u_vga|LessThan1~1_combout\ & (\u_vga|magn_g_y\(1) & VCC))
-- \u_vga|Add5~1\ = CARRY((\u_vga|LessThan1~1_combout\ & \u_vga|magn_g_y\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan1~1_combout\,
	datab => \u_vga|magn_g_y\(1),
	datad => VCC,
	combout => \u_vga|Add5~0_combout\,
	cout => \u_vga|Add5~1\);

-- Location: LCCOMB_X20_Y19_N22
\u_vga|Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~2_combout\ = (\u_vga|magn_g_y\(2) & (!\u_vga|Add5~1\)) # (!\u_vga|magn_g_y\(2) & ((\u_vga|Add5~1\) # (GND)))
-- \u_vga|Add5~3\ = CARRY((!\u_vga|Add5~1\) # (!\u_vga|magn_g_y\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(2),
	datad => VCC,
	cin => \u_vga|Add5~1\,
	combout => \u_vga|Add5~2_combout\,
	cout => \u_vga|Add5~3\);

-- Location: LCCOMB_X20_Y19_N24
\u_vga|Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~4_combout\ = (\u_vga|magn_g_y\(3) & (\u_vga|Add5~3\ $ (GND))) # (!\u_vga|magn_g_y\(3) & (!\u_vga|Add5~3\ & VCC))
-- \u_vga|Add5~5\ = CARRY((\u_vga|magn_g_y\(3) & !\u_vga|Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(3),
	datad => VCC,
	cin => \u_vga|Add5~3\,
	combout => \u_vga|Add5~4_combout\,
	cout => \u_vga|Add5~5\);

-- Location: LCCOMB_X26_Y20_N30
\u_vga|Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~0_combout\ = (!\u_vga|Add5~4_combout\ & (!\u_vga|Add5~0_combout\ & !\u_vga|Add5~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~4_combout\,
	datab => \u_vga|Add5~0_combout\,
	datac => \u_vga|Add5~2_combout\,
	combout => \u_vga|Decoder0~0_combout\);

-- Location: LCCOMB_X20_Y19_N26
\u_vga|Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~6_combout\ = (\u_vga|LessThan1~1_combout\ & ((\u_vga|magn_g_y\(4) & (\u_vga|Add5~5\ & VCC)) # (!\u_vga|magn_g_y\(4) & (!\u_vga|Add5~5\)))) # (!\u_vga|LessThan1~1_combout\ & ((\u_vga|magn_g_y\(4) & (!\u_vga|Add5~5\)) # (!\u_vga|magn_g_y\(4) & 
-- ((\u_vga|Add5~5\) # (GND)))))
-- \u_vga|Add5~7\ = CARRY((\u_vga|LessThan1~1_combout\ & (!\u_vga|magn_g_y\(4) & !\u_vga|Add5~5\)) # (!\u_vga|LessThan1~1_combout\ & ((!\u_vga|Add5~5\) # (!\u_vga|magn_g_y\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan1~1_combout\,
	datab => \u_vga|magn_g_y\(4),
	datad => VCC,
	cin => \u_vga|Add5~5\,
	combout => \u_vga|Add5~6_combout\,
	cout => \u_vga|Add5~7\);

-- Location: LCCOMB_X20_Y19_N28
\u_vga|Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~8_combout\ = \u_vga|LessThan1~1_combout\ $ (\u_vga|magn_g_y\(5) $ (!\u_vga|Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan1~1_combout\,
	datab => \u_vga|magn_g_y\(5),
	cin => \u_vga|Add5~7\,
	combout => \u_vga|Add5~8_combout\);

-- Location: LCCOMB_X25_Y19_N18
\u_vga|current_submarine[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[0]~7_combout\ = \u_vga|current_submarine\(0) $ (VCC)
-- \u_vga|current_submarine[0]~8\ = CARRY(\u_vga|current_submarine\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine\(0),
	datad => VCC,
	combout => \u_vga|current_submarine[0]~7_combout\,
	cout => \u_vga|current_submarine[0]~8\);

-- Location: LCCOMB_X26_Y23_N22
\u_vga|update_elements_position~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~4_combout\ = (\u_vga|update_elements_position~1_combout\ & (!\u_vga|v_cnt\(7) & (\u_vga|v_cnt\(5) & \u_vga|update_elements_position~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_elements_position~1_combout\,
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|update_elements_position~0_combout\,
	combout => \u_vga|update_elements_position~4_combout\);

-- Location: LCCOMB_X27_Y24_N30
\u_vga|update_elements_position~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~2_combout\ = (\u_vga|v_cnt\(6) & (\u_vga|v_cnt\(1) & (\u_vga|v_cnt\(0) & !\u_vga|v_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(0),
	datad => \u_vga|v_cnt\(2),
	combout => \u_vga|update_elements_position~2_combout\);

-- Location: LCCOMB_X26_Y22_N28
\u_vga|vga_gen~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~39_combout\ = (\u_vga|h_cnt\(9) & (\u_vga|h_cnt\(8) & !\u_vga|h_cnt\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(9),
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|h_cnt\(10),
	combout => \u_vga|vga_gen~39_combout\);

-- Location: LCCOMB_X26_Y22_N20
\u_vga|update_elements_position~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~3_combout\ = (\u_vga|update_elements_position~2_combout\ & (\u_vga|vga_gen~39_combout\ & \u_vga|h_cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_elements_position~2_combout\,
	datab => \u_vga|vga_gen~39_combout\,
	datac => \u_vga|h_cnt\(4),
	combout => \u_vga|update_elements_position~3_combout\);

-- Location: LCCOMB_X26_Y22_N14
\u_vga|update_elements_position~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~5_combout\ = (\u_vga|update_elements_position~4_combout\ & (\u_vga|LessThan23~0_combout\ & (\u_vga|LessThan23~2_combout\ & \u_vga|update_elements_position~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_elements_position~4_combout\,
	datab => \u_vga|LessThan23~0_combout\,
	datac => \u_vga|LessThan23~2_combout\,
	datad => \u_vga|update_elements_position~3_combout\,
	combout => \u_vga|update_elements_position~5_combout\);

-- Location: LCCOMB_X25_Y21_N14
\u_vga|Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal4~0_combout\ = (!\u_vga|current_submarine\(3) & (!\u_vga|current_submarine\(1) & !\u_vga|current_submarine\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(3),
	datab => \u_vga|current_submarine\(1),
	datac => \u_vga|current_submarine\(2),
	combout => \u_vga|Equal4~0_combout\);

-- Location: LCCOMB_X25_Y21_N22
\u_vga|Equal4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal4~1_combout\ = (((!\u_vga|current_submarine\(5)) # (!\u_vga|Equal4~0_combout\)) # (!\u_vga|current_submarine\(0))) # (!\u_vga|current_submarine\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(4),
	datab => \u_vga|current_submarine\(0),
	datac => \u_vga|Equal4~0_combout\,
	datad => \u_vga|current_submarine\(5),
	combout => \u_vga|Equal4~1_combout\);

-- Location: LCCOMB_X25_Y23_N4
\u_vga|current_submarine[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[1]~11_combout\ = (\u_vga|update_elements_position~5_combout\) # (!\u_vga|Equal4~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|update_elements_position~5_combout\,
	datac => \u_vga|Equal4~1_combout\,
	combout => \u_vga|current_submarine[1]~11_combout\);

-- Location: LCCOMB_X24_Y23_N20
\u_vga|data_a_sub[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[10]~0_combout\ = (\u_vga|v_sync~q\ & !\u_vga|update_elements_position~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|update_elements_position~5_combout\,
	combout => \u_vga|data_a_sub[10]~0_combout\);

-- Location: LCCOMB_X24_Y23_N16
\u_vga|read_sub~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|read_sub~0_combout\ = \u_vga|read_sub~q\ $ (((\u_vga|update_submarines~q\ & (!\u_vga|Mux0~32_combout\ & \u_vga|data_a_sub[10]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|Mux0~32_combout\,
	datac => \u_vga|read_sub~q\,
	datad => \u_vga|data_a_sub[10]~0_combout\,
	combout => \u_vga|read_sub~0_combout\);

-- Location: FF_X24_Y23_N17
\u_vga|read_sub\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|read_sub~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|read_sub~q\);

-- Location: LCCOMB_X24_Y23_N4
\u_vga|current_submarine[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[1]~6_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|v_sync~q\ & ((\u_vga|Mux0~32_combout\) # (\u_vga|read_sub~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|v_sync~q\,
	datac => \u_vga|Mux0~32_combout\,
	datad => \u_vga|read_sub~q\,
	combout => \u_vga|current_submarine[1]~6_combout\);

-- Location: LCCOMB_X25_Y23_N22
\u_vga|current_submarine[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[1]~12_combout\ = (\u_vga|update_elements_position~5_combout\) # (\u_vga|current_submarine[1]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|update_elements_position~5_combout\,
	datac => \u_vga|current_submarine[1]~6_combout\,
	combout => \u_vga|current_submarine[1]~12_combout\);

-- Location: FF_X25_Y19_N19
\u_vga|current_submarine[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[0]~7_combout\,
	sclr => \u_vga|current_submarine[1]~11_combout\,
	ena => \u_vga|current_submarine[1]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(0));

-- Location: LCCOMB_X25_Y19_N20
\u_vga|current_submarine[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[1]~9_combout\ = (\u_vga|current_submarine\(1) & (!\u_vga|current_submarine[0]~8\)) # (!\u_vga|current_submarine\(1) & ((\u_vga|current_submarine[0]~8\) # (GND)))
-- \u_vga|current_submarine[1]~10\ = CARRY((!\u_vga|current_submarine[0]~8\) # (!\u_vga|current_submarine\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine\(1),
	datad => VCC,
	cin => \u_vga|current_submarine[0]~8\,
	combout => \u_vga|current_submarine[1]~9_combout\,
	cout => \u_vga|current_submarine[1]~10\);

-- Location: FF_X25_Y19_N21
\u_vga|current_submarine[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[1]~9_combout\,
	sclr => \u_vga|current_submarine[1]~11_combout\,
	ena => \u_vga|current_submarine[1]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(1));

-- Location: LCCOMB_X25_Y19_N22
\u_vga|current_submarine[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[2]~13_combout\ = (\u_vga|current_submarine\(2) & (\u_vga|current_submarine[1]~10\ $ (GND))) # (!\u_vga|current_submarine\(2) & (!\u_vga|current_submarine[1]~10\ & VCC))
-- \u_vga|current_submarine[2]~14\ = CARRY((\u_vga|current_submarine\(2) & !\u_vga|current_submarine[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(2),
	datad => VCC,
	cin => \u_vga|current_submarine[1]~10\,
	combout => \u_vga|current_submarine[2]~13_combout\,
	cout => \u_vga|current_submarine[2]~14\);

-- Location: FF_X25_Y19_N23
\u_vga|current_submarine[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[2]~13_combout\,
	sclr => \u_vga|current_submarine[1]~11_combout\,
	ena => \u_vga|current_submarine[1]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(2));

-- Location: LCCOMB_X25_Y19_N24
\u_vga|current_submarine[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[3]~15_combout\ = (\u_vga|current_submarine\(3) & (!\u_vga|current_submarine[2]~14\)) # (!\u_vga|current_submarine\(3) & ((\u_vga|current_submarine[2]~14\) # (GND)))
-- \u_vga|current_submarine[3]~16\ = CARRY((!\u_vga|current_submarine[2]~14\) # (!\u_vga|current_submarine\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine\(3),
	datad => VCC,
	cin => \u_vga|current_submarine[2]~14\,
	combout => \u_vga|current_submarine[3]~15_combout\,
	cout => \u_vga|current_submarine[3]~16\);

-- Location: FF_X25_Y19_N25
\u_vga|current_submarine[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[3]~15_combout\,
	sclr => \u_vga|current_submarine[1]~11_combout\,
	ena => \u_vga|current_submarine[1]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(3));

-- Location: LCCOMB_X25_Y19_N26
\u_vga|current_submarine[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[4]~17_combout\ = (\u_vga|current_submarine\(4) & (\u_vga|current_submarine[3]~16\ $ (GND))) # (!\u_vga|current_submarine\(4) & (!\u_vga|current_submarine[3]~16\ & VCC))
-- \u_vga|current_submarine[4]~18\ = CARRY((\u_vga|current_submarine\(4) & !\u_vga|current_submarine[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(4),
	datad => VCC,
	cin => \u_vga|current_submarine[3]~16\,
	combout => \u_vga|current_submarine[4]~17_combout\,
	cout => \u_vga|current_submarine[4]~18\);

-- Location: FF_X25_Y19_N27
\u_vga|current_submarine[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[4]~17_combout\,
	sclr => \u_vga|current_submarine[1]~11_combout\,
	ena => \u_vga|current_submarine[1]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(4));

-- Location: LCCOMB_X25_Y19_N28
\u_vga|current_submarine[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[5]~19_combout\ = \u_vga|current_submarine[4]~18\ $ (\u_vga|current_submarine\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|current_submarine\(5),
	cin => \u_vga|current_submarine[4]~18\,
	combout => \u_vga|current_submarine[5]~19_combout\);

-- Location: FF_X25_Y19_N29
\u_vga|current_submarine[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[5]~19_combout\,
	sclr => \u_vga|current_submarine[1]~11_combout\,
	ena => \u_vga|current_submarine[1]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(5));

-- Location: LCCOMB_X24_Y19_N16
\u_vga|submarines[48]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[48]~49_combout\ = (\u_vga|submarines\(48)) # ((!\u_vga|magn_g_y\(0) & (\u_vga|Decoder0~0_combout\ & \u_vga|Decoder0~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Decoder0~0_combout\,
	datac => \u_vga|submarines\(48),
	datad => \u_vga|Decoder0~17_combout\,
	combout => \u_vga|submarines[48]~49_combout\);

-- Location: FF_X24_Y19_N17
\u_vga|submarines[48]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[48]~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(48));

-- Location: LCCOMB_X25_Y21_N16
\u_vga|Mux0~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~31_combout\ = ((\u_vga|current_submarine\(0) & (!\u_vga|submarines\(49))) # (!\u_vga|current_submarine\(0) & ((!\u_vga|submarines\(48))))) # (!\u_vga|Equal4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(49),
	datab => \u_vga|current_submarine\(0),
	datac => \u_vga|Equal4~0_combout\,
	datad => \u_vga|submarines\(48),
	combout => \u_vga|Mux0~31_combout\);

-- Location: LCCOMB_X24_Y19_N4
\u_vga|Decoder0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~12_combout\ = (!\u_vga|magn_g_y\(0) & (\u_vga|Add5~8_combout\ & (!\u_vga|Add5~6_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|Decoder0~12_combout\);

-- Location: LCCOMB_X26_Y19_N14
\u_vga|Decoder0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~5_combout\ = (!\u_vga|Add5~2_combout\ & (\u_vga|Add5~4_combout\ & !\u_vga|Add5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~2_combout\,
	datac => \u_vga|Add5~4_combout\,
	datad => \u_vga|Add5~0_combout\,
	combout => \u_vga|Decoder0~5_combout\);

-- Location: LCCOMB_X25_Y20_N26
\u_vga|submarines[40]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[40]~22_combout\ = (\u_vga|submarines\(40)) # ((\u_vga|Decoder0~12_combout\ & \u_vga|Decoder0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~12_combout\,
	datac => \u_vga|submarines\(40),
	datad => \u_vga|Decoder0~5_combout\,
	combout => \u_vga|submarines[40]~22_combout\);

-- Location: FF_X25_Y20_N27
\u_vga|submarines[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[40]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(40));

-- Location: LCCOMB_X24_Y20_N26
\u_vga|Decoder0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~6_combout\ = (\u_vga|Add5~0_combout\ & (!\u_vga|Add5~2_combout\ & \u_vga|Add5~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~0_combout\,
	datab => \u_vga|Add5~2_combout\,
	datac => \u_vga|Add5~4_combout\,
	combout => \u_vga|Decoder0~6_combout\);

-- Location: LCCOMB_X25_Y20_N28
\u_vga|submarines[42]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[42]~30_combout\ = (\u_vga|submarines\(42)) # ((\u_vga|Decoder0~6_combout\ & \u_vga|Decoder0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~6_combout\,
	datac => \u_vga|submarines\(42),
	datad => \u_vga|Decoder0~12_combout\,
	combout => \u_vga|submarines[42]~30_combout\);

-- Location: FF_X25_Y20_N29
\u_vga|submarines[42]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[42]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(42));

-- Location: LCCOMB_X25_Y20_N10
\u_vga|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~2_combout\ = (\u_vga|current_submarine\(1) & (((\u_vga|current_submarine\(0)) # (!\u_vga|submarines\(42))))) # (!\u_vga|current_submarine\(1) & (!\u_vga|submarines\(40) & (!\u_vga|current_submarine\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(40),
	datab => \u_vga|current_submarine\(1),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|submarines\(42),
	combout => \u_vga|Mux0~2_combout\);

-- Location: LCCOMB_X24_Y19_N22
\u_vga|Decoder0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~13_combout\ = (\u_vga|magn_g_y\(0) & (\u_vga|Add5~8_combout\ & (!\u_vga|Add5~6_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|Decoder0~13_combout\);

-- Location: LCCOMB_X25_Y20_N16
\u_vga|submarines[41]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[41]~20_combout\ = (\u_vga|submarines\(41)) # ((\u_vga|Decoder0~13_combout\ & \u_vga|Decoder0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~13_combout\,
	datac => \u_vga|submarines\(41),
	datad => \u_vga|Decoder0~5_combout\,
	combout => \u_vga|submarines[41]~20_combout\);

-- Location: FF_X25_Y20_N17
\u_vga|submarines[41]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[41]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(41));

-- Location: LCCOMB_X25_Y20_N18
\u_vga|submarines[43]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[43]~28_combout\ = (\u_vga|submarines\(43)) # ((\u_vga|Decoder0~6_combout\ & \u_vga|Decoder0~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~6_combout\,
	datac => \u_vga|submarines\(43),
	datad => \u_vga|Decoder0~13_combout\,
	combout => \u_vga|submarines[43]~28_combout\);

-- Location: FF_X25_Y20_N19
\u_vga|submarines[43]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[43]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(43));

-- Location: LCCOMB_X25_Y20_N4
\u_vga|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~3_combout\ = (\u_vga|Mux0~2_combout\ & (((!\u_vga|submarines\(43)) # (!\u_vga|current_submarine\(0))))) # (!\u_vga|Mux0~2_combout\ & (!\u_vga|submarines\(41) & (\u_vga|current_submarine\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~2_combout\,
	datab => \u_vga|submarines\(41),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|submarines\(43),
	combout => \u_vga|Mux0~3_combout\);

-- Location: LCCOMB_X24_Y19_N24
\u_vga|Decoder0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~14_combout\ = (\u_vga|Add5~8_combout\ & (!\u_vga|Add5~6_combout\ & \u_vga|Decoder0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|Decoder0~14_combout\);

-- Location: LCCOMB_X24_Y19_N0
\u_vga|submarines[33]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[33]~25_combout\ = (\u_vga|submarines\(33)) # ((\u_vga|magn_g_y\(0) & (\u_vga|Decoder0~0_combout\ & \u_vga|Decoder0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Decoder0~0_combout\,
	datac => \u_vga|submarines\(33),
	datad => \u_vga|Decoder0~14_combout\,
	combout => \u_vga|submarines[33]~25_combout\);

-- Location: FF_X24_Y19_N1
\u_vga|submarines[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[33]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(33));

-- Location: LCCOMB_X26_Y20_N8
\u_vga|Decoder0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~4_combout\ = (!\u_vga|Add5~4_combout\ & (\u_vga|Add5~0_combout\ & !\u_vga|Add5~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~4_combout\,
	datab => \u_vga|Add5~0_combout\,
	datac => \u_vga|Add5~2_combout\,
	combout => \u_vga|Decoder0~4_combout\);

-- Location: LCCOMB_X26_Y21_N24
\u_vga|submarines[35]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[35]~17_combout\ = (\u_vga|submarines\(35)) # ((\u_vga|Decoder0~13_combout\ & \u_vga|Decoder0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~13_combout\,
	datab => \u_vga|Decoder0~4_combout\,
	datac => \u_vga|submarines\(35),
	combout => \u_vga|submarines[35]~17_combout\);

-- Location: FF_X26_Y21_N25
\u_vga|submarines[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[35]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(35));

-- Location: LCCOMB_X26_Y20_N22
\u_vga|submarines[32]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[32]~26_combout\ = (\u_vga|submarines\(32)) # ((\u_vga|Decoder0~0_combout\ & \u_vga|Decoder0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~0_combout\,
	datab => \u_vga|Decoder0~12_combout\,
	datac => \u_vga|submarines\(32),
	combout => \u_vga|submarines[32]~26_combout\);

-- Location: FF_X26_Y20_N23
\u_vga|submarines[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[32]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(32));

-- Location: LCCOMB_X26_Y21_N2
\u_vga|submarines[34]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[34]~18_combout\ = (\u_vga|submarines\(34)) # ((\u_vga|Decoder0~4_combout\ & \u_vga|Decoder0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~4_combout\,
	datac => \u_vga|submarines\(34),
	datad => \u_vga|Decoder0~12_combout\,
	combout => \u_vga|submarines[34]~18_combout\);

-- Location: FF_X26_Y21_N3
\u_vga|submarines[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[34]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(34));

-- Location: LCCOMB_X26_Y21_N12
\u_vga|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~4_combout\ = (\u_vga|current_submarine\(1) & (((\u_vga|current_submarine\(0)) # (!\u_vga|submarines\(34))))) # (!\u_vga|current_submarine\(1) & (!\u_vga|submarines\(32) & (!\u_vga|current_submarine\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(1),
	datab => \u_vga|submarines\(32),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|submarines\(34),
	combout => \u_vga|Mux0~4_combout\);

-- Location: LCCOMB_X26_Y21_N22
\u_vga|Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~5_combout\ = (\u_vga|current_submarine\(0) & ((\u_vga|Mux0~4_combout\ & ((!\u_vga|submarines\(35)))) # (!\u_vga|Mux0~4_combout\ & (!\u_vga|submarines\(33))))) # (!\u_vga|current_submarine\(0) & (((\u_vga|Mux0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(33),
	datab => \u_vga|submarines\(35),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|Mux0~4_combout\,
	combout => \u_vga|Mux0~5_combout\);

-- Location: LCCOMB_X25_Y21_N30
\u_vga|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~6_combout\ = (\u_vga|current_submarine\(3) & ((\u_vga|current_submarine\(2)) # ((\u_vga|Mux0~3_combout\)))) # (!\u_vga|current_submarine\(3) & (!\u_vga|current_submarine\(2) & ((\u_vga|Mux0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(3),
	datab => \u_vga|current_submarine\(2),
	datac => \u_vga|Mux0~3_combout\,
	datad => \u_vga|Mux0~5_combout\,
	combout => \u_vga|Mux0~6_combout\);

-- Location: LCCOMB_X26_Y20_N26
\u_vga|Decoder0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~9_combout\ = (!\u_vga|Add5~4_combout\ & (\u_vga|Add5~0_combout\ & \u_vga|Add5~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~4_combout\,
	datab => \u_vga|Add5~0_combout\,
	datac => \u_vga|Add5~2_combout\,
	combout => \u_vga|Decoder0~9_combout\);

-- Location: LCCOMB_X26_Y20_N4
\u_vga|submarines[38]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[38]~16_combout\ = (\u_vga|submarines\(38)) # ((\u_vga|Decoder0~9_combout\ & \u_vga|Decoder0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~9_combout\,
	datab => \u_vga|Decoder0~12_combout\,
	datac => \u_vga|submarines\(38),
	combout => \u_vga|submarines[38]~16_combout\);

-- Location: FF_X26_Y20_N5
\u_vga|submarines[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[38]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(38));

-- Location: LCCOMB_X26_Y21_N30
\u_vga|submarines[39]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[39]~19_combout\ = (\u_vga|submarines\(39)) # ((\u_vga|Decoder0~9_combout\ & \u_vga|Decoder0~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~9_combout\,
	datac => \u_vga|submarines\(39),
	datad => \u_vga|Decoder0~13_combout\,
	combout => \u_vga|submarines[39]~19_combout\);

-- Location: FF_X26_Y21_N31
\u_vga|submarines[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[39]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(39));

-- Location: LCCOMB_X26_Y20_N12
\u_vga|Decoder0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~10_combout\ = (!\u_vga|Add5~4_combout\ & (!\u_vga|Add5~0_combout\ & \u_vga|Add5~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~4_combout\,
	datab => \u_vga|Add5~0_combout\,
	datac => \u_vga|Add5~2_combout\,
	combout => \u_vga|Decoder0~10_combout\);

-- Location: LCCOMB_X26_Y21_N6
\u_vga|submarines[37]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[37]~27_combout\ = (\u_vga|submarines\(37)) # ((\u_vga|Decoder0~13_combout\ & \u_vga|Decoder0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~13_combout\,
	datab => \u_vga|Decoder0~10_combout\,
	datac => \u_vga|submarines\(37),
	combout => \u_vga|submarines[37]~27_combout\);

-- Location: FF_X26_Y21_N7
\u_vga|submarines[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[37]~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(37));

-- Location: LCCOMB_X26_Y21_N10
\u_vga|submarines[36]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[36]~24_combout\ = (\u_vga|submarines\(36)) # ((\u_vga|Decoder0~10_combout\ & \u_vga|Decoder0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~10_combout\,
	datac => \u_vga|submarines\(36),
	datad => \u_vga|Decoder0~12_combout\,
	combout => \u_vga|submarines[36]~24_combout\);

-- Location: FF_X26_Y21_N11
\u_vga|submarines[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[36]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(36));

-- Location: LCCOMB_X26_Y21_N26
\u_vga|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~0_combout\ = (\u_vga|current_submarine\(1) & (((\u_vga|current_submarine\(0))))) # (!\u_vga|current_submarine\(1) & ((\u_vga|current_submarine\(0) & (!\u_vga|submarines\(37))) # (!\u_vga|current_submarine\(0) & ((!\u_vga|submarines\(36))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(37),
	datab => \u_vga|current_submarine\(1),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|submarines\(36),
	combout => \u_vga|Mux0~0_combout\);

-- Location: LCCOMB_X25_Y21_N0
\u_vga|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~1_combout\ = (\u_vga|current_submarine\(1) & ((\u_vga|Mux0~0_combout\ & ((!\u_vga|submarines\(39)))) # (!\u_vga|Mux0~0_combout\ & (!\u_vga|submarines\(38))))) # (!\u_vga|current_submarine\(1) & (((\u_vga|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(38),
	datab => \u_vga|current_submarine\(1),
	datac => \u_vga|submarines\(39),
	datad => \u_vga|Mux0~0_combout\,
	combout => \u_vga|Mux0~1_combout\);

-- Location: LCCOMB_X24_Y20_N30
\u_vga|Decoder0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~11_combout\ = (\u_vga|Add5~0_combout\ & (\u_vga|Add5~2_combout\ & \u_vga|Add5~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~0_combout\,
	datab => \u_vga|Add5~2_combout\,
	datac => \u_vga|Add5~4_combout\,
	combout => \u_vga|Decoder0~11_combout\);

-- Location: LCCOMB_X24_Y19_N12
\u_vga|submarines[47]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[47]~31_combout\ = (\u_vga|submarines\(47)) # ((\u_vga|Decoder0~11_combout\ & \u_vga|Decoder0~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~11_combout\,
	datac => \u_vga|submarines\(47),
	datad => \u_vga|Decoder0~13_combout\,
	combout => \u_vga|submarines[47]~31_combout\);

-- Location: FF_X24_Y19_N13
\u_vga|submarines[47]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[47]~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(47));

-- Location: LCCOMB_X24_Y19_N2
\u_vga|submarines[46]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[46]~29_combout\ = (\u_vga|submarines\(46)) # ((\u_vga|Decoder0~11_combout\ & \u_vga|Decoder0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~11_combout\,
	datab => \u_vga|Decoder0~12_combout\,
	datac => \u_vga|submarines\(46),
	combout => \u_vga|submarines[46]~29_combout\);

-- Location: FF_X24_Y19_N3
\u_vga|submarines[46]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[46]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(46));

-- Location: LCCOMB_X24_Y20_N28
\u_vga|Decoder0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~8_combout\ = (!\u_vga|Add5~0_combout\ & (\u_vga|Add5~2_combout\ & \u_vga|Add5~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~0_combout\,
	datab => \u_vga|Add5~2_combout\,
	datac => \u_vga|Add5~4_combout\,
	combout => \u_vga|Decoder0~8_combout\);

-- Location: LCCOMB_X25_Y20_N6
\u_vga|submarines[45]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[45]~23_combout\ = (\u_vga|submarines\(45)) # ((\u_vga|Decoder0~13_combout\ & \u_vga|Decoder0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~13_combout\,
	datac => \u_vga|submarines\(45),
	datad => \u_vga|Decoder0~8_combout\,
	combout => \u_vga|submarines[45]~23_combout\);

-- Location: FF_X25_Y20_N7
\u_vga|submarines[45]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[45]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(45));

-- Location: LCCOMB_X23_Y20_N0
\u_vga|submarines[44]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[44]~21_combout\ = (\u_vga|submarines\(44)) # ((\u_vga|Decoder0~12_combout\ & \u_vga|Decoder0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~12_combout\,
	datac => \u_vga|submarines\(44),
	datad => \u_vga|Decoder0~8_combout\,
	combout => \u_vga|submarines[44]~21_combout\);

-- Location: FF_X23_Y20_N1
\u_vga|submarines[44]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[44]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(44));

-- Location: LCCOMB_X25_Y20_N22
\u_vga|Mux0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~7_combout\ = (\u_vga|current_submarine\(0) & (((\u_vga|current_submarine\(1))) # (!\u_vga|submarines\(45)))) # (!\u_vga|current_submarine\(0) & (((!\u_vga|submarines\(44) & !\u_vga|current_submarine\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(45),
	datab => \u_vga|submarines\(44),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|current_submarine\(1),
	combout => \u_vga|Mux0~7_combout\);

-- Location: LCCOMB_X25_Y21_N24
\u_vga|Mux0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~8_combout\ = (\u_vga|current_submarine\(1) & ((\u_vga|Mux0~7_combout\ & (!\u_vga|submarines\(47))) # (!\u_vga|Mux0~7_combout\ & ((!\u_vga|submarines\(46)))))) # (!\u_vga|current_submarine\(1) & (((\u_vga|Mux0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(47),
	datab => \u_vga|current_submarine\(1),
	datac => \u_vga|submarines\(46),
	datad => \u_vga|Mux0~7_combout\,
	combout => \u_vga|Mux0~8_combout\);

-- Location: LCCOMB_X25_Y21_N26
\u_vga|Mux0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~9_combout\ = (\u_vga|Mux0~6_combout\ & (((\u_vga|Mux0~8_combout\) # (!\u_vga|current_submarine\(2))))) # (!\u_vga|Mux0~6_combout\ & (\u_vga|Mux0~1_combout\ & (\u_vga|current_submarine\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~6_combout\,
	datab => \u_vga|Mux0~1_combout\,
	datac => \u_vga|current_submarine\(2),
	datad => \u_vga|Mux0~8_combout\,
	combout => \u_vga|Mux0~9_combout\);

-- Location: LCCOMB_X24_Y19_N18
\u_vga|Decoder0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~15_combout\ = (!\u_vga|magn_g_y\(0) & (!\u_vga|Add5~8_combout\ & (!\u_vga|Add5~6_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|Decoder0~15_combout\);

-- Location: LCCOMB_X23_Y20_N2
\u_vga|submarines[12]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[12]~32_combout\ = (\u_vga|submarines\(12)) # ((\u_vga|Decoder0~15_combout\ & \u_vga|Decoder0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~15_combout\,
	datac => \u_vga|submarines\(12),
	datad => \u_vga|Decoder0~8_combout\,
	combout => \u_vga|submarines[12]~32_combout\);

-- Location: FF_X23_Y20_N3
\u_vga|submarines[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[12]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(12));

-- Location: LCCOMB_X24_Y20_N24
\u_vga|submarines[14]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[14]~44_combout\ = (\u_vga|submarines\(14)) # ((\u_vga|Decoder0~15_combout\ & \u_vga|Decoder0~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~15_combout\,
	datac => \u_vga|submarines\(14),
	datad => \u_vga|Decoder0~11_combout\,
	combout => \u_vga|submarines[14]~44_combout\);

-- Location: FF_X24_Y20_N25
\u_vga|submarines[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[14]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(14));

-- Location: LCCOMB_X23_Y20_N28
\u_vga|Mux0~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~27_combout\ = (\u_vga|current_submarine\(1) & (((\u_vga|current_submarine\(0)) # (!\u_vga|submarines\(14))))) # (!\u_vga|current_submarine\(1) & (!\u_vga|submarines\(12) & (!\u_vga|current_submarine\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(1),
	datab => \u_vga|submarines\(12),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|submarines\(14),
	combout => \u_vga|Mux0~27_combout\);

-- Location: LCCOMB_X24_Y19_N28
\u_vga|Decoder0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~16_combout\ = (\u_vga|magn_g_y\(0) & (!\u_vga|Add5~8_combout\ & (!\u_vga|Add5~6_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|Decoder0~16_combout\);

-- Location: LCCOMB_X23_Y20_N18
\u_vga|submarines[13]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[13]~35_combout\ = (\u_vga|submarines\(13)) # ((\u_vga|Decoder0~16_combout\ & \u_vga|Decoder0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~16_combout\,
	datac => \u_vga|submarines\(13),
	datad => \u_vga|Decoder0~8_combout\,
	combout => \u_vga|submarines[13]~35_combout\);

-- Location: FF_X23_Y20_N19
\u_vga|submarines[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[13]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(13));

-- Location: LCCOMB_X24_Y20_N22
\u_vga|submarines[15]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[15]~47_combout\ = (\u_vga|submarines\(15)) # ((\u_vga|Decoder0~16_combout\ & \u_vga|Decoder0~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~16_combout\,
	datac => \u_vga|submarines\(15),
	datad => \u_vga|Decoder0~11_combout\,
	combout => \u_vga|submarines[15]~47_combout\);

-- Location: FF_X24_Y20_N23
\u_vga|submarines[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[15]~47_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(15));

-- Location: LCCOMB_X23_Y20_N22
\u_vga|Mux0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~28_combout\ = (\u_vga|Mux0~27_combout\ & (((!\u_vga|submarines\(15)) # (!\u_vga|current_submarine\(0))))) # (!\u_vga|Mux0~27_combout\ & (!\u_vga|submarines\(13) & (\u_vga|current_submarine\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~27_combout\,
	datab => \u_vga|submarines\(13),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|submarines\(15),
	combout => \u_vga|Mux0~28_combout\);

-- Location: LCCOMB_X24_Y20_N4
\u_vga|submarines[10]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[10]~46_combout\ = (\u_vga|submarines\(10)) # ((\u_vga|Decoder0~6_combout\ & \u_vga|Decoder0~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~6_combout\,
	datab => \u_vga|Decoder0~15_combout\,
	datac => \u_vga|submarines\(10),
	combout => \u_vga|submarines[10]~46_combout\);

-- Location: FF_X24_Y20_N5
\u_vga|submarines[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[10]~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(10));

-- Location: LCCOMB_X23_Y20_N12
\u_vga|submarines[9]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[9]~33_combout\ = (\u_vga|submarines\(9)) # ((\u_vga|Decoder0~5_combout\ & \u_vga|Decoder0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~5_combout\,
	datab => \u_vga|Decoder0~16_combout\,
	datac => \u_vga|submarines\(9),
	combout => \u_vga|submarines[9]~33_combout\);

-- Location: FF_X23_Y20_N13
\u_vga|submarines[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(9));

-- Location: LCCOMB_X23_Y20_N6
\u_vga|submarines[8]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[8]~34_combout\ = (\u_vga|submarines\(8)) # ((\u_vga|Decoder0~5_combout\ & \u_vga|Decoder0~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~5_combout\,
	datac => \u_vga|submarines\(8),
	datad => \u_vga|Decoder0~15_combout\,
	combout => \u_vga|submarines[8]~34_combout\);

-- Location: FF_X23_Y20_N7
\u_vga|submarines[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[8]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(8));

-- Location: LCCOMB_X23_Y20_N24
\u_vga|Mux0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~20_combout\ = (\u_vga|current_submarine\(0) & (((\u_vga|current_submarine\(1))) # (!\u_vga|submarines\(9)))) # (!\u_vga|current_submarine\(0) & (((!\u_vga|current_submarine\(1) & !\u_vga|submarines\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(9),
	datab => \u_vga|current_submarine\(0),
	datac => \u_vga|current_submarine\(1),
	datad => \u_vga|submarines\(8),
	combout => \u_vga|Mux0~20_combout\);

-- Location: LCCOMB_X24_Y20_N18
\u_vga|submarines[11]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[11]~45_combout\ = (\u_vga|submarines\(11)) # ((\u_vga|Decoder0~6_combout\ & \u_vga|Decoder0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~6_combout\,
	datac => \u_vga|submarines\(11),
	datad => \u_vga|Decoder0~16_combout\,
	combout => \u_vga|submarines[11]~45_combout\);

-- Location: FF_X24_Y20_N19
\u_vga|submarines[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[11]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(11));

-- Location: LCCOMB_X23_Y20_N26
\u_vga|Mux0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~21_combout\ = (\u_vga|Mux0~20_combout\ & (((!\u_vga|submarines\(11)) # (!\u_vga|current_submarine\(1))))) # (!\u_vga|Mux0~20_combout\ & (!\u_vga|submarines\(10) & (\u_vga|current_submarine\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(10),
	datab => \u_vga|Mux0~20_combout\,
	datac => \u_vga|current_submarine\(1),
	datad => \u_vga|submarines\(11),
	combout => \u_vga|Mux0~21_combout\);

-- Location: LCCOMB_X27_Y20_N20
\u_vga|submarines[2]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[2]~38_combout\ = (\u_vga|submarines\(2)) # ((\u_vga|Decoder0~15_combout\ & \u_vga|Decoder0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~15_combout\,
	datac => \u_vga|submarines\(2),
	datad => \u_vga|Decoder0~4_combout\,
	combout => \u_vga|submarines[2]~38_combout\);

-- Location: FF_X27_Y20_N21
\u_vga|submarines[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[2]~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(2));

-- Location: LCCOMB_X27_Y20_N10
\u_vga|submarines[1]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[1]~40_combout\ = (\u_vga|submarines\(1)) # ((\u_vga|Decoder0~16_combout\ & \u_vga|Decoder0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~16_combout\,
	datac => \u_vga|submarines\(1),
	datad => \u_vga|Decoder0~0_combout\,
	combout => \u_vga|submarines[1]~40_combout\);

-- Location: FF_X27_Y20_N11
\u_vga|submarines[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[1]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(1));

-- Location: LCCOMB_X27_Y20_N30
\u_vga|submarines[0]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[0]~42_combout\ = (\u_vga|submarines\(0)) # ((\u_vga|Decoder0~15_combout\ & \u_vga|Decoder0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~15_combout\,
	datac => \u_vga|submarines\(0),
	datad => \u_vga|Decoder0~0_combout\,
	combout => \u_vga|submarines[0]~42_combout\);

-- Location: FF_X27_Y20_N31
\u_vga|submarines[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[0]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(0));

-- Location: LCCOMB_X27_Y20_N4
\u_vga|Mux0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~24_combout\ = (\u_vga|current_submarine\(0) & (((\u_vga|current_submarine\(1))) # (!\u_vga|submarines\(1)))) # (!\u_vga|current_submarine\(0) & (((!\u_vga|submarines\(0) & !\u_vga|current_submarine\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(1),
	datab => \u_vga|current_submarine\(0),
	datac => \u_vga|submarines\(0),
	datad => \u_vga|current_submarine\(1),
	combout => \u_vga|Mux0~24_combout\);

-- Location: LCCOMB_X27_Y20_N24
\u_vga|submarines[3]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[3]~36_combout\ = (\u_vga|submarines\(3)) # ((\u_vga|Decoder0~16_combout\ & \u_vga|Decoder0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~16_combout\,
	datac => \u_vga|submarines\(3),
	datad => \u_vga|Decoder0~4_combout\,
	combout => \u_vga|submarines[3]~36_combout\);

-- Location: FF_X27_Y20_N25
\u_vga|submarines[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[3]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(3));

-- Location: LCCOMB_X27_Y20_N6
\u_vga|Mux0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~25_combout\ = (\u_vga|current_submarine\(1) & ((\u_vga|Mux0~24_combout\ & ((!\u_vga|submarines\(3)))) # (!\u_vga|Mux0~24_combout\ & (!\u_vga|submarines\(2))))) # (!\u_vga|current_submarine\(1) & (((\u_vga|Mux0~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(1),
	datab => \u_vga|submarines\(2),
	datac => \u_vga|Mux0~24_combout\,
	datad => \u_vga|submarines\(3),
	combout => \u_vga|Mux0~25_combout\);

-- Location: LCCOMB_X27_Y20_N26
\u_vga|submarines[6]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[6]~37_combout\ = (\u_vga|submarines\(6)) # ((\u_vga|Decoder0~9_combout\ & \u_vga|Decoder0~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~9_combout\,
	datac => \u_vga|submarines\(6),
	datad => \u_vga|Decoder0~15_combout\,
	combout => \u_vga|submarines[6]~37_combout\);

-- Location: FF_X27_Y20_N27
\u_vga|submarines[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[6]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(6));

-- Location: LCCOMB_X27_Y20_N12
\u_vga|submarines[4]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[4]~41_combout\ = (\u_vga|submarines\(4)) # ((\u_vga|Decoder0~15_combout\ & \u_vga|Decoder0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~15_combout\,
	datac => \u_vga|submarines\(4),
	datad => \u_vga|Decoder0~10_combout\,
	combout => \u_vga|submarines[4]~41_combout\);

-- Location: FF_X27_Y20_N13
\u_vga|submarines[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[4]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(4));

-- Location: LCCOMB_X27_Y20_N2
\u_vga|Mux0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~22_combout\ = (\u_vga|current_submarine\(1) & (((\u_vga|current_submarine\(0))) # (!\u_vga|submarines\(6)))) # (!\u_vga|current_submarine\(1) & (((!\u_vga|current_submarine\(0) & !\u_vga|submarines\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(6),
	datab => \u_vga|current_submarine\(1),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|submarines\(4),
	combout => \u_vga|Mux0~22_combout\);

-- Location: LCCOMB_X26_Y20_N0
\u_vga|submarines[7]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[7]~39_combout\ = (\u_vga|submarines\(7)) # ((\u_vga|Decoder0~9_combout\ & \u_vga|Decoder0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~9_combout\,
	datac => \u_vga|submarines\(7),
	datad => \u_vga|Decoder0~16_combout\,
	combout => \u_vga|submarines[7]~39_combout\);

-- Location: FF_X26_Y20_N1
\u_vga|submarines[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[7]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(7));

-- Location: LCCOMB_X26_Y20_N2
\u_vga|submarines[5]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[5]~43_combout\ = (\u_vga|submarines\(5)) # ((\u_vga|Decoder0~16_combout\ & \u_vga|Decoder0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~16_combout\,
	datac => \u_vga|submarines\(5),
	datad => \u_vga|Decoder0~10_combout\,
	combout => \u_vga|submarines[5]~43_combout\);

-- Location: FF_X26_Y20_N3
\u_vga|submarines[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[5]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(5));

-- Location: LCCOMB_X26_Y20_N14
\u_vga|Mux0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~23_combout\ = (\u_vga|Mux0~22_combout\ & (((!\u_vga|current_submarine\(0))) # (!\u_vga|submarines\(7)))) # (!\u_vga|Mux0~22_combout\ & (((\u_vga|current_submarine\(0) & !\u_vga|submarines\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~22_combout\,
	datab => \u_vga|submarines\(7),
	datac => \u_vga|current_submarine\(0),
	datad => \u_vga|submarines\(5),
	combout => \u_vga|Mux0~23_combout\);

-- Location: LCCOMB_X26_Y20_N16
\u_vga|Mux0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~26_combout\ = (\u_vga|current_submarine\(2) & (((\u_vga|Mux0~23_combout\) # (\u_vga|current_submarine\(3))))) # (!\u_vga|current_submarine\(2) & (\u_vga|Mux0~25_combout\ & ((!\u_vga|current_submarine\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~25_combout\,
	datab => \u_vga|current_submarine\(2),
	datac => \u_vga|Mux0~23_combout\,
	datad => \u_vga|current_submarine\(3),
	combout => \u_vga|Mux0~26_combout\);

-- Location: LCCOMB_X26_Y20_N18
\u_vga|Mux0~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~29_combout\ = (\u_vga|current_submarine\(3) & ((\u_vga|Mux0~26_combout\ & (\u_vga|Mux0~28_combout\)) # (!\u_vga|Mux0~26_combout\ & ((\u_vga|Mux0~21_combout\))))) # (!\u_vga|current_submarine\(3) & (((\u_vga|Mux0~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~28_combout\,
	datab => \u_vga|current_submarine\(3),
	datac => \u_vga|Mux0~21_combout\,
	datad => \u_vga|Mux0~26_combout\,
	combout => \u_vga|Mux0~29_combout\);

-- Location: LCCOMB_X24_Y19_N26
\u_vga|Decoder0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~7_combout\ = (!\u_vga|magn_g_y\(0) & (!\u_vga|Add5~8_combout\ & (\u_vga|Add5~6_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|Decoder0~7_combout\);

-- Location: LCCOMB_X27_Y19_N30
\u_vga|submarines[30]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[30]~7_combout\ = (\u_vga|submarines\(30)) # ((\u_vga|Decoder0~7_combout\ & \u_vga|Decoder0~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~7_combout\,
	datac => \u_vga|submarines\(30),
	datad => \u_vga|Decoder0~11_combout\,
	combout => \u_vga|submarines[30]~7_combout\);

-- Location: FF_X27_Y19_N31
\u_vga|submarines[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[30]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(30));

-- Location: LCCOMB_X27_Y19_N26
\u_vga|submarines[18]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[18]~8_combout\ = (\u_vga|submarines\(18)) # ((\u_vga|Decoder0~4_combout\ & \u_vga|Decoder0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~4_combout\,
	datac => \u_vga|submarines\(18),
	datad => \u_vga|Decoder0~7_combout\,
	combout => \u_vga|submarines[18]~8_combout\);

-- Location: FF_X27_Y19_N27
\u_vga|submarines[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[18]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(18));

-- Location: LCCOMB_X27_Y19_N4
\u_vga|submarines[26]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[26]~11_combout\ = (\u_vga|submarines\(26)) # ((\u_vga|Decoder0~6_combout\ & \u_vga|Decoder0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~6_combout\,
	datac => \u_vga|submarines\(26),
	datad => \u_vga|Decoder0~7_combout\,
	combout => \u_vga|submarines[26]~11_combout\);

-- Location: FF_X27_Y19_N5
\u_vga|submarines[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[26]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(26));

-- Location: LCCOMB_X25_Y19_N0
\u_vga|Mux0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~10_combout\ = (\u_vga|current_submarine\(3) & (((\u_vga|current_submarine\(2)) # (!\u_vga|submarines\(26))))) # (!\u_vga|current_submarine\(3) & (!\u_vga|submarines\(18) & (!\u_vga|current_submarine\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(18),
	datab => \u_vga|current_submarine\(3),
	datac => \u_vga|current_submarine\(2),
	datad => \u_vga|submarines\(26),
	combout => \u_vga|Mux0~10_combout\);

-- Location: LCCOMB_X27_Y19_N8
\u_vga|submarines[22]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[22]~5_combout\ = (\u_vga|submarines\(22)) # ((\u_vga|Decoder0~7_combout\ & \u_vga|Decoder0~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~7_combout\,
	datac => \u_vga|submarines\(22),
	datad => \u_vga|Decoder0~9_combout\,
	combout => \u_vga|submarines[22]~5_combout\);

-- Location: FF_X27_Y19_N9
\u_vga|submarines[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[22]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(22));

-- Location: LCCOMB_X25_Y19_N10
\u_vga|Mux0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~11_combout\ = (\u_vga|Mux0~10_combout\ & (((!\u_vga|current_submarine\(2))) # (!\u_vga|submarines\(30)))) # (!\u_vga|Mux0~10_combout\ & (((\u_vga|current_submarine\(2) & !\u_vga|submarines\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(30),
	datab => \u_vga|Mux0~10_combout\,
	datac => \u_vga|current_submarine\(2),
	datad => \u_vga|submarines\(22),
	combout => \u_vga|Mux0~11_combout\);

-- Location: LCCOMB_X26_Y19_N0
\u_vga|submarines[16]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[16]~10_combout\ = (\u_vga|submarines\(16)) # ((\u_vga|Decoder0~0_combout\ & \u_vga|Decoder0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~0_combout\,
	datac => \u_vga|submarines\(16),
	datad => \u_vga|Decoder0~7_combout\,
	combout => \u_vga|submarines[16]~10_combout\);

-- Location: FF_X26_Y19_N1
\u_vga|submarines[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[16]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(16));

-- Location: LCCOMB_X26_Y19_N30
\u_vga|submarines[24]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[24]~9_combout\ = (\u_vga|submarines\(24)) # ((\u_vga|Decoder0~7_combout\ & \u_vga|Decoder0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~7_combout\,
	datac => \u_vga|submarines\(24),
	datad => \u_vga|Decoder0~5_combout\,
	combout => \u_vga|submarines[24]~9_combout\);

-- Location: FF_X26_Y19_N31
\u_vga|submarines[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[24]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(24));

-- Location: LCCOMB_X25_Y19_N16
\u_vga|Mux0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~14_combout\ = (\u_vga|current_submarine\(2) & (((\u_vga|current_submarine\(3))))) # (!\u_vga|current_submarine\(2) & ((\u_vga|current_submarine\(3) & ((!\u_vga|submarines\(24)))) # (!\u_vga|current_submarine\(3) & (!\u_vga|submarines\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(2),
	datab => \u_vga|submarines\(16),
	datac => \u_vga|submarines\(24),
	datad => \u_vga|current_submarine\(3),
	combout => \u_vga|Mux0~14_combout\);

-- Location: LCCOMB_X27_Y19_N2
\u_vga|submarines[20]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[20]~6_combout\ = (\u_vga|submarines\(20)) # ((\u_vga|Decoder0~7_combout\ & \u_vga|Decoder0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~7_combout\,
	datac => \u_vga|submarines\(20),
	datad => \u_vga|Decoder0~10_combout\,
	combout => \u_vga|submarines[20]~6_combout\);

-- Location: FF_X27_Y19_N3
\u_vga|submarines[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[20]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(20));

-- Location: LCCOMB_X27_Y19_N14
\u_vga|submarines[28]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[28]~4_combout\ = (\u_vga|submarines\(28)) # ((\u_vga|Decoder0~7_combout\ & \u_vga|Decoder0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~7_combout\,
	datac => \u_vga|submarines\(28),
	datad => \u_vga|Decoder0~8_combout\,
	combout => \u_vga|submarines[28]~4_combout\);

-- Location: FF_X27_Y19_N15
\u_vga|submarines[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[28]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(28));

-- Location: LCCOMB_X25_Y19_N2
\u_vga|Mux0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~15_combout\ = (\u_vga|current_submarine\(2) & ((\u_vga|Mux0~14_combout\ & ((!\u_vga|submarines\(28)))) # (!\u_vga|Mux0~14_combout\ & (!\u_vga|submarines\(20))))) # (!\u_vga|current_submarine\(2) & (\u_vga|Mux0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(2),
	datab => \u_vga|Mux0~14_combout\,
	datac => \u_vga|submarines\(20),
	datad => \u_vga|submarines\(28),
	combout => \u_vga|Mux0~15_combout\);

-- Location: LCCOMB_X24_Y19_N8
\u_vga|Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~3_combout\ = (\u_vga|magn_g_y\(0) & (!\u_vga|Add5~8_combout\ & (\u_vga|Add5~6_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|Decoder0~3_combout\);

-- Location: LCCOMB_X26_Y19_N18
\u_vga|submarines[17]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[17]~2_combout\ = (\u_vga|submarines\(17)) # ((\u_vga|Decoder0~0_combout\ & \u_vga|Decoder0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~0_combout\,
	datac => \u_vga|submarines\(17),
	datad => \u_vga|Decoder0~3_combout\,
	combout => \u_vga|submarines[17]~2_combout\);

-- Location: FF_X26_Y19_N19
\u_vga|submarines[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[17]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(17));

-- Location: LCCOMB_X26_Y20_N10
\u_vga|submarines[21]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[21]~14_combout\ = (\u_vga|submarines\(21)) # ((\u_vga|Decoder0~3_combout\ & \u_vga|Decoder0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~3_combout\,
	datac => \u_vga|submarines\(21),
	datad => \u_vga|Decoder0~10_combout\,
	combout => \u_vga|submarines[21]~14_combout\);

-- Location: FF_X26_Y20_N11
\u_vga|submarines[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[21]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(21));

-- Location: LCCOMB_X25_Y19_N12
\u_vga|Mux0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~12_combout\ = (\u_vga|current_submarine\(3) & (((\u_vga|current_submarine\(2))))) # (!\u_vga|current_submarine\(3) & ((\u_vga|current_submarine\(2) & ((!\u_vga|submarines\(21)))) # (!\u_vga|current_submarine\(2) & (!\u_vga|submarines\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(17),
	datab => \u_vga|current_submarine\(3),
	datac => \u_vga|current_submarine\(2),
	datad => \u_vga|submarines\(21),
	combout => \u_vga|Mux0~12_combout\);

-- Location: LCCOMB_X27_Y19_N10
\u_vga|submarines[29]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[29]~12_combout\ = (\u_vga|submarines\(29)) # ((\u_vga|Decoder0~3_combout\ & \u_vga|Decoder0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~3_combout\,
	datac => \u_vga|submarines\(29),
	datad => \u_vga|Decoder0~8_combout\,
	combout => \u_vga|submarines[29]~12_combout\);

-- Location: FF_X27_Y19_N11
\u_vga|submarines[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[29]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(29));

-- Location: LCCOMB_X26_Y19_N16
\u_vga|submarines[25]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[25]~1_combout\ = (\u_vga|submarines\(25)) # ((\u_vga|Decoder0~3_combout\ & \u_vga|Decoder0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~3_combout\,
	datac => \u_vga|submarines\(25),
	datad => \u_vga|Decoder0~5_combout\,
	combout => \u_vga|submarines[25]~1_combout\);

-- Location: FF_X26_Y19_N17
\u_vga|submarines[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[25]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(25));

-- Location: LCCOMB_X25_Y19_N14
\u_vga|Mux0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~13_combout\ = (\u_vga|Mux0~12_combout\ & (((!\u_vga|submarines\(29))) # (!\u_vga|current_submarine\(3)))) # (!\u_vga|Mux0~12_combout\ & (\u_vga|current_submarine\(3) & ((!\u_vga|submarines\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~12_combout\,
	datab => \u_vga|current_submarine\(3),
	datac => \u_vga|submarines\(29),
	datad => \u_vga|submarines\(25),
	combout => \u_vga|Mux0~13_combout\);

-- Location: LCCOMB_X25_Y19_N4
\u_vga|Mux0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~16_combout\ = (\u_vga|current_submarine\(1) & (((\u_vga|current_submarine\(0))))) # (!\u_vga|current_submarine\(1) & ((\u_vga|current_submarine\(0) & ((\u_vga|Mux0~13_combout\))) # (!\u_vga|current_submarine\(0) & (\u_vga|Mux0~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(1),
	datab => \u_vga|Mux0~15_combout\,
	datac => \u_vga|Mux0~13_combout\,
	datad => \u_vga|current_submarine\(0),
	combout => \u_vga|Mux0~16_combout\);

-- Location: LCCOMB_X27_Y19_N28
\u_vga|submarines[31]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[31]~15_combout\ = (\u_vga|submarines\(31)) # ((\u_vga|Decoder0~3_combout\ & \u_vga|Decoder0~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~3_combout\,
	datac => \u_vga|submarines\(31),
	datad => \u_vga|Decoder0~11_combout\,
	combout => \u_vga|submarines[31]~15_combout\);

-- Location: FF_X27_Y19_N29
\u_vga|submarines[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[31]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(31));

-- Location: LCCOMB_X27_Y19_N0
\u_vga|submarines[19]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[19]~0_combout\ = (\u_vga|submarines\(19)) # ((\u_vga|Decoder0~4_combout\ & \u_vga|Decoder0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~4_combout\,
	datac => \u_vga|submarines\(19),
	datad => \u_vga|Decoder0~3_combout\,
	combout => \u_vga|submarines[19]~0_combout\);

-- Location: FF_X27_Y19_N1
\u_vga|submarines[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[19]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(19));

-- Location: LCCOMB_X26_Y20_N24
\u_vga|submarines[23]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[23]~13_combout\ = (\u_vga|submarines\(23)) # ((\u_vga|Decoder0~9_combout\ & \u_vga|Decoder0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~9_combout\,
	datac => \u_vga|submarines\(23),
	datad => \u_vga|Decoder0~3_combout\,
	combout => \u_vga|submarines[23]~13_combout\);

-- Location: FF_X26_Y20_N25
\u_vga|submarines[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[23]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(23));

-- Location: LCCOMB_X25_Y19_N30
\u_vga|Mux0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~17_combout\ = (\u_vga|current_submarine\(2) & ((\u_vga|current_submarine\(3)) # ((!\u_vga|submarines\(23))))) # (!\u_vga|current_submarine\(2) & (!\u_vga|current_submarine\(3) & (!\u_vga|submarines\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(2),
	datab => \u_vga|current_submarine\(3),
	datac => \u_vga|submarines\(19),
	datad => \u_vga|submarines\(23),
	combout => \u_vga|Mux0~17_combout\);

-- Location: LCCOMB_X27_Y19_N18
\u_vga|submarines[27]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[27]~3_combout\ = (\u_vga|submarines\(27)) # ((\u_vga|Decoder0~3_combout\ & \u_vga|Decoder0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~3_combout\,
	datab => \u_vga|Decoder0~6_combout\,
	datac => \u_vga|submarines\(27),
	combout => \u_vga|submarines[27]~3_combout\);

-- Location: FF_X27_Y19_N19
\u_vga|submarines[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[27]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(27));

-- Location: LCCOMB_X25_Y19_N8
\u_vga|Mux0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~18_combout\ = (\u_vga|current_submarine\(3) & ((\u_vga|Mux0~17_combout\ & (!\u_vga|submarines\(31))) # (!\u_vga|Mux0~17_combout\ & ((!\u_vga|submarines\(27)))))) # (!\u_vga|current_submarine\(3) & (((\u_vga|Mux0~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(31),
	datab => \u_vga|current_submarine\(3),
	datac => \u_vga|Mux0~17_combout\,
	datad => \u_vga|submarines\(27),
	combout => \u_vga|Mux0~18_combout\);

-- Location: LCCOMB_X25_Y19_N6
\u_vga|Mux0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~19_combout\ = (\u_vga|Mux0~16_combout\ & (((\u_vga|Mux0~18_combout\) # (!\u_vga|current_submarine\(1))))) # (!\u_vga|Mux0~16_combout\ & (\u_vga|Mux0~11_combout\ & ((\u_vga|current_submarine\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~11_combout\,
	datab => \u_vga|Mux0~16_combout\,
	datac => \u_vga|Mux0~18_combout\,
	datad => \u_vga|current_submarine\(1),
	combout => \u_vga|Mux0~19_combout\);

-- Location: LCCOMB_X25_Y21_N20
\u_vga|Mux0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~30_combout\ = (\u_vga|current_submarine\(5) & (\u_vga|current_submarine\(4))) # (!\u_vga|current_submarine\(5) & ((\u_vga|current_submarine\(4) & ((\u_vga|Mux0~19_combout\))) # (!\u_vga|current_submarine\(4) & (\u_vga|Mux0~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(5),
	datab => \u_vga|current_submarine\(4),
	datac => \u_vga|Mux0~29_combout\,
	datad => \u_vga|Mux0~19_combout\,
	combout => \u_vga|Mux0~30_combout\);

-- Location: LCCOMB_X25_Y21_N18
\u_vga|Mux0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~32_combout\ = (\u_vga|current_submarine\(5) & ((\u_vga|Mux0~30_combout\ & (\u_vga|Mux0~31_combout\)) # (!\u_vga|Mux0~30_combout\ & ((\u_vga|Mux0~9_combout\))))) # (!\u_vga|current_submarine\(5) & (((\u_vga|Mux0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(5),
	datab => \u_vga|Mux0~31_combout\,
	datac => \u_vga|Mux0~9_combout\,
	datad => \u_vga|Mux0~30_combout\,
	combout => \u_vga|Mux0~32_combout\);

-- Location: LCCOMB_X24_Y23_N22
\u_vga|update_submarines~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_submarines~0_combout\ = (\u_vga|v_sync~q\ & ((\u_vga|Mux0~32_combout\) # (\u_vga|read_sub~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_sync~q\,
	datac => \u_vga|Mux0~32_combout\,
	datad => \u_vga|read_sub~q\,
	combout => \u_vga|update_submarines~0_combout\);

-- Location: LCCOMB_X25_Y23_N10
\u_vga|update_submarines~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_submarines~1_combout\ = (\u_vga|update_elements_position~5_combout\) # ((\u_vga|update_submarines~q\ & ((\u_vga|Equal4~1_combout\) # (!\u_vga|update_submarines~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~0_combout\,
	datab => \u_vga|update_elements_position~5_combout\,
	datac => \u_vga|update_submarines~q\,
	datad => \u_vga|Equal4~1_combout\,
	combout => \u_vga|update_submarines~1_combout\);

-- Location: FF_X25_Y23_N11
\u_vga|update_submarines\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|update_submarines~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|update_submarines~q\);

-- Location: LCCOMB_X24_Y19_N14
\u_vga|Mux1~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~31_combout\ = (\u_vga|Decoder0~0_combout\ & ((\u_vga|magn_g_y\(0) & (\u_vga|submarines\(49))) # (!\u_vga|magn_g_y\(0) & ((\u_vga|submarines\(48))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(49),
	datab => \u_vga|submarines\(48),
	datac => \u_vga|Decoder0~0_combout\,
	datad => \u_vga|magn_g_y\(0),
	combout => \u_vga|Mux1~31_combout\);

-- Location: LCCOMB_X26_Y19_N6
\u_vga|Mux1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~12_combout\ = (\u_vga|magn_g_y\(0) & (((\u_vga|Add5~4_combout\)))) # (!\u_vga|magn_g_y\(0) & ((\u_vga|Add5~4_combout\ & (\u_vga|submarines\(28))) # (!\u_vga|Add5~4_combout\ & ((\u_vga|submarines\(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|submarines\(28),
	datac => \u_vga|Add5~4_combout\,
	datad => \u_vga|submarines\(20),
	combout => \u_vga|Mux1~12_combout\);

-- Location: LCCOMB_X26_Y19_N8
\u_vga|Mux1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~13_combout\ = (\u_vga|magn_g_y\(0) & ((\u_vga|Mux1~12_combout\ & (\u_vga|submarines\(29))) # (!\u_vga|Mux1~12_combout\ & ((\u_vga|submarines\(21)))))) # (!\u_vga|magn_g_y\(0) & (((\u_vga|Mux1~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|submarines\(29),
	datac => \u_vga|submarines\(21),
	datad => \u_vga|Mux1~12_combout\,
	combout => \u_vga|Mux1~13_combout\);

-- Location: LCCOMB_X26_Y19_N26
\u_vga|Mux1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~14_combout\ = (\u_vga|magn_g_y\(0) & (((\u_vga|Add5~4_combout\) # (\u_vga|submarines\(17))))) # (!\u_vga|magn_g_y\(0) & (\u_vga|submarines\(16) & (!\u_vga|Add5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|submarines\(16),
	datac => \u_vga|Add5~4_combout\,
	datad => \u_vga|submarines\(17),
	combout => \u_vga|Mux1~14_combout\);

-- Location: LCCOMB_X26_Y19_N28
\u_vga|Mux1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~15_combout\ = (\u_vga|Add5~4_combout\ & ((\u_vga|Mux1~14_combout\ & (\u_vga|submarines\(25))) # (!\u_vga|Mux1~14_combout\ & ((\u_vga|submarines\(24)))))) # (!\u_vga|Add5~4_combout\ & (((\u_vga|Mux1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~4_combout\,
	datab => \u_vga|submarines\(25),
	datac => \u_vga|Mux1~14_combout\,
	datad => \u_vga|submarines\(24),
	combout => \u_vga|Mux1~15_combout\);

-- Location: LCCOMB_X26_Y19_N22
\u_vga|Mux1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~16_combout\ = (\u_vga|Add5~2_combout\ & ((\u_vga|Add5~0_combout\) # ((\u_vga|Mux1~13_combout\)))) # (!\u_vga|Add5~2_combout\ & (!\u_vga|Add5~0_combout\ & ((\u_vga|Mux1~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~2_combout\,
	datab => \u_vga|Add5~0_combout\,
	datac => \u_vga|Mux1~13_combout\,
	datad => \u_vga|Mux1~15_combout\,
	combout => \u_vga|Mux1~16_combout\);

-- Location: LCCOMB_X24_Y19_N10
\u_vga|Mux1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~10_combout\ = (\u_vga|magn_g_y\(0) & ((\u_vga|Add5~4_combout\) # ((\u_vga|submarines\(19))))) # (!\u_vga|magn_g_y\(0) & (!\u_vga|Add5~4_combout\ & ((\u_vga|submarines\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Add5~4_combout\,
	datac => \u_vga|submarines\(19),
	datad => \u_vga|submarines\(18),
	combout => \u_vga|Mux1~10_combout\);

-- Location: LCCOMB_X24_Y19_N20
\u_vga|Mux1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~11_combout\ = (\u_vga|Add5~4_combout\ & ((\u_vga|Mux1~10_combout\ & (\u_vga|submarines\(27))) # (!\u_vga|Mux1~10_combout\ & ((\u_vga|submarines\(26)))))) # (!\u_vga|Add5~4_combout\ & (((\u_vga|Mux1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(27),
	datab => \u_vga|Add5~4_combout\,
	datac => \u_vga|submarines\(26),
	datad => \u_vga|Mux1~10_combout\,
	combout => \u_vga|Mux1~11_combout\);

-- Location: LCCOMB_X26_Y19_N24
\u_vga|Mux1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~17_combout\ = (\u_vga|Add5~4_combout\ & (((\u_vga|submarines\(30)) # (\u_vga|magn_g_y\(0))))) # (!\u_vga|Add5~4_combout\ & (\u_vga|submarines\(22) & ((!\u_vga|magn_g_y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~4_combout\,
	datab => \u_vga|submarines\(22),
	datac => \u_vga|submarines\(30),
	datad => \u_vga|magn_g_y\(0),
	combout => \u_vga|Mux1~17_combout\);

-- Location: LCCOMB_X26_Y19_N10
\u_vga|Mux1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~18_combout\ = (\u_vga|magn_g_y\(0) & ((\u_vga|Mux1~17_combout\ & (\u_vga|submarines\(31))) # (!\u_vga|Mux1~17_combout\ & ((\u_vga|submarines\(23)))))) # (!\u_vga|magn_g_y\(0) & (((\u_vga|Mux1~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|submarines\(31),
	datac => \u_vga|submarines\(23),
	datad => \u_vga|Mux1~17_combout\,
	combout => \u_vga|Mux1~18_combout\);

-- Location: LCCOMB_X26_Y19_N20
\u_vga|Mux1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~19_combout\ = (\u_vga|Mux1~16_combout\ & (((\u_vga|Mux1~18_combout\)) # (!\u_vga|Add5~0_combout\))) # (!\u_vga|Mux1~16_combout\ & (\u_vga|Add5~0_combout\ & (\u_vga|Mux1~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~16_combout\,
	datab => \u_vga|Add5~0_combout\,
	datac => \u_vga|Mux1~11_combout\,
	datad => \u_vga|Mux1~18_combout\,
	combout => \u_vga|Mux1~19_combout\);

-- Location: LCCOMB_X24_Y20_N20
\u_vga|Mux1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~20_combout\ = (\u_vga|Add5~0_combout\ & (\u_vga|Add5~2_combout\)) # (!\u_vga|Add5~0_combout\ & ((\u_vga|Add5~2_combout\ & ((\u_vga|submarines\(12)))) # (!\u_vga|Add5~2_combout\ & (\u_vga|submarines\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~0_combout\,
	datab => \u_vga|Add5~2_combout\,
	datac => \u_vga|submarines\(8),
	datad => \u_vga|submarines\(12),
	combout => \u_vga|Mux1~20_combout\);

-- Location: LCCOMB_X24_Y20_N6
\u_vga|Mux1~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~21_combout\ = (\u_vga|Add5~0_combout\ & ((\u_vga|Mux1~20_combout\ & ((\u_vga|submarines\(14)))) # (!\u_vga|Mux1~20_combout\ & (\u_vga|submarines\(10))))) # (!\u_vga|Add5~0_combout\ & (\u_vga|Mux1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~0_combout\,
	datab => \u_vga|Mux1~20_combout\,
	datac => \u_vga|submarines\(10),
	datad => \u_vga|submarines\(14),
	combout => \u_vga|Mux1~21_combout\);

-- Location: LCCOMB_X27_Y20_N28
\u_vga|Mux1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~22_combout\ = (\u_vga|Add5~2_combout\ & (((\u_vga|Add5~0_combout\)))) # (!\u_vga|Add5~2_combout\ & ((\u_vga|Add5~0_combout\ & ((\u_vga|submarines\(3)))) # (!\u_vga|Add5~0_combout\ & (\u_vga|submarines\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(1),
	datab => \u_vga|submarines\(3),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|Add5~0_combout\,
	combout => \u_vga|Mux1~22_combout\);

-- Location: LCCOMB_X26_Y20_N20
\u_vga|Mux1~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~23_combout\ = (\u_vga|Add5~2_combout\ & ((\u_vga|Mux1~22_combout\ & (\u_vga|submarines\(7))) # (!\u_vga|Mux1~22_combout\ & ((\u_vga|submarines\(5)))))) # (!\u_vga|Add5~2_combout\ & (((\u_vga|Mux1~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(7),
	datab => \u_vga|submarines\(5),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|Mux1~22_combout\,
	combout => \u_vga|Mux1~23_combout\);

-- Location: LCCOMB_X27_Y20_N14
\u_vga|Mux1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~24_combout\ = (\u_vga|Add5~2_combout\ & (((\u_vga|Add5~0_combout\)))) # (!\u_vga|Add5~2_combout\ & ((\u_vga|Add5~0_combout\ & ((\u_vga|submarines\(2)))) # (!\u_vga|Add5~0_combout\ & (\u_vga|submarines\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(0),
	datab => \u_vga|submarines\(2),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|Add5~0_combout\,
	combout => \u_vga|Mux1~24_combout\);

-- Location: LCCOMB_X27_Y20_N8
\u_vga|Mux1~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~25_combout\ = (\u_vga|Add5~2_combout\ & ((\u_vga|Mux1~24_combout\ & (\u_vga|submarines\(6))) # (!\u_vga|Mux1~24_combout\ & ((\u_vga|submarines\(4)))))) # (!\u_vga|Add5~2_combout\ & (\u_vga|Mux1~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~2_combout\,
	datab => \u_vga|Mux1~24_combout\,
	datac => \u_vga|submarines\(6),
	datad => \u_vga|submarines\(4),
	combout => \u_vga|Mux1~25_combout\);

-- Location: LCCOMB_X24_Y20_N16
\u_vga|Mux1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~26_combout\ = (\u_vga|magn_g_y\(0) & ((\u_vga|Mux1~23_combout\) # ((\u_vga|Add5~4_combout\)))) # (!\u_vga|magn_g_y\(0) & (((!\u_vga|Add5~4_combout\ & \u_vga|Mux1~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~23_combout\,
	datab => \u_vga|magn_g_y\(0),
	datac => \u_vga|Add5~4_combout\,
	datad => \u_vga|Mux1~25_combout\,
	combout => \u_vga|Mux1~26_combout\);

-- Location: LCCOMB_X23_Y20_N14
\u_vga|Mux1~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~27_combout\ = (\u_vga|Add5~0_combout\ & (((\u_vga|Add5~2_combout\)))) # (!\u_vga|Add5~0_combout\ & ((\u_vga|Add5~2_combout\ & ((\u_vga|submarines\(13)))) # (!\u_vga|Add5~2_combout\ & (\u_vga|submarines\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(9),
	datab => \u_vga|Add5~0_combout\,
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|submarines\(13),
	combout => \u_vga|Mux1~27_combout\);

-- Location: LCCOMB_X24_Y20_N2
\u_vga|Mux1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~28_combout\ = (\u_vga|Add5~0_combout\ & ((\u_vga|Mux1~27_combout\ & ((\u_vga|submarines\(15)))) # (!\u_vga|Mux1~27_combout\ & (\u_vga|submarines\(11))))) # (!\u_vga|Add5~0_combout\ & (((\u_vga|Mux1~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~0_combout\,
	datab => \u_vga|submarines\(11),
	datac => \u_vga|submarines\(15),
	datad => \u_vga|Mux1~27_combout\,
	combout => \u_vga|Mux1~28_combout\);

-- Location: LCCOMB_X24_Y20_N12
\u_vga|Mux1~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~29_combout\ = (\u_vga|Mux1~26_combout\ & (((\u_vga|Mux1~28_combout\) # (!\u_vga|Add5~4_combout\)))) # (!\u_vga|Mux1~26_combout\ & (\u_vga|Mux1~21_combout\ & (\u_vga|Add5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~21_combout\,
	datab => \u_vga|Mux1~26_combout\,
	datac => \u_vga|Add5~4_combout\,
	datad => \u_vga|Mux1~28_combout\,
	combout => \u_vga|Mux1~29_combout\);

-- Location: LCCOMB_X24_Y20_N14
\u_vga|Mux1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~30_combout\ = (\u_vga|Add5~6_combout\ & ((\u_vga|Add5~8_combout\) # ((\u_vga|Mux1~19_combout\)))) # (!\u_vga|Add5~6_combout\ & (!\u_vga|Add5~8_combout\ & ((\u_vga|Mux1~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~6_combout\,
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Mux1~19_combout\,
	datad => \u_vga|Mux1~29_combout\,
	combout => \u_vga|Mux1~30_combout\);

-- Location: LCCOMB_X25_Y20_N30
\u_vga|Mux1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~7_combout\ = (\u_vga|Add5~0_combout\ & (((\u_vga|Add5~2_combout\) # (\u_vga|submarines\(43))))) # (!\u_vga|Add5~0_combout\ & (\u_vga|submarines\(41) & (!\u_vga|Add5~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~0_combout\,
	datab => \u_vga|submarines\(41),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|submarines\(43),
	combout => \u_vga|Mux1~7_combout\);

-- Location: LCCOMB_X25_Y20_N0
\u_vga|Mux1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~8_combout\ = (\u_vga|Mux1~7_combout\ & ((\u_vga|submarines\(47)) # ((!\u_vga|Add5~2_combout\)))) # (!\u_vga|Mux1~7_combout\ & (((\u_vga|Add5~2_combout\ & \u_vga|submarines\(45)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~7_combout\,
	datab => \u_vga|submarines\(47),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|submarines\(45),
	combout => \u_vga|Mux1~8_combout\);

-- Location: LCCOMB_X25_Y20_N2
\u_vga|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~0_combout\ = (\u_vga|Add5~2_combout\ & (((\u_vga|Add5~0_combout\)))) # (!\u_vga|Add5~2_combout\ & ((\u_vga|Add5~0_combout\ & ((\u_vga|submarines\(42)))) # (!\u_vga|Add5~0_combout\ & (\u_vga|submarines\(40)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(40),
	datab => \u_vga|submarines\(42),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|Add5~0_combout\,
	combout => \u_vga|Mux1~0_combout\);

-- Location: LCCOMB_X25_Y20_N12
\u_vga|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~1_combout\ = (\u_vga|Add5~2_combout\ & ((\u_vga|Mux1~0_combout\ & (\u_vga|submarines\(46))) # (!\u_vga|Mux1~0_combout\ & ((\u_vga|submarines\(44)))))) # (!\u_vga|Add5~2_combout\ & (((\u_vga|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(46),
	datab => \u_vga|submarines\(44),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|Mux1~0_combout\,
	combout => \u_vga|Mux1~1_combout\);

-- Location: LCCOMB_X26_Y21_N14
\u_vga|Mux1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~4_combout\ = (\u_vga|Add5~2_combout\ & (\u_vga|Add5~0_combout\)) # (!\u_vga|Add5~2_combout\ & ((\u_vga|Add5~0_combout\ & ((\u_vga|submarines\(34)))) # (!\u_vga|Add5~0_combout\ & (\u_vga|submarines\(32)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~2_combout\,
	datab => \u_vga|Add5~0_combout\,
	datac => \u_vga|submarines\(32),
	datad => \u_vga|submarines\(34),
	combout => \u_vga|Mux1~4_combout\);

-- Location: LCCOMB_X26_Y21_N8
\u_vga|Mux1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~5_combout\ = (\u_vga|Add5~2_combout\ & ((\u_vga|Mux1~4_combout\ & (\u_vga|submarines\(38))) # (!\u_vga|Mux1~4_combout\ & ((\u_vga|submarines\(36)))))) # (!\u_vga|Add5~2_combout\ & (((\u_vga|Mux1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(38),
	datab => \u_vga|Add5~2_combout\,
	datac => \u_vga|Mux1~4_combout\,
	datad => \u_vga|submarines\(36),
	combout => \u_vga|Mux1~5_combout\);

-- Location: LCCOMB_X26_Y21_N18
\u_vga|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~2_combout\ = (\u_vga|Add5~2_combout\ & (((\u_vga|Add5~0_combout\) # (\u_vga|submarines\(37))))) # (!\u_vga|Add5~2_combout\ & (\u_vga|submarines\(33) & (!\u_vga|Add5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(33),
	datab => \u_vga|Add5~2_combout\,
	datac => \u_vga|Add5~0_combout\,
	datad => \u_vga|submarines\(37),
	combout => \u_vga|Mux1~2_combout\);

-- Location: LCCOMB_X26_Y21_N28
\u_vga|Mux1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~3_combout\ = (\u_vga|Mux1~2_combout\ & ((\u_vga|submarines\(39)) # ((!\u_vga|Add5~0_combout\)))) # (!\u_vga|Mux1~2_combout\ & (((\u_vga|Add5~0_combout\ & \u_vga|submarines\(35)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(39),
	datab => \u_vga|Mux1~2_combout\,
	datac => \u_vga|Add5~0_combout\,
	datad => \u_vga|submarines\(35),
	combout => \u_vga|Mux1~3_combout\);

-- Location: LCCOMB_X24_Y20_N0
\u_vga|Mux1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~6_combout\ = (\u_vga|magn_g_y\(0) & (((\u_vga|Add5~4_combout\) # (\u_vga|Mux1~3_combout\)))) # (!\u_vga|magn_g_y\(0) & (\u_vga|Mux1~5_combout\ & (!\u_vga|Add5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~5_combout\,
	datab => \u_vga|magn_g_y\(0),
	datac => \u_vga|Add5~4_combout\,
	datad => \u_vga|Mux1~3_combout\,
	combout => \u_vga|Mux1~6_combout\);

-- Location: LCCOMB_X24_Y20_N10
\u_vga|Mux1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~9_combout\ = (\u_vga|Add5~4_combout\ & ((\u_vga|Mux1~6_combout\ & (\u_vga|Mux1~8_combout\)) # (!\u_vga|Mux1~6_combout\ & ((\u_vga|Mux1~1_combout\))))) # (!\u_vga|Add5~4_combout\ & (((\u_vga|Mux1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~4_combout\,
	datab => \u_vga|Mux1~8_combout\,
	datac => \u_vga|Mux1~1_combout\,
	datad => \u_vga|Mux1~6_combout\,
	combout => \u_vga|Mux1~9_combout\);

-- Location: LCCOMB_X24_Y20_N8
\u_vga|Mux1~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~32_combout\ = (\u_vga|Mux1~30_combout\ & ((\u_vga|Mux1~31_combout\) # ((!\u_vga|Add5~8_combout\)))) # (!\u_vga|Mux1~30_combout\ & (((\u_vga|Add5~8_combout\ & \u_vga|Mux1~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~31_combout\,
	datab => \u_vga|Mux1~30_combout\,
	datac => \u_vga|Add5~8_combout\,
	datad => \u_vga|Mux1~9_combout\,
	combout => \u_vga|Mux1~32_combout\);

-- Location: LCCOMB_X23_Y23_N14
\u_vga|Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~0_combout\ = \u_vga|current_rocket\(0) $ (VCC)
-- \u_vga|Add4~1\ = CARRY(\u_vga|current_rocket\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_rocket\(0),
	datad => VCC,
	combout => \u_vga|Add4~0_combout\,
	cout => \u_vga|Add4~1\);

-- Location: LCCOMB_X23_Y23_N4
\u_vga|current_rocket~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket~3_combout\ = (\u_vga|Add4~0_combout\ & !\u_vga|Equal5~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add4~0_combout\,
	datad => \u_vga|Equal5~1_combout\,
	combout => \u_vga|current_rocket~3_combout\);

-- Location: LCCOMB_X23_Y23_N28
\u_vga|current_rocket[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket[0]~1_combout\ = (\u_vga|v_sync~q\ & (!\u_vga|update_submarines~q\ & (\u_vga|update_rockets~q\ & !\u_vga|update_elements_position~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_sync~q\,
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|update_rockets~q\,
	datad => \u_vga|update_elements_position~5_combout\,
	combout => \u_vga|current_rocket[0]~1_combout\);

-- Location: FF_X23_Y23_N5
\u_vga|current_rocket[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_rocket~3_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(0));

-- Location: LCCOMB_X23_Y23_N16
\u_vga|Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~2_combout\ = (\u_vga|current_rocket\(1) & (!\u_vga|Add4~1\)) # (!\u_vga|current_rocket\(1) & ((\u_vga|Add4~1\) # (GND)))
-- \u_vga|Add4~3\ = CARRY((!\u_vga|Add4~1\) # (!\u_vga|current_rocket\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_rocket\(1),
	datad => VCC,
	cin => \u_vga|Add4~1\,
	combout => \u_vga|Add4~2_combout\,
	cout => \u_vga|Add4~3\);

-- Location: LCCOMB_X23_Y23_N8
\u_vga|current_rocket~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket~0_combout\ = (!\u_vga|Equal5~1_combout\ & \u_vga|Add4~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal5~1_combout\,
	datad => \u_vga|Add4~2_combout\,
	combout => \u_vga|current_rocket~0_combout\);

-- Location: FF_X23_Y23_N9
\u_vga|current_rocket[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_rocket~0_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(1));

-- Location: LCCOMB_X23_Y23_N18
\u_vga|Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~4_combout\ = (\u_vga|current_rocket\(2) & (\u_vga|Add4~3\ $ (GND))) # (!\u_vga|current_rocket\(2) & (!\u_vga|Add4~3\ & VCC))
-- \u_vga|Add4~5\ = CARRY((\u_vga|current_rocket\(2) & !\u_vga|Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_rocket\(2),
	datad => VCC,
	cin => \u_vga|Add4~3\,
	combout => \u_vga|Add4~4_combout\,
	cout => \u_vga|Add4~5\);

-- Location: FF_X23_Y23_N19
\u_vga|current_rocket[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add4~4_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(2));

-- Location: LCCOMB_X23_Y23_N20
\u_vga|Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~6_combout\ = (\u_vga|current_rocket\(3) & (!\u_vga|Add4~5\)) # (!\u_vga|current_rocket\(3) & ((\u_vga|Add4~5\) # (GND)))
-- \u_vga|Add4~7\ = CARRY((!\u_vga|Add4~5\) # (!\u_vga|current_rocket\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_rocket\(3),
	datad => VCC,
	cin => \u_vga|Add4~5\,
	combout => \u_vga|Add4~6_combout\,
	cout => \u_vga|Add4~7\);

-- Location: LCCOMB_X23_Y23_N10
\u_vga|current_rocket~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket~2_combout\ = (!\u_vga|Equal5~1_combout\ & \u_vga|Add4~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal5~1_combout\,
	datad => \u_vga|Add4~6_combout\,
	combout => \u_vga|current_rocket~2_combout\);

-- Location: FF_X23_Y23_N11
\u_vga|current_rocket[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_rocket~2_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(3));

-- Location: LCCOMB_X23_Y23_N6
\u_vga|Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal5~0_combout\ = (\u_vga|current_rocket\(3) & (\u_vga|current_rocket\(1) & (!\u_vga|current_rocket\(0) & !\u_vga|current_rocket\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_rocket\(3),
	datab => \u_vga|current_rocket\(1),
	datac => \u_vga|current_rocket\(0),
	datad => \u_vga|current_rocket\(2),
	combout => \u_vga|Equal5~0_combout\);

-- Location: LCCOMB_X23_Y23_N22
\u_vga|Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~8_combout\ = (\u_vga|current_rocket\(4) & (\u_vga|Add4~7\ $ (GND))) # (!\u_vga|current_rocket\(4) & (!\u_vga|Add4~7\ & VCC))
-- \u_vga|Add4~9\ = CARRY((\u_vga|current_rocket\(4) & !\u_vga|Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_rocket\(4),
	datad => VCC,
	cin => \u_vga|Add4~7\,
	combout => \u_vga|Add4~8_combout\,
	cout => \u_vga|Add4~9\);

-- Location: FF_X23_Y23_N23
\u_vga|current_rocket[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add4~8_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(4));

-- Location: LCCOMB_X23_Y23_N24
\u_vga|Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~10_combout\ = (\u_vga|current_rocket\(5) & (!\u_vga|Add4~9\)) # (!\u_vga|current_rocket\(5) & ((\u_vga|Add4~9\) # (GND)))
-- \u_vga|Add4~11\ = CARRY((!\u_vga|Add4~9\) # (!\u_vga|current_rocket\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_rocket\(5),
	datad => VCC,
	cin => \u_vga|Add4~9\,
	combout => \u_vga|Add4~10_combout\,
	cout => \u_vga|Add4~11\);

-- Location: FF_X23_Y23_N25
\u_vga|current_rocket[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add4~10_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(5));

-- Location: LCCOMB_X23_Y23_N26
\u_vga|Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~12_combout\ = \u_vga|Add4~11\ $ (!\u_vga|current_rocket\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|current_rocket\(6),
	cin => \u_vga|Add4~11\,
	combout => \u_vga|Add4~12_combout\);

-- Location: LCCOMB_X23_Y23_N0
\u_vga|current_rocket~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket~4_combout\ = (\u_vga|Add4~12_combout\ & !\u_vga|Equal5~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add4~12_combout\,
	datad => \u_vga|Equal5~1_combout\,
	combout => \u_vga|current_rocket~4_combout\);

-- Location: FF_X23_Y23_N1
\u_vga|current_rocket[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_rocket~4_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(6));

-- Location: LCCOMB_X23_Y23_N2
\u_vga|Equal5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal5~1_combout\ = (\u_vga|Equal5~0_combout\ & (\u_vga|current_rocket\(6) & (!\u_vga|current_rocket\(4) & !\u_vga|current_rocket\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal5~0_combout\,
	datab => \u_vga|current_rocket\(6),
	datac => \u_vga|current_rocket\(4),
	datad => \u_vga|current_rocket\(5),
	combout => \u_vga|Equal5~1_combout\);

-- Location: LCCOMB_X23_Y23_N30
\u_vga|update_rockets~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_rockets~3_combout\ = (\u_vga|update_rockets~q\ & (((\u_vga|update_submarines~q\) # (!\u_vga|Equal5~1_combout\)) # (!\u_vga|v_sync~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_sync~q\,
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|update_rockets~q\,
	datad => \u_vga|Equal5~1_combout\,
	combout => \u_vga|update_rockets~3_combout\);

-- Location: LCCOMB_X25_Y23_N8
\u_vga|update_rockets~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_rockets~2_combout\ = (!\u_vga|update_elements_position~5_combout\ & ((\u_vga|update_rockets~3_combout\) # ((\u_vga|current_submarine[1]~6_combout\ & !\u_vga|Equal4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_rockets~3_combout\,
	datab => \u_vga|current_submarine[1]~6_combout\,
	datac => \u_vga|Equal4~1_combout\,
	datad => \u_vga|update_elements_position~5_combout\,
	combout => \u_vga|update_rockets~2_combout\);

-- Location: FF_X25_Y23_N9
\u_vga|update_rockets\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|update_rockets~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|update_rockets~q\);

-- Location: LCCOMB_X21_Y21_N16
\u_vga|nb_submarines[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[0]~4_combout\ = \u_vga|nb_submarines\(0) $ (((\u_vga|Decoder0~1_combout\ & (\u_vga|data_a_sub[10]~0_combout\ & !\u_vga|update_submarines~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~1_combout\,
	datab => \u_vga|data_a_sub[10]~0_combout\,
	datac => \u_vga|nb_submarines\(0),
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|nb_submarines[0]~4_combout\);

-- Location: FF_X21_Y21_N17
\u_vga|nb_submarines[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|nb_submarines[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|nb_submarines\(0));

-- Location: LCCOMB_X21_Y21_N2
\u_vga|nb_submarines[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[1]~0_combout\ = \u_vga|nb_submarines\(1) $ (((\u_vga|nb_submarines\(0) & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|nb_submarines\(0),
	datac => \u_vga|nb_submarines\(1),
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|nb_submarines[1]~0_combout\);

-- Location: FF_X21_Y21_N3
\u_vga|nb_submarines[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|nb_submarines[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|nb_submarines\(1));

-- Location: LCCOMB_X21_Y23_N26
\u_vga|nb_submarines[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[2]~1_combout\ = \u_vga|nb_submarines\(2) $ (((\u_vga|nb_submarines\(1) & (\u_vga|nb_submarines\(0) & \u_vga|Decoder0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|nb_submarines\(1),
	datab => \u_vga|nb_submarines\(0),
	datac => \u_vga|nb_submarines\(2),
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|nb_submarines[2]~1_combout\);

-- Location: FF_X21_Y23_N27
\u_vga|nb_submarines[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|nb_submarines[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|nb_submarines\(2));

-- Location: LCCOMB_X21_Y23_N0
\u_vga|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~0_combout\ = \u_vga|cycle_cnt\(0) $ (VCC)
-- \u_vga|Add0~1\ = CARRY(\u_vga|cycle_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|cycle_cnt\(0),
	datad => VCC,
	combout => \u_vga|Add0~0_combout\,
	cout => \u_vga|Add0~1\);

-- Location: LCCOMB_X21_Y23_N24
\u_vga|cycle_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|cycle_cnt~1_combout\ = (!\u_vga|Equal6~1_combout\ & \u_vga|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal6~1_combout\,
	datad => \u_vga|Add0~0_combout\,
	combout => \u_vga|cycle_cnt~1_combout\);

-- Location: FF_X21_Y23_N25
\u_vga|cycle_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|cycle_cnt~1_combout\,
	ena => \u_vga|update_elements_position~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(0));

-- Location: LCCOMB_X21_Y23_N2
\u_vga|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~2_combout\ = (\u_vga|cycle_cnt\(1) & (!\u_vga|Add0~1\)) # (!\u_vga|cycle_cnt\(1) & ((\u_vga|Add0~1\) # (GND)))
-- \u_vga|Add0~3\ = CARRY((!\u_vga|Add0~1\) # (!\u_vga|cycle_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|cycle_cnt\(1),
	datad => VCC,
	cin => \u_vga|Add0~1\,
	combout => \u_vga|Add0~2_combout\,
	cout => \u_vga|Add0~3\);

-- Location: FF_X21_Y23_N3
\u_vga|cycle_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add0~2_combout\,
	ena => \u_vga|update_elements_position~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(1));

-- Location: LCCOMB_X21_Y23_N4
\u_vga|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~4_combout\ = (\u_vga|cycle_cnt\(2) & (\u_vga|Add0~3\ $ (GND))) # (!\u_vga|cycle_cnt\(2) & (!\u_vga|Add0~3\ & VCC))
-- \u_vga|Add0~5\ = CARRY((\u_vga|cycle_cnt\(2) & !\u_vga|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|cycle_cnt\(2),
	datad => VCC,
	cin => \u_vga|Add0~3\,
	combout => \u_vga|Add0~4_combout\,
	cout => \u_vga|Add0~5\);

-- Location: LCCOMB_X21_Y23_N22
\u_vga|cycle_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|cycle_cnt~0_combout\ = (\u_vga|Add0~4_combout\ & !\u_vga|Equal6~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add0~4_combout\,
	datad => \u_vga|Equal6~1_combout\,
	combout => \u_vga|cycle_cnt~0_combout\);

-- Location: FF_X21_Y23_N23
\u_vga|cycle_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|cycle_cnt~0_combout\,
	ena => \u_vga|update_elements_position~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(2));

-- Location: LCCOMB_X21_Y23_N6
\u_vga|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~6_combout\ = (\u_vga|cycle_cnt\(3) & (!\u_vga|Add0~5\)) # (!\u_vga|cycle_cnt\(3) & ((\u_vga|Add0~5\) # (GND)))
-- \u_vga|Add0~7\ = CARRY((!\u_vga|Add0~5\) # (!\u_vga|cycle_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|cycle_cnt\(3),
	datad => VCC,
	cin => \u_vga|Add0~5\,
	combout => \u_vga|Add0~6_combout\,
	cout => \u_vga|Add0~7\);

-- Location: FF_X21_Y23_N7
\u_vga|cycle_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add0~6_combout\,
	ena => \u_vga|update_elements_position~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(3));

-- Location: LCCOMB_X21_Y23_N8
\u_vga|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~8_combout\ = (\u_vga|cycle_cnt\(4) & (\u_vga|Add0~7\ $ (GND))) # (!\u_vga|cycle_cnt\(4) & (!\u_vga|Add0~7\ & VCC))
-- \u_vga|Add0~9\ = CARRY((\u_vga|cycle_cnt\(4) & !\u_vga|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|cycle_cnt\(4),
	datad => VCC,
	cin => \u_vga|Add0~7\,
	combout => \u_vga|Add0~8_combout\,
	cout => \u_vga|Add0~9\);

-- Location: FF_X21_Y23_N9
\u_vga|cycle_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add0~8_combout\,
	ena => \u_vga|update_elements_position~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(4));

-- Location: LCCOMB_X21_Y23_N10
\u_vga|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~10_combout\ = (\u_vga|cycle_cnt\(5) & (!\u_vga|Add0~9\)) # (!\u_vga|cycle_cnt\(5) & ((\u_vga|Add0~9\) # (GND)))
-- \u_vga|Add0~11\ = CARRY((!\u_vga|Add0~9\) # (!\u_vga|cycle_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|cycle_cnt\(5),
	datad => VCC,
	cin => \u_vga|Add0~9\,
	combout => \u_vga|Add0~10_combout\,
	cout => \u_vga|Add0~11\);

-- Location: LCCOMB_X21_Y23_N28
\u_vga|cycle_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|cycle_cnt~2_combout\ = (!\u_vga|Equal6~1_combout\ & \u_vga|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal6~1_combout\,
	datac => \u_vga|Add0~10_combout\,
	combout => \u_vga|cycle_cnt~2_combout\);

-- Location: FF_X21_Y23_N29
\u_vga|cycle_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|cycle_cnt~2_combout\,
	ena => \u_vga|update_elements_position~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(5));

-- Location: LCCOMB_X21_Y23_N12
\u_vga|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~12_combout\ = \u_vga|cycle_cnt\(6) $ (!\u_vga|Add0~11\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|cycle_cnt\(6),
	cin => \u_vga|Add0~11\,
	combout => \u_vga|Add0~12_combout\);

-- Location: LCCOMB_X21_Y23_N30
\u_vga|cycle_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|cycle_cnt~3_combout\ = (!\u_vga|Equal6~1_combout\ & \u_vga|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal6~1_combout\,
	datad => \u_vga|Add0~12_combout\,
	combout => \u_vga|cycle_cnt~3_combout\);

-- Location: FF_X21_Y23_N31
\u_vga|cycle_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|cycle_cnt~3_combout\,
	ena => \u_vga|update_elements_position~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(6));

-- Location: LCCOMB_X21_Y23_N18
\u_vga|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal6~0_combout\ = (!\u_vga|cycle_cnt\(3) & (!\u_vga|cycle_cnt\(1) & (\u_vga|cycle_cnt\(2) & !\u_vga|cycle_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|cycle_cnt\(3),
	datab => \u_vga|cycle_cnt\(1),
	datac => \u_vga|cycle_cnt\(2),
	datad => \u_vga|cycle_cnt\(0),
	combout => \u_vga|Equal6~0_combout\);

-- Location: LCCOMB_X21_Y23_N16
\u_vga|Equal6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal6~1_combout\ = (\u_vga|cycle_cnt\(6) & (\u_vga|cycle_cnt\(5) & (!\u_vga|cycle_cnt\(4) & \u_vga|Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|cycle_cnt\(6),
	datab => \u_vga|cycle_cnt\(5),
	datac => \u_vga|cycle_cnt\(4),
	datad => \u_vga|Equal6~0_combout\,
	combout => \u_vga|Equal6~1_combout\);

-- Location: LCCOMB_X21_Y21_N10
\u_vga|nb_submarines[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[1]~2_combout\ = (\u_vga|Decoder0~1_combout\ & (!\u_vga|update_submarines~q\ & (\u_vga|data_a_sub[10]~0_combout\ & \u_vga|nb_submarines\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~1_combout\,
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|data_a_sub[10]~0_combout\,
	datad => \u_vga|nb_submarines\(0),
	combout => \u_vga|nb_submarines[1]~2_combout\);

-- Location: LCCOMB_X21_Y23_N20
\u_vga|nb_submarines[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[3]~3_combout\ = \u_vga|nb_submarines\(3) $ (((\u_vga|nb_submarines\(2) & (\u_vga|nb_submarines\(1) & \u_vga|nb_submarines[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|nb_submarines\(2),
	datab => \u_vga|nb_submarines\(1),
	datac => \u_vga|nb_submarines\(3),
	datad => \u_vga|nb_submarines[1]~2_combout\,
	combout => \u_vga|nb_submarines[3]~3_combout\);

-- Location: FF_X21_Y23_N21
\u_vga|nb_submarines[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|nb_submarines[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|nb_submarines\(3));

-- Location: LCCOMB_X21_Y23_N14
\u_vga|wr_en_a_sub~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|wr_en_a_sub~0_combout\ = (\u_vga|Equal6~1_combout\ & (((!\u_vga|nb_submarines\(2) & !\u_vga|nb_submarines\(1))) # (!\u_vga|nb_submarines\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|nb_submarines\(2),
	datab => \u_vga|Equal6~1_combout\,
	datac => \u_vga|nb_submarines\(1),
	datad => \u_vga|nb_submarines\(3),
	combout => \u_vga|wr_en_a_sub~0_combout\);

-- Location: LCCOMB_X23_Y23_N12
\u_vga|generate_subarine~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|generate_subarine~5_combout\ = (\u_vga|v_sync~q\ & (!\u_vga|update_submarines~q\ & (\u_vga|update_rockets~q\ & \u_vga|Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_sync~q\,
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|update_rockets~q\,
	datad => \u_vga|Equal5~1_combout\,
	combout => \u_vga|generate_subarine~5_combout\);

-- Location: LCCOMB_X24_Y23_N24
\u_vga|generate_subarine~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|generate_subarine~2_combout\ = (\u_vga|v_sync~q\ & !\u_vga|update_submarines~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|generate_subarine~2_combout\);

-- Location: LCCOMB_X24_Y23_N10
\u_vga|generate_subarine~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|generate_subarine~3_combout\ = (\u_vga|Mux1~32_combout\) # ((\u_vga|update_rockets~q\) # ((!\u_vga|generate_subarine~2_combout\) # (!\u_vga|wr_en_a_sub~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~32_combout\,
	datab => \u_vga|update_rockets~q\,
	datac => \u_vga|wr_en_a_sub~0_combout\,
	datad => \u_vga|generate_subarine~2_combout\,
	combout => \u_vga|generate_subarine~3_combout\);

-- Location: LCCOMB_X24_Y23_N18
\u_vga|generate_subarine~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|generate_subarine~4_combout\ = (!\u_vga|update_elements_position~5_combout\ & ((\u_vga|generate_subarine~5_combout\) # ((\u_vga|generate_subarine~q\ & \u_vga|generate_subarine~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|generate_subarine~5_combout\,
	datab => \u_vga|update_elements_position~5_combout\,
	datac => \u_vga|generate_subarine~q\,
	datad => \u_vga|generate_subarine~3_combout\,
	combout => \u_vga|generate_subarine~4_combout\);

-- Location: FF_X24_Y23_N19
\u_vga|generate_subarine\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|generate_subarine~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|generate_subarine~q\);

-- Location: LCCOMB_X24_Y23_N28
\u_vga|Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~1_combout\ = (!\u_vga|Mux1~32_combout\ & (!\u_vga|update_rockets~q\ & (\u_vga|wr_en_a_sub~0_combout\ & \u_vga|generate_subarine~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~32_combout\,
	datab => \u_vga|update_rockets~q\,
	datac => \u_vga|wr_en_a_sub~0_combout\,
	datad => \u_vga|generate_subarine~q\,
	combout => \u_vga|Decoder0~1_combout\);

-- Location: LCCOMB_X24_Y23_N14
\u_vga|Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~2_combout\ = (!\u_vga|update_submarines~q\ & (\u_vga|Decoder0~1_combout\ & (\u_vga|v_sync~q\ & !\u_vga|update_elements_position~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|Decoder0~1_combout\,
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|update_elements_position~5_combout\,
	combout => \u_vga|Decoder0~2_combout\);

-- Location: LCCOMB_X24_Y19_N6
\u_vga|Decoder0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~17_combout\ = (\u_vga|Add5~8_combout\ & (\u_vga|Add5~6_combout\ & \u_vga|Decoder0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add5~8_combout\,
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|Decoder0~17_combout\);

-- Location: LCCOMB_X24_Y19_N30
\u_vga|submarines[49]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[49]~48_combout\ = (\u_vga|submarines\(49)) # ((\u_vga|magn_g_y\(0) & (\u_vga|Decoder0~0_combout\ & \u_vga|Decoder0~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|magn_g_y\(0),
	datab => \u_vga|Decoder0~0_combout\,
	datac => \u_vga|submarines\(49),
	datad => \u_vga|Decoder0~17_combout\,
	combout => \u_vga|submarines[49]~48_combout\);

-- Location: FF_X24_Y19_N31
\u_vga|submarines[49]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[49]~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(49));

-- Location: LCCOMB_X26_Y22_N30
\u_vga|Mux2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~32_combout\ = (\u_vga|Mux2~0_combout\ & ((\u_vga|h_cnt\(3) & (\u_vga|submarines\(49))) # (!\u_vga|h_cnt\(3) & ((\u_vga|submarines\(48))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(49),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|submarines\(48),
	datad => \u_vga|Mux2~0_combout\,
	combout => \u_vga|Mux2~32_combout\);

-- Location: LCCOMB_X27_Y19_N12
\u_vga|Mux2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~3_combout\ = (\u_vga|h_cnt\(6) & (((\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(6) & ((\u_vga|h_cnt\(4) & ((\u_vga|submarines\(22)))) # (!\u_vga|h_cnt\(4) & (\u_vga|submarines\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(20),
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|submarines\(22),
	combout => \u_vga|Mux2~3_combout\);

-- Location: LCCOMB_X27_Y19_N24
\u_vga|Mux2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~4_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|Mux2~3_combout\ & (\u_vga|submarines\(30))) # (!\u_vga|Mux2~3_combout\ & ((\u_vga|submarines\(28)))))) # (!\u_vga|h_cnt\(6) & (((\u_vga|Mux2~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(30),
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|submarines\(28),
	datad => \u_vga|Mux2~3_combout\,
	combout => \u_vga|Mux2~4_combout\);

-- Location: LCCOMB_X26_Y19_N2
\u_vga|Mux2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~5_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|submarines\(24)) # ((\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(6) & (((!\u_vga|h_cnt\(4) & \u_vga|submarines\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(24),
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|submarines\(16),
	combout => \u_vga|Mux2~5_combout\);

-- Location: LCCOMB_X27_Y19_N6
\u_vga|Mux2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~6_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|Mux2~5_combout\ & ((\u_vga|submarines\(26)))) # (!\u_vga|Mux2~5_combout\ & (\u_vga|submarines\(18))))) # (!\u_vga|h_cnt\(4) & (((\u_vga|Mux2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(18),
	datab => \u_vga|submarines\(26),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|Mux2~5_combout\,
	combout => \u_vga|Mux2~6_combout\);

-- Location: LCCOMB_X27_Y19_N16
\u_vga|Mux2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~7_combout\ = (\u_vga|h_cnt\(5) & ((\u_vga|Mux2~4_combout\) # ((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & (((!\u_vga|h_cnt\(3) & \u_vga|Mux2~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|Mux2~4_combout\,
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|Mux2~6_combout\,
	combout => \u_vga|Mux2~7_combout\);

-- Location: LCCOMB_X26_Y19_N4
\u_vga|Mux2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~8_combout\ = (\u_vga|h_cnt\(4) & (((\u_vga|submarines\(23)) # (\u_vga|h_cnt\(6))))) # (!\u_vga|h_cnt\(4) & (\u_vga|submarines\(21) & ((!\u_vga|h_cnt\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(21),
	datab => \u_vga|submarines\(23),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|h_cnt\(6),
	combout => \u_vga|Mux2~8_combout\);

-- Location: LCCOMB_X27_Y19_N22
\u_vga|Mux2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~9_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|Mux2~8_combout\ & (\u_vga|submarines\(31))) # (!\u_vga|Mux2~8_combout\ & ((\u_vga|submarines\(29)))))) # (!\u_vga|h_cnt\(6) & (((\u_vga|Mux2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(31),
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|Mux2~8_combout\,
	datad => \u_vga|submarines\(29),
	combout => \u_vga|Mux2~9_combout\);

-- Location: LCCOMB_X26_Y19_N12
\u_vga|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~1_combout\ = (\u_vga|h_cnt\(4) & (((\u_vga|h_cnt\(6))))) # (!\u_vga|h_cnt\(4) & ((\u_vga|h_cnt\(6) & (\u_vga|submarines\(25))) # (!\u_vga|h_cnt\(6) & ((\u_vga|submarines\(17))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(25),
	datab => \u_vga|submarines\(17),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|h_cnt\(6),
	combout => \u_vga|Mux2~1_combout\);

-- Location: LCCOMB_X27_Y19_N20
\u_vga|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~2_combout\ = (\u_vga|Mux2~1_combout\ & (((\u_vga|submarines\(27)) # (!\u_vga|h_cnt\(4))))) # (!\u_vga|Mux2~1_combout\ & (\u_vga|submarines\(19) & (\u_vga|h_cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~1_combout\,
	datab => \u_vga|submarines\(19),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|submarines\(27),
	combout => \u_vga|Mux2~2_combout\);

-- Location: LCCOMB_X26_Y22_N22
\u_vga|Mux2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~10_combout\ = (\u_vga|Mux2~7_combout\ & (((\u_vga|Mux2~9_combout\)) # (!\u_vga|h_cnt\(3)))) # (!\u_vga|Mux2~7_combout\ & (\u_vga|h_cnt\(3) & ((\u_vga|Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~7_combout\,
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|Mux2~9_combout\,
	datad => \u_vga|Mux2~2_combout\,
	combout => \u_vga|Mux2~10_combout\);

-- Location: LCCOMB_X27_Y20_N0
\u_vga|Mux2~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~25_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|h_cnt\(5))))) # (!\u_vga|h_cnt\(3) & ((\u_vga|h_cnt\(5) & (\u_vga|submarines\(4))) # (!\u_vga|h_cnt\(5) & ((\u_vga|submarines\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(4),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|submarines\(0),
	datad => \u_vga|h_cnt\(5),
	combout => \u_vga|Mux2~25_combout\);

-- Location: LCCOMB_X27_Y20_N18
\u_vga|Mux2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~26_combout\ = (\u_vga|Mux2~25_combout\ & ((\u_vga|submarines\(5)) # ((!\u_vga|h_cnt\(3))))) # (!\u_vga|Mux2~25_combout\ & (((\u_vga|h_cnt\(3) & \u_vga|submarines\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(5),
	datab => \u_vga|Mux2~25_combout\,
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|submarines\(1),
	combout => \u_vga|Mux2~26_combout\);

-- Location: LCCOMB_X27_Y20_N22
\u_vga|Mux2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~23_combout\ = (\u_vga|h_cnt\(5) & ((\u_vga|submarines\(6)) # ((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & (((!\u_vga|h_cnt\(3) & \u_vga|submarines\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(6),
	datab => \u_vga|h_cnt\(5),
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|submarines\(2),
	combout => \u_vga|Mux2~23_combout\);

-- Location: LCCOMB_X27_Y20_N16
\u_vga|Mux2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~24_combout\ = (\u_vga|h_cnt\(3) & ((\u_vga|Mux2~23_combout\ & (\u_vga|submarines\(7))) # (!\u_vga|Mux2~23_combout\ & ((\u_vga|submarines\(3)))))) # (!\u_vga|h_cnt\(3) & (((\u_vga|Mux2~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(7),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|Mux2~23_combout\,
	datad => \u_vga|submarines\(3),
	combout => \u_vga|Mux2~24_combout\);

-- Location: LCCOMB_X23_Y20_N30
\u_vga|Mux2~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~27_combout\ = (\u_vga|h_cnt\(4) & (((\u_vga|h_cnt\(6)) # (\u_vga|Mux2~24_combout\)))) # (!\u_vga|h_cnt\(4) & (\u_vga|Mux2~26_combout\ & (!\u_vga|h_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~26_combout\,
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|h_cnt\(6),
	datad => \u_vga|Mux2~24_combout\,
	combout => \u_vga|Mux2~27_combout\);

-- Location: LCCOMB_X23_Y20_N16
\u_vga|Mux2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~21_combout\ = (\u_vga|h_cnt\(3) & ((\u_vga|submarines\(9)) # ((\u_vga|h_cnt\(5))))) # (!\u_vga|h_cnt\(3) & (((!\u_vga|h_cnt\(5) & \u_vga|submarines\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(9),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines\(8),
	combout => \u_vga|Mux2~21_combout\);

-- Location: LCCOMB_X23_Y20_N20
\u_vga|Mux2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~22_combout\ = (\u_vga|Mux2~21_combout\ & ((\u_vga|submarines\(13)) # ((!\u_vga|h_cnt\(5))))) # (!\u_vga|Mux2~21_combout\ & (((\u_vga|h_cnt\(5) & \u_vga|submarines\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~21_combout\,
	datab => \u_vga|submarines\(13),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines\(12),
	combout => \u_vga|Mux2~22_combout\);

-- Location: LCCOMB_X23_Y20_N8
\u_vga|Mux2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~28_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|h_cnt\(5)) # (\u_vga|submarines\(11))))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines\(10) & (!\u_vga|h_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(10),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines\(11),
	combout => \u_vga|Mux2~28_combout\);

-- Location: LCCOMB_X23_Y20_N10
\u_vga|Mux2~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~29_combout\ = (\u_vga|Mux2~28_combout\ & (((\u_vga|submarines\(15)) # (!\u_vga|h_cnt\(5))))) # (!\u_vga|Mux2~28_combout\ & (\u_vga|submarines\(14) & (\u_vga|h_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~28_combout\,
	datab => \u_vga|submarines\(14),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines\(15),
	combout => \u_vga|Mux2~29_combout\);

-- Location: LCCOMB_X23_Y20_N4
\u_vga|Mux2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~30_combout\ = (\u_vga|Mux2~27_combout\ & (((\u_vga|Mux2~29_combout\) # (!\u_vga|h_cnt\(6))))) # (!\u_vga|Mux2~27_combout\ & (\u_vga|Mux2~22_combout\ & (\u_vga|h_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~27_combout\,
	datab => \u_vga|Mux2~22_combout\,
	datac => \u_vga|h_cnt\(6),
	datad => \u_vga|Mux2~29_combout\,
	combout => \u_vga|Mux2~30_combout\);

-- Location: LCCOMB_X26_Y21_N20
\u_vga|Mux2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~11_combout\ = (\u_vga|h_cnt\(5) & (((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & ((\u_vga|h_cnt\(3) & ((\u_vga|submarines\(35)))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines\(34)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|submarines\(34),
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|submarines\(35),
	combout => \u_vga|Mux2~11_combout\);

-- Location: LCCOMB_X26_Y21_N0
\u_vga|Mux2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~12_combout\ = (\u_vga|Mux2~11_combout\ & (((\u_vga|submarines\(39)) # (!\u_vga|h_cnt\(5))))) # (!\u_vga|Mux2~11_combout\ & (\u_vga|submarines\(38) & ((\u_vga|h_cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(38),
	datab => \u_vga|Mux2~11_combout\,
	datac => \u_vga|submarines\(39),
	datad => \u_vga|h_cnt\(5),
	combout => \u_vga|Mux2~12_combout\);

-- Location: LCCOMB_X25_Y20_N14
\u_vga|Mux2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~18_combout\ = (\u_vga|h_cnt\(5) & ((\u_vga|submarines\(46)) # ((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & (((\u_vga|submarines\(42) & !\u_vga|h_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(46),
	datab => \u_vga|submarines\(42),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|h_cnt\(3),
	combout => \u_vga|Mux2~18_combout\);

-- Location: LCCOMB_X25_Y20_N24
\u_vga|Mux2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~19_combout\ = (\u_vga|h_cnt\(3) & ((\u_vga|Mux2~18_combout\ & (\u_vga|submarines\(47))) # (!\u_vga|Mux2~18_combout\ & ((\u_vga|submarines\(43)))))) # (!\u_vga|h_cnt\(3) & (\u_vga|Mux2~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|Mux2~18_combout\,
	datac => \u_vga|submarines\(47),
	datad => \u_vga|submarines\(43),
	combout => \u_vga|Mux2~19_combout\);

-- Location: LCCOMB_X25_Y20_N20
\u_vga|Mux2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~13_combout\ = (\u_vga|h_cnt\(5) & (((\u_vga|submarines\(44)) # (\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & (\u_vga|submarines\(40) & ((!\u_vga|h_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(40),
	datab => \u_vga|submarines\(44),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|h_cnt\(3),
	combout => \u_vga|Mux2~13_combout\);

-- Location: LCCOMB_X25_Y20_N8
\u_vga|Mux2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~14_combout\ = (\u_vga|Mux2~13_combout\ & ((\u_vga|submarines\(45)) # ((!\u_vga|h_cnt\(3))))) # (!\u_vga|Mux2~13_combout\ & (((\u_vga|submarines\(41) & \u_vga|h_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(45),
	datab => \u_vga|Mux2~13_combout\,
	datac => \u_vga|submarines\(41),
	datad => \u_vga|h_cnt\(3),
	combout => \u_vga|Mux2~14_combout\);

-- Location: LCCOMB_X26_Y21_N4
\u_vga|Mux2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~15_combout\ = (\u_vga|h_cnt\(3) & ((\u_vga|submarines\(33)) # ((\u_vga|h_cnt\(5))))) # (!\u_vga|h_cnt\(3) & (((\u_vga|submarines\(32) & !\u_vga|h_cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(33),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|submarines\(32),
	datad => \u_vga|h_cnt\(5),
	combout => \u_vga|Mux2~15_combout\);

-- Location: LCCOMB_X26_Y21_N16
\u_vga|Mux2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~16_combout\ = (\u_vga|h_cnt\(5) & ((\u_vga|Mux2~15_combout\ & (\u_vga|submarines\(37))) # (!\u_vga|Mux2~15_combout\ & ((\u_vga|submarines\(36)))))) # (!\u_vga|h_cnt\(5) & (((\u_vga|Mux2~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(37),
	datab => \u_vga|h_cnt\(5),
	datac => \u_vga|Mux2~15_combout\,
	datad => \u_vga|submarines\(36),
	combout => \u_vga|Mux2~16_combout\);

-- Location: LCCOMB_X26_Y22_N24
\u_vga|Mux2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~17_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|Mux2~14_combout\) # ((\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(6) & (((!\u_vga|h_cnt\(4) & \u_vga|Mux2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~14_combout\,
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|Mux2~16_combout\,
	combout => \u_vga|Mux2~17_combout\);

-- Location: LCCOMB_X26_Y22_N18
\u_vga|Mux2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~20_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|Mux2~17_combout\ & ((\u_vga|Mux2~19_combout\))) # (!\u_vga|Mux2~17_combout\ & (\u_vga|Mux2~12_combout\)))) # (!\u_vga|h_cnt\(4) & (((\u_vga|Mux2~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|Mux2~12_combout\,
	datac => \u_vga|Mux2~19_combout\,
	datad => \u_vga|Mux2~17_combout\,
	combout => \u_vga|Mux2~20_combout\);

-- Location: LCCOMB_X26_Y22_N12
\u_vga|Mux2~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~31_combout\ = (\u_vga|h_cnt\(8) & (((\u_vga|Mux2~20_combout\) # (\u_vga|h_cnt\(7))))) # (!\u_vga|h_cnt\(8) & (\u_vga|Mux2~30_combout\ & ((!\u_vga|h_cnt\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~30_combout\,
	datab => \u_vga|Mux2~20_combout\,
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|h_cnt\(7),
	combout => \u_vga|Mux2~31_combout\);

-- Location: LCCOMB_X26_Y22_N16
\u_vga|Mux2~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux2~33_combout\ = (\u_vga|h_cnt\(7) & ((\u_vga|Mux2~31_combout\ & (\u_vga|Mux2~32_combout\)) # (!\u_vga|Mux2~31_combout\ & ((\u_vga|Mux2~10_combout\))))) # (!\u_vga|h_cnt\(7) & (((\u_vga|Mux2~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux2~32_combout\,
	datab => \u_vga|h_cnt\(7),
	datac => \u_vga|Mux2~10_combout\,
	datad => \u_vga|Mux2~31_combout\,
	combout => \u_vga|Mux2~33_combout\);

-- Location: LCCOMB_X25_Y22_N26
\u_vga|Equal8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal8~2_combout\ = (!\u_vga|h_cnt\(4) & (!\u_vga|h_cnt\(2) & \u_vga|h_cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|h_cnt\(2),
	datad => \u_vga|h_cnt\(8),
	combout => \u_vga|Equal8~2_combout\);

-- Location: LCCOMB_X25_Y22_N24
\u_vga|Equal8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal8~1_combout\ = (\u_vga|h_cnt\(5) & (\u_vga|h_cnt\(9) & (!\u_vga|h_cnt\(6) & !\u_vga|h_cnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|h_cnt\(9),
	datac => \u_vga|h_cnt\(6),
	datad => \u_vga|h_cnt\(10),
	combout => \u_vga|Equal8~1_combout\);

-- Location: LCCOMB_X25_Y22_N22
\u_vga|Equal8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal8~3_combout\ = (!\u_vga|h_cnt\(7) & (\u_vga|Equal8~2_combout\ & (!\u_vga|h_cnt\(3) & \u_vga|Equal8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(7),
	datab => \u_vga|Equal8~2_combout\,
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|Equal8~1_combout\,
	combout => \u_vga|Equal8~3_combout\);

-- Location: LCCOMB_X27_Y23_N10
\u_vga|vga_gen~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~11_combout\ = (!\u_vga|h_cnt\(0) & (\u_vga|Equal8~3_combout\ & (!\u_vga|h_cnt\(1) & \u_vga|Equal7~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datab => \u_vga|Equal8~3_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|Equal7~4_combout\,
	combout => \u_vga|vga_gen~11_combout\);

-- Location: FF_X29_Y23_N9
\u_vga|current_line[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_line~3_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_line\(9));

-- Location: LCCOMB_X28_Y23_N4
\u_vga|Add14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add14~0_combout\ = (((!\u_vga|vga_gen~11_combout\ & \u_vga|current_line\(3))))
-- \u_vga|Add14~1\ = CARRY((!\u_vga|vga_gen~11_combout\ & \u_vga|current_line\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(3),
	datad => VCC,
	combout => \u_vga|Add14~0_combout\,
	cout => \u_vga|Add14~1\);

-- Location: LCCOMB_X28_Y23_N16
\u_vga|Add14~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add14~12_combout\ = (\u_vga|Add14~11\ & (!\u_vga|vga_gen~11_combout\ & (\u_vga|current_line\(9) & VCC))) # (!\u_vga|Add14~11\ & ((((!\u_vga|vga_gen~11_combout\ & \u_vga|current_line\(9))))))
-- \u_vga|Add14~13\ = CARRY((!\u_vga|vga_gen~11_combout\ & (\u_vga|current_line\(9) & !\u_vga|Add14~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(9),
	datad => VCC,
	cin => \u_vga|Add14~11\,
	combout => \u_vga|Add14~12_combout\,
	cout => \u_vga|Add14~13\);

-- Location: LCCOMB_X28_Y23_N18
\u_vga|Add14~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add14~14_combout\ = \u_vga|Add14~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|Add14~13\,
	combout => \u_vga|Add14~14_combout\);

-- Location: LCCOMB_X29_Y24_N26
\u_vga|vga_gen~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~12_combout\ = (\u_vga|v_cnt\(10) & (\u_vga|Add14~14_combout\ & (\u_vga|Add14~12_combout\ $ (!\u_vga|v_cnt\(9))))) # (!\u_vga|v_cnt\(10) & (!\u_vga|Add14~14_combout\ & (\u_vga|Add14~12_combout\ $ (!\u_vga|v_cnt\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(10),
	datab => \u_vga|Add14~12_combout\,
	datac => \u_vga|Add14~14_combout\,
	datad => \u_vga|v_cnt\(9),
	combout => \u_vga|vga_gen~12_combout\);

-- Location: LCCOMB_X28_Y23_N24
\u_vga|vga_gen~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~13_combout\ = (\u_vga|v_cnt\(3) & (\u_vga|Add14~0_combout\ & (\u_vga|v_cnt\(4) $ (!\u_vga|Add14~2_combout\)))) # (!\u_vga|v_cnt\(3) & (!\u_vga|Add14~0_combout\ & (\u_vga|v_cnt\(4) $ (!\u_vga|Add14~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(3),
	datab => \u_vga|Add14~0_combout\,
	datac => \u_vga|v_cnt\(4),
	datad => \u_vga|Add14~2_combout\,
	combout => \u_vga|vga_gen~13_combout\);

-- Location: LCCOMB_X28_Y23_N28
\u_vga|vga_gen~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~15_combout\ = (\u_vga|v_cnt\(8) & (\u_vga|Add14~10_combout\ & (\u_vga|v_cnt\(7) $ (!\u_vga|Add14~8_combout\)))) # (!\u_vga|v_cnt\(8) & (!\u_vga|Add14~10_combout\ & (\u_vga|v_cnt\(7) $ (!\u_vga|Add14~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(8),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|Add14~10_combout\,
	datad => \u_vga|Add14~8_combout\,
	combout => \u_vga|vga_gen~15_combout\);

-- Location: LCCOMB_X28_Y23_N2
\u_vga|vga_gen~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~14_combout\ = (\u_vga|Add14~4_combout\ & (\u_vga|v_cnt\(5) & (\u_vga|v_cnt\(6) $ (!\u_vga|Add14~6_combout\)))) # (!\u_vga|Add14~4_combout\ & (!\u_vga|v_cnt\(5) & (\u_vga|v_cnt\(6) $ (!\u_vga|Add14~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add14~4_combout\,
	datab => \u_vga|v_cnt\(5),
	datac => \u_vga|v_cnt\(6),
	datad => \u_vga|Add14~6_combout\,
	combout => \u_vga|vga_gen~14_combout\);

-- Location: LCCOMB_X28_Y23_N30
\u_vga|vga_gen~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~16_combout\ = (\u_vga|vga_gen~13_combout\ & (\u_vga|vga_gen~15_combout\ & (\u_vga|Equal7~2_combout\ & \u_vga|vga_gen~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~13_combout\,
	datab => \u_vga|vga_gen~15_combout\,
	datac => \u_vga|Equal7~2_combout\,
	datad => \u_vga|vga_gen~14_combout\,
	combout => \u_vga|vga_gen~16_combout\);

-- Location: LCCOMB_X29_Y24_N28
\u_vga|current_line~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line~0_combout\ = (\u_vga|Equal8~3_combout\ & (\u_vga|Equal8~0_combout\ & (\u_vga|vga_gen~12_combout\ & \u_vga|vga_gen~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal8~3_combout\,
	datab => \u_vga|Equal8~0_combout\,
	datac => \u_vga|vga_gen~12_combout\,
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|current_line~0_combout\);

-- Location: LCCOMB_X29_Y24_N30
\u_vga|current_line~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line~1_combout\ = (\u_vga|current_line~0_combout\ & (\u_vga|Add14~0_combout\)) # (!\u_vga|current_line~0_combout\ & (((\u_vga|current_line\(3) & !\u_vga|vga_gen~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add14~0_combout\,
	datab => \u_vga|current_line\(3),
	datac => \u_vga|vga_gen~11_combout\,
	datad => \u_vga|current_line~0_combout\,
	combout => \u_vga|current_line~1_combout\);

-- Location: FF_X29_Y24_N25
\u_vga|current_line[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|current_line~1_combout\,
	sload => VCC,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_line\(3));

-- Location: LCCOMB_X28_Y23_N6
\u_vga|Add14~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add14~2_combout\ = (\u_vga|Add14~1\ & ((\u_vga|vga_gen~11_combout\) # ((!\u_vga|current_line\(4))))) # (!\u_vga|Add14~1\ & (((!\u_vga|vga_gen~11_combout\ & \u_vga|current_line\(4))) # (GND)))
-- \u_vga|Add14~3\ = CARRY((\u_vga|vga_gen~11_combout\) # ((!\u_vga|Add14~1\) # (!\u_vga|current_line\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(4),
	datad => VCC,
	cin => \u_vga|Add14~1\,
	combout => \u_vga|Add14~2_combout\,
	cout => \u_vga|Add14~3\);

-- Location: LCCOMB_X28_Y23_N20
\u_vga|vga_gen~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~19_combout\ = (\u_vga|Add14~14_combout\ & ((\u_vga|v_cnt\(9) $ (\u_vga|Add14~12_combout\)) # (!\u_vga|v_cnt\(10)))) # (!\u_vga|Add14~14_combout\ & ((\u_vga|v_cnt\(10)) # (\u_vga|v_cnt\(9) $ (\u_vga|Add14~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add14~14_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|Add14~12_combout\,
	combout => \u_vga|vga_gen~19_combout\);

-- Location: LCCOMB_X28_Y23_N0
\u_vga|vga_gen~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~17_combout\ = (\u_vga|Equal8~3_combout\ & (\u_vga|Equal7~2_combout\ & (\u_vga|v_cnt\(7) $ (!\u_vga|Add14~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal8~3_combout\,
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|Equal7~2_combout\,
	datad => \u_vga|Add14~8_combout\,
	combout => \u_vga|vga_gen~17_combout\);

-- Location: LCCOMB_X28_Y23_N26
\u_vga|vga_gen~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~18_combout\ = (\u_vga|Equal8~0_combout\ & (\u_vga|vga_gen~13_combout\ & (\u_vga|v_cnt\(8) $ (!\u_vga|Add14~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(8),
	datab => \u_vga|Equal8~0_combout\,
	datac => \u_vga|Add14~10_combout\,
	datad => \u_vga|vga_gen~13_combout\,
	combout => \u_vga|vga_gen~18_combout\);

-- Location: LCCOMB_X28_Y23_N22
\u_vga|vga_gen~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~20_combout\ = (!\u_vga|vga_gen~19_combout\ & (\u_vga|vga_gen~17_combout\ & (\u_vga|vga_gen~18_combout\ & \u_vga|vga_gen~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~19_combout\,
	datab => \u_vga|vga_gen~17_combout\,
	datac => \u_vga|vga_gen~18_combout\,
	datad => \u_vga|vga_gen~14_combout\,
	combout => \u_vga|vga_gen~20_combout\);

-- Location: LCCOMB_X29_Y23_N26
\u_vga|current_line~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line~2_combout\ = (\u_vga|vga_gen~20_combout\ & (((\u_vga|Add14~2_combout\)))) # (!\u_vga|vga_gen~20_combout\ & (!\u_vga|vga_gen~11_combout\ & ((\u_vga|current_line\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|Add14~2_combout\,
	datac => \u_vga|current_line\(4),
	datad => \u_vga|vga_gen~20_combout\,
	combout => \u_vga|current_line~2_combout\);

-- Location: FF_X29_Y23_N27
\u_vga|current_line[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_line~2_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_line\(4));

-- Location: LCCOMB_X28_Y23_N8
\u_vga|Add14~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add14~4_combout\ = (\u_vga|Add14~3\ & (!\u_vga|vga_gen~11_combout\ & (\u_vga|current_line\(5) & VCC))) # (!\u_vga|Add14~3\ & ((((!\u_vga|vga_gen~11_combout\ & \u_vga|current_line\(5))))))
-- \u_vga|Add14~5\ = CARRY((!\u_vga|vga_gen~11_combout\ & (\u_vga|current_line\(5) & !\u_vga|Add14~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(5),
	datad => VCC,
	cin => \u_vga|Add14~3\,
	combout => \u_vga|Add14~4_combout\,
	cout => \u_vga|Add14~5\);

-- Location: LCCOMB_X30_Y23_N10
\u_vga|current_line~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line~6_combout\ = (\u_vga|vga_gen~20_combout\ & (((\u_vga|Add14~4_combout\)))) # (!\u_vga|vga_gen~20_combout\ & (!\u_vga|vga_gen~11_combout\ & ((\u_vga|current_line\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|Add14~4_combout\,
	datac => \u_vga|current_line\(5),
	datad => \u_vga|vga_gen~20_combout\,
	combout => \u_vga|current_line~6_combout\);

-- Location: FF_X30_Y23_N11
\u_vga|current_line[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_line~6_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_line\(5));

-- Location: LCCOMB_X28_Y23_N10
\u_vga|Add14~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add14~6_combout\ = (\u_vga|vga_gen~11_combout\ & (((!\u_vga|Add14~5\)))) # (!\u_vga|vga_gen~11_combout\ & ((\u_vga|current_line\(6) & ((\u_vga|Add14~5\) # (GND))) # (!\u_vga|current_line\(6) & (!\u_vga|Add14~5\))))
-- \u_vga|Add14~7\ = CARRY(((!\u_vga|vga_gen~11_combout\ & \u_vga|current_line\(6))) # (!\u_vga|Add14~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101101001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(6),
	datad => VCC,
	cin => \u_vga|Add14~5\,
	combout => \u_vga|Add14~6_combout\,
	cout => \u_vga|Add14~7\);

-- Location: LCCOMB_X30_Y23_N8
\u_vga|current_line~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line~5_combout\ = (\u_vga|vga_gen~20_combout\ & (((\u_vga|Add14~6_combout\)))) # (!\u_vga|vga_gen~20_combout\ & ((\u_vga|vga_gen~11_combout\) # ((!\u_vga|current_line\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|Add14~6_combout\,
	datac => \u_vga|current_line\(6),
	datad => \u_vga|vga_gen~20_combout\,
	combout => \u_vga|current_line~5_combout\);

-- Location: LCCOMB_X27_Y23_N20
\u_vga|current_line[6]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line[6]~9_combout\ = !\u_vga|current_line~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|current_line~5_combout\,
	combout => \u_vga|current_line[6]~9_combout\);

-- Location: FF_X27_Y23_N21
\u_vga|current_line[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_line[6]~9_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_line\(6));

-- Location: LCCOMB_X28_Y23_N12
\u_vga|Add14~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add14~8_combout\ = (\u_vga|Add14~7\ & (((\u_vga|vga_gen~11_combout\) # (!\u_vga|current_line\(7))))) # (!\u_vga|Add14~7\ & ((((\u_vga|vga_gen~11_combout\) # (!\u_vga|current_line\(7))))))
-- \u_vga|Add14~9\ = CARRY((!\u_vga|Add14~7\ & ((\u_vga|vga_gen~11_combout\) # (!\u_vga|current_line\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010000001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(7),
	datad => VCC,
	cin => \u_vga|Add14~7\,
	combout => \u_vga|Add14~8_combout\,
	cout => \u_vga|Add14~9\);

-- Location: LCCOMB_X30_Y23_N18
\u_vga|current_line~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line~7_combout\ = (\u_vga|vga_gen~20_combout\ & (\u_vga|Add14~8_combout\)) # (!\u_vga|vga_gen~20_combout\ & (((\u_vga|vga_gen~11_combout\) # (!\u_vga|current_line\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add14~8_combout\,
	datab => \u_vga|current_line\(7),
	datac => \u_vga|vga_gen~11_combout\,
	datad => \u_vga|vga_gen~20_combout\,
	combout => \u_vga|current_line~7_combout\);

-- Location: LCCOMB_X28_Y22_N0
\u_vga|current_line[7]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line[7]~8_combout\ = !\u_vga|current_line~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|current_line~7_combout\,
	combout => \u_vga|current_line[7]~8_combout\);

-- Location: FF_X28_Y22_N1
\u_vga|current_line[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_line[7]~8_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_line\(7));

-- Location: LCCOMB_X28_Y23_N14
\u_vga|Add14~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add14~10_combout\ = (\u_vga|Add14~9\ & ((\u_vga|vga_gen~11_combout\) # ((!\u_vga|current_line\(8))))) # (!\u_vga|Add14~9\ & (((!\u_vga|vga_gen~11_combout\ & \u_vga|current_line\(8))) # (GND)))
-- \u_vga|Add14~11\ = CARRY((\u_vga|vga_gen~11_combout\) # ((!\u_vga|Add14~9\) # (!\u_vga|current_line\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(8),
	datad => VCC,
	cin => \u_vga|Add14~9\,
	combout => \u_vga|Add14~10_combout\,
	cout => \u_vga|Add14~11\);

-- Location: LCCOMB_X30_Y23_N0
\u_vga|current_line~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line~4_combout\ = (\u_vga|current_line~0_combout\ & (((\u_vga|Add14~10_combout\)))) # (!\u_vga|current_line~0_combout\ & (!\u_vga|vga_gen~11_combout\ & ((\u_vga|current_line\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|Add14~10_combout\,
	datac => \u_vga|current_line\(8),
	datad => \u_vga|current_line~0_combout\,
	combout => \u_vga|current_line~4_combout\);

-- Location: FF_X30_Y23_N1
\u_vga|current_line[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_line~4_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_line\(8));

-- Location: LCCOMB_X29_Y23_N8
\u_vga|current_line~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_line~3_combout\ = (\u_vga|vga_gen~20_combout\ & (\u_vga|Add14~12_combout\)) # (!\u_vga|vga_gen~20_combout\ & (((!\u_vga|vga_gen~11_combout\ & \u_vga|current_line\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add14~12_combout\,
	datab => \u_vga|vga_gen~11_combout\,
	datac => \u_vga|current_line\(9),
	datad => \u_vga|vga_gen~20_combout\,
	combout => \u_vga|current_line~3_combout\);

-- Location: LCCOMB_X30_Y24_N18
\u_vga|Add16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add16~0_combout\ = (\u_vga|current_line~2_combout\ & (\u_vga|current_line~1_combout\ $ (VCC))) # (!\u_vga|current_line~2_combout\ & (\u_vga|current_line~1_combout\ & VCC))
-- \u_vga|Add16~1\ = CARRY((\u_vga|current_line~2_combout\ & \u_vga|current_line~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~2_combout\,
	datab => \u_vga|current_line~1_combout\,
	datad => VCC,
	combout => \u_vga|Add16~0_combout\,
	cout => \u_vga|Add16~1\);

-- Location: LCCOMB_X30_Y24_N20
\u_vga|Add16~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add16~2_combout\ = (\u_vga|current_line~6_combout\ & (!\u_vga|Add16~1\)) # (!\u_vga|current_line~6_combout\ & ((\u_vga|Add16~1\) # (GND)))
-- \u_vga|Add16~3\ = CARRY((!\u_vga|Add16~1\) # (!\u_vga|current_line~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_line~6_combout\,
	datad => VCC,
	cin => \u_vga|Add16~1\,
	combout => \u_vga|Add16~2_combout\,
	cout => \u_vga|Add16~3\);

-- Location: LCCOMB_X30_Y24_N22
\u_vga|Add16~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add16~4_combout\ = (\u_vga|current_line~5_combout\ & (\u_vga|Add16~3\ $ (GND))) # (!\u_vga|current_line~5_combout\ & (!\u_vga|Add16~3\ & VCC))
-- \u_vga|Add16~5\ = CARRY((\u_vga|current_line~5_combout\ & !\u_vga|Add16~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~5_combout\,
	datad => VCC,
	cin => \u_vga|Add16~3\,
	combout => \u_vga|Add16~4_combout\,
	cout => \u_vga|Add16~5\);

-- Location: LCCOMB_X30_Y24_N24
\u_vga|Add16~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add16~6_combout\ = (\u_vga|current_line~7_combout\ & (!\u_vga|Add16~5\)) # (!\u_vga|current_line~7_combout\ & ((\u_vga|Add16~5\) # (GND)))
-- \u_vga|Add16~7\ = CARRY((!\u_vga|Add16~5\) # (!\u_vga|current_line~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~7_combout\,
	datad => VCC,
	cin => \u_vga|Add16~5\,
	combout => \u_vga|Add16~6_combout\,
	cout => \u_vga|Add16~7\);

-- Location: LCCOMB_X30_Y24_N26
\u_vga|Add16~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add16~8_combout\ = (\u_vga|current_line~4_combout\ & (\u_vga|Add16~7\ $ (GND))) # (!\u_vga|current_line~4_combout\ & (!\u_vga|Add16~7\ & VCC))
-- \u_vga|Add16~9\ = CARRY((\u_vga|current_line~4_combout\ & !\u_vga|Add16~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_line~4_combout\,
	datad => VCC,
	cin => \u_vga|Add16~7\,
	combout => \u_vga|Add16~8_combout\,
	cout => \u_vga|Add16~9\);

-- Location: LCCOMB_X30_Y24_N28
\u_vga|Add16~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add16~10_combout\ = (\u_vga|current_line~3_combout\ & (!\u_vga|Add16~9\)) # (!\u_vga|current_line~3_combout\ & ((\u_vga|Add16~9\) # (GND)))
-- \u_vga|Add16~11\ = CARRY((!\u_vga|Add16~9\) # (!\u_vga|current_line~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_line~3_combout\,
	datad => VCC,
	cin => \u_vga|Add16~9\,
	combout => \u_vga|Add16~10_combout\,
	cout => \u_vga|Add16~11\);

-- Location: LCCOMB_X30_Y24_N30
\u_vga|Add16~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add16~12_combout\ = !\u_vga|Add16~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|Add16~11\,
	combout => \u_vga|Add16~12_combout\);

-- Location: LCCOMB_X29_Y24_N8
\u_vga|LessThan12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan12~1_cout\ = CARRY((\u_vga|current_line~1_combout\ & \u_vga|v_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~1_combout\,
	datab => \u_vga|v_cnt\(3),
	datad => VCC,
	cout => \u_vga|LessThan12~1_cout\);

-- Location: LCCOMB_X29_Y24_N10
\u_vga|LessThan12~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan12~3_cout\ = CARRY((\u_vga|v_cnt\(4) & (\u_vga|Add16~0_combout\ & !\u_vga|LessThan12~1_cout\)) # (!\u_vga|v_cnt\(4) & ((\u_vga|Add16~0_combout\) # (!\u_vga|LessThan12~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datab => \u_vga|Add16~0_combout\,
	datad => VCC,
	cin => \u_vga|LessThan12~1_cout\,
	cout => \u_vga|LessThan12~3_cout\);

-- Location: LCCOMB_X29_Y24_N12
\u_vga|LessThan12~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan12~5_cout\ = CARRY((\u_vga|Add16~2_combout\ & (\u_vga|v_cnt\(5) & !\u_vga|LessThan12~3_cout\)) # (!\u_vga|Add16~2_combout\ & ((\u_vga|v_cnt\(5)) # (!\u_vga|LessThan12~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add16~2_combout\,
	datab => \u_vga|v_cnt\(5),
	datad => VCC,
	cin => \u_vga|LessThan12~3_cout\,
	cout => \u_vga|LessThan12~5_cout\);

-- Location: LCCOMB_X29_Y24_N14
\u_vga|LessThan12~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan12~7_cout\ = CARRY((\u_vga|v_cnt\(6) & (\u_vga|Add16~4_combout\ & !\u_vga|LessThan12~5_cout\)) # (!\u_vga|v_cnt\(6) & ((\u_vga|Add16~4_combout\) # (!\u_vga|LessThan12~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|Add16~4_combout\,
	datad => VCC,
	cin => \u_vga|LessThan12~5_cout\,
	cout => \u_vga|LessThan12~7_cout\);

-- Location: LCCOMB_X29_Y24_N16
\u_vga|LessThan12~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan12~9_cout\ = CARRY((\u_vga|v_cnt\(7) & ((!\u_vga|LessThan12~7_cout\) # (!\u_vga|Add16~6_combout\))) # (!\u_vga|v_cnt\(7) & (!\u_vga|Add16~6_combout\ & !\u_vga|LessThan12~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datab => \u_vga|Add16~6_combout\,
	datad => VCC,
	cin => \u_vga|LessThan12~7_cout\,
	cout => \u_vga|LessThan12~9_cout\);

-- Location: LCCOMB_X29_Y24_N18
\u_vga|LessThan12~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan12~11_cout\ = CARRY((\u_vga|Add16~8_combout\ & ((!\u_vga|LessThan12~9_cout\) # (!\u_vga|v_cnt\(8)))) # (!\u_vga|Add16~8_combout\ & (!\u_vga|v_cnt\(8) & !\u_vga|LessThan12~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add16~8_combout\,
	datab => \u_vga|v_cnt\(8),
	datad => VCC,
	cin => \u_vga|LessThan12~9_cout\,
	cout => \u_vga|LessThan12~11_cout\);

-- Location: LCCOMB_X29_Y24_N20
\u_vga|LessThan12~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan12~13_cout\ = CARRY((\u_vga|v_cnt\(9) & ((!\u_vga|LessThan12~11_cout\) # (!\u_vga|Add16~10_combout\))) # (!\u_vga|v_cnt\(9) & (!\u_vga|Add16~10_combout\ & !\u_vga|LessThan12~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datab => \u_vga|Add16~10_combout\,
	datad => VCC,
	cin => \u_vga|LessThan12~11_cout\,
	cout => \u_vga|LessThan12~13_cout\);

-- Location: LCCOMB_X29_Y24_N22
\u_vga|LessThan12~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan12~14_combout\ = (\u_vga|v_cnt\(10) & ((\u_vga|LessThan12~13_cout\) # (!\u_vga|Add16~12_combout\))) # (!\u_vga|v_cnt\(10) & (\u_vga|LessThan12~13_cout\ & !\u_vga|Add16~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(10),
	datad => \u_vga|Add16~12_combout\,
	cin => \u_vga|LessThan12~13_cout\,
	combout => \u_vga|LessThan12~14_combout\);

-- Location: LCCOMB_X24_Y23_N6
\u_vga|generate_rocket~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|generate_rocket~0_combout\ = (!\u_vga|update_elements_position~5_combout\ & ((\u_vga|generate_rocket~q\) # ((\u_vga|generate_subarine~2_combout\ & \u_vga|Decoder0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|generate_subarine~2_combout\,
	datab => \u_vga|Decoder0~1_combout\,
	datac => \u_vga|generate_rocket~q\,
	datad => \u_vga|update_elements_position~5_combout\,
	combout => \u_vga|generate_rocket~0_combout\);

-- Location: FF_X24_Y23_N7
\u_vga|generate_rocket\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|generate_rocket~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|generate_rocket~q\);

-- Location: LCCOMB_X24_Y23_N0
\u_vga|wr_en_a_sub~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|wr_en_a_sub~2_combout\ = (\u_vga|generate_subarine~q\ & (\u_vga|wr_en_a_sub~0_combout\)) # (!\u_vga|generate_subarine~q\ & ((\u_vga|generate_rocket~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|generate_subarine~q\,
	datac => \u_vga|wr_en_a_sub~0_combout\,
	datad => \u_vga|generate_rocket~q\,
	combout => \u_vga|wr_en_a_sub~2_combout\);

-- Location: LCCOMB_X24_Y23_N26
\u_vga|wr_en_a_sub~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|wr_en_a_sub~3_combout\ = (\u_vga|update_submarines~q\ & (((!\u_vga|Mux0~32_combout\)))) # (!\u_vga|update_submarines~q\ & (!\u_vga|update_rockets~q\ & ((\u_vga|wr_en_a_sub~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|update_rockets~q\,
	datac => \u_vga|Mux0~32_combout\,
	datad => \u_vga|wr_en_a_sub~2_combout\,
	combout => \u_vga|wr_en_a_sub~3_combout\);

-- Location: LCCOMB_X24_Y23_N2
\u_vga|wr_en_a_sub~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|wr_en_a_sub~1_combout\ = (\u_vga|update_submarines~q\ & (((\u_vga|read_sub~q\)))) # (!\u_vga|update_submarines~q\ & (!\u_vga|Mux1~32_combout\ & ((\u_vga|generate_subarine~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~32_combout\,
	datab => \u_vga|read_sub~q\,
	datac => \u_vga|update_submarines~q\,
	datad => \u_vga|generate_subarine~q\,
	combout => \u_vga|wr_en_a_sub~1_combout\);

-- Location: LCCOMB_X24_Y23_N8
\u_vga|wr_en_a_sub~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|wr_en_a_sub~4_combout\ = (\u_vga|wr_en_a_sub~3_combout\ & ((\u_vga|data_a_sub[10]~0_combout\ & (\u_vga|wr_en_a_sub~1_combout\)) # (!\u_vga|data_a_sub[10]~0_combout\ & ((\u_vga|wr_en_a_sub~q\))))) # (!\u_vga|wr_en_a_sub~3_combout\ & 
-- (((\u_vga|wr_en_a_sub~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|wr_en_a_sub~3_combout\,
	datab => \u_vga|wr_en_a_sub~1_combout\,
	datac => \u_vga|wr_en_a_sub~q\,
	datad => \u_vga|data_a_sub[10]~0_combout\,
	combout => \u_vga|wr_en_a_sub~4_combout\);

-- Location: FF_X24_Y23_N9
\u_vga|wr_en_a_sub\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|wr_en_a_sub~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|wr_en_a_sub~q\);

-- Location: LCCOMB_X25_Y21_N2
\u_vga|address_a_sub[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a_sub[0]~6_combout\ = \u_vga|magn_g_y\(0) $ (VCC)
-- \u_vga|address_a_sub[0]~7\ = CARRY(\u_vga|magn_g_y\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|magn_g_y\(0),
	datad => VCC,
	combout => \u_vga|address_a_sub[0]~6_combout\,
	cout => \u_vga|address_a_sub[0]~7\);

-- Location: LCCOMB_X25_Y21_N28
\u_vga|address_a_sub[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a_sub[0]~8_combout\ = (\u_vga|data_a_sub[10]~0_combout\ & ((\u_vga|update_submarines~q\ & ((!\u_vga|Mux0~32_combout\))) # (!\u_vga|update_submarines~q\ & (\u_vga|Decoder0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~1_combout\,
	datab => \u_vga|Mux0~32_combout\,
	datac => \u_vga|data_a_sub[10]~0_combout\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|address_a_sub[0]~8_combout\);

-- Location: FF_X25_Y21_N3
\u_vga|address_a_sub[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a_sub[0]~6_combout\,
	asdata => \u_vga|current_submarine\(0),
	sload => \u_vga|update_submarines~q\,
	ena => \u_vga|address_a_sub[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a_sub\(0));

-- Location: LCCOMB_X25_Y21_N4
\u_vga|address_a_sub[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a_sub[1]~9_combout\ = (\u_vga|Add5~0_combout\ & (\u_vga|address_a_sub[0]~7\ & VCC)) # (!\u_vga|Add5~0_combout\ & (!\u_vga|address_a_sub[0]~7\))
-- \u_vga|address_a_sub[1]~10\ = CARRY((!\u_vga|Add5~0_combout\ & !\u_vga|address_a_sub[0]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add5~0_combout\,
	datad => VCC,
	cin => \u_vga|address_a_sub[0]~7\,
	combout => \u_vga|address_a_sub[1]~9_combout\,
	cout => \u_vga|address_a_sub[1]~10\);

-- Location: FF_X25_Y21_N5
\u_vga|address_a_sub[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a_sub[1]~9_combout\,
	asdata => \u_vga|current_submarine\(1),
	sload => \u_vga|update_submarines~q\,
	ena => \u_vga|address_a_sub[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a_sub\(1));

-- Location: LCCOMB_X25_Y21_N6
\u_vga|address_a_sub[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a_sub[2]~11_combout\ = (\u_vga|Add5~2_combout\ & ((GND) # (!\u_vga|address_a_sub[1]~10\))) # (!\u_vga|Add5~2_combout\ & (\u_vga|address_a_sub[1]~10\ $ (GND)))
-- \u_vga|address_a_sub[2]~12\ = CARRY((\u_vga|Add5~2_combout\) # (!\u_vga|address_a_sub[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add5~2_combout\,
	datad => VCC,
	cin => \u_vga|address_a_sub[1]~10\,
	combout => \u_vga|address_a_sub[2]~11_combout\,
	cout => \u_vga|address_a_sub[2]~12\);

-- Location: FF_X25_Y21_N7
\u_vga|address_a_sub[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a_sub[2]~11_combout\,
	asdata => \u_vga|current_submarine\(2),
	sload => \u_vga|update_submarines~q\,
	ena => \u_vga|address_a_sub[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a_sub\(2));

-- Location: LCCOMB_X25_Y21_N8
\u_vga|address_a_sub[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a_sub[3]~13_combout\ = (\u_vga|Add5~4_combout\ & (\u_vga|address_a_sub[2]~12\ & VCC)) # (!\u_vga|Add5~4_combout\ & (!\u_vga|address_a_sub[2]~12\))
-- \u_vga|address_a_sub[3]~14\ = CARRY((!\u_vga|Add5~4_combout\ & !\u_vga|address_a_sub[2]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~4_combout\,
	datad => VCC,
	cin => \u_vga|address_a_sub[2]~12\,
	combout => \u_vga|address_a_sub[3]~13_combout\,
	cout => \u_vga|address_a_sub[3]~14\);

-- Location: FF_X25_Y21_N9
\u_vga|address_a_sub[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a_sub[3]~13_combout\,
	asdata => \u_vga|current_submarine\(3),
	sload => \u_vga|update_submarines~q\,
	ena => \u_vga|address_a_sub[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a_sub\(3));

-- Location: LCCOMB_X25_Y21_N10
\u_vga|address_a_sub[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a_sub[4]~15_combout\ = (\u_vga|Add5~6_combout\ & ((GND) # (!\u_vga|address_a_sub[3]~14\))) # (!\u_vga|Add5~6_combout\ & (\u_vga|address_a_sub[3]~14\ $ (GND)))
-- \u_vga|address_a_sub[4]~16\ = CARRY((\u_vga|Add5~6_combout\) # (!\u_vga|address_a_sub[3]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add5~6_combout\,
	datad => VCC,
	cin => \u_vga|address_a_sub[3]~14\,
	combout => \u_vga|address_a_sub[4]~15_combout\,
	cout => \u_vga|address_a_sub[4]~16\);

-- Location: FF_X25_Y21_N11
\u_vga|address_a_sub[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a_sub[4]~15_combout\,
	asdata => \u_vga|current_submarine\(4),
	sload => \u_vga|update_submarines~q\,
	ena => \u_vga|address_a_sub[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a_sub\(4));

-- Location: LCCOMB_X25_Y21_N12
\u_vga|address_a_sub[5]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a_sub[5]~17_combout\ = \u_vga|Add5~8_combout\ $ (!\u_vga|address_a_sub[4]~16\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add5~8_combout\,
	cin => \u_vga|address_a_sub[4]~16\,
	combout => \u_vga|address_a_sub[5]~17_combout\);

-- Location: FF_X25_Y21_N13
\u_vga|address_a_sub[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a_sub[5]~17_combout\,
	asdata => \u_vga|current_submarine\(5),
	sload => \u_vga|update_submarines~q\,
	ena => \u_vga|address_a_sub[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a_sub\(5));

-- Location: LCCOMB_X24_Y21_N24
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X29_Y24_N4
\u_vga|address_b_sub[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b_sub[0]~feeder_combout\ = \u_vga|current_line~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|current_line~1_combout\,
	combout => \u_vga|address_b_sub[0]~feeder_combout\);

-- Location: LCCOMB_X30_Y23_N28
\u_vga|vga_gen~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~26_combout\ = (\u_vga|vga_gen~11_combout\ & (((!\u_vga|v_cnt\(8))))) # (!\u_vga|vga_gen~11_combout\ & (!\u_vga|current_line\(7) & (\u_vga|v_cnt\(8) $ (!\u_vga|current_line\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(7),
	datac => \u_vga|v_cnt\(8),
	datad => \u_vga|current_line\(8),
	combout => \u_vga|vga_gen~26_combout\);

-- Location: LCCOMB_X30_Y23_N22
\u_vga|vga_gen~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~27_combout\ = (\u_vga|v_cnt\(7) & (\u_vga|vga_gen~26_combout\)) # (!\u_vga|v_cnt\(7) & (!\u_vga|vga_gen~26_combout\ & (\u_vga|v_cnt\(8) $ (!\u_vga|current_line\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datab => \u_vga|vga_gen~26_combout\,
	datac => \u_vga|v_cnt\(8),
	datad => \u_vga|current_line\(8),
	combout => \u_vga|vga_gen~27_combout\);

-- Location: LCCOMB_X30_Y23_N14
\u_vga|vga_gen~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~52_combout\ = (!\u_vga|v_cnt\(8)) # (!\u_vga|vga_gen~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datac => \u_vga|v_cnt\(8),
	combout => \u_vga|vga_gen~52_combout\);

-- Location: LCCOMB_X29_Y23_N22
\u_vga|vga_gen~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~28_combout\ = (\u_vga|vga_gen~20_combout\ & (((\u_vga|vga_gen~15_combout\)))) # (!\u_vga|vga_gen~20_combout\ & (\u_vga|vga_gen~27_combout\ & (\u_vga|vga_gen~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~27_combout\,
	datab => \u_vga|vga_gen~20_combout\,
	datac => \u_vga|vga_gen~52_combout\,
	datad => \u_vga|vga_gen~15_combout\,
	combout => \u_vga|vga_gen~28_combout\);

-- Location: LCCOMB_X28_Y24_N18
\u_vga|vga_gen~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~29_combout\ = (\u_vga|Equal8~3_combout\ & (!\u_vga|v_cnt\(10) & (\u_vga|Equal7~2_combout\ & \u_vga|h_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal8~3_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|Equal7~2_combout\,
	datad => \u_vga|h_cnt\(0),
	combout => \u_vga|vga_gen~29_combout\);

-- Location: LCCOMB_X29_Y23_N0
\u_vga|vga_gen~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~30_combout\ = (\u_vga|vga_gen~29_combout\ & (\u_vga|v_cnt\(9) $ (!\u_vga|current_line~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datab => \u_vga|vga_gen~29_combout\,
	datac => \u_vga|current_line~3_combout\,
	combout => \u_vga|vga_gen~30_combout\);

-- Location: LCCOMB_X29_Y24_N0
\u_vga|vga_gen~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~21_combout\ = (\u_vga|v_cnt\(4) & (\u_vga|current_line~2_combout\ & (\u_vga|v_cnt\(3) $ (!\u_vga|current_line~1_combout\)))) # (!\u_vga|v_cnt\(4) & (!\u_vga|current_line~2_combout\ & (\u_vga|v_cnt\(3) $ (!\u_vga|current_line~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datab => \u_vga|v_cnt\(3),
	datac => \u_vga|current_line~1_combout\,
	datad => \u_vga|current_line~2_combout\,
	combout => \u_vga|vga_gen~21_combout\);

-- Location: LCCOMB_X27_Y23_N6
\u_vga|vga_gen~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~22_combout\ = (\u_vga|vga_gen~11_combout\ & (((!\u_vga|v_cnt\(5))))) # (!\u_vga|vga_gen~11_combout\ & (!\u_vga|current_line\(6) & (\u_vga|v_cnt\(5) $ (!\u_vga|current_line\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~11_combout\,
	datab => \u_vga|current_line\(6),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|current_line\(5),
	combout => \u_vga|vga_gen~22_combout\);

-- Location: LCCOMB_X27_Y23_N24
\u_vga|vga_gen~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~23_combout\ = (\u_vga|vga_gen~22_combout\ & (\u_vga|v_cnt\(6))) # (!\u_vga|vga_gen~22_combout\ & (!\u_vga|v_cnt\(6) & (\u_vga|v_cnt\(5) $ (!\u_vga|current_line\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~22_combout\,
	datab => \u_vga|v_cnt\(6),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|current_line\(5),
	combout => \u_vga|vga_gen~23_combout\);

-- Location: LCCOMB_X27_Y23_N8
\u_vga|vga_gen~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~51_combout\ = (!\u_vga|vga_gen~11_combout\) # (!\u_vga|v_cnt\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|vga_gen~11_combout\,
	combout => \u_vga|vga_gen~51_combout\);

-- Location: LCCOMB_X27_Y23_N26
\u_vga|vga_gen~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~24_combout\ = (\u_vga|vga_gen~20_combout\ & (\u_vga|vga_gen~14_combout\)) # (!\u_vga|vga_gen~20_combout\ & (((\u_vga|vga_gen~23_combout\ & \u_vga|vga_gen~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~14_combout\,
	datab => \u_vga|vga_gen~23_combout\,
	datac => \u_vga|vga_gen~51_combout\,
	datad => \u_vga|vga_gen~20_combout\,
	combout => \u_vga|vga_gen~24_combout\);

-- Location: LCCOMB_X29_Y23_N14
\u_vga|vga_gen~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~31_combout\ = (\u_vga|vga_gen~28_combout\ & (\u_vga|vga_gen~30_combout\ & (\u_vga|vga_gen~21_combout\ & \u_vga|vga_gen~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~28_combout\,
	datab => \u_vga|vga_gen~30_combout\,
	datac => \u_vga|vga_gen~21_combout\,
	datad => \u_vga|vga_gen~24_combout\,
	combout => \u_vga|vga_gen~31_combout\);

-- Location: LCCOMB_X28_Y22_N10
\u_vga|address_b_sub[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b_sub[0]~0_combout\ = (\u_vga|LessThan3~2_combout\ & (!\u_vga|h_cnt\(1) & \u_vga|vga_gen~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan3~2_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|address_b_sub[0]~0_combout\);

-- Location: FF_X29_Y24_N5
\u_vga|address_b_sub[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b_sub[0]~feeder_combout\,
	ena => \u_vga|address_b_sub[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b_sub\(0));

-- Location: LCCOMB_X29_Y24_N6
\u_vga|address_b_sub[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b_sub[1]~feeder_combout\ = \u_vga|current_line~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|current_line~2_combout\,
	combout => \u_vga|address_b_sub[1]~feeder_combout\);

-- Location: FF_X29_Y24_N7
\u_vga|address_b_sub[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b_sub[1]~feeder_combout\,
	ena => \u_vga|address_b_sub[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b_sub\(1));

-- Location: LCCOMB_X28_Y22_N2
\u_vga|address_b_sub[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b_sub[2]~feeder_combout\ = \u_vga|current_line~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|current_line~6_combout\,
	combout => \u_vga|address_b_sub[2]~feeder_combout\);

-- Location: FF_X28_Y22_N3
\u_vga|address_b_sub[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b_sub[2]~feeder_combout\,
	ena => \u_vga|address_b_sub[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b_sub\(2));

-- Location: LCCOMB_X28_Y22_N4
\u_vga|address_b_sub[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b_sub[3]~1_combout\ = !\u_vga|current_line~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|current_line~5_combout\,
	combout => \u_vga|address_b_sub[3]~1_combout\);

-- Location: FF_X28_Y22_N5
\u_vga|address_b_sub[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b_sub[3]~1_combout\,
	ena => \u_vga|address_b_sub[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b_sub\(3));

-- Location: LCCOMB_X28_Y22_N30
\u_vga|Add15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~0_combout\ = \u_vga|current_line~5_combout\ $ (\u_vga|current_line~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~7_combout\,
	combout => \u_vga|Add15~0_combout\);

-- Location: FF_X28_Y22_N31
\u_vga|address_b_sub[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add15~0_combout\,
	ena => \u_vga|address_b_sub[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b_sub\(4));

-- Location: LCCOMB_X28_Y22_N8
\u_vga|Add15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~1_combout\ = \u_vga|current_line~4_combout\ $ (((!\u_vga|current_line~7_combout\) # (!\u_vga|current_line~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_line~4_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~7_combout\,
	combout => \u_vga|Add15~1_combout\);

-- Location: FF_X28_Y22_N9
\u_vga|address_b_sub[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add15~1_combout\,
	ena => \u_vga|address_b_sub[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b_sub\(5));

-- Location: FF_X21_Y20_N13
\u_vga|sign_g_y\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|sign_g_y~q\);

-- Location: LCCOMB_X20_Y21_N26
\u_vga|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~18_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(9) & (\u_vga|Add2~17\ & VCC)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(9) & (!\u_vga|Add2~17\))
-- \u_vga|Add2~19\ = CARRY((!\u_ram_sub|altsyncram_component|auto_generated|q_a\(9) & !\u_vga|Add2~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(9),
	datad => VCC,
	cin => \u_vga|Add2~17\,
	combout => \u_vga|Add2~18_combout\,
	cout => \u_vga|Add2~19\);

-- Location: LCCOMB_X20_Y21_N28
\u_vga|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~20_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & ((GND) # (!\u_vga|Add2~19\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (\u_vga|Add2~19\ $ (GND)))
-- \u_vga|Add2~21\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(10)) # (!\u_vga|Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datad => VCC,
	cin => \u_vga|Add2~19\,
	combout => \u_vga|Add2~20_combout\,
	cout => \u_vga|Add2~21\);

-- Location: LCCOMB_X21_Y21_N12
\u_vga|data_a_sub[9]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[9]~10_combout\ = (\u_vga|data_a_sub[11]~5_combout\) # (!\u_vga|update_submarines~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|data_a_sub[11]~5_combout\,
	combout => \u_vga|data_a_sub[9]~10_combout\);

-- Location: LCCOMB_X21_Y20_N12
\u_vga|data_a_sub~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~27_combout\ = (\u_vga|data_a_sub[9]~9_combout\ & (((\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub[9]~9_combout\ & ((\u_vga|data_a_sub[9]~10_combout\ & ((!\u_vga|sign_g_y~q\))) # (!\u_vga|data_a_sub[9]~10_combout\ & 
-- (\u_vga|Add2~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add2~20_combout\,
	datab => \u_vga|data_a_sub[9]~9_combout\,
	datac => \u_vga|sign_g_y~q\,
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~27_combout\);

-- Location: M9K_X22_Y21_N0
\u_ram_sub|altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ram_sub:u_ram_sub|altsyncram:altsyncram_component|altsyncram_8rm3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 18,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \u_vga|wr_en_a_sub~q\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portbdatain => \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\,
	portaaddr => \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\,
	portbdataout => \u_ram_sub|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X20_Y21_N30
\u_vga|Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~22_combout\ = \u_vga|Add2~21\ $ (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_a\(11),
	cin => \u_vga|Add2~21\,
	combout => \u_vga|Add2~22_combout\);

-- Location: LCCOMB_X23_Y21_N24
\u_vga|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~20_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (\u_vga|Add1~19\ $ (GND))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (!\u_vga|Add1~19\ & VCC))
-- \u_vga|Add1~21\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & !\u_vga|Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datad => VCC,
	cin => \u_vga|Add1~19\,
	combout => \u_vga|Add1~20_combout\,
	cout => \u_vga|Add1~21\);

-- Location: LCCOMB_X23_Y21_N26
\u_vga|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~22_combout\ = \u_vga|Add1~21\ $ (\u_ram_sub|altsyncram_component|auto_generated|q_a\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_a\(11),
	cin => \u_vga|Add1~21\,
	combout => \u_vga|Add1~22_combout\);

-- Location: LCCOMB_X21_Y21_N6
\u_vga|data_a_sub~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~1_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & ((\u_vga|Add1~22_combout\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (\u_vga|Add2~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add2~22_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datad => \u_vga|Add1~22_combout\,
	combout => \u_vga|data_a_sub~1_combout\);

-- Location: LCCOMB_X21_Y21_N8
\u_vga|data_a_sub~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~6_combout\ = (\u_vga|data_a_sub[11]~5_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_a\(11))) # (!\u_vga|data_a_sub[11]~5_combout\ & ((\u_vga|data_a_sub~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(11),
	datab => \u_vga|data_a_sub[11]~5_combout\,
	datad => \u_vga|data_a_sub~1_combout\,
	combout => \u_vga|data_a_sub~6_combout\);

-- Location: LCCOMB_X24_Y23_N12
\u_vga|data_a_sub[11]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[11]~7_combout\ = (\u_vga|v_sync~q\ & (!\u_vga|update_elements_position~5_combout\ & ((\u_vga|read_sub~q\) # (!\u_vga|update_submarines~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|read_sub~q\,
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|update_elements_position~5_combout\,
	combout => \u_vga|data_a_sub[11]~7_combout\);

-- Location: LCCOMB_X24_Y23_N30
\u_vga|data_a_sub[11]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[11]~8_combout\ = (\u_vga|data_a_sub[11]~7_combout\ & ((\u_vga|update_submarines~q\ & ((!\u_vga|Mux0~32_combout\))) # (!\u_vga|update_submarines~q\ & (\u_vga|Decoder0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|Decoder0~1_combout\,
	datac => \u_vga|Mux0~32_combout\,
	datad => \u_vga|data_a_sub[11]~7_combout\,
	combout => \u_vga|data_a_sub[11]~8_combout\);

-- Location: FF_X21_Y21_N9
\u_vga|data_a_sub[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~6_combout\,
	asdata => VCC,
	sload => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(11));

-- Location: LCCOMB_X23_Y21_N4
\u_vga|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~0_combout\ = \u_ram_sub|altsyncram_component|auto_generated|q_a\(0) $ (VCC)
-- \u_vga|Add1~1\ = CARRY(\u_ram_sub|altsyncram_component|auto_generated|q_a\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(0),
	datad => VCC,
	combout => \u_vga|Add1~0_combout\,
	cout => \u_vga|Add1~1\);

-- Location: LCCOMB_X23_Y21_N6
\u_vga|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~2_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(1) & (!\u_vga|Add1~1\)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(1) & ((\u_vga|Add1~1\) # (GND)))
-- \u_vga|Add1~3\ = CARRY((!\u_vga|Add1~1\) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(1),
	datad => VCC,
	cin => \u_vga|Add1~1\,
	combout => \u_vga|Add1~2_combout\,
	cout => \u_vga|Add1~3\);

-- Location: LCCOMB_X23_Y21_N8
\u_vga|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~4_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(2) & (\u_vga|Add1~3\ $ (GND))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(2) & (!\u_vga|Add1~3\ & VCC))
-- \u_vga|Add1~5\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(2) & !\u_vga|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(2),
	datad => VCC,
	cin => \u_vga|Add1~3\,
	combout => \u_vga|Add1~4_combout\,
	cout => \u_vga|Add1~5\);

-- Location: LCCOMB_X23_Y21_N10
\u_vga|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~6_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(3) & (!\u_vga|Add1~5\)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(3) & ((\u_vga|Add1~5\) # (GND)))
-- \u_vga|Add1~7\ = CARRY((!\u_vga|Add1~5\) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(3),
	datad => VCC,
	cin => \u_vga|Add1~5\,
	combout => \u_vga|Add1~6_combout\,
	cout => \u_vga|Add1~7\);

-- Location: LCCOMB_X23_Y21_N12
\u_vga|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~8_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(4) & (\u_vga|Add1~7\ $ (GND))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(4) & (!\u_vga|Add1~7\ & VCC))
-- \u_vga|Add1~9\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(4) & !\u_vga|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(4),
	datad => VCC,
	cin => \u_vga|Add1~7\,
	combout => \u_vga|Add1~8_combout\,
	cout => \u_vga|Add1~9\);

-- Location: LCCOMB_X23_Y21_N14
\u_vga|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~10_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(5) & (!\u_vga|Add1~9\)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(5) & ((\u_vga|Add1~9\) # (GND)))
-- \u_vga|Add1~11\ = CARRY((!\u_vga|Add1~9\) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(5),
	datad => VCC,
	cin => \u_vga|Add1~9\,
	combout => \u_vga|Add1~10_combout\,
	cout => \u_vga|Add1~11\);

-- Location: LCCOMB_X23_Y21_N16
\u_vga|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~12_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) & (\u_vga|Add1~11\ $ (GND))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) & (!\u_vga|Add1~11\ & VCC))
-- \u_vga|Add1~13\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) & !\u_vga|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(6),
	datad => VCC,
	cin => \u_vga|Add1~11\,
	combout => \u_vga|Add1~12_combout\,
	cout => \u_vga|Add1~13\);

-- Location: LCCOMB_X23_Y21_N18
\u_vga|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~14_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(7) & (!\u_vga|Add1~13\)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(7) & ((\u_vga|Add1~13\) # (GND)))
-- \u_vga|Add1~15\ = CARRY((!\u_vga|Add1~13\) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(7),
	datad => VCC,
	cin => \u_vga|Add1~13\,
	combout => \u_vga|Add1~14_combout\,
	cout => \u_vga|Add1~15\);

-- Location: LCCOMB_X23_Y21_N20
\u_vga|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~16_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(8) & (\u_vga|Add1~15\ $ (GND))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(8) & (!\u_vga|Add1~15\ & VCC))
-- \u_vga|Add1~17\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(8) & !\u_vga|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(8),
	datad => VCC,
	cin => \u_vga|Add1~15\,
	combout => \u_vga|Add1~16_combout\,
	cout => \u_vga|Add1~17\);

-- Location: LCCOMB_X23_Y21_N22
\u_vga|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~18_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(9) & (!\u_vga|Add1~17\)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(9) & ((\u_vga|Add1~17\) # (GND)))
-- \u_vga|Add1~19\ = CARRY((!\u_vga|Add1~17\) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(9),
	datad => VCC,
	cin => \u_vga|Add1~17\,
	combout => \u_vga|Add1~18_combout\,
	cout => \u_vga|Add1~19\);

-- Location: LCCOMB_X21_Y20_N16
\u_vga|data_a_sub~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~28_combout\ = (\u_vga|data_a_sub~27_combout\ & (((!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10))) # (!\u_vga|data_a_sub[9]~9_combout\))) # (!\u_vga|data_a_sub~27_combout\ & (\u_vga|data_a_sub[9]~9_combout\ & 
-- ((\u_vga|Add1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub~27_combout\,
	datab => \u_vga|data_a_sub[9]~9_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datad => \u_vga|Add1~20_combout\,
	combout => \u_vga|data_a_sub~28_combout\);

-- Location: FF_X21_Y20_N17
\u_vga|data_a_sub[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~28_combout\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(10));

-- Location: LCCOMB_X20_Y21_N8
\u_vga|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~0_combout\ = \u_ram_sub|altsyncram_component|auto_generated|q_a\(0) $ (VCC)
-- \u_vga|Add2~1\ = CARRY(\u_ram_sub|altsyncram_component|auto_generated|q_a\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(0),
	datad => VCC,
	combout => \u_vga|Add2~0_combout\,
	cout => \u_vga|Add2~1\);

-- Location: LCCOMB_X20_Y21_N10
\u_vga|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~2_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(1) & (\u_vga|Add2~1\ & VCC)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(1) & (!\u_vga|Add2~1\))
-- \u_vga|Add2~3\ = CARRY((!\u_ram_sub|altsyncram_component|auto_generated|q_a\(1) & !\u_vga|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(1),
	datad => VCC,
	cin => \u_vga|Add2~1\,
	combout => \u_vga|Add2~2_combout\,
	cout => \u_vga|Add2~3\);

-- Location: LCCOMB_X20_Y21_N12
\u_vga|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~4_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(2) & ((GND) # (!\u_vga|Add2~3\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(2) & (\u_vga|Add2~3\ $ (GND)))
-- \u_vga|Add2~5\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(2)) # (!\u_vga|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(2),
	datad => VCC,
	cin => \u_vga|Add2~3\,
	combout => \u_vga|Add2~4_combout\,
	cout => \u_vga|Add2~5\);

-- Location: LCCOMB_X20_Y21_N14
\u_vga|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~6_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(3) & (\u_vga|Add2~5\ & VCC)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(3) & (!\u_vga|Add2~5\))
-- \u_vga|Add2~7\ = CARRY((!\u_ram_sub|altsyncram_component|auto_generated|q_a\(3) & !\u_vga|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(3),
	datad => VCC,
	cin => \u_vga|Add2~5\,
	combout => \u_vga|Add2~6_combout\,
	cout => \u_vga|Add2~7\);

-- Location: LCCOMB_X20_Y21_N16
\u_vga|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~8_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(4) & ((GND) # (!\u_vga|Add2~7\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(4) & (\u_vga|Add2~7\ $ (GND)))
-- \u_vga|Add2~9\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(4)) # (!\u_vga|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(4),
	datad => VCC,
	cin => \u_vga|Add2~7\,
	combout => \u_vga|Add2~8_combout\,
	cout => \u_vga|Add2~9\);

-- Location: LCCOMB_X20_Y21_N18
\u_vga|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~10_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(5) & (\u_vga|Add2~9\ & VCC)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(5) & (!\u_vga|Add2~9\))
-- \u_vga|Add2~11\ = CARRY((!\u_ram_sub|altsyncram_component|auto_generated|q_a\(5) & !\u_vga|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(5),
	datad => VCC,
	cin => \u_vga|Add2~9\,
	combout => \u_vga|Add2~10_combout\,
	cout => \u_vga|Add2~11\);

-- Location: LCCOMB_X20_Y21_N20
\u_vga|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~12_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) & ((GND) # (!\u_vga|Add2~11\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) & (\u_vga|Add2~11\ $ (GND)))
-- \u_vga|Add2~13\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(6)) # (!\u_vga|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(6),
	datad => VCC,
	cin => \u_vga|Add2~11\,
	combout => \u_vga|Add2~12_combout\,
	cout => \u_vga|Add2~13\);

-- Location: LCCOMB_X20_Y21_N22
\u_vga|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~14_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(7) & (\u_vga|Add2~13\ & VCC)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(7) & (!\u_vga|Add2~13\))
-- \u_vga|Add2~15\ = CARRY((!\u_ram_sub|altsyncram_component|auto_generated|q_a\(7) & !\u_vga|Add2~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(7),
	datad => VCC,
	cin => \u_vga|Add2~13\,
	combout => \u_vga|Add2~14_combout\,
	cout => \u_vga|Add2~15\);

-- Location: LCCOMB_X20_Y21_N24
\u_vga|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~16_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(8) & ((GND) # (!\u_vga|Add2~15\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(8) & (\u_vga|Add2~15\ $ (GND)))
-- \u_vga|Add2~17\ = CARRY((\u_ram_sub|altsyncram_component|auto_generated|q_a\(8)) # (!\u_vga|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(8),
	datad => VCC,
	cin => \u_vga|Add2~15\,
	combout => \u_vga|Add2~16_combout\,
	cout => \u_vga|Add2~17\);

-- Location: LCCOMB_X21_Y21_N30
\u_vga|data_a_sub~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~11_combout\ = (\u_vga|data_a_sub[9]~9_combout\ & (((\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub[9]~9_combout\ & ((\u_vga|data_a_sub[9]~10_combout\ & (\u_vga|sign_g_y~q\)) # (!\u_vga|data_a_sub[9]~10_combout\ & 
-- ((\u_vga|Add2~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub[9]~9_combout\,
	datab => \u_vga|sign_g_y~q\,
	datac => \u_vga|Add2~18_combout\,
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~11_combout\);

-- Location: LCCOMB_X21_Y21_N28
\u_vga|data_a_sub~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~12_combout\ = (\u_vga|data_a_sub[9]~9_combout\ & ((\u_vga|data_a_sub~11_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_a\(9))) # (!\u_vga|data_a_sub~11_combout\ & ((\u_vga|Add1~18_combout\))))) # 
-- (!\u_vga|data_a_sub[9]~9_combout\ & (((\u_vga|data_a_sub~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub[9]~9_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(9),
	datac => \u_vga|data_a_sub~11_combout\,
	datad => \u_vga|Add1~18_combout\,
	combout => \u_vga|data_a_sub~12_combout\);

-- Location: FF_X21_Y21_N29
\u_vga|data_a_sub[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~12_combout\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(9));

-- Location: LCCOMB_X23_Y21_N0
\u_vga|data_a_sub~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~13_combout\ = (!\u_vga|data_a_sub[11]~5_combout\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & ((\u_vga|Add1~16_combout\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (\u_vga|Add2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add2~16_combout\,
	datab => \u_vga|data_a_sub[11]~5_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datad => \u_vga|Add1~16_combout\,
	combout => \u_vga|data_a_sub~13_combout\);

-- Location: FF_X23_Y21_N1
\u_vga|data_a_sub[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~13_combout\,
	sclr => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(8));

-- Location: LCCOMB_X21_Y21_N24
\u_vga|data_a_sub~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~14_combout\ = (\u_vga|data_a_sub[9]~9_combout\ & (((\u_vga|Add1~14_combout\) # (\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub[9]~9_combout\ & (\u_vga|Add2~14_combout\ & ((!\u_vga|data_a_sub[9]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub[9]~9_combout\,
	datab => \u_vga|Add2~14_combout\,
	datac => \u_vga|Add1~14_combout\,
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~14_combout\);

-- Location: LCCOMB_X21_Y21_N22
\u_vga|data_a_sub~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~15_combout\ = (\u_vga|data_a_sub~14_combout\ & (((\u_ram_sub|altsyncram_component|auto_generated|q_a\(7)) # (!\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub~14_combout\ & (\u_vga|sign_g_y~q\ & 
-- ((\u_vga|data_a_sub[9]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|sign_g_y~q\,
	datab => \u_vga|data_a_sub~14_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(7),
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~15_combout\);

-- Location: FF_X21_Y21_N23
\u_vga|data_a_sub[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~15_combout\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(7));

-- Location: LCCOMB_X21_Y20_N6
\u_vga|data_a_sub~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~16_combout\ = (\u_vga|data_a_sub[9]~9_combout\ & (((\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub[9]~9_combout\ & ((\u_vga|data_a_sub[9]~10_combout\ & ((\u_vga|sign_g_y~q\))) # (!\u_vga|data_a_sub[9]~10_combout\ & 
-- (\u_vga|Add2~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add2~12_combout\,
	datab => \u_vga|data_a_sub[9]~9_combout\,
	datac => \u_vga|sign_g_y~q\,
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~16_combout\);

-- Location: LCCOMB_X21_Y20_N24
\u_vga|data_a_sub~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~17_combout\ = (\u_vga|data_a_sub~16_combout\ & (((\u_ram_sub|altsyncram_component|auto_generated|q_a\(6))) # (!\u_vga|data_a_sub[9]~9_combout\))) # (!\u_vga|data_a_sub~16_combout\ & (\u_vga|data_a_sub[9]~9_combout\ & 
-- ((\u_vga|Add1~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub~16_combout\,
	datab => \u_vga|data_a_sub[9]~9_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(6),
	datad => \u_vga|Add1~12_combout\,
	combout => \u_vga|data_a_sub~17_combout\);

-- Location: FF_X21_Y20_N25
\u_vga|data_a_sub[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~17_combout\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(6));

-- Location: LCCOMB_X21_Y21_N26
\u_vga|data_a_sub~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~18_combout\ = (\u_vga|data_a_sub[9]~9_combout\ & (((\u_vga|Add1~10_combout\) # (\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub[9]~9_combout\ & (\u_vga|Add2~10_combout\ & ((!\u_vga|data_a_sub[9]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub[9]~9_combout\,
	datab => \u_vga|Add2~10_combout\,
	datac => \u_vga|Add1~10_combout\,
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~18_combout\);

-- Location: LCCOMB_X21_Y21_N0
\u_vga|data_a_sub~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~19_combout\ = (\u_vga|data_a_sub~18_combout\ & (((\u_ram_sub|altsyncram_component|auto_generated|q_a\(5)) # (!\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub~18_combout\ & (\u_vga|sign_g_y~q\ & 
-- ((\u_vga|data_a_sub[9]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|sign_g_y~q\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(5),
	datac => \u_vga|data_a_sub~18_combout\,
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~19_combout\);

-- Location: FF_X21_Y21_N1
\u_vga|data_a_sub[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~19_combout\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(5));

-- Location: LCCOMB_X21_Y21_N4
\u_vga|data_a_sub~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~20_combout\ = (\u_vga|data_a_sub[9]~9_combout\ & (((\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub[9]~9_combout\ & ((\u_vga|data_a_sub[9]~10_combout\ & (\u_vga|sign_g_y~q\)) # (!\u_vga|data_a_sub[9]~10_combout\ & 
-- ((\u_vga|Add2~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub[9]~9_combout\,
	datab => \u_vga|sign_g_y~q\,
	datac => \u_vga|Add2~8_combout\,
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~20_combout\);

-- Location: LCCOMB_X21_Y21_N18
\u_vga|data_a_sub~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~21_combout\ = (\u_vga|data_a_sub~20_combout\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_a\(4)) # ((!\u_vga|data_a_sub[9]~9_combout\)))) # (!\u_vga|data_a_sub~20_combout\ & (((\u_vga|Add1~8_combout\ & 
-- \u_vga|data_a_sub[9]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(4),
	datab => \u_vga|Add1~8_combout\,
	datac => \u_vga|data_a_sub~20_combout\,
	datad => \u_vga|data_a_sub[9]~9_combout\,
	combout => \u_vga|data_a_sub~21_combout\);

-- Location: FF_X21_Y21_N19
\u_vga|data_a_sub[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~21_combout\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(4));

-- Location: LCCOMB_X21_Y20_N10
\u_vga|data_a_sub[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[9]~9_combout\ = (\u_vga|update_submarines~q\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_a\(10)) # (\u_vga|data_a_sub[11]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datab => \u_vga|data_a_sub[11]~5_combout\,
	datac => \u_vga|update_submarines~q\,
	combout => \u_vga|data_a_sub[9]~9_combout\);

-- Location: LCCOMB_X21_Y21_N14
\u_vga|data_a_sub~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~22_combout\ = (\u_vga|data_a_sub[9]~9_combout\ & (((\u_vga|Add1~6_combout\) # (\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub[9]~9_combout\ & (\u_vga|Add2~6_combout\ & ((!\u_vga|data_a_sub[9]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub[9]~9_combout\,
	datab => \u_vga|Add2~6_combout\,
	datac => \u_vga|Add1~6_combout\,
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~22_combout\);

-- Location: LCCOMB_X21_Y21_N20
\u_vga|data_a_sub~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~23_combout\ = (\u_vga|data_a_sub~22_combout\ & (((\u_ram_sub|altsyncram_component|auto_generated|q_a\(3)) # (!\u_vga|data_a_sub[9]~10_combout\)))) # (!\u_vga|data_a_sub~22_combout\ & (\u_vga|sign_g_y~q\ & 
-- ((\u_vga|data_a_sub[9]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|sign_g_y~q\,
	datab => \u_vga|data_a_sub~22_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(3),
	datad => \u_vga|data_a_sub[9]~10_combout\,
	combout => \u_vga|data_a_sub~23_combout\);

-- Location: FF_X21_Y21_N21
\u_vga|data_a_sub[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~23_combout\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(3));

-- Location: LCCOMB_X20_Y21_N4
\u_vga|data_a_sub[11]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[11]~4_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(9) & (((\u_ram_sub|altsyncram_component|auto_generated|q_a\(4) & \u_ram_sub|altsyncram_component|auto_generated|q_a\(5))) # 
-- (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(6)))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(9) & (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) & ((\u_ram_sub|altsyncram_component|auto_generated|q_a\(4)) # 
-- (\u_ram_sub|altsyncram_component|auto_generated|q_a\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(9),
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(4),
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(6),
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_a\(5),
	combout => \u_vga|data_a_sub[11]~4_combout\);

-- Location: LCCOMB_X20_Y21_N0
\u_vga|data_a_sub[11]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[11]~2_combout\ = (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(1) & (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(0) & (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(8) & 
-- !\u_ram_sub|altsyncram_component|auto_generated|q_a\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(1),
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(0),
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(8),
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_a\(2),
	combout => \u_vga|data_a_sub[11]~2_combout\);

-- Location: LCCOMB_X20_Y21_N2
\u_vga|data_a_sub[11]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[11]~3_combout\ = (\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (((\u_ram_sub|altsyncram_component|auto_generated|q_a\(3) & \u_ram_sub|altsyncram_component|auto_generated|q_a\(7))) # 
-- (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(4)))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(4) & ((\u_ram_sub|altsyncram_component|auto_generated|q_a\(3)) # 
-- (\u_ram_sub|altsyncram_component|auto_generated|q_a\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(3),
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(4),
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_a\(7),
	combout => \u_vga|data_a_sub[11]~3_combout\);

-- Location: LCCOMB_X20_Y21_N6
\u_vga|data_a_sub[11]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub[11]~5_combout\ = (\u_vga|data_a_sub[11]~2_combout\ & ((\u_vga|data_a_sub[11]~4_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) & \u_vga|data_a_sub[11]~3_combout\)) # (!\u_vga|data_a_sub[11]~4_combout\ & 
-- (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(6) & !\u_vga|data_a_sub[11]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub[11]~4_combout\,
	datab => \u_vga|data_a_sub[11]~2_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(6),
	datad => \u_vga|data_a_sub[11]~3_combout\,
	combout => \u_vga|data_a_sub[11]~5_combout\);

-- Location: LCCOMB_X23_Y21_N2
\u_vga|data_a_sub~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~24_combout\ = (!\u_vga|data_a_sub[11]~5_combout\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (\u_vga|Add1~4_combout\)) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & ((\u_vga|Add2~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a_sub[11]~5_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datac => \u_vga|Add1~4_combout\,
	datad => \u_vga|Add2~4_combout\,
	combout => \u_vga|data_a_sub~24_combout\);

-- Location: FF_X23_Y21_N3
\u_vga|data_a_sub[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~24_combout\,
	sclr => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(2));

-- Location: LCCOMB_X23_Y21_N28
\u_vga|data_a_sub~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~25_combout\ = (!\u_vga|data_a_sub[11]~5_combout\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & ((\u_vga|Add1~2_combout\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (\u_vga|Add2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add2~2_combout\,
	datab => \u_vga|data_a_sub[11]~5_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datad => \u_vga|Add1~2_combout\,
	combout => \u_vga|data_a_sub~25_combout\);

-- Location: FF_X23_Y21_N29
\u_vga|data_a_sub[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~25_combout\,
	sclr => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(1));

-- Location: LCCOMB_X23_Y21_N30
\u_vga|data_a_sub~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a_sub~26_combout\ = (!\u_vga|data_a_sub[11]~5_combout\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & ((\u_vga|Add1~0_combout\))) # (!\u_ram_sub|altsyncram_component|auto_generated|q_a\(10) & (\u_vga|Add2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add2~0_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_a\(10),
	datac => \u_vga|Add1~0_combout\,
	datad => \u_vga|data_a_sub[11]~5_combout\,
	combout => \u_vga|data_a_sub~26_combout\);

-- Location: FF_X23_Y21_N31
\u_vga|data_a_sub[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a_sub~26_combout\,
	sclr => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|data_a_sub[11]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a_sub\(0));

-- Location: FF_X27_Y23_N13
\u_vga|data_sub_disp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~10_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(11));

-- Location: LCCOMB_X27_Y23_N12
\u_vga|data_sub_disp~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~10_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(11)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datac => \u_vga|data_sub_disp\(11),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~10_combout\);

-- Location: LCCOMB_X27_Y23_N30
\u_vga|red_signal~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~3_combout\ = ((\u_vga|Equal7~0_combout\ & ((\u_vga|Equal7~1_combout\) # (!\u_vga|Equal7~3_combout\)))) # (!\u_vga|data_sub_disp~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_sub_disp~10_combout\,
	datab => \u_vga|Equal7~1_combout\,
	datac => \u_vga|Equal7~0_combout\,
	datad => \u_vga|Equal7~3_combout\,
	combout => \u_vga|red_signal~3_combout\);

-- Location: LCCOMB_X30_Y24_N0
\u_vga|LessThan11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~1_cout\ = CARRY((!\u_vga|v_cnt\(3) & !\u_vga|current_line~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(3),
	datab => \u_vga|current_line~1_combout\,
	datad => VCC,
	cout => \u_vga|LessThan11~1_cout\);

-- Location: LCCOMB_X30_Y24_N2
\u_vga|LessThan11~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~3_cout\ = CARRY((\u_vga|v_cnt\(4) & ((!\u_vga|LessThan11~1_cout\) # (!\u_vga|Add16~0_combout\))) # (!\u_vga|v_cnt\(4) & (!\u_vga|Add16~0_combout\ & !\u_vga|LessThan11~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datab => \u_vga|Add16~0_combout\,
	datad => VCC,
	cin => \u_vga|LessThan11~1_cout\,
	cout => \u_vga|LessThan11~3_cout\);

-- Location: LCCOMB_X30_Y24_N4
\u_vga|LessThan11~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~5_cout\ = CARRY((\u_vga|v_cnt\(5) & (\u_vga|Add16~2_combout\ & !\u_vga|LessThan11~3_cout\)) # (!\u_vga|v_cnt\(5) & ((\u_vga|Add16~2_combout\) # (!\u_vga|LessThan11~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|Add16~2_combout\,
	datad => VCC,
	cin => \u_vga|LessThan11~3_cout\,
	cout => \u_vga|LessThan11~5_cout\);

-- Location: LCCOMB_X30_Y24_N6
\u_vga|LessThan11~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~7_cout\ = CARRY((\u_vga|Add16~4_combout\ & (\u_vga|v_cnt\(6) & !\u_vga|LessThan11~5_cout\)) # (!\u_vga|Add16~4_combout\ & ((\u_vga|v_cnt\(6)) # (!\u_vga|LessThan11~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add16~4_combout\,
	datab => \u_vga|v_cnt\(6),
	datad => VCC,
	cin => \u_vga|LessThan11~5_cout\,
	cout => \u_vga|LessThan11~7_cout\);

-- Location: LCCOMB_X30_Y24_N8
\u_vga|LessThan11~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~9_cout\ = CARRY((\u_vga|v_cnt\(7) & (\u_vga|Add16~6_combout\ & !\u_vga|LessThan11~7_cout\)) # (!\u_vga|v_cnt\(7) & ((\u_vga|Add16~6_combout\) # (!\u_vga|LessThan11~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datab => \u_vga|Add16~6_combout\,
	datad => VCC,
	cin => \u_vga|LessThan11~7_cout\,
	cout => \u_vga|LessThan11~9_cout\);

-- Location: LCCOMB_X30_Y24_N10
\u_vga|LessThan11~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~11_cout\ = CARRY((\u_vga|Add16~8_combout\ & (\u_vga|v_cnt\(8) & !\u_vga|LessThan11~9_cout\)) # (!\u_vga|Add16~8_combout\ & ((\u_vga|v_cnt\(8)) # (!\u_vga|LessThan11~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add16~8_combout\,
	datab => \u_vga|v_cnt\(8),
	datad => VCC,
	cin => \u_vga|LessThan11~9_cout\,
	cout => \u_vga|LessThan11~11_cout\);

-- Location: LCCOMB_X30_Y24_N12
\u_vga|LessThan11~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~13_cout\ = CARRY((\u_vga|v_cnt\(9) & (\u_vga|Add16~10_combout\ & !\u_vga|LessThan11~11_cout\)) # (!\u_vga|v_cnt\(9) & ((\u_vga|Add16~10_combout\) # (!\u_vga|LessThan11~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datab => \u_vga|Add16~10_combout\,
	datad => VCC,
	cin => \u_vga|LessThan11~11_cout\,
	cout => \u_vga|LessThan11~13_cout\);

-- Location: LCCOMB_X30_Y24_N14
\u_vga|LessThan11~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~14_combout\ = (\u_vga|Add16~12_combout\ & ((\u_vga|LessThan11~13_cout\) # (!\u_vga|v_cnt\(10)))) # (!\u_vga|Add16~12_combout\ & (!\u_vga|v_cnt\(10) & \u_vga|LessThan11~13_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001010110010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add16~12_combout\,
	datab => \u_vga|v_cnt\(10),
	cin => \u_vga|LessThan11~13_cout\,
	combout => \u_vga|LessThan11~14_combout\);

-- Location: LCCOMB_X27_Y22_N14
\u_vga|red_signal~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~4_combout\ = ((\u_vga|red_signal~3_combout\) # (\u_vga|LessThan11~14_combout\)) # (!\u_vga|LessThan26~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan26~0_combout\,
	datac => \u_vga|red_signal~3_combout\,
	datad => \u_vga|LessThan11~14_combout\,
	combout => \u_vga|red_signal~4_combout\);

-- Location: FF_X28_Y22_N19
\u_vga|data_sub_disp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~0_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(9));

-- Location: LCCOMB_X28_Y22_N18
\u_vga|data_sub_disp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~0_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(9))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(9)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(9),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(9),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~0_combout\);

-- Location: FF_X23_Y22_N1
\u_vga|data_sub_disp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~1_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(8));

-- Location: LCCOMB_X23_Y22_N0
\u_vga|data_sub_disp~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~1_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(8))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(8)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(8),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(8),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~1_combout\);

-- Location: FF_X28_Y22_N29
\u_vga|data_sub_disp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~2_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(7));

-- Location: LCCOMB_X28_Y22_N28
\u_vga|data_sub_disp~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~2_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(7))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(7)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(7),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(7),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~2_combout\);

-- Location: FF_X28_Y22_N23
\u_vga|data_sub_disp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~3_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(6));

-- Location: LCCOMB_X28_Y22_N22
\u_vga|data_sub_disp~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~3_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(6))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(6)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(6),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(6),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~3_combout\);

-- Location: FF_X23_Y22_N3
\u_vga|data_sub_disp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~4_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(5));

-- Location: LCCOMB_X23_Y22_N2
\u_vga|data_sub_disp~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~4_combout\ = (\u_vga|vga_gen~31_combout\ & ((\u_vga|h_cnt\(1) & ((\u_ram_sub|altsyncram_component|auto_generated|q_b\(5)))) # (!\u_vga|h_cnt\(1) & (\u_vga|data_sub_disp\(5))))) # (!\u_vga|vga_gen~31_combout\ & 
-- (((\u_vga|data_sub_disp\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~31_combout\,
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(5),
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_b\(5),
	combout => \u_vga|data_sub_disp~4_combout\);

-- Location: FF_X23_Y22_N29
\u_vga|data_sub_disp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~5_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(4));

-- Location: LCCOMB_X23_Y22_N28
\u_vga|data_sub_disp~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~5_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(4))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(4)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(4),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(4),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~5_combout\);

-- Location: FF_X28_Y22_N17
\u_vga|data_sub_disp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~6_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(3));

-- Location: LCCOMB_X28_Y22_N16
\u_vga|data_sub_disp~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~6_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(3))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(3)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(3),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(3),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~6_combout\);

-- Location: FF_X23_Y22_N31
\u_vga|data_sub_disp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~7_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(2));

-- Location: LCCOMB_X23_Y22_N30
\u_vga|data_sub_disp~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~7_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(2))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(2)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(2),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(2),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~7_combout\);

-- Location: FF_X23_Y22_N5
\u_vga|data_sub_disp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~8_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(1));

-- Location: LCCOMB_X23_Y22_N4
\u_vga|data_sub_disp~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~8_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(1))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(1)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(1),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(1),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~8_combout\);

-- Location: FF_X23_Y22_N7
\u_vga|data_sub_disp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_sub_disp~9_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_sub_disp\(0));

-- Location: LCCOMB_X23_Y22_N6
\u_vga|data_sub_disp~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_sub_disp~9_combout\ = (\u_vga|h_cnt\(1) & ((\u_vga|vga_gen~31_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(0))) # (!\u_vga|vga_gen~31_combout\ & ((\u_vga|data_sub_disp\(0)))))) # (!\u_vga|h_cnt\(1) & 
-- (((\u_vga|data_sub_disp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(0),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|data_sub_disp\(0),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|data_sub_disp~9_combout\);

-- Location: LCCOMB_X23_Y22_N8
\u_vga|LessThan13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~1_cout\ = CARRY((\u_vga|data_sub_disp~9_combout\ & !\u_vga|h_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_sub_disp~9_combout\,
	datab => \u_vga|h_cnt\(0),
	datad => VCC,
	cout => \u_vga|LessThan13~1_cout\);

-- Location: LCCOMB_X23_Y22_N10
\u_vga|LessThan13~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~3_cout\ = CARRY((\u_vga|data_sub_disp~8_combout\ & (\u_vga|h_cnt\(1) & !\u_vga|LessThan13~1_cout\)) # (!\u_vga|data_sub_disp~8_combout\ & ((\u_vga|h_cnt\(1)) # (!\u_vga|LessThan13~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_sub_disp~8_combout\,
	datab => \u_vga|h_cnt\(1),
	datad => VCC,
	cin => \u_vga|LessThan13~1_cout\,
	cout => \u_vga|LessThan13~3_cout\);

-- Location: LCCOMB_X23_Y22_N12
\u_vga|LessThan13~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~5_cout\ = CARRY((\u_vga|data_sub_disp~7_combout\ & ((!\u_vga|LessThan13~3_cout\) # (!\u_vga|h_cnt\(2)))) # (!\u_vga|data_sub_disp~7_combout\ & (!\u_vga|h_cnt\(2) & !\u_vga|LessThan13~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_sub_disp~7_combout\,
	datab => \u_vga|h_cnt\(2),
	datad => VCC,
	cin => \u_vga|LessThan13~3_cout\,
	cout => \u_vga|LessThan13~5_cout\);

-- Location: LCCOMB_X23_Y22_N14
\u_vga|LessThan13~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~7_cout\ = CARRY((\u_vga|data_sub_disp~6_combout\ & (\u_vga|h_cnt\(3) & !\u_vga|LessThan13~5_cout\)) # (!\u_vga|data_sub_disp~6_combout\ & ((\u_vga|h_cnt\(3)) # (!\u_vga|LessThan13~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_sub_disp~6_combout\,
	datab => \u_vga|h_cnt\(3),
	datad => VCC,
	cin => \u_vga|LessThan13~5_cout\,
	cout => \u_vga|LessThan13~7_cout\);

-- Location: LCCOMB_X23_Y22_N16
\u_vga|LessThan13~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~9_cout\ = CARRY((\u_vga|h_cnt\(4) & (\u_vga|data_sub_disp~5_combout\ & !\u_vga|LessThan13~7_cout\)) # (!\u_vga|h_cnt\(4) & ((\u_vga|data_sub_disp~5_combout\) # (!\u_vga|LessThan13~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|data_sub_disp~5_combout\,
	datad => VCC,
	cin => \u_vga|LessThan13~7_cout\,
	cout => \u_vga|LessThan13~9_cout\);

-- Location: LCCOMB_X23_Y22_N18
\u_vga|LessThan13~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~11_cout\ = CARRY((\u_vga|h_cnt\(5) & ((!\u_vga|LessThan13~9_cout\) # (!\u_vga|data_sub_disp~4_combout\))) # (!\u_vga|h_cnt\(5) & (!\u_vga|data_sub_disp~4_combout\ & !\u_vga|LessThan13~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|data_sub_disp~4_combout\,
	datad => VCC,
	cin => \u_vga|LessThan13~9_cout\,
	cout => \u_vga|LessThan13~11_cout\);

-- Location: LCCOMB_X23_Y22_N20
\u_vga|LessThan13~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~13_cout\ = CARRY((\u_vga|h_cnt\(6) & (\u_vga|data_sub_disp~3_combout\ & !\u_vga|LessThan13~11_cout\)) # (!\u_vga|h_cnt\(6) & ((\u_vga|data_sub_disp~3_combout\) # (!\u_vga|LessThan13~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|data_sub_disp~3_combout\,
	datad => VCC,
	cin => \u_vga|LessThan13~11_cout\,
	cout => \u_vga|LessThan13~13_cout\);

-- Location: LCCOMB_X23_Y22_N22
\u_vga|LessThan13~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~15_cout\ = CARRY((\u_vga|data_sub_disp~2_combout\ & (\u_vga|h_cnt\(7) & !\u_vga|LessThan13~13_cout\)) # (!\u_vga|data_sub_disp~2_combout\ & ((\u_vga|h_cnt\(7)) # (!\u_vga|LessThan13~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_sub_disp~2_combout\,
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|LessThan13~13_cout\,
	cout => \u_vga|LessThan13~15_cout\);

-- Location: LCCOMB_X23_Y22_N24
\u_vga|LessThan13~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~17_cout\ = CARRY((\u_vga|h_cnt\(8) & (\u_vga|data_sub_disp~1_combout\ & !\u_vga|LessThan13~15_cout\)) # (!\u_vga|h_cnt\(8) & ((\u_vga|data_sub_disp~1_combout\) # (!\u_vga|LessThan13~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|data_sub_disp~1_combout\,
	datad => VCC,
	cin => \u_vga|LessThan13~15_cout\,
	cout => \u_vga|LessThan13~17_cout\);

-- Location: LCCOMB_X23_Y22_N26
\u_vga|LessThan13~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~18_combout\ = (\u_vga|h_cnt\(9) & (\u_vga|LessThan13~17_cout\ & \u_vga|data_sub_disp~0_combout\)) # (!\u_vga|h_cnt\(9) & ((\u_vga|LessThan13~17_cout\) # (\u_vga|data_sub_disp~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(9),
	datad => \u_vga|data_sub_disp~0_combout\,
	cin => \u_vga|LessThan13~17_cout\,
	combout => \u_vga|LessThan13~18_combout\);

-- Location: LCCOMB_X24_Y22_N0
\u_vga|Add18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~0_combout\ = (\u_vga|data_sub_disp~5_combout\ & (\u_vga|data_sub_disp~6_combout\ $ (VCC))) # (!\u_vga|data_sub_disp~5_combout\ & (\u_vga|data_sub_disp~6_combout\ & VCC))
-- \u_vga|Add18~1\ = CARRY((\u_vga|data_sub_disp~5_combout\ & \u_vga|data_sub_disp~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_sub_disp~5_combout\,
	datab => \u_vga|data_sub_disp~6_combout\,
	datad => VCC,
	combout => \u_vga|Add18~0_combout\,
	cout => \u_vga|Add18~1\);

-- Location: LCCOMB_X24_Y22_N2
\u_vga|Add18~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~2_combout\ = (\u_vga|data_sub_disp~4_combout\ & (\u_vga|Add18~1\ & VCC)) # (!\u_vga|data_sub_disp~4_combout\ & (!\u_vga|Add18~1\))
-- \u_vga|Add18~3\ = CARRY((!\u_vga|data_sub_disp~4_combout\ & !\u_vga|Add18~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_sub_disp~4_combout\,
	datad => VCC,
	cin => \u_vga|Add18~1\,
	combout => \u_vga|Add18~2_combout\,
	cout => \u_vga|Add18~3\);

-- Location: LCCOMB_X24_Y22_N4
\u_vga|Add18~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~4_combout\ = (\u_vga|data_sub_disp~3_combout\ & (\u_vga|Add18~3\ $ (GND))) # (!\u_vga|data_sub_disp~3_combout\ & (!\u_vga|Add18~3\ & VCC))
-- \u_vga|Add18~5\ = CARRY((\u_vga|data_sub_disp~3_combout\ & !\u_vga|Add18~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|data_sub_disp~3_combout\,
	datad => VCC,
	cin => \u_vga|Add18~3\,
	combout => \u_vga|Add18~4_combout\,
	cout => \u_vga|Add18~5\);

-- Location: LCCOMB_X24_Y22_N6
\u_vga|Add18~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~6_combout\ = (\u_vga|data_sub_disp~2_combout\ & (!\u_vga|Add18~5\)) # (!\u_vga|data_sub_disp~2_combout\ & ((\u_vga|Add18~5\) # (GND)))
-- \u_vga|Add18~7\ = CARRY((!\u_vga|Add18~5\) # (!\u_vga|data_sub_disp~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|data_sub_disp~2_combout\,
	datad => VCC,
	cin => \u_vga|Add18~5\,
	combout => \u_vga|Add18~6_combout\,
	cout => \u_vga|Add18~7\);

-- Location: LCCOMB_X24_Y22_N8
\u_vga|Add18~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~8_combout\ = (\u_vga|data_sub_disp~1_combout\ & (\u_vga|Add18~7\ $ (GND))) # (!\u_vga|data_sub_disp~1_combout\ & (!\u_vga|Add18~7\ & VCC))
-- \u_vga|Add18~9\ = CARRY((\u_vga|data_sub_disp~1_combout\ & !\u_vga|Add18~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|data_sub_disp~1_combout\,
	datad => VCC,
	cin => \u_vga|Add18~7\,
	combout => \u_vga|Add18~8_combout\,
	cout => \u_vga|Add18~9\);

-- Location: LCCOMB_X24_Y22_N10
\u_vga|Add18~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~10_combout\ = \u_vga|Add18~9\ $ (\u_vga|data_sub_disp~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|data_sub_disp~0_combout\,
	cin => \u_vga|Add18~9\,
	combout => \u_vga|Add18~10_combout\);

-- Location: LCCOMB_X24_Y22_N12
\u_vga|LessThan14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~1_cout\ = CARRY((\u_vga|h_cnt\(0) & !\u_vga|data_sub_disp~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datab => \u_vga|data_sub_disp~9_combout\,
	datad => VCC,
	cout => \u_vga|LessThan14~1_cout\);

-- Location: LCCOMB_X24_Y22_N14
\u_vga|LessThan14~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~3_cout\ = CARRY((\u_vga|h_cnt\(1) & (\u_vga|data_sub_disp~8_combout\ & !\u_vga|LessThan14~1_cout\)) # (!\u_vga|h_cnt\(1) & ((\u_vga|data_sub_disp~8_combout\) # (!\u_vga|LessThan14~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|data_sub_disp~8_combout\,
	datad => VCC,
	cin => \u_vga|LessThan14~1_cout\,
	cout => \u_vga|LessThan14~3_cout\);

-- Location: LCCOMB_X24_Y22_N16
\u_vga|LessThan14~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~5_cout\ = CARRY((\u_vga|h_cnt\(2) & ((!\u_vga|LessThan14~3_cout\) # (!\u_vga|data_sub_disp~7_combout\))) # (!\u_vga|h_cnt\(2) & (!\u_vga|data_sub_disp~7_combout\ & !\u_vga|LessThan14~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|data_sub_disp~7_combout\,
	datad => VCC,
	cin => \u_vga|LessThan14~3_cout\,
	cout => \u_vga|LessThan14~5_cout\);

-- Location: LCCOMB_X24_Y22_N18
\u_vga|LessThan14~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~7_cout\ = CARRY((\u_vga|h_cnt\(3) & (!\u_vga|data_sub_disp~6_combout\ & !\u_vga|LessThan14~5_cout\)) # (!\u_vga|h_cnt\(3) & ((!\u_vga|LessThan14~5_cout\) # (!\u_vga|data_sub_disp~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|data_sub_disp~6_combout\,
	datad => VCC,
	cin => \u_vga|LessThan14~5_cout\,
	cout => \u_vga|LessThan14~7_cout\);

-- Location: LCCOMB_X24_Y22_N20
\u_vga|LessThan14~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~9_cout\ = CARRY((\u_vga|h_cnt\(4) & ((!\u_vga|LessThan14~7_cout\) # (!\u_vga|Add18~0_combout\))) # (!\u_vga|h_cnt\(4) & (!\u_vga|Add18~0_combout\ & !\u_vga|LessThan14~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|Add18~0_combout\,
	datad => VCC,
	cin => \u_vga|LessThan14~7_cout\,
	cout => \u_vga|LessThan14~9_cout\);

-- Location: LCCOMB_X24_Y22_N22
\u_vga|LessThan14~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~11_cout\ = CARRY((\u_vga|h_cnt\(5) & (\u_vga|Add18~2_combout\ & !\u_vga|LessThan14~9_cout\)) # (!\u_vga|h_cnt\(5) & ((\u_vga|Add18~2_combout\) # (!\u_vga|LessThan14~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|Add18~2_combout\,
	datad => VCC,
	cin => \u_vga|LessThan14~9_cout\,
	cout => \u_vga|LessThan14~11_cout\);

-- Location: LCCOMB_X24_Y22_N24
\u_vga|LessThan14~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~13_cout\ = CARRY((\u_vga|h_cnt\(6) & ((!\u_vga|LessThan14~11_cout\) # (!\u_vga|Add18~4_combout\))) # (!\u_vga|h_cnt\(6) & (!\u_vga|Add18~4_combout\ & !\u_vga|LessThan14~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|Add18~4_combout\,
	datad => VCC,
	cin => \u_vga|LessThan14~11_cout\,
	cout => \u_vga|LessThan14~13_cout\);

-- Location: LCCOMB_X24_Y22_N26
\u_vga|LessThan14~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~15_cout\ = CARRY((\u_vga|Add18~6_combout\ & ((!\u_vga|LessThan14~13_cout\) # (!\u_vga|h_cnt\(7)))) # (!\u_vga|Add18~6_combout\ & (!\u_vga|h_cnt\(7) & !\u_vga|LessThan14~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add18~6_combout\,
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|LessThan14~13_cout\,
	cout => \u_vga|LessThan14~15_cout\);

-- Location: LCCOMB_X24_Y22_N28
\u_vga|LessThan14~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~17_cout\ = CARRY((\u_vga|h_cnt\(8) & ((!\u_vga|LessThan14~15_cout\) # (!\u_vga|Add18~8_combout\))) # (!\u_vga|h_cnt\(8) & (!\u_vga|Add18~8_combout\ & !\u_vga|LessThan14~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|Add18~8_combout\,
	datad => VCC,
	cin => \u_vga|LessThan14~15_cout\,
	cout => \u_vga|LessThan14~17_cout\);

-- Location: LCCOMB_X24_Y22_N30
\u_vga|LessThan14~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~18_combout\ = (\u_vga|h_cnt\(9) & ((\u_vga|LessThan14~17_cout\) # (!\u_vga|Add18~10_combout\))) # (!\u_vga|h_cnt\(9) & (\u_vga|LessThan14~17_cout\ & !\u_vga|Add18~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datad => \u_vga|Add18~10_combout\,
	cin => \u_vga|LessThan14~17_cout\,
	combout => \u_vga|LessThan14~18_combout\);

-- Location: LCCOMB_X27_Y22_N24
\u_vga|red_signal~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~5_combout\ = (\u_vga|LessThan12~14_combout\) # ((\u_vga|red_signal~4_combout\) # ((\u_vga|LessThan13~18_combout\) # (\u_vga|LessThan14~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan12~14_combout\,
	datab => \u_vga|red_signal~4_combout\,
	datac => \u_vga|LessThan13~18_combout\,
	datad => \u_vga|LessThan14~18_combout\,
	combout => \u_vga|red_signal~5_combout\);

-- Location: LCCOMB_X27_Y22_N16
\u_vga|red_signal~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~9_combout\ = (\u_vga|red_signal~8_combout\ & ((\u_vga|red_signal~5_combout\) # ((\u_vga|vga_gen~10_combout\ & \u_vga|Mux2~33_combout\)))) # (!\u_vga|red_signal~8_combout\ & (\u_vga|vga_gen~10_combout\ & (\u_vga|Mux2~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~8_combout\,
	datab => \u_vga|vga_gen~10_combout\,
	datac => \u_vga|Mux2~33_combout\,
	datad => \u_vga|red_signal~5_combout\,
	combout => \u_vga|red_signal~9_combout\);

-- Location: LCCOMB_X29_Y23_N20
\u_vga|vga_gen~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~25_combout\ = (\u_vga|vga_gen~21_combout\ & \u_vga|vga_gen~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~21_combout\,
	datac => \u_vga|vga_gen~24_combout\,
	combout => \u_vga|vga_gen~25_combout\);

-- Location: LCCOMB_X29_Y23_N10
\u_vga|submarines_debug~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~2_combout\ = (\u_vga|vga_gen~28_combout\ & (\u_vga|vga_gen~30_combout\ & (\u_vga|h_cnt\(1) & \u_vga|vga_gen~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~28_combout\,
	datab => \u_vga|vga_gen~30_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|vga_gen~25_combout\,
	combout => \u_vga|submarines_debug~2_combout\);

-- Location: LCCOMB_X29_Y23_N12
\u_vga|submarines_debug~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~3_combout\ = (!\u_vga|current_line~2_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11) & (!\u_vga|current_line~1_combout\ & \u_vga|submarines_debug~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~2_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datac => \u_vga|current_line~1_combout\,
	datad => \u_vga|submarines_debug~2_combout\,
	combout => \u_vga|submarines_debug~3_combout\);

-- Location: LCCOMB_X29_Y22_N16
\u_vga|Decoder1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~11_combout\ = (\u_vga|current_line~4_combout\ & (!\u_vga|current_line~5_combout\ & (!\u_vga|current_line~7_combout\ & \u_vga|current_line~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~4_combout\,
	datab => \u_vga|current_line~5_combout\,
	datac => \u_vga|current_line~7_combout\,
	datad => \u_vga|current_line~6_combout\,
	combout => \u_vga|Decoder1~11_combout\);

-- Location: FF_X29_Y22_N29
\u_vga|submarines_debug[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~64_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(12));

-- Location: LCCOMB_X29_Y23_N16
\u_vga|submarines_debug~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~4_combout\ = (\u_vga|h_cnt\(1) & (\u_vga|vga_gen~31_combout\ & (!\u_vga|current_line~2_combout\ & !\u_vga|current_line~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|vga_gen~31_combout\,
	datac => \u_vga|current_line~2_combout\,
	datad => \u_vga|current_line~1_combout\,
	combout => \u_vga|submarines_debug~4_combout\);

-- Location: LCCOMB_X29_Y22_N28
\u_vga|submarines_debug~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~64_combout\ = (\u_vga|Decoder1~11_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((\u_vga|submarines_debug\(12) & !\u_vga|submarines_debug~4_combout\)))) # (!\u_vga|Decoder1~11_combout\ & (((\u_vga|submarines_debug\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~3_combout\,
	datab => \u_vga|Decoder1~11_combout\,
	datac => \u_vga|submarines_debug\(12),
	datad => \u_vga|submarines_debug~4_combout\,
	combout => \u_vga|submarines_debug~64_combout\);

-- Location: LCCOMB_X29_Y23_N4
\u_vga|submarines_debug~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~10_combout\ = (!\u_vga|current_line~2_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11) & (\u_vga|current_line~1_combout\ & \u_vga|submarines_debug~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~2_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datac => \u_vga|current_line~1_combout\,
	datad => \u_vga|submarines_debug~2_combout\,
	combout => \u_vga|submarines_debug~10_combout\);

-- Location: FF_X29_Y22_N19
\u_vga|submarines_debug[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~63_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(13));

-- Location: LCCOMB_X29_Y23_N6
\u_vga|submarines_debug~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~11_combout\ = (\u_vga|h_cnt\(1) & (\u_vga|vga_gen~31_combout\ & (!\u_vga|current_line~2_combout\ & \u_vga|current_line~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|vga_gen~31_combout\,
	datac => \u_vga|current_line~2_combout\,
	datad => \u_vga|current_line~1_combout\,
	combout => \u_vga|submarines_debug~11_combout\);

-- Location: LCCOMB_X29_Y22_N18
\u_vga|submarines_debug~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~63_combout\ = (\u_vga|Decoder1~11_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((\u_vga|submarines_debug\(13) & !\u_vga|submarines_debug~11_combout\)))) # (!\u_vga|Decoder1~11_combout\ & (((\u_vga|submarines_debug\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~10_combout\,
	datab => \u_vga|Decoder1~11_combout\,
	datac => \u_vga|submarines_debug\(13),
	datad => \u_vga|submarines_debug~11_combout\,
	combout => \u_vga|submarines_debug~63_combout\);

-- Location: LCCOMB_X29_Y22_N30
\u_vga|Mux3~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~27_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|h_cnt\(4)) # (\u_vga|submarines_debug~63_combout\)))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines_debug~64_combout\ & (!\u_vga|h_cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|submarines_debug~64_combout\,
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|submarines_debug~63_combout\,
	combout => \u_vga|Mux3~27_combout\);

-- Location: LCCOMB_X28_Y22_N24
\u_vga|submarines_debug~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~65_combout\ = (\u_vga|vga_gen~31_combout\ & (\u_vga|h_cnt\(1) & \u_vga|Decoder1~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~31_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|Decoder1~11_combout\,
	combout => \u_vga|submarines_debug~65_combout\);

-- Location: FF_X28_Y22_N7
\u_vga|submarines_debug[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~66_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(15));

-- Location: LCCOMB_X31_Y21_N0
\u_vga|submarines_debug~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~14_combout\ = (\u_vga|current_line~1_combout\ & \u_vga|current_line~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|current_line~1_combout\,
	datad => \u_vga|current_line~2_combout\,
	combout => \u_vga|submarines_debug~14_combout\);

-- Location: LCCOMB_X28_Y22_N6
\u_vga|submarines_debug~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~66_combout\ = (\u_vga|submarines_debug~65_combout\ & ((\u_vga|submarines_debug~14_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~14_combout\ & ((\u_vga|submarines_debug\(15)))))) # 
-- (!\u_vga|submarines_debug~65_combout\ & (((\u_vga|submarines_debug\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|submarines_debug~65_combout\,
	datac => \u_vga|submarines_debug\(15),
	datad => \u_vga|submarines_debug~14_combout\,
	combout => \u_vga|submarines_debug~66_combout\);

-- Location: FF_X29_Y22_N7
\u_vga|submarines_debug[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~62_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(14));

-- Location: LCCOMB_X29_Y23_N2
\u_vga|submarines_debug~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~6_combout\ = (\u_vga|h_cnt\(1) & (\u_vga|vga_gen~31_combout\ & (\u_vga|current_line~2_combout\ & !\u_vga|current_line~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|vga_gen~31_combout\,
	datac => \u_vga|current_line~2_combout\,
	datad => \u_vga|current_line~1_combout\,
	combout => \u_vga|submarines_debug~6_combout\);

-- Location: LCCOMB_X29_Y22_N6
\u_vga|submarines_debug~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~62_combout\ = (\u_vga|Decoder1~11_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(14)))))) # 
-- (!\u_vga|Decoder1~11_combout\ & (((\u_vga|submarines_debug\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|Decoder1~11_combout\,
	datac => \u_vga|submarines_debug\(14),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~62_combout\);

-- Location: LCCOMB_X29_Y22_N24
\u_vga|Mux3~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~28_combout\ = (\u_vga|Mux3~27_combout\ & (((\u_vga|submarines_debug~66_combout\)) # (!\u_vga|h_cnt\(4)))) # (!\u_vga|Mux3~27_combout\ & (\u_vga|h_cnt\(4) & ((\u_vga|submarines_debug~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux3~27_combout\,
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|submarines_debug~66_combout\,
	datad => \u_vga|submarines_debug~62_combout\,
	combout => \u_vga|Mux3~28_combout\);

-- Location: LCCOMB_X29_Y22_N2
\u_vga|Decoder1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~9_combout\ = (!\u_vga|current_line~4_combout\ & (\u_vga|current_line~5_combout\ & (\u_vga|current_line~7_combout\ & \u_vga|current_line~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~4_combout\,
	datab => \u_vga|current_line~5_combout\,
	datac => \u_vga|current_line~7_combout\,
	datad => \u_vga|current_line~6_combout\,
	combout => \u_vga|Decoder1~9_combout\);

-- Location: FF_X29_Y22_N9
\u_vga|submarines_debug[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~52_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(6));

-- Location: LCCOMB_X29_Y22_N8
\u_vga|submarines_debug~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~52_combout\ = (\u_vga|Decoder1~9_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(6)))))) # 
-- (!\u_vga|Decoder1~9_combout\ & (((\u_vga|submarines_debug\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|Decoder1~9_combout\,
	datac => \u_vga|submarines_debug\(6),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~52_combout\);

-- Location: FF_X29_Y22_N5
\u_vga|submarines_debug[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~54_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(4));

-- Location: LCCOMB_X29_Y22_N4
\u_vga|submarines_debug~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~54_combout\ = (\u_vga|Decoder1~9_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((\u_vga|submarines_debug\(4) & !\u_vga|submarines_debug~4_combout\)))) # (!\u_vga|Decoder1~9_combout\ & (((\u_vga|submarines_debug\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~3_combout\,
	datab => \u_vga|Decoder1~9_combout\,
	datac => \u_vga|submarines_debug\(4),
	datad => \u_vga|submarines_debug~4_combout\,
	combout => \u_vga|submarines_debug~54_combout\);

-- Location: FF_X30_Y22_N9
\u_vga|submarines_debug[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~53_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(5));

-- Location: LCCOMB_X30_Y22_N8
\u_vga|submarines_debug~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~53_combout\ = (\u_vga|Decoder1~9_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(5))))) # (!\u_vga|Decoder1~9_combout\ & (((\u_vga|submarines_debug\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~9_combout\,
	datab => \u_vga|submarines_debug~11_combout\,
	datac => \u_vga|submarines_debug\(5),
	datad => \u_vga|submarines_debug~10_combout\,
	combout => \u_vga|submarines_debug~53_combout\);

-- Location: LCCOMB_X30_Y22_N26
\u_vga|Mux3~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~22_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|submarines_debug~53_combout\) # (\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines_debug~54_combout\ & ((!\u_vga|h_cnt\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|submarines_debug~54_combout\,
	datac => \u_vga|submarines_debug~53_combout\,
	datad => \u_vga|h_cnt\(4),
	combout => \u_vga|Mux3~22_combout\);

-- Location: FF_X31_Y22_N19
\u_vga|submarines_debug[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~56_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(7));

-- Location: LCCOMB_X31_Y22_N20
\u_vga|submarines_debug~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~55_combout\ = (\u_vga|h_cnt\(1) & (\u_vga|Decoder1~9_combout\ & \u_vga|vga_gen~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|Decoder1~9_combout\,
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|submarines_debug~55_combout\);

-- Location: LCCOMB_X31_Y22_N18
\u_vga|submarines_debug~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~56_combout\ = (\u_vga|submarines_debug~14_combout\ & ((\u_vga|submarines_debug~55_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~55_combout\ & ((\u_vga|submarines_debug\(7)))))) # 
-- (!\u_vga|submarines_debug~14_combout\ & (((\u_vga|submarines_debug\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|submarines_debug~14_combout\,
	datac => \u_vga|submarines_debug\(7),
	datad => \u_vga|submarines_debug~55_combout\,
	combout => \u_vga|submarines_debug~56_combout\);

-- Location: LCCOMB_X30_Y22_N12
\u_vga|Mux3~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~23_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|Mux3~22_combout\ & ((\u_vga|submarines_debug~56_combout\))) # (!\u_vga|Mux3~22_combout\ & (\u_vga|submarines_debug~52_combout\)))) # (!\u_vga|h_cnt\(4) & (((\u_vga|Mux3~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~52_combout\,
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|Mux3~22_combout\,
	datad => \u_vga|submarines_debug~56_combout\,
	combout => \u_vga|Mux3~23_combout\);

-- Location: LCCOMB_X30_Y23_N4
\u_vga|Decoder1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~10_combout\ = (!\u_vga|current_line~6_combout\ & (\u_vga|current_line~7_combout\ & (\u_vga|current_line~5_combout\ & !\u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~10_combout\);

-- Location: LCCOMB_X28_Y22_N12
\u_vga|submarines_debug~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~60_combout\ = (\u_vga|Decoder1~10_combout\ & (\u_vga|h_cnt\(1) & \u_vga|vga_gen~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder1~10_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|submarines_debug~60_combout\);

-- Location: FF_X28_Y22_N27
\u_vga|submarines_debug[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~61_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(3));

-- Location: LCCOMB_X28_Y22_N26
\u_vga|submarines_debug~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~61_combout\ = (\u_vga|submarines_debug~60_combout\ & ((\u_vga|submarines_debug~14_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~14_combout\ & ((\u_vga|submarines_debug\(3)))))) # 
-- (!\u_vga|submarines_debug~60_combout\ & (((\u_vga|submarines_debug\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~60_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datac => \u_vga|submarines_debug\(3),
	datad => \u_vga|submarines_debug~14_combout\,
	combout => \u_vga|submarines_debug~61_combout\);

-- Location: FF_X29_Y23_N31
\u_vga|submarines_debug[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~57_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(2));

-- Location: LCCOMB_X29_Y23_N30
\u_vga|submarines_debug~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~57_combout\ = (\u_vga|submarines_debug~6_combout\ & ((\u_vga|Decoder1~10_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|Decoder1~10_combout\ & ((\u_vga|submarines_debug\(2)))))) # 
-- (!\u_vga|submarines_debug~6_combout\ & (((\u_vga|submarines_debug\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|submarines_debug~6_combout\,
	datac => \u_vga|submarines_debug\(2),
	datad => \u_vga|Decoder1~10_combout\,
	combout => \u_vga|submarines_debug~57_combout\);

-- Location: FF_X30_Y22_N7
\u_vga|submarines_debug[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~58_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(1));

-- Location: LCCOMB_X30_Y22_N6
\u_vga|submarines_debug~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~58_combout\ = (\u_vga|Decoder1~10_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((\u_vga|submarines_debug\(1) & !\u_vga|submarines_debug~11_combout\)))) # (!\u_vga|Decoder1~10_combout\ & (((\u_vga|submarines_debug\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~10_combout\,
	datab => \u_vga|submarines_debug~10_combout\,
	datac => \u_vga|submarines_debug\(1),
	datad => \u_vga|submarines_debug~11_combout\,
	combout => \u_vga|submarines_debug~58_combout\);

-- Location: FF_X30_Y22_N17
\u_vga|submarines_debug[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~59_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(0));

-- Location: LCCOMB_X30_Y22_N16
\u_vga|submarines_debug~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~59_combout\ = (\u_vga|Decoder1~10_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((!\u_vga|submarines_debug~4_combout\ & \u_vga|submarines_debug\(0))))) # (!\u_vga|Decoder1~10_combout\ & (((\u_vga|submarines_debug\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~10_combout\,
	datab => \u_vga|submarines_debug~4_combout\,
	datac => \u_vga|submarines_debug\(0),
	datad => \u_vga|submarines_debug~3_combout\,
	combout => \u_vga|submarines_debug~59_combout\);

-- Location: LCCOMB_X30_Y22_N18
\u_vga|Mux3~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~24_combout\ = (\u_vga|h_cnt\(3) & ((\u_vga|submarines_debug~58_combout\) # ((\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(3) & (((\u_vga|submarines_debug~59_combout\ & !\u_vga|h_cnt\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~58_combout\,
	datab => \u_vga|submarines_debug~59_combout\,
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|h_cnt\(4),
	combout => \u_vga|Mux3~24_combout\);

-- Location: LCCOMB_X30_Y22_N20
\u_vga|Mux3~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~25_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|Mux3~24_combout\ & (\u_vga|submarines_debug~61_combout\)) # (!\u_vga|Mux3~24_combout\ & ((\u_vga|submarines_debug~57_combout\))))) # (!\u_vga|h_cnt\(4) & (((\u_vga|Mux3~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~61_combout\,
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|submarines_debug~57_combout\,
	datad => \u_vga|Mux3~24_combout\,
	combout => \u_vga|Mux3~25_combout\);

-- Location: LCCOMB_X30_Y22_N22
\u_vga|Mux3~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~26_combout\ = (\u_vga|h_cnt\(6) & (((\u_vga|h_cnt\(5))))) # (!\u_vga|h_cnt\(6) & ((\u_vga|h_cnt\(5) & (\u_vga|Mux3~23_combout\)) # (!\u_vga|h_cnt\(5) & ((\u_vga|Mux3~25_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux3~23_combout\,
	datab => \u_vga|Mux3~25_combout\,
	datac => \u_vga|h_cnt\(6),
	datad => \u_vga|h_cnt\(5),
	combout => \u_vga|Mux3~26_combout\);

-- Location: FF_X31_Y22_N27
\u_vga|submarines_debug[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~47_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(9));

-- Location: LCCOMB_X31_Y22_N12
\u_vga|Decoder1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~8_combout\ = (\u_vga|current_line~4_combout\ & (!\u_vga|current_line~6_combout\ & (!\u_vga|current_line~5_combout\ & !\u_vga|current_line~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~4_combout\,
	datab => \u_vga|current_line~6_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~7_combout\,
	combout => \u_vga|Decoder1~8_combout\);

-- Location: LCCOMB_X31_Y22_N26
\u_vga|submarines_debug~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~47_combout\ = (\u_vga|Decoder1~8_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(9))))) # (!\u_vga|Decoder1~8_combout\ & (((\u_vga|submarines_debug\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~11_combout\,
	datab => \u_vga|submarines_debug~10_combout\,
	datac => \u_vga|submarines_debug\(9),
	datad => \u_vga|Decoder1~8_combout\,
	combout => \u_vga|submarines_debug~47_combout\);

-- Location: LCCOMB_X31_Y22_N22
\u_vga|submarines_debug~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~50_combout\ = (\u_vga|vga_gen~31_combout\ & (\u_vga|h_cnt\(1) & \u_vga|Decoder1~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~31_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|Decoder1~8_combout\,
	combout => \u_vga|submarines_debug~50_combout\);

-- Location: FF_X31_Y22_N29
\u_vga|submarines_debug[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~51_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(11));

-- Location: LCCOMB_X31_Y22_N28
\u_vga|submarines_debug~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~51_combout\ = (\u_vga|submarines_debug~50_combout\ & ((\u_vga|submarines_debug~14_combout\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_b\(11)))) # (!\u_vga|submarines_debug~14_combout\ & (\u_vga|submarines_debug\(11))))) # 
-- (!\u_vga|submarines_debug~50_combout\ & (((\u_vga|submarines_debug\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~50_combout\,
	datab => \u_vga|submarines_debug~14_combout\,
	datac => \u_vga|submarines_debug\(11),
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	combout => \u_vga|submarines_debug~51_combout\);

-- Location: FF_X31_Y22_N1
\u_vga|submarines_debug[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~49_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(8));

-- Location: LCCOMB_X31_Y22_N0
\u_vga|submarines_debug~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~49_combout\ = (\u_vga|Decoder1~8_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((!\u_vga|submarines_debug~4_combout\ & \u_vga|submarines_debug\(8))))) # (!\u_vga|Decoder1~8_combout\ & (((\u_vga|submarines_debug\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~4_combout\,
	datab => \u_vga|submarines_debug~3_combout\,
	datac => \u_vga|submarines_debug\(8),
	datad => \u_vga|Decoder1~8_combout\,
	combout => \u_vga|submarines_debug~49_combout\);

-- Location: FF_X31_Y22_N7
\u_vga|submarines_debug[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~48_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(10));

-- Location: LCCOMB_X31_Y22_N6
\u_vga|submarines_debug~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~48_combout\ = (\u_vga|submarines_debug~6_combout\ & ((\u_vga|Decoder1~8_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|Decoder1~8_combout\ & ((\u_vga|submarines_debug\(10)))))) # 
-- (!\u_vga|submarines_debug~6_combout\ & (((\u_vga|submarines_debug\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~6_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datac => \u_vga|submarines_debug\(10),
	datad => \u_vga|Decoder1~8_combout\,
	combout => \u_vga|submarines_debug~48_combout\);

-- Location: LCCOMB_X31_Y22_N2
\u_vga|Mux3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~20_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(3) & ((\u_vga|h_cnt\(4) & ((\u_vga|submarines_debug~48_combout\))) # (!\u_vga|h_cnt\(4) & (\u_vga|submarines_debug~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|submarines_debug~49_combout\,
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|submarines_debug~48_combout\,
	combout => \u_vga|Mux3~20_combout\);

-- Location: LCCOMB_X31_Y22_N24
\u_vga|Mux3~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~21_combout\ = (\u_vga|h_cnt\(3) & ((\u_vga|Mux3~20_combout\ & ((\u_vga|submarines_debug~51_combout\))) # (!\u_vga|Mux3~20_combout\ & (\u_vga|submarines_debug~47_combout\)))) # (!\u_vga|h_cnt\(3) & (((\u_vga|Mux3~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~47_combout\,
	datab => \u_vga|submarines_debug~51_combout\,
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|Mux3~20_combout\,
	combout => \u_vga|Mux3~21_combout\);

-- Location: LCCOMB_X30_Y22_N0
\u_vga|Mux3~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~29_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|Mux3~26_combout\ & (\u_vga|Mux3~28_combout\)) # (!\u_vga|Mux3~26_combout\ & ((\u_vga|Mux3~21_combout\))))) # (!\u_vga|h_cnt\(6) & (((\u_vga|Mux3~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|Mux3~28_combout\,
	datac => \u_vga|Mux3~26_combout\,
	datad => \u_vga|Mux3~21_combout\,
	combout => \u_vga|Mux3~29_combout\);

-- Location: FF_X31_Y21_N13
\u_vga|submarines_debug[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~33_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(19));

-- Location: LCCOMB_X30_Y23_N2
\u_vga|Decoder1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~7_combout\ = (!\u_vga|current_line~6_combout\ & (!\u_vga|current_line~7_combout\ & (\u_vga|current_line~5_combout\ & \u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~7_combout\);

-- Location: LCCOMB_X31_Y21_N6
\u_vga|submarines_debug~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~32_combout\ = (\u_vga|vga_gen~31_combout\ & (\u_vga|h_cnt\(1) & \u_vga|Decoder1~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~31_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|Decoder1~7_combout\,
	combout => \u_vga|submarines_debug~32_combout\);

-- Location: LCCOMB_X31_Y21_N12
\u_vga|submarines_debug~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~33_combout\ = (\u_vga|submarines_debug~14_combout\ & ((\u_vga|submarines_debug~32_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~32_combout\ & ((\u_vga|submarines_debug\(19)))))) # 
-- (!\u_vga|submarines_debug~14_combout\ & (((\u_vga|submarines_debug\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|submarines_debug~14_combout\,
	datac => \u_vga|submarines_debug\(19),
	datad => \u_vga|submarines_debug~32_combout\,
	combout => \u_vga|submarines_debug~33_combout\);

-- Location: FF_X31_Y21_N9
\u_vga|submarines_debug[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~34_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(18));

-- Location: LCCOMB_X31_Y21_N8
\u_vga|submarines_debug~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~34_combout\ = (\u_vga|Decoder1~7_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(18)))))) # 
-- (!\u_vga|Decoder1~7_combout\ & (((\u_vga|submarines_debug\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|Decoder1~7_combout\,
	datac => \u_vga|submarines_debug\(18),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~34_combout\);

-- Location: LCCOMB_X31_Y21_N26
\u_vga|Mux3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~12_combout\ = (\u_vga|h_cnt\(5) & (((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & ((\u_vga|h_cnt\(3) & (\u_vga|submarines_debug~33_combout\)) # (!\u_vga|h_cnt\(3) & ((\u_vga|submarines_debug~34_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~33_combout\,
	datab => \u_vga|submarines_debug~34_combout\,
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|h_cnt\(3),
	combout => \u_vga|Mux3~12_combout\);

-- Location: LCCOMB_X30_Y23_N16
\u_vga|Decoder1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~6_combout\ = (\u_vga|current_line~6_combout\ & (!\u_vga|current_line~7_combout\ & (\u_vga|current_line~5_combout\ & \u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~6_combout\);

-- Location: LCCOMB_X31_Y21_N30
\u_vga|submarines_debug~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~35_combout\ = (\u_vga|Decoder1~6_combout\ & (\u_vga|h_cnt\(1) & \u_vga|vga_gen~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder1~6_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|submarines_debug~35_combout\);

-- Location: FF_X31_Y21_N21
\u_vga|submarines_debug[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~36_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(23));

-- Location: LCCOMB_X31_Y21_N20
\u_vga|submarines_debug~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~36_combout\ = (\u_vga|submarines_debug~35_combout\ & ((\u_vga|submarines_debug~14_combout\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_b\(11)))) # (!\u_vga|submarines_debug~14_combout\ & (\u_vga|submarines_debug\(23))))) # 
-- (!\u_vga|submarines_debug~35_combout\ & (((\u_vga|submarines_debug\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~35_combout\,
	datab => \u_vga|submarines_debug~14_combout\,
	datac => \u_vga|submarines_debug\(23),
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	combout => \u_vga|submarines_debug~36_combout\);

-- Location: FF_X31_Y21_N11
\u_vga|submarines_debug[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~31_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(22));

-- Location: LCCOMB_X31_Y21_N10
\u_vga|submarines_debug~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~31_combout\ = (\u_vga|Decoder1~6_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(22)))))) # 
-- (!\u_vga|Decoder1~6_combout\ & (((\u_vga|submarines_debug\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|Decoder1~6_combout\,
	datac => \u_vga|submarines_debug\(22),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~31_combout\);

-- Location: LCCOMB_X31_Y21_N24
\u_vga|Mux3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~13_combout\ = (\u_vga|Mux3~12_combout\ & ((\u_vga|submarines_debug~36_combout\) # ((!\u_vga|h_cnt\(5))))) # (!\u_vga|Mux3~12_combout\ & (((\u_vga|h_cnt\(5) & \u_vga|submarines_debug~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux3~12_combout\,
	datab => \u_vga|submarines_debug~36_combout\,
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines_debug~31_combout\,
	combout => \u_vga|Mux3~13_combout\);

-- Location: FF_X29_Y23_N19
\u_vga|submarines_debug[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~39_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(16));

-- Location: LCCOMB_X29_Y23_N18
\u_vga|submarines_debug~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~39_combout\ = (\u_vga|Decoder1~7_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((!\u_vga|submarines_debug~4_combout\ & \u_vga|submarines_debug\(16))))) # (!\u_vga|Decoder1~7_combout\ & (((\u_vga|submarines_debug\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~3_combout\,
	datab => \u_vga|submarines_debug~4_combout\,
	datac => \u_vga|submarines_debug\(16),
	datad => \u_vga|Decoder1~7_combout\,
	combout => \u_vga|submarines_debug~39_combout\);

-- Location: FF_X29_Y23_N25
\u_vga|submarines_debug[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~38_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(17));

-- Location: LCCOMB_X29_Y23_N24
\u_vga|submarines_debug~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~38_combout\ = (\u_vga|Decoder1~7_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(17))))) # (!\u_vga|Decoder1~7_combout\ & (((\u_vga|submarines_debug\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~11_combout\,
	datab => \u_vga|submarines_debug~10_combout\,
	datac => \u_vga|submarines_debug\(17),
	datad => \u_vga|Decoder1~7_combout\,
	combout => \u_vga|submarines_debug~38_combout\);

-- Location: LCCOMB_X29_Y23_N28
\u_vga|Mux3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~14_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|h_cnt\(5)) # (\u_vga|submarines_debug~38_combout\)))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines_debug~39_combout\ & (!\u_vga|h_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|submarines_debug~39_combout\,
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines_debug~38_combout\,
	combout => \u_vga|Mux3~14_combout\);

-- Location: FF_X30_Y21_N17
\u_vga|submarines_debug[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~40_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(21));

-- Location: LCCOMB_X30_Y21_N16
\u_vga|submarines_debug~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~40_combout\ = (\u_vga|Decoder1~6_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(21))))) # (!\u_vga|Decoder1~6_combout\ & (((\u_vga|submarines_debug\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~11_combout\,
	datab => \u_vga|Decoder1~6_combout\,
	datac => \u_vga|submarines_debug\(21),
	datad => \u_vga|submarines_debug~10_combout\,
	combout => \u_vga|submarines_debug~40_combout\);

-- Location: FF_X30_Y21_N7
\u_vga|submarines_debug[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~37_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(20));

-- Location: LCCOMB_X30_Y21_N6
\u_vga|submarines_debug~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~37_combout\ = (\u_vga|Decoder1~6_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((\u_vga|submarines_debug\(20) & !\u_vga|submarines_debug~4_combout\)))) # (!\u_vga|Decoder1~6_combout\ & (((\u_vga|submarines_debug\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~3_combout\,
	datab => \u_vga|Decoder1~6_combout\,
	datac => \u_vga|submarines_debug\(20),
	datad => \u_vga|submarines_debug~4_combout\,
	combout => \u_vga|submarines_debug~37_combout\);

-- Location: LCCOMB_X30_Y21_N26
\u_vga|Mux3~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~15_combout\ = (\u_vga|Mux3~14_combout\ & ((\u_vga|submarines_debug~40_combout\) # ((!\u_vga|h_cnt\(5))))) # (!\u_vga|Mux3~14_combout\ & (((\u_vga|h_cnt\(5) & \u_vga|submarines_debug~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux3~14_combout\,
	datab => \u_vga|submarines_debug~40_combout\,
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines_debug~37_combout\,
	combout => \u_vga|Mux3~15_combout\);

-- Location: LCCOMB_X30_Y21_N28
\u_vga|Mux3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~16_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|Mux3~13_combout\) # ((\u_vga|h_cnt\(6))))) # (!\u_vga|h_cnt\(4) & (((\u_vga|Mux3~15_combout\ & !\u_vga|h_cnt\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|Mux3~13_combout\,
	datac => \u_vga|Mux3~15_combout\,
	datad => \u_vga|h_cnt\(6),
	combout => \u_vga|Mux3~16_combout\);

-- Location: LCCOMB_X30_Y23_N30
\u_vga|Decoder1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~5_combout\ = (!\u_vga|current_line~6_combout\ & (\u_vga|current_line~7_combout\ & (!\u_vga|current_line~5_combout\ & \u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~5_combout\);

-- Location: FF_X30_Y22_N11
\u_vga|submarines_debug[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~28_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(25));

-- Location: LCCOMB_X30_Y22_N10
\u_vga|submarines_debug~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~28_combout\ = (\u_vga|Decoder1~5_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(25))))) # (!\u_vga|Decoder1~5_combout\ & (((\u_vga|submarines_debug\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~5_combout\,
	datab => \u_vga|submarines_debug~11_combout\,
	datac => \u_vga|submarines_debug\(25),
	datad => \u_vga|submarines_debug~10_combout\,
	combout => \u_vga|submarines_debug~28_combout\);

-- Location: FF_X30_Y22_N29
\u_vga|submarines_debug[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~29_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(24));

-- Location: LCCOMB_X30_Y22_N28
\u_vga|submarines_debug~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~29_combout\ = (\u_vga|Decoder1~5_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((!\u_vga|submarines_debug~4_combout\ & \u_vga|submarines_debug\(24))))) # (!\u_vga|Decoder1~5_combout\ & (((\u_vga|submarines_debug\(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~5_combout\,
	datab => \u_vga|submarines_debug~4_combout\,
	datac => \u_vga|submarines_debug\(24),
	datad => \u_vga|submarines_debug~3_combout\,
	combout => \u_vga|submarines_debug~29_combout\);

-- Location: LCCOMB_X30_Y22_N14
\u_vga|Mux3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~10_combout\ = (\u_vga|h_cnt\(5) & (((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & ((\u_vga|h_cnt\(3) & (\u_vga|submarines_debug~28_combout\)) # (!\u_vga|h_cnt\(3) & ((\u_vga|submarines_debug~29_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~28_combout\,
	datab => \u_vga|h_cnt\(5),
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|submarines_debug~29_combout\,
	combout => \u_vga|Mux3~10_combout\);

-- Location: LCCOMB_X30_Y23_N20
\u_vga|Decoder1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~4_combout\ = (\u_vga|current_line~6_combout\ & (\u_vga|current_line~7_combout\ & (!\u_vga|current_line~5_combout\ & \u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~4_combout\);

-- Location: FF_X31_Y22_N5
\u_vga|submarines_debug[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~30_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(29));

-- Location: LCCOMB_X31_Y22_N4
\u_vga|submarines_debug~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~30_combout\ = (\u_vga|Decoder1~4_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(29))))) # (!\u_vga|Decoder1~4_combout\ & (((\u_vga|submarines_debug\(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~11_combout\,
	datab => \u_vga|Decoder1~4_combout\,
	datac => \u_vga|submarines_debug\(29),
	datad => \u_vga|submarines_debug~10_combout\,
	combout => \u_vga|submarines_debug~30_combout\);

-- Location: FF_X31_Y22_N11
\u_vga|submarines_debug[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~27_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(28));

-- Location: LCCOMB_X31_Y22_N10
\u_vga|submarines_debug~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~27_combout\ = (\u_vga|Decoder1~4_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((!\u_vga|submarines_debug~4_combout\ & \u_vga|submarines_debug\(28))))) # (!\u_vga|Decoder1~4_combout\ & (((\u_vga|submarines_debug\(28)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~4_combout\,
	datab => \u_vga|Decoder1~4_combout\,
	datac => \u_vga|submarines_debug\(28),
	datad => \u_vga|submarines_debug~3_combout\,
	combout => \u_vga|submarines_debug~27_combout\);

-- Location: LCCOMB_X31_Y22_N30
\u_vga|Mux3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~11_combout\ = (\u_vga|Mux3~10_combout\ & ((\u_vga|submarines_debug~30_combout\) # ((!\u_vga|h_cnt\(5))))) # (!\u_vga|Mux3~10_combout\ & (((\u_vga|h_cnt\(5) & \u_vga|submarines_debug~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux3~10_combout\,
	datab => \u_vga|submarines_debug~30_combout\,
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines_debug~27_combout\,
	combout => \u_vga|Mux3~11_combout\);

-- Location: FF_X31_Y21_N17
\u_vga|submarines_debug[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~44_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(26));

-- Location: LCCOMB_X31_Y21_N16
\u_vga|submarines_debug~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~44_combout\ = (\u_vga|Decoder1~5_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(26)))))) # 
-- (!\u_vga|Decoder1~5_combout\ & (((\u_vga|submarines_debug\(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|Decoder1~5_combout\,
	datac => \u_vga|submarines_debug\(26),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~44_combout\);

-- Location: LCCOMB_X31_Y21_N14
\u_vga|submarines_debug~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~42_combout\ = (\u_vga|vga_gen~31_combout\ & (\u_vga|h_cnt\(1) & \u_vga|Decoder1~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~31_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|Decoder1~5_combout\,
	combout => \u_vga|submarines_debug~42_combout\);

-- Location: FF_X31_Y21_N29
\u_vga|submarines_debug[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~43_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(27));

-- Location: LCCOMB_X31_Y21_N28
\u_vga|submarines_debug~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~43_combout\ = (\u_vga|submarines_debug~42_combout\ & ((\u_vga|submarines_debug~14_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~14_combout\ & ((\u_vga|submarines_debug\(27)))))) # 
-- (!\u_vga|submarines_debug~42_combout\ & (((\u_vga|submarines_debug\(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|submarines_debug~42_combout\,
	datac => \u_vga|submarines_debug\(27),
	datad => \u_vga|submarines_debug~14_combout\,
	combout => \u_vga|submarines_debug~43_combout\);

-- Location: LCCOMB_X31_Y21_N2
\u_vga|Mux3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~17_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|h_cnt\(5)) # (\u_vga|submarines_debug~43_combout\)))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines_debug~44_combout\ & (!\u_vga|h_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~44_combout\,
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|submarines_debug~43_combout\,
	combout => \u_vga|Mux3~17_combout\);

-- Location: FF_X31_Y21_N5
\u_vga|submarines_debug[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~46_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(31));

-- Location: LCCOMB_X31_Y22_N8
\u_vga|submarines_debug~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~45_combout\ = (\u_vga|Decoder1~4_combout\ & (\u_vga|h_cnt\(1) & \u_vga|vga_gen~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder1~4_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|submarines_debug~45_combout\);

-- Location: LCCOMB_X31_Y21_N4
\u_vga|submarines_debug~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~46_combout\ = (\u_vga|submarines_debug~14_combout\ & ((\u_vga|submarines_debug~45_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~45_combout\ & ((\u_vga|submarines_debug\(31)))))) # 
-- (!\u_vga|submarines_debug~14_combout\ & (((\u_vga|submarines_debug\(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|submarines_debug~14_combout\,
	datac => \u_vga|submarines_debug\(31),
	datad => \u_vga|submarines_debug~45_combout\,
	combout => \u_vga|submarines_debug~46_combout\);

-- Location: FF_X31_Y21_N19
\u_vga|submarines_debug[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~41_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(30));

-- Location: LCCOMB_X31_Y21_N18
\u_vga|submarines_debug~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~41_combout\ = (\u_vga|Decoder1~4_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(30)))))) # 
-- (!\u_vga|Decoder1~4_combout\ & (((\u_vga|submarines_debug\(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|Decoder1~4_combout\,
	datac => \u_vga|submarines_debug\(30),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~41_combout\);

-- Location: LCCOMB_X31_Y21_N22
\u_vga|Mux3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~18_combout\ = (\u_vga|h_cnt\(5) & ((\u_vga|Mux3~17_combout\ & (\u_vga|submarines_debug~46_combout\)) # (!\u_vga|Mux3~17_combout\ & ((\u_vga|submarines_debug~41_combout\))))) # (!\u_vga|h_cnt\(5) & (\u_vga|Mux3~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|Mux3~17_combout\,
	datac => \u_vga|submarines_debug~46_combout\,
	datad => \u_vga|submarines_debug~41_combout\,
	combout => \u_vga|Mux3~18_combout\);

-- Location: LCCOMB_X30_Y21_N14
\u_vga|Mux3~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~19_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|Mux3~16_combout\ & ((\u_vga|Mux3~18_combout\))) # (!\u_vga|Mux3~16_combout\ & (\u_vga|Mux3~11_combout\)))) # (!\u_vga|h_cnt\(6) & (\u_vga|Mux3~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|Mux3~16_combout\,
	datac => \u_vga|Mux3~11_combout\,
	datad => \u_vga|Mux3~18_combout\,
	combout => \u_vga|Mux3~19_combout\);

-- Location: LCCOMB_X30_Y22_N2
\u_vga|Mux3~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~30_combout\ = (\u_vga|h_cnt\(8) & (((\u_vga|h_cnt\(7))))) # (!\u_vga|h_cnt\(8) & ((\u_vga|h_cnt\(7) & ((\u_vga|Mux3~19_combout\))) # (!\u_vga|h_cnt\(7) & (\u_vga|Mux3~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|Mux3~29_combout\,
	datac => \u_vga|h_cnt\(7),
	datad => \u_vga|Mux3~19_combout\,
	combout => \u_vga|Mux3~30_combout\);

-- Location: LCCOMB_X29_Y22_N20
\u_vga|Decoder1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~12_combout\ = (!\u_vga|current_line~4_combout\ & (\u_vga|current_line~5_combout\ & (!\u_vga|current_line~7_combout\ & !\u_vga|current_line~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~4_combout\,
	datab => \u_vga|current_line~5_combout\,
	datac => \u_vga|current_line~7_combout\,
	datad => \u_vga|current_line~6_combout\,
	combout => \u_vga|Decoder1~12_combout\);

-- Location: FF_X29_Y22_N27
\u_vga|submarines_debug[50]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~69_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(50));

-- Location: LCCOMB_X29_Y22_N26
\u_vga|submarines_debug~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~69_combout\ = (\u_vga|Decoder1~12_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(50)))))) # 
-- (!\u_vga|Decoder1~12_combout\ & (((\u_vga|submarines_debug\(50)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|Decoder1~12_combout\,
	datac => \u_vga|submarines_debug\(50),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~69_combout\);

-- Location: FF_X29_Y22_N23
\u_vga|submarines_debug[48]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~68_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(48));

-- Location: LCCOMB_X29_Y22_N22
\u_vga|submarines_debug~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~68_combout\ = (\u_vga|Decoder1~12_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((\u_vga|submarines_debug\(48) & !\u_vga|submarines_debug~4_combout\)))) # (!\u_vga|Decoder1~12_combout\ & (((\u_vga|submarines_debug\(48)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~3_combout\,
	datab => \u_vga|Decoder1~12_combout\,
	datac => \u_vga|submarines_debug\(48),
	datad => \u_vga|submarines_debug~4_combout\,
	combout => \u_vga|submarines_debug~68_combout\);

-- Location: FF_X29_Y22_N11
\u_vga|submarines_debug[49]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~67_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(49));

-- Location: LCCOMB_X29_Y22_N10
\u_vga|submarines_debug~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~67_combout\ = (\u_vga|Decoder1~12_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((\u_vga|submarines_debug\(49) & !\u_vga|submarines_debug~11_combout\)))) # (!\u_vga|Decoder1~12_combout\ & (((\u_vga|submarines_debug\(49)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~10_combout\,
	datab => \u_vga|Decoder1~12_combout\,
	datac => \u_vga|submarines_debug\(49),
	datad => \u_vga|submarines_debug~11_combout\,
	combout => \u_vga|submarines_debug~67_combout\);

-- Location: LCCOMB_X29_Y22_N0
\u_vga|Mux3~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~31_combout\ = (!\u_vga|h_cnt\(4) & ((\u_vga|h_cnt\(3) & ((\u_vga|submarines_debug~67_combout\))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines_debug~68_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~68_combout\,
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|submarines_debug~67_combout\,
	combout => \u_vga|Mux3~31_combout\);

-- Location: LCCOMB_X29_Y22_N12
\u_vga|Mux3~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~32_combout\ = (\u_vga|Mux3~31_combout\) # ((\u_vga|submarines_debug~69_combout\ & (\u_vga|h_cnt\(4) & !\u_vga|h_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~69_combout\,
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|Mux3~31_combout\,
	combout => \u_vga|Mux3~32_combout\);

-- Location: LCCOMB_X30_Y22_N4
\u_vga|Mux3~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~33_combout\ = (!\u_vga|h_cnt\(5) & (!\u_vga|h_cnt\(6) & \u_vga|Mux3~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(5),
	datac => \u_vga|h_cnt\(6),
	datad => \u_vga|Mux3~32_combout\,
	combout => \u_vga|Mux3~33_combout\);

-- Location: LCCOMB_X30_Y23_N24
\u_vga|Decoder1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~2_combout\ = (!\u_vga|current_line~6_combout\ & (!\u_vga|current_line~7_combout\ & (!\u_vga|current_line~5_combout\ & !\u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~2_combout\);

-- Location: FF_X29_Y21_N25
\u_vga|submarines_debug[41]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~12_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(41));

-- Location: LCCOMB_X29_Y21_N24
\u_vga|submarines_debug~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~12_combout\ = (\u_vga|Decoder1~2_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(41))))) # (!\u_vga|Decoder1~2_combout\ & (((\u_vga|submarines_debug\(41)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~2_combout\,
	datab => \u_vga|submarines_debug~11_combout\,
	datac => \u_vga|submarines_debug\(41),
	datad => \u_vga|submarines_debug~10_combout\,
	combout => \u_vga|submarines_debug~12_combout\);

-- Location: LCCOMB_X29_Y21_N2
\u_vga|submarines_debug~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~17_combout\ = (\u_vga|h_cnt\(1) & (\u_vga|submarines_debug~14_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11) & \u_vga|vga_gen~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|submarines_debug~14_combout\,
	datac => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|submarines_debug~17_combout\);

-- Location: FF_X29_Y21_N5
\u_vga|submarines_debug[43]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~18_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(43));

-- Location: LCCOMB_X29_Y21_N6
\u_vga|submarines_debug~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~70_combout\ = (\u_vga|current_line~2_combout\ & (\u_vga|vga_gen~31_combout\ & (\u_vga|h_cnt\(1) & \u_vga|current_line~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~2_combout\,
	datab => \u_vga|vga_gen~31_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|current_line~1_combout\,
	combout => \u_vga|submarines_debug~70_combout\);

-- Location: LCCOMB_X29_Y21_N4
\u_vga|submarines_debug~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~18_combout\ = (\u_vga|Decoder1~2_combout\ & ((\u_vga|submarines_debug~17_combout\) # ((\u_vga|submarines_debug\(43) & !\u_vga|submarines_debug~70_combout\)))) # (!\u_vga|Decoder1~2_combout\ & (((\u_vga|submarines_debug\(43)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~2_combout\,
	datab => \u_vga|submarines_debug~17_combout\,
	datac => \u_vga|submarines_debug\(43),
	datad => \u_vga|submarines_debug~70_combout\,
	combout => \u_vga|submarines_debug~18_combout\);

-- Location: FF_X29_Y21_N11
\u_vga|submarines_debug[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~15_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(35));

-- Location: LCCOMB_X30_Y23_N26
\u_vga|Decoder1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~3_combout\ = (!\u_vga|current_line~6_combout\ & (\u_vga|current_line~7_combout\ & (\u_vga|current_line~5_combout\ & \u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~3_combout\);

-- Location: LCCOMB_X29_Y21_N20
\u_vga|submarines_debug~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~13_combout\ = (\u_vga|Decoder1~3_combout\ & (\u_vga|h_cnt\(1) & \u_vga|vga_gen~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder1~3_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|vga_gen~31_combout\,
	combout => \u_vga|submarines_debug~13_combout\);

-- Location: LCCOMB_X29_Y21_N10
\u_vga|submarines_debug~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~15_combout\ = (\u_vga|submarines_debug~14_combout\ & ((\u_vga|submarines_debug~13_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~13_combout\ & ((\u_vga|submarines_debug\(35)))))) # 
-- (!\u_vga|submarines_debug~14_combout\ & (((\u_vga|submarines_debug\(35)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|submarines_debug~14_combout\,
	datac => \u_vga|submarines_debug\(35),
	datad => \u_vga|submarines_debug~13_combout\,
	combout => \u_vga|submarines_debug~15_combout\);

-- Location: FF_X29_Y21_N23
\u_vga|submarines_debug[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~16_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(33));

-- Location: LCCOMB_X29_Y21_N22
\u_vga|submarines_debug~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~16_combout\ = (\u_vga|Decoder1~3_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((\u_vga|submarines_debug\(33) & !\u_vga|submarines_debug~11_combout\)))) # (!\u_vga|Decoder1~3_combout\ & (((\u_vga|submarines_debug\(33)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~10_combout\,
	datab => \u_vga|Decoder1~3_combout\,
	datac => \u_vga|submarines_debug\(33),
	datad => \u_vga|submarines_debug~11_combout\,
	combout => \u_vga|submarines_debug~16_combout\);

-- Location: LCCOMB_X29_Y21_N16
\u_vga|Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~2_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|submarines_debug~15_combout\) # ((\u_vga|h_cnt\(6))))) # (!\u_vga|h_cnt\(4) & (((\u_vga|submarines_debug~16_combout\ & !\u_vga|h_cnt\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|submarines_debug~15_combout\,
	datac => \u_vga|submarines_debug~16_combout\,
	datad => \u_vga|h_cnt\(6),
	combout => \u_vga|Mux3~2_combout\);

-- Location: LCCOMB_X29_Y21_N14
\u_vga|Mux3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~3_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|Mux3~2_combout\ & ((\u_vga|submarines_debug~18_combout\))) # (!\u_vga|Mux3~2_combout\ & (\u_vga|submarines_debug~12_combout\)))) # (!\u_vga|h_cnt\(6) & (((\u_vga|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|submarines_debug~12_combout\,
	datac => \u_vga|submarines_debug~18_combout\,
	datad => \u_vga|Mux3~2_combout\,
	combout => \u_vga|Mux3~3_combout\);

-- Location: FF_X29_Y21_N13
\u_vga|submarines_debug[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~21_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(32));

-- Location: LCCOMB_X29_Y21_N12
\u_vga|submarines_debug~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~21_combout\ = (\u_vga|Decoder1~3_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((!\u_vga|submarines_debug~4_combout\ & \u_vga|submarines_debug\(32))))) # (!\u_vga|Decoder1~3_combout\ & (((\u_vga|submarines_debug\(32)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~4_combout\,
	datab => \u_vga|Decoder1~3_combout\,
	datac => \u_vga|submarines_debug\(32),
	datad => \u_vga|submarines_debug~3_combout\,
	combout => \u_vga|submarines_debug~21_combout\);

-- Location: FF_X29_Y21_N27
\u_vga|submarines_debug[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~20_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(34));

-- Location: LCCOMB_X29_Y21_N26
\u_vga|submarines_debug~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~20_combout\ = (\u_vga|Decoder1~3_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(34)))))) # 
-- (!\u_vga|Decoder1~3_combout\ & (((\u_vga|submarines_debug\(34)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datab => \u_vga|Decoder1~3_combout\,
	datac => \u_vga|submarines_debug\(34),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~20_combout\);

-- Location: LCCOMB_X29_Y21_N30
\u_vga|Mux3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~4_combout\ = (\u_vga|h_cnt\(4) & (((\u_vga|submarines_debug~20_combout\) # (\u_vga|h_cnt\(6))))) # (!\u_vga|h_cnt\(4) & (\u_vga|submarines_debug~21_combout\ & ((!\u_vga|h_cnt\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|submarines_debug~21_combout\,
	datac => \u_vga|submarines_debug~20_combout\,
	datad => \u_vga|h_cnt\(6),
	combout => \u_vga|Mux3~4_combout\);

-- Location: FF_X29_Y21_N1
\u_vga|submarines_debug[42]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~22_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(42));

-- Location: LCCOMB_X29_Y21_N0
\u_vga|submarines_debug~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~22_combout\ = (\u_vga|Decoder1~2_combout\ & ((\u_vga|submarines_debug~6_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|submarines_debug~6_combout\ & ((\u_vga|submarines_debug\(42)))))) # 
-- (!\u_vga|Decoder1~2_combout\ & (((\u_vga|submarines_debug\(42)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~2_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datac => \u_vga|submarines_debug\(42),
	datad => \u_vga|submarines_debug~6_combout\,
	combout => \u_vga|submarines_debug~22_combout\);

-- Location: FF_X29_Y21_N9
\u_vga|submarines_debug[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~19_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(40));

-- Location: LCCOMB_X29_Y21_N8
\u_vga|submarines_debug~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~19_combout\ = (\u_vga|Decoder1~2_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((\u_vga|submarines_debug\(40) & !\u_vga|submarines_debug~4_combout\)))) # (!\u_vga|Decoder1~2_combout\ & (((\u_vga|submarines_debug\(40)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~2_combout\,
	datab => \u_vga|submarines_debug~3_combout\,
	datac => \u_vga|submarines_debug\(40),
	datad => \u_vga|submarines_debug~4_combout\,
	combout => \u_vga|submarines_debug~19_combout\);

-- Location: LCCOMB_X29_Y21_N18
\u_vga|Mux3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~5_combout\ = (\u_vga|Mux3~4_combout\ & ((\u_vga|submarines_debug~22_combout\) # ((!\u_vga|h_cnt\(6))))) # (!\u_vga|Mux3~4_combout\ & (((\u_vga|submarines_debug~19_combout\ & \u_vga|h_cnt\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux3~4_combout\,
	datab => \u_vga|submarines_debug~22_combout\,
	datac => \u_vga|submarines_debug~19_combout\,
	datad => \u_vga|h_cnt\(6),
	combout => \u_vga|Mux3~5_combout\);

-- Location: LCCOMB_X29_Y21_N28
\u_vga|Mux3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~6_combout\ = (\u_vga|h_cnt\(5) & (((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & ((\u_vga|h_cnt\(3) & (\u_vga|Mux3~3_combout\)) # (!\u_vga|h_cnt\(3) & ((\u_vga|Mux3~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|Mux3~3_combout\,
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|Mux3~5_combout\,
	combout => \u_vga|Mux3~6_combout\);

-- Location: FF_X30_Y21_N3
\u_vga|submarines_debug[47]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~26_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(47));

-- Location: LCCOMB_X30_Y23_N12
\u_vga|Decoder1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~0_combout\ = (\u_vga|current_line~6_combout\ & (!\u_vga|current_line~7_combout\ & (!\u_vga|current_line~5_combout\ & !\u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~0_combout\);

-- Location: LCCOMB_X30_Y21_N2
\u_vga|submarines_debug~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~26_combout\ = (\u_vga|Decoder1~0_combout\ & ((\u_vga|submarines_debug~17_combout\) # ((!\u_vga|submarines_debug~70_combout\ & \u_vga|submarines_debug\(47))))) # (!\u_vga|Decoder1~0_combout\ & (((\u_vga|submarines_debug\(47)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~17_combout\,
	datab => \u_vga|submarines_debug~70_combout\,
	datac => \u_vga|submarines_debug\(47),
	datad => \u_vga|Decoder1~0_combout\,
	combout => \u_vga|submarines_debug~26_combout\);

-- Location: LCCOMB_X30_Y23_N6
\u_vga|Decoder1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder1~1_combout\ = (\u_vga|current_line~6_combout\ & (\u_vga|current_line~7_combout\ & (\u_vga|current_line~5_combout\ & \u_vga|current_line~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_line~6_combout\,
	datab => \u_vga|current_line~7_combout\,
	datac => \u_vga|current_line~5_combout\,
	datad => \u_vga|current_line~4_combout\,
	combout => \u_vga|Decoder1~1_combout\);

-- Location: FF_X30_Y21_N31
\u_vga|submarines_debug[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~25_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(37));

-- Location: LCCOMB_X30_Y21_N30
\u_vga|submarines_debug~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~25_combout\ = (\u_vga|Decoder1~1_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(37))))) # (!\u_vga|Decoder1~1_combout\ & (((\u_vga|submarines_debug\(37)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~11_combout\,
	datab => \u_vga|Decoder1~1_combout\,
	datac => \u_vga|submarines_debug\(37),
	datad => \u_vga|submarines_debug~10_combout\,
	combout => \u_vga|submarines_debug~25_combout\);

-- Location: FF_X30_Y21_N13
\u_vga|submarines_debug[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~24_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(39));

-- Location: LCCOMB_X30_Y21_N12
\u_vga|submarines_debug~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~24_combout\ = (\u_vga|Decoder1~1_combout\ & ((\u_vga|submarines_debug~17_combout\) # ((!\u_vga|submarines_debug~70_combout\ & \u_vga|submarines_debug\(39))))) # (!\u_vga|Decoder1~1_combout\ & (((\u_vga|submarines_debug\(39)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder1~1_combout\,
	datab => \u_vga|submarines_debug~70_combout\,
	datac => \u_vga|submarines_debug\(39),
	datad => \u_vga|submarines_debug~17_combout\,
	combout => \u_vga|submarines_debug~24_combout\);

-- Location: LCCOMB_X30_Y21_N8
\u_vga|Mux3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~7_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|h_cnt\(6)) # ((\u_vga|submarines_debug~24_combout\)))) # (!\u_vga|h_cnt\(4) & (!\u_vga|h_cnt\(6) & (\u_vga|submarines_debug~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|h_cnt\(6),
	datac => \u_vga|submarines_debug~25_combout\,
	datad => \u_vga|submarines_debug~24_combout\,
	combout => \u_vga|Mux3~7_combout\);

-- Location: FF_X30_Y21_N11
\u_vga|submarines_debug[45]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~23_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(45));

-- Location: LCCOMB_X30_Y21_N10
\u_vga|submarines_debug~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~23_combout\ = (\u_vga|Decoder1~0_combout\ & ((\u_vga|submarines_debug~10_combout\) # ((!\u_vga|submarines_debug~11_combout\ & \u_vga|submarines_debug\(45))))) # (!\u_vga|Decoder1~0_combout\ & (((\u_vga|submarines_debug\(45)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~11_combout\,
	datab => \u_vga|Decoder1~0_combout\,
	datac => \u_vga|submarines_debug\(45),
	datad => \u_vga|submarines_debug~10_combout\,
	combout => \u_vga|submarines_debug~23_combout\);

-- Location: LCCOMB_X30_Y21_N4
\u_vga|Mux3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~8_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|Mux3~7_combout\ & (\u_vga|submarines_debug~26_combout\)) # (!\u_vga|Mux3~7_combout\ & ((\u_vga|submarines_debug~23_combout\))))) # (!\u_vga|h_cnt\(6) & (((\u_vga|Mux3~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|submarines_debug~26_combout\,
	datac => \u_vga|Mux3~7_combout\,
	datad => \u_vga|submarines_debug~23_combout\,
	combout => \u_vga|Mux3~8_combout\);

-- Location: FF_X30_Y21_N25
\u_vga|submarines_debug[44]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~5_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(44));

-- Location: LCCOMB_X30_Y21_N24
\u_vga|submarines_debug~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~5_combout\ = (\u_vga|Decoder1~0_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((\u_vga|submarines_debug\(44) & !\u_vga|submarines_debug~4_combout\)))) # (!\u_vga|Decoder1~0_combout\ & (((\u_vga|submarines_debug\(44)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~3_combout\,
	datab => \u_vga|Decoder1~0_combout\,
	datac => \u_vga|submarines_debug\(44),
	datad => \u_vga|submarines_debug~4_combout\,
	combout => \u_vga|submarines_debug~5_combout\);

-- Location: FF_X30_Y21_N23
\u_vga|submarines_debug[46]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~9_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(46));

-- Location: LCCOMB_X30_Y21_N22
\u_vga|submarines_debug~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~9_combout\ = (\u_vga|submarines_debug~6_combout\ & ((\u_vga|Decoder1~0_combout\ & (\u_ram_sub|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|Decoder1~0_combout\ & ((\u_vga|submarines_debug\(46)))))) # 
-- (!\u_vga|submarines_debug~6_combout\ & (((\u_vga|submarines_debug\(46)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~6_combout\,
	datab => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	datac => \u_vga|submarines_debug\(46),
	datad => \u_vga|Decoder1~0_combout\,
	combout => \u_vga|submarines_debug~9_combout\);

-- Location: FF_X30_Y21_N19
\u_vga|submarines_debug[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~8_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(36));

-- Location: LCCOMB_X30_Y21_N18
\u_vga|submarines_debug~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~8_combout\ = (\u_vga|Decoder1~1_combout\ & ((\u_vga|submarines_debug~3_combout\) # ((\u_vga|submarines_debug\(36) & !\u_vga|submarines_debug~4_combout\)))) # (!\u_vga|Decoder1~1_combout\ & (((\u_vga|submarines_debug\(36)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~3_combout\,
	datab => \u_vga|Decoder1~1_combout\,
	datac => \u_vga|submarines_debug\(36),
	datad => \u_vga|submarines_debug~4_combout\,
	combout => \u_vga|submarines_debug~8_combout\);

-- Location: FF_X31_Y22_N17
\u_vga|submarines_debug[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines_debug~7_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines_debug\(38));

-- Location: LCCOMB_X31_Y22_N16
\u_vga|submarines_debug~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines_debug~7_combout\ = (\u_vga|submarines_debug~6_combout\ & ((\u_vga|Decoder1~1_combout\ & ((\u_ram_sub|altsyncram_component|auto_generated|q_b\(11)))) # (!\u_vga|Decoder1~1_combout\ & (\u_vga|submarines_debug\(38))))) # 
-- (!\u_vga|submarines_debug~6_combout\ & (((\u_vga|submarines_debug\(38)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines_debug~6_combout\,
	datab => \u_vga|Decoder1~1_combout\,
	datac => \u_vga|submarines_debug\(38),
	datad => \u_ram_sub|altsyncram_component|auto_generated|q_b\(11),
	combout => \u_vga|submarines_debug~7_combout\);

-- Location: LCCOMB_X30_Y21_N20
\u_vga|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~0_combout\ = (\u_vga|h_cnt\(4) & (((\u_vga|h_cnt\(6)) # (\u_vga|submarines_debug~7_combout\)))) # (!\u_vga|h_cnt\(4) & (\u_vga|submarines_debug~8_combout\ & (!\u_vga|h_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|submarines_debug~8_combout\,
	datac => \u_vga|h_cnt\(6),
	datad => \u_vga|submarines_debug~7_combout\,
	combout => \u_vga|Mux3~0_combout\);

-- Location: LCCOMB_X30_Y21_N0
\u_vga|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~1_combout\ = (\u_vga|h_cnt\(6) & ((\u_vga|Mux3~0_combout\ & ((\u_vga|submarines_debug~9_combout\))) # (!\u_vga|Mux3~0_combout\ & (\u_vga|submarines_debug~5_combout\)))) # (!\u_vga|h_cnt\(6) & (((\u_vga|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|submarines_debug~5_combout\,
	datac => \u_vga|submarines_debug~9_combout\,
	datad => \u_vga|Mux3~0_combout\,
	combout => \u_vga|Mux3~1_combout\);

-- Location: LCCOMB_X30_Y22_N24
\u_vga|Mux3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~9_combout\ = (\u_vga|Mux3~6_combout\ & (((\u_vga|Mux3~8_combout\)) # (!\u_vga|h_cnt\(5)))) # (!\u_vga|Mux3~6_combout\ & (\u_vga|h_cnt\(5) & ((\u_vga|Mux3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux3~6_combout\,
	datab => \u_vga|h_cnt\(5),
	datac => \u_vga|Mux3~8_combout\,
	datad => \u_vga|Mux3~1_combout\,
	combout => \u_vga|Mux3~9_combout\);

-- Location: LCCOMB_X30_Y22_N30
\u_vga|Mux3~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux3~34_combout\ = (\u_vga|h_cnt\(8) & ((\u_vga|Mux3~30_combout\ & (\u_vga|Mux3~33_combout\)) # (!\u_vga|Mux3~30_combout\ & ((\u_vga|Mux3~9_combout\))))) # (!\u_vga|h_cnt\(8) & (\u_vga|Mux3~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|Mux3~30_combout\,
	datac => \u_vga|Mux3~33_combout\,
	datad => \u_vga|Mux3~9_combout\,
	combout => \u_vga|Mux3~34_combout\);

-- Location: LCCOMB_X27_Y22_N30
\u_vga|red_signal~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~10_combout\ = (\u_vga|red_signal~2_combout\) # ((\u_vga|vga_gen~8_combout\ & ((\u_vga|Mux3~34_combout\))) # (!\u_vga|vga_gen~8_combout\ & (\u_vga|red_signal~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~2_combout\,
	datab => \u_vga|red_signal~9_combout\,
	datac => \u_vga|vga_gen~8_combout\,
	datad => \u_vga|Mux3~34_combout\,
	combout => \u_vga|red_signal~10_combout\);

-- Location: FF_X27_Y22_N31
\u_vga|red_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|red_signal~10_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|red_signal~q\);

-- Location: FF_X26_Y22_N1
\u_vga|horizontal_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|LessThan26~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|horizontal_en~q\);

-- Location: FF_X26_Y23_N27
\u_vga|vertical_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|vertical_en~q\);

-- Location: LCCOMB_X26_Y23_N30
\u_vga|video_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|video_en~0_combout\ = (\u_vga|horizontal_en~q\ & \u_vga|vertical_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|horizontal_en~q\,
	datad => \u_vga|vertical_en~q\,
	combout => \u_vga|video_en~0_combout\);

-- Location: FF_X26_Y23_N31
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

-- Location: LCCOMB_X27_Y22_N8
\u_vga|out_red~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_red~0_combout\ = (\u_vga|red_signal~q\ & \u_vga|video_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~q\,
	datad => \u_vga|video_en~q\,
	combout => \u_vga|out_red~0_combout\);

-- Location: FF_X27_Y22_N9
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

-- Location: LCCOMB_X27_Y22_N26
\u_vga|green_signal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~0_combout\ = (\u_vga|LessThan26~0_combout\ & (\u_vga|vga_gen~38_combout\ & ((\u_vga|green_signal~q\) # (!\u_vga|LessThan4~1_combout\)))) # (!\u_vga|LessThan26~0_combout\ & (\u_vga|green_signal~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan26~0_combout\,
	datab => \u_vga|green_signal~q\,
	datac => \u_vga|LessThan4~1_combout\,
	datad => \u_vga|vga_gen~38_combout\,
	combout => \u_vga|green_signal~0_combout\);

-- Location: LCCOMB_X27_Y22_N28
\u_vga|green_signal~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~1_combout\ = (\u_vga|vga_gen~36_combout\ & (((\u_vga|LessThan26~0_combout\ & \u_vga|Equal7~4_combout\)))) # (!\u_vga|vga_gen~36_combout\ & ((\u_vga|green_signal~0_combout\) # ((\u_vga|LessThan26~0_combout\ & 
-- \u_vga|Equal7~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~36_combout\,
	datab => \u_vga|green_signal~0_combout\,
	datac => \u_vga|LessThan26~0_combout\,
	datad => \u_vga|Equal7~4_combout\,
	combout => \u_vga|green_signal~1_combout\);

-- Location: LCCOMB_X26_Y24_N20
\u_vga|red_signal~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~11_combout\ = (!\u_vga|vga_gen~8_combout\ & ((\u_vga|v_cnt\(5)) # ((!\u_vga|vga_gen~5_combout\) # (!\u_vga|vga_gen~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|vga_gen~9_combout\,
	datac => \u_vga|vga_gen~8_combout\,
	datad => \u_vga|vga_gen~5_combout\,
	combout => \u_vga|red_signal~11_combout\);

-- Location: LCCOMB_X27_Y22_N0
\u_vga|green_signal~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~2_combout\ = (\u_vga|red_signal~2_combout\) # ((\u_vga|green_signal~1_combout\ & (\u_vga|red_signal~11_combout\ & \u_vga|red_signal~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~2_combout\,
	datab => \u_vga|green_signal~1_combout\,
	datac => \u_vga|red_signal~11_combout\,
	datad => \u_vga|red_signal~5_combout\,
	combout => \u_vga|green_signal~2_combout\);

-- Location: FF_X27_Y22_N1
\u_vga|green_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|green_signal~2_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|green_signal~q\);

-- Location: LCCOMB_X27_Y22_N18
\u_vga|out_green~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_green~0_combout\ = (\u_vga|green_signal~q\ & \u_vga|video_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|green_signal~q\,
	datad => \u_vga|video_en~q\,
	combout => \u_vga|out_green~0_combout\);

-- Location: FF_X27_Y22_N19
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

-- Location: LCCOMB_X27_Y22_N22
\u_vga|blue_signal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|blue_signal~0_combout\ = (!\u_vga|vga_gen~36_combout\ & ((\u_vga|blue_signal~q\) # ((\u_vga|LessThan26~0_combout\ & !\u_vga|LessThan4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan26~0_combout\,
	datab => \u_vga|LessThan4~1_combout\,
	datac => \u_vga|vga_gen~36_combout\,
	datad => \u_vga|blue_signal~q\,
	combout => \u_vga|blue_signal~0_combout\);

-- Location: LCCOMB_X27_Y22_N2
\u_vga|blue_signal~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|blue_signal~1_combout\ = (\u_vga|red_signal~11_combout\ & (\u_vga|red_signal~5_combout\ & ((\u_vga|blue_signal~0_combout\) # (\u_vga|red_signal~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|blue_signal~0_combout\,
	datab => \u_vga|red_signal~7_combout\,
	datac => \u_vga|red_signal~11_combout\,
	datad => \u_vga|red_signal~5_combout\,
	combout => \u_vga|blue_signal~1_combout\);

-- Location: FF_X27_Y22_N3
\u_vga|blue_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|blue_signal~1_combout\,
	ena => \u_vga|LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|blue_signal~q\);

-- Location: LCCOMB_X27_Y22_N4
\u_vga|out_blue~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_blue~0_combout\ = (\u_vga|blue_signal~q\ & \u_vga|video_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|blue_signal~q\,
	datad => \u_vga|video_en~q\,
	combout => \u_vga|out_blue~0_combout\);

-- Location: FF_X27_Y22_N5
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

-- Location: LCCOMB_X21_Y22_N24
\u_vga|vga_gen~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~40_combout\ = (!\u_vga|h_cnt\(3) & (((!\u_vga|h_cnt\(2)) # (!\u_vga|h_cnt\(0))) # (!\u_vga|h_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|h_cnt\(0),
	datad => \u_vga|h_cnt\(2),
	combout => \u_vga|vga_gen~40_combout\);

-- Location: LCCOMB_X21_Y22_N26
\u_vga|vga_gen~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~41_combout\ = (\u_vga|h_cnt\(5)) # ((\u_vga|h_cnt\(4) & ((\u_vga|h_cnt\(7)) # (!\u_vga|vga_gen~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|vga_gen~40_combout\,
	datad => \u_vga|h_cnt\(7),
	combout => \u_vga|vga_gen~41_combout\);

-- Location: LCCOMB_X21_Y22_N30
\u_vga|vga_gen~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~42_combout\ = (\u_vga|h_cnt\(7) $ (((!\u_vga|h_cnt\(6)) # (!\u_vga|vga_gen~41_combout\)))) # (!\u_vga|vga_gen~39_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~41_combout\,
	datab => \u_vga|vga_gen~39_combout\,
	datac => \u_vga|h_cnt\(6),
	datad => \u_vga|h_cnt\(7),
	combout => \u_vga|vga_gen~42_combout\);

-- Location: FF_X21_Y22_N31
\u_vga|h_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|vga_gen~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_sync~q\);

-- Location: FF_X21_Y22_N1
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

-- Location: LCCOMB_X34_Y22_N16
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

-- Location: FF_X34_Y22_N17
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


