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

-- DATE "04/16/2015 14:24:59"

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
-- G_SENSOR_INT	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
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
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Add0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[0]~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[1]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[1]~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[2]~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|ini_index[3]~4_combout\ : std_logic;
SIGNAL \u_spi_ee_config|LessThan0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~0_combout\ : std_logic;
SIGNAL \I2C_SDAT~input_o\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[15]~8_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[1]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[2]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[3]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[4]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[5]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_ready~q\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~13_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back~q\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte~q\ : std_logic;
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
SIGNAL \u_spi_ee_config|read_back~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status~q\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status_d[0]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status_d[1]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|clear_status_d[2]~feeder_combout\ : std_logic;
SIGNAL \G_SENSOR_INT~input_o\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[15]~12_combout\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|spi_go~q\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count_en~q\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux5~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data[6]~6_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~7_combout\ : std_logic;
SIGNAL \u_spi_ee_config|read_back_d~q\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[7]~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|high_byte_d~q\ : std_logic;
SIGNAL \u_spi_ee_config|direction~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|direction~q\ : std_logic;
SIGNAL \u_spi_ee_config|Mux3~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~11_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux11~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux10~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~4_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux4~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~10_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~5_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~14_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux2~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~9_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux9~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~2_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux8~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~3_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~6_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux6~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|p2s_data~7_combout\ : std_logic;
SIGNAL \u_spi_ee_config|Mux7~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~0_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|Mux0~8_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\ : std_logic;
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oSPI_CLK~0_combout\ : std_logic;
SIGNAL \u_vga|Add23~11\ : std_logic;
SIGNAL \u_vga|Add23~12_combout\ : std_logic;
SIGNAL \u_vga|Add23~13\ : std_logic;
SIGNAL \u_vga|Add23~14_combout\ : std_logic;
SIGNAL \u_vga|Add23~15\ : std_logic;
SIGNAL \u_vga|Add23~16_combout\ : std_logic;
SIGNAL \u_vga|Add23~17\ : std_logic;
SIGNAL \u_vga|Add23~18_combout\ : std_logic;
SIGNAL \u_vga|Add23~19\ : std_logic;
SIGNAL \u_vga|Add23~20_combout\ : std_logic;
SIGNAL \u_vga|Add23~0_combout\ : std_logic;
SIGNAL \u_vga|Add23~1\ : std_logic;
SIGNAL \u_vga|Add23~2_combout\ : std_logic;
SIGNAL \u_vga|Add23~3\ : std_logic;
SIGNAL \u_vga|Add23~4_combout\ : std_logic;
SIGNAL \u_vga|Add23~5\ : std_logic;
SIGNAL \u_vga|Add23~6_combout\ : std_logic;
SIGNAL \u_vga|Equal1~1_combout\ : std_logic;
SIGNAL \u_vga|h_cnt~0_combout\ : std_logic;
SIGNAL \u_vga|Add23~7\ : std_logic;
SIGNAL \u_vga|Add23~8_combout\ : std_logic;
SIGNAL \u_vga|h_cnt~1_combout\ : std_logic;
SIGNAL \u_vga|Add23~9\ : std_logic;
SIGNAL \u_vga|Add23~10_combout\ : std_logic;
SIGNAL \u_vga|Equal1~0_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~13_combout\ : std_logic;
SIGNAL \u_vga|Add24~0_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~11_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[4]~1_combout\ : std_logic;
SIGNAL \u_vga|Add24~1\ : std_logic;
SIGNAL \u_vga|Add24~2_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~10_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[1]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Add24~3\ : std_logic;
SIGNAL \u_vga|Add24~4_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~9_combout\ : std_logic;
SIGNAL \u_vga|Add24~5\ : std_logic;
SIGNAL \u_vga|Add24~6_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~5_combout\ : std_logic;
SIGNAL \u_vga|Add24~7\ : std_logic;
SIGNAL \u_vga|Add24~8_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~4_combout\ : std_logic;
SIGNAL \u_vga|Add24~9\ : std_logic;
SIGNAL \u_vga|Add24~10_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~3_combout\ : std_logic;
SIGNAL \u_vga|Add24~11\ : std_logic;
SIGNAL \u_vga|Add24~12_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~2_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~8_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~0_combout\ : std_logic;
SIGNAL \u_vga|Add24~13\ : std_logic;
SIGNAL \u_vga|Add24~14_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~0_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~7_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~31_combout\ : std_logic;
SIGNAL \u_vga|Add24~15\ : std_logic;
SIGNAL \u_vga|Add24~16_combout\ : std_logic;
SIGNAL \u_vga|v_cnt~7_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~32_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~33_combout\ : std_logic;
SIGNAL \u_vga|Add24~17\ : std_logic;
SIGNAL \u_vga|Add24~18_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[9]~6_combout\ : std_logic;
SIGNAL \u_vga|Add24~19\ : std_logic;
SIGNAL \u_vga|Add24~20_combout\ : std_logic;
SIGNAL \u_vga|v_cnt[10]~8_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~1_combout\ : std_logic;
SIGNAL \u_vga|LessThan13~0_combout\ : std_logic;
SIGNAL \u_vga|Equal9~0_combout\ : std_logic;
SIGNAL \u_vga|Equal9~1_combout\ : std_logic;
SIGNAL \u_vga|LessThan11~0_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~0_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~2_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~5_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~6_combout\ : std_logic;
SIGNAL \u_vga|Equal9~2_combout\ : std_logic;
SIGNAL \u_vga|Equal9~3_combout\ : std_logic;
SIGNAL \u_vga|Equal9~4_combout\ : std_logic;
SIGNAL \u_vga|green_signal~2_combout\ : std_logic;
SIGNAL \u_vga|Equal1~2_combout\ : std_logic;
SIGNAL \u_vga|Equal1~3_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~34_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[4]~16_combout\ : std_logic;
SIGNAL \u_vga|LessThan11~1_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line~6_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line~7_combout\ : std_logic;
SIGNAL \u_vga|Add19~1\ : std_logic;
SIGNAL \u_vga|Add19~3\ : std_logic;
SIGNAL \u_vga|Add19~5\ : std_logic;
SIGNAL \u_vga|Add19~7\ : std_logic;
SIGNAL \u_vga|Add19~8_combout\ : std_logic;
SIGNAL \u_vga|Add19~4_combout\ : std_logic;
SIGNAL \u_vga|Add19~0_combout\ : std_logic;
SIGNAL \u_vga|Add19~2_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[4]~8_combout\ : std_logic;
SIGNAL \u_vga|Add19~6_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[4]~14_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[4]~15_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[4]~17\ : std_logic;
SIGNAL \u_vga|current_submarine_line[5]~18_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[5]~19\ : std_logic;
SIGNAL \u_vga|current_submarine_line[6]~20_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[6]~21\ : std_logic;
SIGNAL \u_vga|current_submarine_line[7]~22_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[7]~23\ : std_logic;
SIGNAL \u_vga|current_submarine_line[8]~24_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line[8]~25\ : std_logic;
SIGNAL \u_vga|current_submarine_line[9]~26_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line~13_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line~12_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line~11_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line~10_combout\ : std_logic;
SIGNAL \u_vga|current_submarine_line~9_combout\ : std_logic;
SIGNAL \u_vga|Add19~9\ : std_logic;
SIGNAL \u_vga|Add19~11\ : std_logic;
SIGNAL \u_vga|Add19~13\ : std_logic;
SIGNAL \u_vga|Add19~15\ : std_logic;
SIGNAL \u_vga|Add19~17\ : std_logic;
SIGNAL \u_vga|Add19~19\ : std_logic;
SIGNAL \u_vga|Add19~20_combout\ : std_logic;
SIGNAL \u_vga|Add19~18_combout\ : std_logic;
SIGNAL \u_vga|Add19~14_combout\ : std_logic;
SIGNAL \u_vga|Add19~12_combout\ : std_logic;
SIGNAL \u_vga|Add19~10_combout\ : std_logic;
SIGNAL \u_vga|Add19~16_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~3_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~4_combout\ : std_logic;
SIGNAL \u_vga|LessThan14~0_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~1_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~3_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~2_combout\ : std_logic;
SIGNAL \u_vga|update_elements_position~4_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[0]~5_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[0]~6\ : std_logic;
SIGNAL \u_vga|current_submarine[1]~7_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~27_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~29_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~28_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~30_combout\ : std_logic;
SIGNAL \u_vga|v_sync~feeder_combout\ : std_logic;
SIGNAL \u_vga|v_sync~q\ : std_logic;
SIGNAL \u_vga|current_submarine[2]~10_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[1]~8\ : std_logic;
SIGNAL \u_vga|current_submarine[2]~11_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[2]~12\ : std_logic;
SIGNAL \u_vga|current_submarine[3]~13_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[3]~14\ : std_logic;
SIGNAL \u_vga|current_submarine[4]~15_combout\ : std_logic;
SIGNAL \u_vga|current_submarine[2]~9_combout\ : std_logic;
SIGNAL \u_vga|Equal6~0_combout\ : std_logic;
SIGNAL \u_vga|update_submarines~0_combout\ : std_logic;
SIGNAL \u_vga|update_submarines~1_combout\ : std_logic;
SIGNAL \u_vga|update_submarines~feeder_combout\ : std_logic;
SIGNAL \u_vga|update_submarines~q\ : std_logic;
SIGNAL \u_vga|first_part~0_combout\ : std_logic;
SIGNAL \u_vga|first_part~feeder_combout\ : std_logic;
SIGNAL \u_vga|first_part~q\ : std_logic;
SIGNAL \u_vga|Add7~0_combout\ : std_logic;
SIGNAL \u_vga|update_rockets~0_combout\ : std_logic;
SIGNAL \u_vga|update_rockets~1_combout\ : std_logic;
SIGNAL \u_vga|update_rockets~feeder_combout\ : std_logic;
SIGNAL \u_vga|update_rockets~q\ : std_logic;
SIGNAL \u_vga|current_rocket[0]~1_combout\ : std_logic;
SIGNAL \u_vga|Add7~1\ : std_logic;
SIGNAL \u_vga|Add7~2_combout\ : std_logic;
SIGNAL \u_vga|Add7~3\ : std_logic;
SIGNAL \u_vga|Add7~4_combout\ : std_logic;
SIGNAL \u_vga|current_rocket~2_combout\ : std_logic;
SIGNAL \u_vga|Add7~5\ : std_logic;
SIGNAL \u_vga|Add7~6_combout\ : std_logic;
SIGNAL \u_vga|Add7~7\ : std_logic;
SIGNAL \u_vga|Add7~8_combout\ : std_logic;
SIGNAL \u_vga|Add7~9\ : std_logic;
SIGNAL \u_vga|Add7~10_combout\ : std_logic;
SIGNAL \u_vga|current_rocket~3_combout\ : std_logic;
SIGNAL \u_vga|current_rocket~0_combout\ : std_logic;
SIGNAL \u_vga|Equal7~0_combout\ : std_logic;
SIGNAL \u_vga|Equal7~1_combout\ : std_logic;
SIGNAL \u_vga|new_elements~2_combout\ : std_logic;
SIGNAL \u_vga|new_elements~0_combout\ : std_logic;
SIGNAL \u_vga|Add0~0_combout\ : std_logic;
SIGNAL \u_vga|cycle_cnt~1_combout\ : std_logic;
SIGNAL \u_vga|Add0~1\ : std_logic;
SIGNAL \u_vga|Add0~2_combout\ : std_logic;
SIGNAL \u_vga|Add0~3\ : std_logic;
SIGNAL \u_vga|Add0~4_combout\ : std_logic;
SIGNAL \u_vga|cycle_cnt~0_combout\ : std_logic;
SIGNAL \u_vga|Add0~5\ : std_logic;
SIGNAL \u_vga|Add0~6_combout\ : std_logic;
SIGNAL \u_vga|Equal8~0_combout\ : std_logic;
SIGNAL \u_vga|Add0~7\ : std_logic;
SIGNAL \u_vga|Add0~8_combout\ : std_logic;
SIGNAL \u_vga|Add0~9\ : std_logic;
SIGNAL \u_vga|Add0~10_combout\ : std_logic;
SIGNAL \u_vga|cycle_cnt~2_combout\ : std_logic;
SIGNAL \u_vga|Add0~11\ : std_logic;
SIGNAL \u_vga|Add0~12_combout\ : std_logic;
SIGNAL \u_vga|cycle_cnt~3_combout\ : std_logic;
SIGNAL \u_vga|Equal8~1_combout\ : std_logic;
SIGNAL \u_vga|new_elements~1_combout\ : std_logic;
SIGNAL \u_vga|new_elements~3_combout\ : std_logic;
SIGNAL \u_vga|new_elements~feeder_combout\ : std_logic;
SIGNAL \u_vga|new_elements~q\ : std_logic;
SIGNAL \u_vga|tmp_random[7]~0_combout\ : std_logic;
SIGNAL \u_vga|ask_read~0_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[0]~4_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[1]~0_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[1]~feeder_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[2]~1_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[2]~2_combout\ : std_logic;
SIGNAL \u_vga|nb_submarines[3]~3_combout\ : std_logic;
SIGNAL \u_vga|LessThan0~0_combout\ : std_logic;
SIGNAL \u_vga|tmp_random[2]~4_combout\ : std_logic;
SIGNAL \u_vga|tmp_random[7]~1_combout\ : std_logic;
SIGNAL \u_vga|tmp_random[7]~2_combout\ : std_logic;
SIGNAL \u_vga|Add8~0_combout\ : std_logic;
SIGNAL \u_vga|tmp_random[1]~5_combout\ : std_logic;
SIGNAL \u_vga|Add8~1\ : std_logic;
SIGNAL \u_vga|Add8~2_combout\ : std_logic;
SIGNAL \u_vga|tmp_random[4]~6_combout\ : std_logic;
SIGNAL \u_vga|Add8~3\ : std_logic;
SIGNAL \u_vga|Add8~4_combout\ : std_logic;
SIGNAL \u_vga|tmp_random[3]~3_combout\ : std_logic;
SIGNAL \u_vga|Add8~5\ : std_logic;
SIGNAL \u_vga|Add8~6_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~3_combout\ : std_logic;
SIGNAL \u_vga|tmp_random[5]~7_combout\ : std_logic;
SIGNAL \u_vga|Add8~7\ : std_logic;
SIGNAL \u_vga|Add8~8_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~2_combout\ : std_logic;
SIGNAL \u_vga|submarines[22]~7_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~9_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~10_combout\ : std_logic;
SIGNAL \u_vga|submarines[6]~29_combout\ : std_logic;
SIGNAL \u_vga|submarines[6]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Mux0~13_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~11_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~7_combout\ : std_logic;
SIGNAL \u_vga|submarines[14]~24_combout\ : std_logic;
SIGNAL \u_vga|submarines[30]~9_combout\ : std_logic;
SIGNAL \u_vga|Mux0~14_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~1_combout\ : std_logic;
SIGNAL \u_vga|submarines[0]~28_combout\ : std_logic;
SIGNAL \u_vga|submarines[0]~feeder_combout\ : std_logic;
SIGNAL \u_vga|submarines[8]~22_combout\ : std_logic;
SIGNAL \u_vga|submarines[8]~23_combout\ : std_logic;
SIGNAL \u_vga|submarines[8]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Mux0~10_combout\ : std_logic;
SIGNAL \u_vga|submarines[16]~12_combout\ : std_logic;
SIGNAL \u_vga|submarines[16]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~4_combout\ : std_logic;
SIGNAL \u_vga|submarines[24]~10_combout\ : std_logic;
SIGNAL \u_vga|Mux0~11_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~5_combout\ : std_logic;
SIGNAL \u_vga|submarines[10]~20_combout\ : std_logic;
SIGNAL \u_vga|submarines[10]~21_combout\ : std_logic;
SIGNAL \u_vga|submarines[10]~feeder_combout\ : std_logic;
SIGNAL \u_vga|submarines[26]~13_combout\ : std_logic;
SIGNAL \u_vga|submarines[26]~feeder_combout\ : std_logic;
SIGNAL \u_vga|submarines[2]~27_combout\ : std_logic;
SIGNAL \u_vga|submarines[2]~feeder_combout\ : std_logic;
SIGNAL \u_vga|submarines[18]~11_combout\ : std_logic;
SIGNAL \u_vga|submarines[18]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Mux0~8_combout\ : std_logic;
SIGNAL \u_vga|Mux0~9_combout\ : std_logic;
SIGNAL \u_vga|Mux0~12_combout\ : std_logic;
SIGNAL \u_vga|submarines[12]~34_combout\ : std_logic;
SIGNAL \u_vga|submarines[12]~19_combout\ : std_logic;
SIGNAL \u_vga|submarines[12]~feeder_combout\ : std_logic;
SIGNAL \u_vga|submarines[4]~25_combout\ : std_logic;
SIGNAL \u_vga|submarines[4]~26_combout\ : std_logic;
SIGNAL \u_vga|Mux0~6_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~0_combout\ : std_logic;
SIGNAL \u_vga|submarines[28]~6_combout\ : std_logic;
SIGNAL \u_vga|submarines[20]~8_combout\ : std_logic;
SIGNAL \u_vga|Mux0~7_combout\ : std_logic;
SIGNAL \u_vga|Mux0~15_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~6_combout\ : std_logic;
SIGNAL \u_vga|submarines[48]~14_combout\ : std_logic;
SIGNAL \u_vga|submarines[32]~17_combout\ : std_logic;
SIGNAL \u_vga|submarines[32]~feeder_combout\ : std_logic;
SIGNAL \u_vga|submarines[34]~16_combout\ : std_logic;
SIGNAL \u_vga|Mux0~2_combout\ : std_logic;
SIGNAL \u_vga|submarines[38]~18_combout\ : std_logic;
SIGNAL \u_vga|submarines[38]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~8_combout\ : std_logic;
SIGNAL \u_vga|submarines[36]~15_combout\ : std_logic;
SIGNAL \u_vga|submarines[36]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Mux0~3_combout\ : std_logic;
SIGNAL \u_vga|submarines[46]~32_combout\ : std_logic;
SIGNAL \u_vga|submarines[46]~33_combout\ : std_logic;
SIGNAL \u_vga|submarines[46]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Decoder0~12_combout\ : std_logic;
SIGNAL \u_vga|submarines[44]~36_combout\ : std_logic;
SIGNAL \u_vga|submarines[44]~feeder_combout\ : std_logic;
SIGNAL \u_vga|submarines[40]~30_combout\ : std_logic;
SIGNAL \u_vga|submarines[40]~31_combout\ : std_logic;
SIGNAL \u_vga|submarines[40]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Mux0~0_combout\ : std_logic;
SIGNAL \u_vga|submarines[42]~35_combout\ : std_logic;
SIGNAL \u_vga|Mux0~1_combout\ : std_logic;
SIGNAL \u_vga|Mux0~4_combout\ : std_logic;
SIGNAL \u_vga|Mux0~5_combout\ : std_logic;
SIGNAL \u_vga|Mux0~16_combout\ : std_logic;
SIGNAL \u_vga|ask_read~1_combout\ : std_logic;
SIGNAL \u_vga|ask_read~q\ : std_logic;
SIGNAL \u_vga|wr_en_a~2_combout\ : std_logic;
SIGNAL \u_vga|rd_en_a~0_combout\ : std_logic;
SIGNAL \u_vga|rd_en_a~1_combout\ : std_logic;
SIGNAL \u_vga|wr_en_a~q\ : std_logic;
SIGNAL \u_vga|rd_en_a~2_combout\ : std_logic;
SIGNAL \u_vga|rd_en_a~q\ : std_logic;
SIGNAL \u_vga|rd_en_b~0_combout\ : std_logic;
SIGNAL \u_vga|rd_en_b~q\ : std_logic;
SIGNAL \u_vga|address_a[0]~5_combout\ : std_logic;
SIGNAL \u_vga|address_a[4]~7_combout\ : std_logic;
SIGNAL \u_vga|address_a[4]~8_combout\ : std_logic;
SIGNAL \u_vga|address_a[0]~6\ : std_logic;
SIGNAL \u_vga|address_a[1]~9_combout\ : std_logic;
SIGNAL \u_vga|address_a[1]~10\ : std_logic;
SIGNAL \u_vga|address_a[2]~11_combout\ : std_logic;
SIGNAL \u_vga|address_a[2]~12\ : std_logic;
SIGNAL \u_vga|address_a[3]~13_combout\ : std_logic;
SIGNAL \u_vga|address_a[3]~14\ : std_logic;
SIGNAL \u_vga|address_a[4]~15_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \u_vga|address_b[0]~5_combout\ : std_logic;
SIGNAL \u_vga|rd_en_b~1_combout\ : std_logic;
SIGNAL \u_vga|address_b[0]~6\ : std_logic;
SIGNAL \u_vga|address_b[1]~7_combout\ : std_logic;
SIGNAL \u_vga|address_b[1]~8\ : std_logic;
SIGNAL \u_vga|address_b[2]~9_combout\ : std_logic;
SIGNAL \u_vga|address_b[2]~10\ : std_logic;
SIGNAL \u_vga|address_b[3]~11_combout\ : std_logic;
SIGNAL \u_vga|address_b[3]~12\ : std_logic;
SIGNAL \u_vga|address_b[4]~13_combout\ : std_logic;
SIGNAL \u_vga|first_data[4]~3_combout\ : std_logic;
SIGNAL \u_vga|first_data[11]~25_combout\ : std_logic;
SIGNAL \u_vga|Equal2~0_combout\ : std_logic;
SIGNAL \u_vga|Equal3~0_combout\ : std_logic;
SIGNAL \u_vga|Equal3~1_combout\ : std_logic;
SIGNAL \u_vga|Add2~21\ : std_logic;
SIGNAL \u_vga|Add2~22_combout\ : std_logic;
SIGNAL \u_vga|Add1~19\ : std_logic;
SIGNAL \u_vga|Add1~21\ : std_logic;
SIGNAL \u_vga|Add1~22_combout\ : std_logic;
SIGNAL \u_vga|first_data[11]~26_combout\ : std_logic;
SIGNAL \u_vga|first_data[11]~27_combout\ : std_logic;
SIGNAL \u_vga|first_data[10]~28_combout\ : std_logic;
SIGNAL \u_vga|first_data[10]~29_combout\ : std_logic;
SIGNAL \u_vga|data_a~25_combout\ : std_logic;
SIGNAL \u_vga|data_a[25]~1_combout\ : std_logic;
SIGNAL \u_vga|data_a[25]~2_combout\ : std_logic;
SIGNAL \u_vga|data_a[25]~3_combout\ : std_logic;
SIGNAL \u_vga|Add1~1\ : std_logic;
SIGNAL \u_vga|Add1~3\ : std_logic;
SIGNAL \u_vga|Add1~5\ : std_logic;
SIGNAL \u_vga|Add1~7\ : std_logic;
SIGNAL \u_vga|Add1~9\ : std_logic;
SIGNAL \u_vga|Add1~11\ : std_logic;
SIGNAL \u_vga|Add1~13\ : std_logic;
SIGNAL \u_vga|Add1~15\ : std_logic;
SIGNAL \u_vga|Add1~17\ : std_logic;
SIGNAL \u_vga|Add1~18_combout\ : std_logic;
SIGNAL \u_vga|first_data[4]~4_combout\ : std_logic;
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
SIGNAL \u_vga|v_sync~clkctrl_outclk\ : std_logic;
SIGNAL \u_spi_ee_config|oDATA_YH_xhdl2[1]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\ : std_logic;
SIGNAL \u_vga|sign_g_y~q\ : std_logic;
SIGNAL \u_vga|first_data~5_combout\ : std_logic;
SIGNAL \u_vga|first_data~6_combout\ : std_logic;
SIGNAL \u_vga|data_a[25]~26_combout\ : std_logic;
SIGNAL \u_vga|first_data[9]~33_combout\ : std_logic;
SIGNAL \u_vga|data_a~15_combout\ : std_logic;
SIGNAL \u_vga|Add2~16_combout\ : std_logic;
SIGNAL \u_vga|Add1~16_combout\ : std_logic;
SIGNAL \u_vga|first_data~7_combout\ : std_logic;
SIGNAL \u_vga|first_data~8_combout\ : std_logic;
SIGNAL \u_vga|data_a~16_combout\ : std_logic;
SIGNAL \u_vga|data_a[24]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Add1~14_combout\ : std_logic;
SIGNAL \u_vga|Add2~14_combout\ : std_logic;
SIGNAL \u_vga|first_data~9_combout\ : std_logic;
SIGNAL \u_vga|first_data~10_combout\ : std_logic;
SIGNAL \u_vga|data_a~17_combout\ : std_logic;
SIGNAL \u_vga|Add1~12_combout\ : std_logic;
SIGNAL \u_vga|Add2~12_combout\ : std_logic;
SIGNAL \u_vga|first_data~11_combout\ : std_logic;
SIGNAL \u_vga|first_data~12_combout\ : std_logic;
SIGNAL \u_vga|data_a~18_combout\ : std_logic;
SIGNAL \u_vga|Add1~10_combout\ : std_logic;
SIGNAL \u_vga|Add2~10_combout\ : std_logic;
SIGNAL \u_vga|first_data~13_combout\ : std_logic;
SIGNAL \u_vga|first_data~14_combout\ : std_logic;
SIGNAL \u_vga|data_a~19_combout\ : std_logic;
SIGNAL \u_vga|Add1~8_combout\ : std_logic;
SIGNAL \u_vga|Add2~8_combout\ : std_logic;
SIGNAL \u_vga|first_data~15_combout\ : std_logic;
SIGNAL \u_vga|first_data~16_combout\ : std_logic;
SIGNAL \u_vga|data_a~20_combout\ : std_logic;
SIGNAL \u_vga|Add1~6_combout\ : std_logic;
SIGNAL \u_vga|Add2~6_combout\ : std_logic;
SIGNAL \u_vga|first_data~17_combout\ : std_logic;
SIGNAL \u_vga|first_data~18_combout\ : std_logic;
SIGNAL \u_vga|data_a~21_combout\ : std_logic;
SIGNAL \u_vga|second_data~21_combout\ : std_logic;
SIGNAL \u_vga|Add5~0_combout\ : std_logic;
SIGNAL \u_vga|Add4~0_combout\ : std_logic;
SIGNAL \u_vga|Add5~29_combout\ : std_logic;
SIGNAL \u_vga|second_data[0]~1_combout\ : std_logic;
SIGNAL \u_vga|second_data[4]~14_combout\ : std_logic;
SIGNAL \u_vga|Add4~1\ : std_logic;
SIGNAL \u_vga|Add4~3\ : std_logic;
SIGNAL \u_vga|Add4~4_combout\ : std_logic;
SIGNAL \u_vga|Add5~1\ : std_logic;
SIGNAL \u_vga|Add5~3\ : std_logic;
SIGNAL \u_vga|Add5~4_combout\ : std_logic;
SIGNAL \u_vga|Add5~27_combout\ : std_logic;
SIGNAL \u_vga|second_data[2]~3_combout\ : std_logic;
SIGNAL \u_vga|Add5~5\ : std_logic;
SIGNAL \u_vga|Add5~6_combout\ : std_logic;
SIGNAL \u_vga|Add4~5\ : std_logic;
SIGNAL \u_vga|Add4~6_combout\ : std_logic;
SIGNAL \u_vga|Add5~26_combout\ : std_logic;
SIGNAL \u_vga|second_data[3]~4_combout\ : std_logic;
SIGNAL \u_vga|Add5~7\ : std_logic;
SIGNAL \u_vga|Add5~9\ : std_logic;
SIGNAL \u_vga|Add5~10_combout\ : std_logic;
SIGNAL \u_vga|Add4~7\ : std_logic;
SIGNAL \u_vga|Add4~9\ : std_logic;
SIGNAL \u_vga|Add4~10_combout\ : std_logic;
SIGNAL \u_vga|Add5~24_combout\ : std_logic;
SIGNAL \u_vga|second_data[5]~6_combout\ : std_logic;
SIGNAL \u_vga|Add4~11\ : std_logic;
SIGNAL \u_vga|Add4~13\ : std_logic;
SIGNAL \u_vga|Add4~14_combout\ : std_logic;
SIGNAL \u_vga|Add5~11\ : std_logic;
SIGNAL \u_vga|Add5~13\ : std_logic;
SIGNAL \u_vga|Add5~14_combout\ : std_logic;
SIGNAL \u_vga|Add5~22_combout\ : std_logic;
SIGNAL \u_vga|second_data[7]~8_combout\ : std_logic;
SIGNAL \u_vga|Add5~15\ : std_logic;
SIGNAL \u_vga|Add5~16_combout\ : std_logic;
SIGNAL \u_vga|Add4~15\ : std_logic;
SIGNAL \u_vga|Add4~16_combout\ : std_logic;
SIGNAL \u_vga|Add5~21_combout\ : std_logic;
SIGNAL \u_vga|second_data[8]~9_combout\ : std_logic;
SIGNAL \u_vga|Add4~17\ : std_logic;
SIGNAL \u_vga|Add4~19\ : std_logic;
SIGNAL \u_vga|Add4~21\ : std_logic;
SIGNAL \u_vga|Add4~22_combout\ : std_logic;
SIGNAL \u_vga|data_a~13_combout\ : std_logic;
SIGNAL \u_vga|data_a~14_combout\ : std_logic;
SIGNAL \u_vga|second_data~20_combout\ : std_logic;
SIGNAL \u_vga|Add5~17\ : std_logic;
SIGNAL \u_vga|Add5~18_combout\ : std_logic;
SIGNAL \u_vga|Add4~18_combout\ : std_logic;
SIGNAL \u_vga|Add5~20_combout\ : std_logic;
SIGNAL \u_vga|data_a[9]~0_combout\ : std_logic;
SIGNAL \u_vga|data_a~4_combout\ : std_logic;
SIGNAL \u_vga|data_a[8]~feeder_combout\ : std_logic;
SIGNAL \u_vga|data_a~5_combout\ : std_logic;
SIGNAL \u_vga|data_a~6_combout\ : std_logic;
SIGNAL \u_vga|data_a~7_combout\ : std_logic;
SIGNAL \u_vga|Add4~8_combout\ : std_logic;
SIGNAL \u_vga|Add5~8_combout\ : std_logic;
SIGNAL \u_vga|Add5~25_combout\ : std_logic;
SIGNAL \u_vga|second_data[4]~5_combout\ : std_logic;
SIGNAL \u_vga|data_a~8_combout\ : std_logic;
SIGNAL \u_vga|data_a[4]~feeder_combout\ : std_logic;
SIGNAL \u_vga|data_a~9_combout\ : std_logic;
SIGNAL \u_vga|data_a~10_combout\ : std_logic;
SIGNAL \u_vga|Add5~2_combout\ : std_logic;
SIGNAL \u_vga|Add4~2_combout\ : std_logic;
SIGNAL \u_vga|Add5~28_combout\ : std_logic;
SIGNAL \u_vga|second_data[1]~2_combout\ : std_logic;
SIGNAL \u_vga|data_a~11_combout\ : std_logic;
SIGNAL \u_vga|data_a~12_combout\ : std_logic;
SIGNAL \u_vga|Add2~19\ : std_logic;
SIGNAL \u_vga|Add2~20_combout\ : std_logic;
SIGNAL \u_vga|first_data[10]~31_combout\ : std_logic;
SIGNAL \u_vga|Equal2~1_combout\ : std_logic;
SIGNAL \u_vga|Equal2~2_combout\ : std_logic;
SIGNAL \u_vga|Add1~20_combout\ : std_logic;
SIGNAL \u_vga|first_data[10]~30_combout\ : std_logic;
SIGNAL \u_vga|first_data[10]~32_combout\ : std_logic;
SIGNAL \u_vga|data_a~28_combout\ : std_logic;
SIGNAL \u_vga|Add1~4_combout\ : std_logic;
SIGNAL \u_vga|Add2~4_combout\ : std_logic;
SIGNAL \u_vga|first_data~19_combout\ : std_logic;
SIGNAL \u_vga|first_data~20_combout\ : std_logic;
SIGNAL \u_vga|data_a~22_combout\ : std_logic;
SIGNAL \u_vga|data_a[18]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Add2~2_combout\ : std_logic;
SIGNAL \u_vga|Add1~2_combout\ : std_logic;
SIGNAL \u_vga|first_data~21_combout\ : std_logic;
SIGNAL \u_vga|first_data~22_combout\ : std_logic;
SIGNAL \u_vga|data_a~23_combout\ : std_logic;
SIGNAL \u_vga|data_a[17]~feeder_combout\ : std_logic;
SIGNAL \u_vga|first_data[4]~2_combout\ : std_logic;
SIGNAL \u_vga|Add1~0_combout\ : std_logic;
SIGNAL \u_vga|Add2~0_combout\ : std_logic;
SIGNAL \u_vga|first_data~23_combout\ : std_logic;
SIGNAL \u_vga|first_data~24_combout\ : std_logic;
SIGNAL \u_vga|data_a~24_combout\ : std_logic;
SIGNAL \u_vga|second_data~16_combout\ : std_logic;
SIGNAL \u_vga|second_data~15_combout\ : std_logic;
SIGNAL \u_vga|Equal4~0_combout\ : std_logic;
SIGNAL \u_vga|second_data~17_combout\ : std_logic;
SIGNAL \u_vga|second_data~18_combout\ : std_logic;
SIGNAL \u_vga|Add4~12_combout\ : std_logic;
SIGNAL \u_vga|Add5~12_combout\ : std_logic;
SIGNAL \u_vga|Add5~23_combout\ : std_logic;
SIGNAL \u_vga|second_data[6]~7_combout\ : std_logic;
SIGNAL \u_vga|Equal4~1_combout\ : std_logic;
SIGNAL \u_vga|Equal4~2_combout\ : std_logic;
SIGNAL \u_vga|Add4~20_combout\ : std_logic;
SIGNAL \u_vga|second_data~19_combout\ : std_logic;
SIGNAL \u_vga|second_data[10]~0_combout\ : std_logic;
SIGNAL \u_vga|data_a~27_combout\ : std_logic;
SIGNAL \u_vga|second_row[9]~11_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~12_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~14_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~15_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~16_combout\ : std_logic;
SIGNAL \u_vga|first_row~10_combout\ : std_logic;
SIGNAL \u_vga|first_row~0_combout\ : std_logic;
SIGNAL \u_vga|first_row~1_combout\ : std_logic;
SIGNAL \u_vga|first_row~2_combout\ : std_logic;
SIGNAL \u_vga|first_row~3_combout\ : std_logic;
SIGNAL \u_vga|first_row~4_combout\ : std_logic;
SIGNAL \u_vga|first_row~5_combout\ : std_logic;
SIGNAL \u_vga|first_row~6_combout\ : std_logic;
SIGNAL \u_vga|Add17~1\ : std_logic;
SIGNAL \u_vga|Add17~3\ : std_logic;
SIGNAL \u_vga|Add17~5\ : std_logic;
SIGNAL \u_vga|Add17~7\ : std_logic;
SIGNAL \u_vga|Add17~9\ : std_logic;
SIGNAL \u_vga|Add17~10_combout\ : std_logic;
SIGNAL \u_vga|Add17~8_combout\ : std_logic;
SIGNAL \u_vga|Add17~6_combout\ : std_logic;
SIGNAL \u_vga|Add17~4_combout\ : std_logic;
SIGNAL \u_vga|Add17~2_combout\ : std_logic;
SIGNAL \u_vga|Add17~0_combout\ : std_logic;
SIGNAL \u_vga|first_row~7_combout\ : std_logic;
SIGNAL \u_vga|first_row~8_combout\ : std_logic;
SIGNAL \u_vga|first_row~9_combout\ : std_logic;
SIGNAL \u_vga|LessThan16~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan16~18_combout\ : std_logic;
SIGNAL \u_vga|LessThan15~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan15~18_combout\ : std_logic;
SIGNAL \u_vga|red_signal~4_combout\ : std_logic;
SIGNAL \u_vga|red_signal~2_combout\ : std_logic;
SIGNAL \u_vga|second_row~0_combout\ : std_logic;
SIGNAL \u_vga|second_row~1_combout\ : std_logic;
SIGNAL \u_vga|second_row~2_combout\ : std_logic;
SIGNAL \u_vga|second_row~3_combout\ : std_logic;
SIGNAL \u_vga|second_row~4_combout\ : std_logic;
SIGNAL \u_vga|second_row~5_combout\ : std_logic;
SIGNAL \u_vga|second_row~6_combout\ : std_logic;
SIGNAL \u_vga|second_row~7_combout\ : std_logic;
SIGNAL \u_vga|second_row~8_combout\ : std_logic;
SIGNAL \u_vga|second_row~9_combout\ : std_logic;
SIGNAL \u_vga|LessThan18~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan18~18_combout\ : std_logic;
SIGNAL \u_vga|second_row~10_combout\ : std_logic;
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
SIGNAL \u_vga|LessThan19~1_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~3_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~5_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~7_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~9_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~11_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~13_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~15_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~17_cout\ : std_logic;
SIGNAL \u_vga|LessThan19~18_combout\ : std_logic;
SIGNAL \u_vga|red_signal~3_combout\ : std_logic;
SIGNAL \u_vga|red_signal~5_combout\ : std_logic;
SIGNAL \u_vga|LessThan17~0_combout\ : std_logic;
SIGNAL \u_vga|red_signal~0_combout\ : std_logic;
SIGNAL \u_vga|red_signal~1_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~19_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~17_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~18_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~20_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~21_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~22_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~23_combout\ : std_logic;
SIGNAL \u_vga|LessThan2~0_combout\ : std_logic;
SIGNAL \u_vga|LessThan2~1_combout\ : std_logic;
SIGNAL \u_vga|red_signal~6_combout\ : std_logic;
SIGNAL \u_vga|Mux1~11_combout\ : std_logic;
SIGNAL \u_vga|Mux1~12_combout\ : std_logic;
SIGNAL \u_vga|Mux1~4_combout\ : std_logic;
SIGNAL \u_vga|Mux1~5_combout\ : std_logic;
SIGNAL \u_vga|Mux1~8_combout\ : std_logic;
SIGNAL \u_vga|Mux1~9_combout\ : std_logic;
SIGNAL \u_vga|Mux1~6_combout\ : std_logic;
SIGNAL \u_vga|Mux1~7_combout\ : std_logic;
SIGNAL \u_vga|Mux1~10_combout\ : std_logic;
SIGNAL \u_vga|Mux1~13_combout\ : std_logic;
SIGNAL \u_vga|Mux1~0_combout\ : std_logic;
SIGNAL \u_vga|Mux1~1_combout\ : std_logic;
SIGNAL \u_vga|Mux1~2_combout\ : std_logic;
SIGNAL \u_vga|Mux1~3_combout\ : std_logic;
SIGNAL \u_vga|red_signal~7_combout\ : std_logic;
SIGNAL \u_vga|red_signal~8_combout\ : std_logic;
SIGNAL \u_vga|red_signal~9_combout\ : std_logic;
SIGNAL \u_vga|red_signal~10_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~9_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~10_combout\ : std_logic;
SIGNAL \u_vga|Add12~16_combout\ : std_logic;
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[7]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[7]~1_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[6]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[4]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[2]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[1]~feeder_combout\ : std_logic;
SIGNAL \u_spi_ee_config|low_byte_dataY[0]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Add11~0_combout\ : std_logic;
SIGNAL \u_vga|Add11~2\ : std_logic;
SIGNAL \u_vga|Add11~4\ : std_logic;
SIGNAL \u_vga|Add11~6\ : std_logic;
SIGNAL \u_vga|Add11~8\ : std_logic;
SIGNAL \u_vga|Add11~10\ : std_logic;
SIGNAL \u_vga|Add11~12\ : std_logic;
SIGNAL \u_vga|Add11~14\ : std_logic;
SIGNAL \u_vga|Add11~16\ : std_logic;
SIGNAL \u_vga|Add11~17_combout\ : std_logic;
SIGNAL \u_vga|Add11~15_combout\ : std_logic;
SIGNAL \u_vga|Add11~13_combout\ : std_logic;
SIGNAL \u_vga|Add11~11_combout\ : std_logic;
SIGNAL \u_vga|Add11~9_combout\ : std_logic;
SIGNAL \u_vga|Add11~7_combout\ : std_logic;
SIGNAL \u_vga|Add11~5_combout\ : std_logic;
SIGNAL \u_vga|Add12~0_combout\ : std_logic;
SIGNAL \u_vga|Add11~3_combout\ : std_logic;
SIGNAL \u_vga|Add11~1_combout\ : std_logic;
SIGNAL \u_vga|Add13~1_cout\ : std_logic;
SIGNAL \u_vga|Add13~3_cout\ : std_logic;
SIGNAL \u_vga|Add13~4_combout\ : std_logic;
SIGNAL \u_vga|Add12~1\ : std_logic;
SIGNAL \u_vga|Add12~2_combout\ : std_logic;
SIGNAL \u_vga|Add13~5\ : std_logic;
SIGNAL \u_vga|Add13~6_combout\ : std_logic;
SIGNAL \u_vga|old_magn_g_y[1]~feeder_combout\ : std_logic;
SIGNAL \u_vga|Add12~3\ : std_logic;
SIGNAL \u_vga|Add12~4_combout\ : std_logic;
SIGNAL \u_vga|Add13~7\ : std_logic;
SIGNAL \u_vga|Add13~8_combout\ : std_logic;
SIGNAL \u_vga|Add12~5\ : std_logic;
SIGNAL \u_vga|Add12~6_combout\ : std_logic;
SIGNAL \u_vga|Add13~9\ : std_logic;
SIGNAL \u_vga|Add13~10_combout\ : std_logic;
SIGNAL \u_vga|Add12~7\ : std_logic;
SIGNAL \u_vga|Add12~8_combout\ : std_logic;
SIGNAL \u_vga|Add13~11\ : std_logic;
SIGNAL \u_vga|Add13~12_combout\ : std_logic;
SIGNAL \u_vga|Add12~9\ : std_logic;
SIGNAL \u_vga|Add12~10_combout\ : std_logic;
SIGNAL \u_vga|Add13~13\ : std_logic;
SIGNAL \u_vga|Add13~15\ : std_logic;
SIGNAL \u_vga|Add13~17\ : std_logic;
SIGNAL \u_vga|Add13~18_combout\ : std_logic;
SIGNAL \u_vga|Add12~11\ : std_logic;
SIGNAL \u_vga|Add12~13\ : std_logic;
SIGNAL \u_vga|Add12~15\ : std_logic;
SIGNAL \u_vga|Add12~17\ : std_logic;
SIGNAL \u_vga|Add12~18_combout\ : std_logic;
SIGNAL \u_vga|Add13~19\ : std_logic;
SIGNAL \u_vga|Add13~20_combout\ : std_logic;
SIGNAL \u_vga|Add12~14_combout\ : std_logic;
SIGNAL \u_vga|Add13~16_combout\ : std_logic;
SIGNAL \u_vga|Add12~12_combout\ : std_logic;
SIGNAL \u_vga|Add13~14_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][12]~0_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][11]~combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][10]~1_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][9]~2_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][12]~4_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][8]~3_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][7]~5_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][11]~6_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][6]~7_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][10]~8_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][9]~10_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][5]~9_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][4]~11_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][8]~12_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][7]~14_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[1][3]~13_combout\ : std_logic;
SIGNAL \u_vga|Mult0|mult_core|romout[0][6]~15_combout\ : std_logic;
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
SIGNAL \u_vga|left_bound[0]~11\ : std_logic;
SIGNAL \u_vga|left_bound[1]~13\ : std_logic;
SIGNAL \u_vga|left_bound[2]~15\ : std_logic;
SIGNAL \u_vga|left_bound[3]~17\ : std_logic;
SIGNAL \u_vga|left_bound[4]~19\ : std_logic;
SIGNAL \u_vga|left_bound[5]~21\ : std_logic;
SIGNAL \u_vga|left_bound[6]~23\ : std_logic;
SIGNAL \u_vga|left_bound[7]~25\ : std_logic;
SIGNAL \u_vga|left_bound[8]~27\ : std_logic;
SIGNAL \u_vga|left_bound[9]~28_combout\ : std_logic;
SIGNAL \u_vga|Add15~1\ : std_logic;
SIGNAL \u_vga|Add15~3\ : std_logic;
SIGNAL \u_vga|Add15~5\ : std_logic;
SIGNAL \u_vga|Add15~7\ : std_logic;
SIGNAL \u_vga|Add15~9\ : std_logic;
SIGNAL \u_vga|Add15~11\ : std_logic;
SIGNAL \u_vga|Add15~13\ : std_logic;
SIGNAL \u_vga|Add15~14_combout\ : std_logic;
SIGNAL \u_vga|left_bound[8]~26_combout\ : std_logic;
SIGNAL \u_vga|Add15~12_combout\ : std_logic;
SIGNAL \u_vga|left_bound[7]~24_combout\ : std_logic;
SIGNAL \u_vga|Add15~10_combout\ : std_logic;
SIGNAL \u_vga|left_bound[6]~22_combout\ : std_logic;
SIGNAL \u_vga|Add15~8_combout\ : std_logic;
SIGNAL \u_vga|left_bound[5]~20_combout\ : std_logic;
SIGNAL \u_vga|Add15~6_combout\ : std_logic;
SIGNAL \u_vga|left_bound[3]~16_combout\ : std_logic;
SIGNAL \u_vga|Add15~2_combout\ : std_logic;
SIGNAL \u_vga|left_bound[4]~18_combout\ : std_logic;
SIGNAL \u_vga|Add15~4_combout\ : std_logic;
SIGNAL \u_vga|right_bound[4]~7\ : std_logic;
SIGNAL \u_vga|right_bound[5]~9\ : std_logic;
SIGNAL \u_vga|right_bound[6]~11\ : std_logic;
SIGNAL \u_vga|right_bound[7]~13\ : std_logic;
SIGNAL \u_vga|right_bound[8]~15\ : std_logic;
SIGNAL \u_vga|right_bound[9]~16_combout\ : std_logic;
SIGNAL \u_vga|right_bound[8]~14_combout\ : std_logic;
SIGNAL \u_vga|right_bound[7]~12_combout\ : std_logic;
SIGNAL \u_vga|right_bound[6]~10_combout\ : std_logic;
SIGNAL \u_vga|right_bound[5]~8_combout\ : std_logic;
SIGNAL \u_vga|right_bound[4]~6_combout\ : std_logic;
SIGNAL \u_vga|right_bound[3]~18_combout\ : std_logic;
SIGNAL \u_vga|left_bound[2]~14_combout\ : std_logic;
SIGNAL \u_vga|Add15~0_combout\ : std_logic;
SIGNAL \u_vga|left_bound[1]~12_combout\ : std_logic;
SIGNAL \u_vga|left_bound[0]~10_combout\ : std_logic;
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
SIGNAL \u_vga|vga_gen~11_combout\ : std_logic;
SIGNAL \u_vga|red_signal~11_combout\ : std_logic;
SIGNAL \u_vga|red_signal~q\ : std_logic;
SIGNAL \u_vga|horizontal_en~q\ : std_logic;
SIGNAL \u_vga|vertical_en~q\ : std_logic;
SIGNAL \u_vga|video_en~0_combout\ : std_logic;
SIGNAL \u_vga|video_en~q\ : std_logic;
SIGNAL \u_vga|out_red~0_combout\ : std_logic;
SIGNAL \u_vga|out_red~q\ : std_logic;
SIGNAL \u_vga|green_signal~4_combout\ : std_logic;
SIGNAL \u_vga|green_signal~3_combout\ : std_logic;
SIGNAL \u_vga|green_signal~5_combout\ : std_logic;
SIGNAL \u_vga|green_signal~6_combout\ : std_logic;
SIGNAL \u_vga|green_signal~11_combout\ : std_logic;
SIGNAL \u_vga|green_signal~7_combout\ : std_logic;
SIGNAL \u_vga|green_signal~8_combout\ : std_logic;
SIGNAL \u_vga|green_signal~9_combout\ : std_logic;
SIGNAL \u_vga|green_signal~10_combout\ : std_logic;
SIGNAL \u_vga|green_signal~q\ : std_logic;
SIGNAL \u_vga|out_green~0_combout\ : std_logic;
SIGNAL \u_vga|out_green~q\ : std_logic;
SIGNAL \u_vga|blue_signal~0_combout\ : std_logic;
SIGNAL \u_vga|blue_signal~q\ : std_logic;
SIGNAL \u_vga|out_blue~0_combout\ : std_logic;
SIGNAL \u_vga|out_blue~q\ : std_logic;
SIGNAL \u_vga|vga_gen~24_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~25_combout\ : std_logic;
SIGNAL \u_vga|vga_gen~26_combout\ : std_logic;
SIGNAL \u_vga|h_sync~q\ : std_logic;
SIGNAL \u_vga|out_h_sync~q\ : std_logic;
SIGNAL \u_vga|out_v_sync~q\ : std_logic;
SIGNAL \u_spipll|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|q_a\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u_vga|right_bound\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_spi_ee_config|read_idle_count\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \u_vga|current_submarine_line\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_reset_delay|cont\ : std_logic_vector(20 DOWNTO 0);
SIGNAL \u_vga|left_bound\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_vga|data_a\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u_ram1_submarine|altsyncram_component|auto_generated|q_b\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u_vga|address_a\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_vga|address_b\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_vga|second_data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|current_submarine\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_vga|first_data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|v_cnt\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \u_spi_ee_config|u_spi_controller|spi_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|clear_status_d\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|ini_index\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_vga|tmp_random\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga|h_cnt\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \u_vga|second_row\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|first_row\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|submarines\ : std_logic_vector(49 DOWNTO 0);
SIGNAL \u_spi_ee_config|p2s_data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_vga|old_magn_g_y\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_spi_ee_config|oDATA_YH_xhdl2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_spi_ee_config|oDATA_YL_xhdl1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga|cycle_cnt\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \u_vga|nb_submarines\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_spi_ee_config|low_byte_dataY\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga|current_rocket\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \u_vga|ALT_INV_v_sync~clkctrl_outclk\ : std_logic;
SIGNAL \u_vga|ALT_INV_update_submarines~q\ : std_logic;
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

\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\u_vga|data_a\(25) & \u_vga|data_a\(24) & \u_vga|data_a\(23) & \u_vga|data_a\(22) & \u_vga|data_a\(21) & \u_vga|data_a\(20) & \u_vga|data_a\(19) & 
\u_vga|data_a\(11) & \u_vga|data_a\(9) & \u_vga|data_a\(8) & \u_vga|data_a\(7) & \u_vga|data_a\(6) & \u_vga|data_a\(5) & \u_vga|data_a\(4) & \u_vga|data_a\(3) & \u_vga|data_a\(2) & \u_vga|data_a\(1) & \u_vga|data_a\(0));

\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\
& \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\u_vga|address_a\(4) & \u_vga|address_a\(3) & \u_vga|address_a\(2) & \u_vga|address_a\(1) & \u_vga|address_a\(0));

\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\u_vga|address_b\(4) & \u_vga|address_b\(3) & \u_vga|address_b\(2) & \u_vga|address_b\(1) & \u_vga|address_b\(0));

\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(0) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(1) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(2) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(3) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(4) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(5) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(6) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(7) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(8) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(9) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(11) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(14);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(15);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(16);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(17);

\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(0) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(1) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(2) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(3) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(4) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(5) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(6) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(7) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(8) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(9) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(9);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(11) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(10);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(19) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(11);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(20) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(12);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(21) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(13);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(22) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(14);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(23) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(15);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(24) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(16);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(25) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(17);

\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & \u_vga|data_a\(27) & \u_vga|data_a\(26) & \u_vga|data_a\(18) & \u_vga|data_a\(17) & 
\u_vga|data_a\(16) & \u_vga|data_a\(10));

\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & 
\~GND~combout\);

\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\u_vga|address_a\(4) & \u_vga|address_a\(3) & \u_vga|address_a\(2) & \u_vga|address_a\(1) & \u_vga|address_a\(0));

\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBADDR_bus\ <= (\u_vga|address_b\(4) & \u_vga|address_b\(3) & \u_vga|address_b\(2) & \u_vga|address_b\(1) & \u_vga|address_b\(0));

\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(10) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(1);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(2);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(3);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(4);
\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(5);

\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(16) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(1);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(17) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(2);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(18) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(3);
\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(27) <= \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(5);

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

-- Location: LCCOMB_X43_Y20_N8
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

-- Location: FF_X43_Y20_N9
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

-- Location: LCCOMB_X43_Y20_N12
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

-- Location: FF_X43_Y20_N13
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

-- Location: LCCOMB_X43_Y20_N14
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

-- Location: FF_X43_Y20_N15
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

-- Location: LCCOMB_X43_Y20_N16
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

-- Location: FF_X43_Y20_N17
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

-- Location: LCCOMB_X43_Y20_N18
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

-- Location: FF_X43_Y20_N19
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

-- Location: LCCOMB_X43_Y20_N20
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

-- Location: FF_X43_Y20_N21
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

-- Location: LCCOMB_X43_Y20_N22
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

-- Location: FF_X43_Y20_N23
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

-- Location: LCCOMB_X43_Y20_N24
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

-- Location: FF_X43_Y20_N25
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

-- Location: LCCOMB_X43_Y20_N26
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

-- Location: FF_X43_Y20_N27
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

-- Location: LCCOMB_X43_Y20_N28
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

-- Location: FF_X43_Y20_N29
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

-- Location: LCCOMB_X43_Y20_N30
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

-- Location: FF_X43_Y20_N31
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

-- Location: LCCOMB_X43_Y19_N0
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

-- Location: FF_X43_Y19_N1
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

-- Location: LCCOMB_X43_Y19_N2
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

-- Location: FF_X43_Y19_N3
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

-- Location: LCCOMB_X43_Y19_N4
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

-- Location: FF_X43_Y19_N5
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

-- Location: LCCOMB_X43_Y19_N6
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

-- Location: FF_X43_Y19_N7
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

-- Location: LCCOMB_X43_Y19_N8
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

-- Location: FF_X43_Y19_N9
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

-- Location: LCCOMB_X43_Y19_N10
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

-- Location: FF_X43_Y19_N11
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

-- Location: LCCOMB_X43_Y19_N12
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

-- Location: FF_X43_Y19_N13
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

-- Location: LCCOMB_X43_Y19_N14
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

-- Location: FF_X43_Y19_N15
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

-- Location: LCCOMB_X43_Y19_N16
\u_reset_delay|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_reset_delay|Add0~36_combout\ = (\u_reset_delay|cont\(19) & (\u_reset_delay|Add0~35\ $ (GND))) # (!\u_reset_delay|cont\(19) & (!\u_reset_delay|Add0~35\ & VCC))
-- \u_reset_delay|Add0~37\ = CARRY((\u_reset_delay|cont\(19) & !\u_reset_delay|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_reset_delay|cont\(19),
	datad => VCC,
	cin => \u_reset_delay|Add0~35\,
	combout => \u_reset_delay|Add0~36_combout\,
	cout => \u_reset_delay|Add0~37\);

-- Location: FF_X43_Y19_N17
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

-- Location: LCCOMB_X43_Y19_N18
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

-- Location: LCCOMB_X43_Y19_N24
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

-- Location: FF_X43_Y19_N25
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

-- Location: FF_X43_Y20_N5
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

-- Location: LCCOMB_X39_Y20_N16
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

-- Location: FF_X39_Y20_N17
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

-- Location: LCCOMB_X38_Y20_N8
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

-- Location: LCCOMB_X38_Y20_N6
\u_spi_ee_config|u_spi_controller|spi_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count~0_combout\ = (\u_spi_ee_config|u_spi_controller|Add0~0_combout\ & \u_spi_ee_config|u_spi_controller|spi_count_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|u_spi_controller|Add0~0_combout\,
	datad => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count~0_combout\);

-- Location: FF_X39_Y20_N15
\u_spi_ee_config|u_spi_controller|spi_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|spi_count~0_combout\,
	clrn => \u_reset_delay|oRST_xhdl1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|spi_count\(3));

-- Location: LCCOMB_X39_Y20_N14
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

-- Location: LCCOMB_X39_Y20_N0
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

-- Location: FF_X39_Y20_N1
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

-- Location: LCCOMB_X40_Y20_N10
\u_spi_ee_config|ini_index[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|ini_index[1]~0_combout\ = (\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & (\u_spi_ee_config|ini_index\(0) & (!\u_spi_ee_config|LessThan0~0_combout\ & \u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datab => \u_spi_ee_config|ini_index\(0),
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|ini_index[1]~0_combout\);

-- Location: LCCOMB_X40_Y20_N14
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

-- Location: FF_X40_Y20_N15
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

-- Location: LCCOMB_X40_Y20_N28
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

-- Location: FF_X40_Y20_N29
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

-- Location: LCCOMB_X40_Y20_N18
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

-- Location: FF_X40_Y20_N19
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

-- Location: LCCOMB_X40_Y20_N4
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

-- Location: LCCOMB_X39_Y20_N12
\u_spi_ee_config|high_byte~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|high_byte~0_combout\ = (\u_spi_ee_config|spi_go~q\ & (\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & \u_spi_ee_config|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datad => \u_spi_ee_config|LessThan0~0_combout\,
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

-- Location: LCCOMB_X40_Y20_N6
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

-- Location: FF_X40_Y20_N5
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

-- Location: LCCOMB_X38_Y20_N0
\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\ = (\u_spi_ee_config|p2s_data\(15) & (\u_spi_ee_config|u_spi_controller|spi_count\(3) & \u_reset_delay|oRST_xhdl1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(15),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_reset_delay|oRST_xhdl1~q\,
	combout => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\);

-- Location: FF_X37_Y21_N25
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
	ena => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0));

-- Location: LCCOMB_X38_Y20_N2
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

-- Location: FF_X38_Y20_N3
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

-- Location: LCCOMB_X38_Y20_N18
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

-- Location: FF_X38_Y20_N19
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

-- Location: LCCOMB_X38_Y20_N16
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

-- Location: FF_X38_Y20_N17
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

-- Location: LCCOMB_X38_Y20_N30
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

-- Location: FF_X38_Y20_N31
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

-- Location: LCCOMB_X38_Y20_N20
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

-- Location: FF_X38_Y20_N21
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

-- Location: LCCOMB_X38_Y20_N28
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

-- Location: FF_X38_Y20_N29
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

-- Location: LCCOMB_X38_Y20_N22
\u_spi_ee_config|read_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_ready~0_combout\ = (\u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6) & !\u_spi_ee_config|read_back~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(6),
	datad => \u_spi_ee_config|read_back~q\,
	combout => \u_spi_ee_config|read_ready~0_combout\);

-- Location: LCCOMB_X39_Y20_N26
\u_spi_ee_config|read_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_ready~1_combout\ = (\u_spi_ee_config|high_byte~0_combout\ & ((\u_reset_delay|oRST_xhdl1~q\ & (\u_spi_ee_config|read_ready~0_combout\)) # (!\u_reset_delay|oRST_xhdl1~q\ & ((\u_spi_ee_config|read_ready~q\))))) # 
-- (!\u_spi_ee_config|high_byte~0_combout\ & (((\u_spi_ee_config|read_ready~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~0_combout\,
	datab => \u_spi_ee_config|read_ready~0_combout\,
	datac => \u_spi_ee_config|read_ready~q\,
	datad => \u_reset_delay|oRST_xhdl1~q\,
	combout => \u_spi_ee_config|read_ready~1_combout\);

-- Location: FF_X39_Y20_N27
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

-- Location: LCCOMB_X39_Y20_N10
\u_spi_ee_config|p2s_data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~13_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & ((\u_spi_ee_config|high_byte~q\) # (\u_spi_ee_config|read_ready~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|high_byte~q\,
	datac => \u_spi_ee_config|read_ready~q\,
	datad => \u_spi_ee_config|LessThan0~0_combout\,
	combout => \u_spi_ee_config|p2s_data~13_combout\);

-- Location: LCCOMB_X39_Y20_N24
\u_spi_ee_config|read_back~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_back~1_combout\ = (\u_spi_ee_config|high_byte~0_combout\ & (!\u_spi_ee_config|spi_go~q\ & ((\u_spi_ee_config|p2s_data~13_combout\)))) # (!\u_spi_ee_config|high_byte~0_combout\ & ((\u_spi_ee_config|read_back~q\) # 
-- ((!\u_spi_ee_config|spi_go~q\ & \u_spi_ee_config|p2s_data~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|read_back~q\,
	datad => \u_spi_ee_config|p2s_data~13_combout\,
	combout => \u_spi_ee_config|read_back~1_combout\);

-- Location: FF_X39_Y20_N25
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

-- Location: LCCOMB_X39_Y20_N20
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

-- Location: FF_X39_Y20_N21
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

-- Location: LCCOMB_X38_Y21_N2
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

-- Location: LCCOMB_X39_Y20_N8
\u_spi_ee_config|read_idle_count[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_idle_count[14]~45_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (((!\u_spi_ee_config|read_back~q\ & \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\)) # (!\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_back~q\,
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datad => \u_spi_ee_config|LessThan0~0_combout\,
	combout => \u_spi_ee_config|read_idle_count[14]~45_combout\);

-- Location: FF_X38_Y21_N3
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

-- Location: LCCOMB_X38_Y21_N4
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

-- Location: FF_X38_Y21_N5
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

-- Location: LCCOMB_X38_Y21_N6
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

-- Location: FF_X38_Y21_N7
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

-- Location: LCCOMB_X38_Y21_N8
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

-- Location: FF_X38_Y21_N9
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

-- Location: LCCOMB_X38_Y21_N10
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

-- Location: FF_X38_Y21_N11
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

-- Location: LCCOMB_X38_Y21_N12
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

-- Location: FF_X38_Y21_N13
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

-- Location: LCCOMB_X38_Y21_N14
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

-- Location: FF_X38_Y21_N15
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

-- Location: LCCOMB_X38_Y21_N16
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

-- Location: FF_X38_Y21_N17
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

-- Location: LCCOMB_X38_Y21_N18
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

-- Location: FF_X38_Y21_N19
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

-- Location: LCCOMB_X38_Y21_N20
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

-- Location: FF_X38_Y21_N21
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

-- Location: LCCOMB_X38_Y21_N22
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

-- Location: FF_X38_Y21_N23
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

-- Location: LCCOMB_X38_Y21_N24
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

-- Location: FF_X38_Y21_N25
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

-- Location: LCCOMB_X38_Y21_N26
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

-- Location: FF_X38_Y21_N27
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

-- Location: LCCOMB_X38_Y21_N28
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

-- Location: FF_X38_Y21_N29
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

-- Location: LCCOMB_X38_Y21_N30
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

-- Location: FF_X38_Y21_N31
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

-- Location: LCCOMB_X43_Y20_N6
\u_spi_ee_config|read_back~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|read_back~0_combout\ = (!\u_spi_ee_config|high_byte~q\ & !\u_spi_ee_config|read_ready~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~q\,
	datac => \u_spi_ee_config|read_ready~q\,
	combout => \u_spi_ee_config|read_back~0_combout\);

-- Location: LCCOMB_X40_Y20_N26
\u_spi_ee_config|clear_status~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~0_combout\ = (\u_spi_ee_config|read_back~0_combout\ & (!\u_spi_ee_config|spi_go~q\ & (\u_spi_ee_config|LessThan0~0_combout\ & !\u_spi_ee_config|spi_go~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|read_back~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|spi_go~0_combout\,
	combout => \u_spi_ee_config|clear_status~0_combout\);

-- Location: LCCOMB_X39_Y20_N6
\u_spi_ee_config|clear_status~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|clear_status~1_combout\ = (\u_spi_ee_config|clear_status~0_combout\) # ((\u_spi_ee_config|clear_status~q\ & ((\u_spi_ee_config|read_back~q\) # (!\u_spi_ee_config|high_byte~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~0_combout\,
	datab => \u_spi_ee_config|clear_status~0_combout\,
	datac => \u_spi_ee_config|clear_status~q\,
	datad => \u_spi_ee_config|read_back~q\,
	combout => \u_spi_ee_config|clear_status~1_combout\);

-- Location: FF_X39_Y20_N7
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

-- Location: LCCOMB_X44_Y20_N18
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

-- Location: FF_X44_Y20_N19
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

-- Location: LCCOMB_X44_Y20_N12
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

-- Location: FF_X44_Y20_N13
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

-- Location: LCCOMB_X44_Y20_N22
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

-- Location: FF_X44_Y20_N23
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

-- Location: FF_X44_Y20_N29
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

-- Location: IOIBUF_X53_Y20_N15
\G_SENSOR_INT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_G_SENSOR_INT,
	o => \G_SENSOR_INT~input_o\);

-- Location: LCCOMB_X44_Y20_N28
\u_spi_ee_config|spi_go~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|spi_go~0_combout\ = (!\u_spi_ee_config|read_idle_count\(14) & ((\u_spi_ee_config|clear_status_d\(3)) # (!\G_SENSOR_INT~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|read_idle_count\(14),
	datac => \u_spi_ee_config|clear_status_d\(3),
	datad => \G_SENSOR_INT~input_o\,
	combout => \u_spi_ee_config|spi_go~0_combout\);

-- Location: LCCOMB_X43_Y20_N10
\u_spi_ee_config|p2s_data[15]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[15]~12_combout\ = (!\u_spi_ee_config|high_byte~q\ & (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|read_ready~q\ & \u_spi_ee_config|spi_go~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte~q\,
	datab => \u_spi_ee_config|LessThan0~0_combout\,
	datac => \u_spi_ee_config|read_ready~q\,
	datad => \u_spi_ee_config|spi_go~0_combout\,
	combout => \u_spi_ee_config|p2s_data[15]~12_combout\);

-- Location: LCCOMB_X40_Y20_N16
\u_spi_ee_config|spi_go~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|spi_go~1_combout\ = (\u_spi_ee_config|spi_go~q\ & (!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\)) # (!\u_spi_ee_config|spi_go~q\ & ((!\u_spi_ee_config|p2s_data[15]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|spi_go~q\,
	datad => \u_spi_ee_config|p2s_data[15]~12_combout\,
	combout => \u_spi_ee_config|spi_go~1_combout\);

-- Location: FF_X40_Y20_N17
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

-- Location: LCCOMB_X39_Y20_N4
\u_spi_ee_config|u_spi_controller|spi_count_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\ = (!\u_spi_ee_config|u_spi_controller|WideOr0~0_combout\ & ((\u_spi_ee_config|u_spi_controller|spi_count_en~q\) # (\u_spi_ee_config|spi_go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_spi_ee_config|u_spi_controller|WideOr0~0_combout\,
	datac => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datad => \u_spi_ee_config|spi_go~q\,
	combout => \u_spi_ee_config|u_spi_controller|spi_count_en~0_combout\);

-- Location: FF_X39_Y20_N5
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

-- Location: LCCOMB_X39_Y20_N28
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

-- Location: FF_X39_Y20_N29
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

-- Location: LCCOMB_X39_Y20_N18
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

-- Location: FF_X39_Y20_N19
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

-- Location: LCCOMB_X41_Y20_N30
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

-- Location: LCCOMB_X39_Y20_N30
\u_spi_ee_config|p2s_data[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data[6]~6_combout\ = (!\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|spi_go~q\ & \u_reset_delay|oRST_xhdl1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|LessThan0~0_combout\,
	datab => \u_spi_ee_config|spi_go~q\,
	datad => \u_reset_delay|oRST_xhdl1~q\,
	combout => \u_spi_ee_config|p2s_data[6]~6_combout\);

-- Location: FF_X41_Y20_N31
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

-- Location: LCCOMB_X41_Y20_N0
\u_spi_ee_config|u_spi_controller|Mux0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~7_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (\u_spi_ee_config|p2s_data\(6) & ((\u_spi_ee_config|u_spi_controller|spi_count\(0))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- (((\u_spi_ee_config|p2s_data\(15) & !\u_spi_ee_config|u_spi_controller|spi_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(6),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|p2s_data\(15),
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~7_combout\);

-- Location: FF_X39_Y20_N3
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

-- Location: LCCOMB_X39_Y20_N2
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

-- Location: FF_X40_Y20_N21
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

-- Location: LCCOMB_X40_Y20_N0
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

-- Location: FF_X40_Y20_N1
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

-- Location: LCCOMB_X40_Y20_N2
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

-- Location: LCCOMB_X40_Y20_N24
\u_spi_ee_config|p2s_data~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~11_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (!\u_spi_ee_config|direction~q\ & ((!\u_spi_ee_config|read_back~0_combout\)))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (((\u_spi_ee_config|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|direction~q\,
	datab => \u_spi_ee_config|Mux3~0_combout\,
	datac => \u_spi_ee_config|LessThan0~0_combout\,
	datad => \u_spi_ee_config|read_back~0_combout\,
	combout => \u_spi_ee_config|p2s_data~11_combout\);

-- Location: FF_X40_Y20_N25
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

-- Location: LCCOMB_X41_Y20_N6
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

-- Location: FF_X41_Y20_N7
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

-- Location: LCCOMB_X41_Y20_N24
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

-- Location: FF_X41_Y20_N25
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

-- Location: LCCOMB_X41_Y20_N8
\u_spi_ee_config|u_spi_controller|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~4_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & (\u_spi_ee_config|p2s_data\(0) & (\u_spi_ee_config|u_spi_controller|spi_count\(3)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- (((\u_spi_ee_config|p2s_data\(1)) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(0),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|p2s_data\(1),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~4_combout\);

-- Location: LCCOMB_X40_Y20_N12
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

-- Location: LCCOMB_X40_Y20_N22
\u_spi_ee_config|p2s_data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~10_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & ((\u_spi_ee_config|high_byte~q\))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|Mux4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|Mux4~0_combout\,
	datab => \u_spi_ee_config|LessThan0~0_combout\,
	datac => \u_spi_ee_config|high_byte~q\,
	combout => \u_spi_ee_config|p2s_data~10_combout\);

-- Location: FF_X40_Y20_N23
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

-- Location: LCCOMB_X38_Y20_N4
\u_spi_ee_config|u_spi_controller|Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~5_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(3) & (((\u_spi_ee_config|u_spi_controller|Mux0~4_combout\)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- ((\u_spi_ee_config|u_spi_controller|Mux0~4_combout\ & (\u_spi_ee_config|p2s_data\(9))) # (!\u_spi_ee_config|u_spi_controller|Mux0~4_combout\ & ((\u_spi_ee_config|p2s_data\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(9),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datac => \u_spi_ee_config|u_spi_controller|Mux0~4_combout\,
	datad => \u_spi_ee_config|p2s_data\(8),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~5_combout\);

-- Location: LCCOMB_X41_Y20_N12
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

-- Location: FF_X41_Y20_N13
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

-- Location: LCCOMB_X40_Y20_N30
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

-- Location: LCCOMB_X40_Y20_N8
\u_spi_ee_config|p2s_data~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|p2s_data~9_combout\ = (\u_spi_ee_config|LessThan0~0_combout\ & (\u_spi_ee_config|direction~q\ & ((!\u_spi_ee_config|read_back~0_combout\)))) # (!\u_spi_ee_config|LessThan0~0_combout\ & (((!\u_spi_ee_config|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001110001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|direction~q\,
	datab => \u_spi_ee_config|LessThan0~0_combout\,
	datac => \u_spi_ee_config|Mux2~0_combout\,
	datad => \u_spi_ee_config|read_back~0_combout\,
	combout => \u_spi_ee_config|p2s_data~9_combout\);

-- Location: FF_X40_Y20_N9
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

-- Location: LCCOMB_X41_Y20_N20
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

-- Location: FF_X41_Y20_N21
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

-- Location: LCCOMB_X41_Y20_N14
\u_spi_ee_config|u_spi_controller|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~2_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & ((\u_spi_ee_config|u_spi_controller|spi_count\(3) & ((\u_spi_ee_config|p2s_data\(2)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- (\u_spi_ee_config|p2s_data\(10))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & (((!\u_spi_ee_config|u_spi_controller|spi_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(10),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|p2s_data\(2),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~2_combout\);

-- Location: LCCOMB_X41_Y20_N18
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

-- Location: FF_X41_Y20_N19
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

-- Location: LCCOMB_X41_Y20_N10
\u_spi_ee_config|u_spi_controller|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~3_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & (((\u_spi_ee_config|u_spi_controller|Mux0~2_combout\)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & 
-- ((\u_spi_ee_config|u_spi_controller|Mux0~2_combout\ & (\u_spi_ee_config|p2s_data\(11))) # (!\u_spi_ee_config|u_spi_controller|Mux0~2_combout\ & ((\u_spi_ee_config|p2s_data\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(11),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datac => \u_spi_ee_config|u_spi_controller|Mux0~2_combout\,
	datad => \u_spi_ee_config|p2s_data\(3),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~3_combout\);

-- Location: LCCOMB_X39_Y20_N22
\u_spi_ee_config|u_spi_controller|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~6_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(1) & (\u_spi_ee_config|u_spi_controller|spi_count\(2) & (\u_spi_ee_config|u_spi_controller|Mux0~5_combout\))) # 
-- (!\u_spi_ee_config|u_spi_controller|spi_count\(1) & (((\u_spi_ee_config|u_spi_controller|Mux0~3_combout\)) # (!\u_spi_ee_config|u_spi_controller|spi_count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(1),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datac => \u_spi_ee_config|u_spi_controller|Mux0~5_combout\,
	datad => \u_spi_ee_config|u_spi_controller|Mux0~3_combout\,
	combout => \u_spi_ee_config|u_spi_controller|Mux0~6_combout\);

-- Location: LCCOMB_X41_Y20_N22
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

-- Location: FF_X41_Y20_N23
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

-- Location: LCCOMB_X41_Y20_N26
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

-- Location: FF_X41_Y20_N27
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

-- Location: LCCOMB_X41_Y20_N28
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

-- Location: FF_X41_Y20_N29
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

-- Location: LCCOMB_X41_Y20_N4
\u_spi_ee_config|u_spi_controller|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(0) & ((\u_spi_ee_config|u_spi_controller|spi_count\(3) & ((\u_spi_ee_config|p2s_data\(4)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3) & 
-- (\u_spi_ee_config|p2s_data\(12))))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(0) & (((!\u_spi_ee_config|u_spi_controller|spi_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(12),
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	datac => \u_spi_ee_config|u_spi_controller|spi_count\(3),
	datad => \u_spi_ee_config|p2s_data\(4),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~0_combout\);

-- Location: LCCOMB_X41_Y20_N16
\u_spi_ee_config|u_spi_controller|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~1_combout\ = (\u_spi_ee_config|u_spi_controller|Mux0~0_combout\) # ((\u_spi_ee_config|p2s_data\(5) & !\u_spi_ee_config|u_spi_controller|spi_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|p2s_data\(5),
	datab => \u_spi_ee_config|u_spi_controller|Mux0~0_combout\,
	datad => \u_spi_ee_config|u_spi_controller|spi_count\(0),
	combout => \u_spi_ee_config|u_spi_controller|Mux0~1_combout\);

-- Location: LCCOMB_X41_Y20_N2
\u_spi_ee_config|u_spi_controller|Mux0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|Mux0~8_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count\(2) & (((\u_spi_ee_config|u_spi_controller|Mux0~6_combout\)))) # (!\u_spi_ee_config|u_spi_controller|spi_count\(2) & 
-- ((\u_spi_ee_config|u_spi_controller|Mux0~6_combout\ & (\u_spi_ee_config|u_spi_controller|Mux0~7_combout\)) # (!\u_spi_ee_config|u_spi_controller|Mux0~6_combout\ & ((\u_spi_ee_config|u_spi_controller|Mux0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count\(2),
	datab => \u_spi_ee_config|u_spi_controller|Mux0~7_combout\,
	datac => \u_spi_ee_config|u_spi_controller|Mux0~6_combout\,
	datad => \u_spi_ee_config|u_spi_controller|Mux0~1_combout\,
	combout => \u_spi_ee_config|u_spi_controller|Mux0~8_combout\);

-- Location: LCCOMB_X38_Y20_N12
\u_spi_ee_config|u_spi_controller|temp_xhdl7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|u_spi_controller|temp_xhdl7~0_combout\ = (\u_spi_ee_config|u_spi_controller|spi_count_en~q\ & ((!\u_spi_ee_config|p2s_data\(15)) # (!\u_spi_ee_config|u_spi_controller|spi_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|u_spi_controller|spi_count_en~q\,
	datab => \u_spi_ee_config|u_spi_controller|spi_count\(3),
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

-- Location: LCCOMB_X38_Y20_N24
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

-- Location: LCCOMB_X26_Y21_N16
\u_vga|Add23~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~10_combout\ = (\u_vga|h_cnt\(5) & (!\u_vga|Add23~9\)) # (!\u_vga|h_cnt\(5) & ((\u_vga|Add23~9\) # (GND)))
-- \u_vga|Add23~11\ = CARRY((!\u_vga|Add23~9\) # (!\u_vga|h_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|Add23~9\,
	combout => \u_vga|Add23~10_combout\,
	cout => \u_vga|Add23~11\);

-- Location: LCCOMB_X26_Y21_N18
\u_vga|Add23~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~12_combout\ = (\u_vga|h_cnt\(6) & (\u_vga|Add23~11\ $ (GND))) # (!\u_vga|h_cnt\(6) & (!\u_vga|Add23~11\ & VCC))
-- \u_vga|Add23~13\ = CARRY((\u_vga|h_cnt\(6) & !\u_vga|Add23~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(6),
	datad => VCC,
	cin => \u_vga|Add23~11\,
	combout => \u_vga|Add23~12_combout\,
	cout => \u_vga|Add23~13\);

-- Location: FF_X26_Y21_N19
\u_vga|h_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add23~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(6));

-- Location: LCCOMB_X26_Y21_N20
\u_vga|Add23~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~14_combout\ = (\u_vga|h_cnt\(7) & (!\u_vga|Add23~13\)) # (!\u_vga|h_cnt\(7) & ((\u_vga|Add23~13\) # (GND)))
-- \u_vga|Add23~15\ = CARRY((!\u_vga|Add23~13\) # (!\u_vga|h_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|Add23~13\,
	combout => \u_vga|Add23~14_combout\,
	cout => \u_vga|Add23~15\);

-- Location: FF_X26_Y21_N21
\u_vga|h_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add23~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(7));

-- Location: LCCOMB_X26_Y21_N22
\u_vga|Add23~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~16_combout\ = (\u_vga|h_cnt\(8) & (\u_vga|Add23~15\ $ (GND))) # (!\u_vga|h_cnt\(8) & (!\u_vga|Add23~15\ & VCC))
-- \u_vga|Add23~17\ = CARRY((\u_vga|h_cnt\(8) & !\u_vga|Add23~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(8),
	datad => VCC,
	cin => \u_vga|Add23~15\,
	combout => \u_vga|Add23~16_combout\,
	cout => \u_vga|Add23~17\);

-- Location: FF_X26_Y21_N3
\u_vga|h_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|Add23~16_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(8));

-- Location: LCCOMB_X26_Y21_N24
\u_vga|Add23~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~18_combout\ = (\u_vga|h_cnt\(9) & (!\u_vga|Add23~17\)) # (!\u_vga|h_cnt\(9) & ((\u_vga|Add23~17\) # (GND)))
-- \u_vga|Add23~19\ = CARRY((!\u_vga|Add23~17\) # (!\u_vga|h_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datad => VCC,
	cin => \u_vga|Add23~17\,
	combout => \u_vga|Add23~18_combout\,
	cout => \u_vga|Add23~19\);

-- Location: FF_X26_Y21_N1
\u_vga|h_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|Add23~18_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(9));

-- Location: LCCOMB_X26_Y21_N26
\u_vga|Add23~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~20_combout\ = \u_vga|h_cnt\(10) $ (!\u_vga|Add23~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(10),
	cin => \u_vga|Add23~19\,
	combout => \u_vga|Add23~20_combout\);

-- Location: LCCOMB_X26_Y21_N6
\u_vga|Add23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~0_combout\ = \u_vga|h_cnt\(0) $ (VCC)
-- \u_vga|Add23~1\ = CARRY(\u_vga|h_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datad => VCC,
	combout => \u_vga|Add23~0_combout\,
	cout => \u_vga|Add23~1\);

-- Location: FF_X26_Y21_N31
\u_vga|h_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|Add23~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(0));

-- Location: LCCOMB_X26_Y21_N8
\u_vga|Add23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~2_combout\ = (\u_vga|h_cnt\(1) & (!\u_vga|Add23~1\)) # (!\u_vga|h_cnt\(1) & ((\u_vga|Add23~1\) # (GND)))
-- \u_vga|Add23~3\ = CARRY((!\u_vga|Add23~1\) # (!\u_vga|h_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(1),
	datad => VCC,
	cin => \u_vga|Add23~1\,
	combout => \u_vga|Add23~2_combout\,
	cout => \u_vga|Add23~3\);

-- Location: FF_X26_Y21_N29
\u_vga|h_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|Add23~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(1));

-- Location: LCCOMB_X26_Y21_N10
\u_vga|Add23~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~4_combout\ = (\u_vga|h_cnt\(2) & (\u_vga|Add23~3\ $ (GND))) # (!\u_vga|h_cnt\(2) & (!\u_vga|Add23~3\ & VCC))
-- \u_vga|Add23~5\ = CARRY((\u_vga|h_cnt\(2) & !\u_vga|Add23~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datad => VCC,
	cin => \u_vga|Add23~3\,
	combout => \u_vga|Add23~4_combout\,
	cout => \u_vga|Add23~5\);

-- Location: FF_X26_Y21_N11
\u_vga|h_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add23~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(2));

-- Location: LCCOMB_X26_Y21_N12
\u_vga|Add23~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~6_combout\ = (\u_vga|h_cnt\(3) & (!\u_vga|Add23~5\)) # (!\u_vga|h_cnt\(3) & ((\u_vga|Add23~5\) # (GND)))
-- \u_vga|Add23~7\ = CARRY((!\u_vga|Add23~5\) # (!\u_vga|h_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(3),
	datad => VCC,
	cin => \u_vga|Add23~5\,
	combout => \u_vga|Add23~6_combout\,
	cout => \u_vga|Add23~7\);

-- Location: FF_X26_Y21_N5
\u_vga|h_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|Add23~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(3));

-- Location: LCCOMB_X31_Y21_N8
\u_vga|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal1~1_combout\ = (\u_vga|h_cnt\(2) & (\u_vga|h_cnt\(1) & (\u_vga|h_cnt\(0) & \u_vga|h_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|h_cnt\(1),
	datac => \u_vga|h_cnt\(0),
	datad => \u_vga|h_cnt\(3),
	combout => \u_vga|Equal1~1_combout\);

-- Location: LCCOMB_X27_Y21_N20
\u_vga|h_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|h_cnt~0_combout\ = (\u_vga|Add23~20_combout\ & (((!\u_vga|vga_gen~13_combout\) # (!\u_vga|h_cnt\(10))) # (!\u_vga|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add23~20_combout\,
	datab => \u_vga|Equal1~1_combout\,
	datac => \u_vga|h_cnt\(10),
	datad => \u_vga|vga_gen~13_combout\,
	combout => \u_vga|h_cnt~0_combout\);

-- Location: FF_X27_Y21_N21
\u_vga|h_cnt[10]\ : dffeas
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
	q => \u_vga|h_cnt\(10));

-- Location: LCCOMB_X26_Y21_N14
\u_vga|Add23~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add23~8_combout\ = (\u_vga|h_cnt\(4) & (\u_vga|Add23~7\ $ (GND))) # (!\u_vga|h_cnt\(4) & (!\u_vga|Add23~7\ & VCC))
-- \u_vga|Add23~9\ = CARRY((\u_vga|h_cnt\(4) & !\u_vga|Add23~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(4),
	datad => VCC,
	cin => \u_vga|Add23~7\,
	combout => \u_vga|Add23~8_combout\,
	cout => \u_vga|Add23~9\);

-- Location: LCCOMB_X27_Y21_N4
\u_vga|h_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|h_cnt~1_combout\ = (\u_vga|Add23~8_combout\ & (((!\u_vga|Equal1~1_combout\) # (!\u_vga|h_cnt\(10))) # (!\u_vga|vga_gen~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~13_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|Add23~8_combout\,
	datad => \u_vga|Equal1~1_combout\,
	combout => \u_vga|h_cnt~1_combout\);

-- Location: FF_X27_Y21_N5
\u_vga|h_cnt[4]\ : dffeas
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
	q => \u_vga|h_cnt\(4));

-- Location: FF_X26_Y21_N17
\u_vga|h_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add23~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_cnt\(5));

-- Location: LCCOMB_X26_Y21_N4
\u_vga|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal1~0_combout\ = (!\u_vga|h_cnt\(5) & (!\u_vga|h_cnt\(6) & !\u_vga|h_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|h_cnt\(6),
	datad => \u_vga|h_cnt\(7),
	combout => \u_vga|Equal1~0_combout\);

-- Location: LCCOMB_X26_Y21_N2
\u_vga|vga_gen~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~13_combout\ = (\u_vga|Equal1~0_combout\ & (!\u_vga|h_cnt\(4) & (!\u_vga|h_cnt\(8) & !\u_vga|h_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal1~0_combout\,
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|h_cnt\(9),
	combout => \u_vga|vga_gen~13_combout\);

-- Location: LCCOMB_X28_Y21_N6
\u_vga|Add24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~0_combout\ = \u_vga|v_cnt\(0) $ (VCC)
-- \u_vga|Add24~1\ = CARRY(\u_vga|v_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(0),
	datad => VCC,
	combout => \u_vga|Add24~0_combout\,
	cout => \u_vga|Add24~1\);

-- Location: LCCOMB_X29_Y21_N20
\u_vga|v_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~11_combout\ = (\u_vga|Add24~0_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add24~0_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~11_combout\);

-- Location: LCCOMB_X27_Y21_N16
\u_vga|v_cnt[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[4]~1_combout\ = (\u_vga|h_cnt\(10) & ((\u_vga|vga_gen~13_combout\ & ((\u_vga|Equal1~1_combout\))) # (!\u_vga|vga_gen~13_combout\ & (!\u_vga|vga_gen~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~13_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|vga_gen~32_combout\,
	datad => \u_vga|Equal1~1_combout\,
	combout => \u_vga|v_cnt[4]~1_combout\);

-- Location: FF_X29_Y21_N21
\u_vga|v_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~11_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(0));

-- Location: LCCOMB_X28_Y21_N8
\u_vga|Add24~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~2_combout\ = (\u_vga|v_cnt\(1) & (!\u_vga|Add24~1\)) # (!\u_vga|v_cnt\(1) & ((\u_vga|Add24~1\) # (GND)))
-- \u_vga|Add24~3\ = CARRY((!\u_vga|Add24~1\) # (!\u_vga|v_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(1),
	datad => VCC,
	cin => \u_vga|Add24~1\,
	combout => \u_vga|Add24~2_combout\,
	cout => \u_vga|Add24~3\);

-- Location: LCCOMB_X29_Y20_N28
\u_vga|v_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~10_combout\ = (\u_vga|Add24~2_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add24~2_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~10_combout\);

-- Location: LCCOMB_X28_Y20_N18
\u_vga|v_cnt[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[1]~feeder_combout\ = \u_vga|v_cnt~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|v_cnt~10_combout\,
	combout => \u_vga|v_cnt[1]~feeder_combout\);

-- Location: FF_X28_Y20_N19
\u_vga|v_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt[1]~feeder_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(1));

-- Location: LCCOMB_X28_Y21_N10
\u_vga|Add24~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~4_combout\ = (\u_vga|v_cnt\(2) & (\u_vga|Add24~3\ $ (GND))) # (!\u_vga|v_cnt\(2) & (!\u_vga|Add24~3\ & VCC))
-- \u_vga|Add24~5\ = CARRY((\u_vga|v_cnt\(2) & !\u_vga|Add24~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(2),
	datad => VCC,
	cin => \u_vga|Add24~3\,
	combout => \u_vga|Add24~4_combout\,
	cout => \u_vga|Add24~5\);

-- Location: LCCOMB_X29_Y21_N30
\u_vga|v_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~9_combout\ = (\u_vga|Add24~4_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add24~4_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~9_combout\);

-- Location: FF_X29_Y21_N31
\u_vga|v_cnt[2]\ : dffeas
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
	q => \u_vga|v_cnt\(2));

-- Location: LCCOMB_X28_Y21_N12
\u_vga|Add24~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~6_combout\ = (\u_vga|v_cnt\(3) & (!\u_vga|Add24~5\)) # (!\u_vga|v_cnt\(3) & ((\u_vga|Add24~5\) # (GND)))
-- \u_vga|Add24~7\ = CARRY((!\u_vga|Add24~5\) # (!\u_vga|v_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(3),
	datad => VCC,
	cin => \u_vga|Add24~5\,
	combout => \u_vga|Add24~6_combout\,
	cout => \u_vga|Add24~7\);

-- Location: LCCOMB_X29_Y21_N0
\u_vga|v_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~5_combout\ = (\u_vga|Add24~6_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add24~6_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~5_combout\);

-- Location: FF_X29_Y21_N1
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

-- Location: LCCOMB_X28_Y21_N14
\u_vga|Add24~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~8_combout\ = (\u_vga|v_cnt\(4) & (\u_vga|Add24~7\ $ (GND))) # (!\u_vga|v_cnt\(4) & (!\u_vga|Add24~7\ & VCC))
-- \u_vga|Add24~9\ = CARRY((\u_vga|v_cnt\(4) & !\u_vga|Add24~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datad => VCC,
	cin => \u_vga|Add24~7\,
	combout => \u_vga|Add24~8_combout\,
	cout => \u_vga|Add24~9\);

-- Location: LCCOMB_X28_Y21_N30
\u_vga|v_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~4_combout\ = (\u_vga|Add24~8_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add24~8_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~4_combout\);

-- Location: FF_X28_Y21_N31
\u_vga|v_cnt[4]\ : dffeas
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
	q => \u_vga|v_cnt\(4));

-- Location: LCCOMB_X28_Y21_N16
\u_vga|Add24~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~10_combout\ = (\u_vga|v_cnt\(5) & (!\u_vga|Add24~9\)) # (!\u_vga|v_cnt\(5) & ((\u_vga|Add24~9\) # (GND)))
-- \u_vga|Add24~11\ = CARRY((!\u_vga|Add24~9\) # (!\u_vga|v_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(5),
	datad => VCC,
	cin => \u_vga|Add24~9\,
	combout => \u_vga|Add24~10_combout\,
	cout => \u_vga|Add24~11\);

-- Location: LCCOMB_X28_Y21_N28
\u_vga|v_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~3_combout\ = (\u_vga|Add24~10_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add24~10_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~3_combout\);

-- Location: FF_X28_Y21_N29
\u_vga|v_cnt[5]\ : dffeas
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
	q => \u_vga|v_cnt\(5));

-- Location: LCCOMB_X28_Y21_N18
\u_vga|Add24~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~12_combout\ = (\u_vga|v_cnt\(6) & (\u_vga|Add24~11\ $ (GND))) # (!\u_vga|v_cnt\(6) & (!\u_vga|Add24~11\ & VCC))
-- \u_vga|Add24~13\ = CARRY((\u_vga|v_cnt\(6) & !\u_vga|Add24~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(6),
	datad => VCC,
	cin => \u_vga|Add24~11\,
	combout => \u_vga|Add24~12_combout\,
	cout => \u_vga|Add24~13\);

-- Location: LCCOMB_X27_Y21_N8
\u_vga|v_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~2_combout\ = (\u_vga|Add24~12_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add24~12_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~2_combout\);

-- Location: FF_X27_Y21_N9
\u_vga|v_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt~2_combout\,
	ena => \u_vga|v_cnt[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(6));

-- Location: LCCOMB_X29_Y20_N10
\u_vga|vga_gen~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~8_combout\ = (!\u_vga|v_cnt\(5) & !\u_vga|v_cnt\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|v_cnt\(6),
	combout => \u_vga|vga_gen~8_combout\);

-- Location: LCCOMB_X29_Y20_N16
\u_vga|update_elements_position~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~0_combout\ = (\u_vga|v_cnt\(4) & \u_vga|v_cnt\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datac => \u_vga|v_cnt\(3),
	combout => \u_vga|update_elements_position~0_combout\);

-- Location: LCCOMB_X28_Y21_N20
\u_vga|Add24~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~14_combout\ = (\u_vga|v_cnt\(7) & (!\u_vga|Add24~13\)) # (!\u_vga|v_cnt\(7) & ((\u_vga|Add24~13\) # (GND)))
-- \u_vga|Add24~15\ = CARRY((!\u_vga|Add24~13\) # (!\u_vga|v_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datad => VCC,
	cin => \u_vga|Add24~13\,
	combout => \u_vga|Add24~14_combout\,
	cout => \u_vga|Add24~15\);

-- Location: LCCOMB_X27_Y21_N14
\u_vga|v_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~0_combout\ = (\u_vga|Add24~14_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add24~14_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~0_combout\);

-- Location: FF_X27_Y21_N15
\u_vga|v_cnt[7]\ : dffeas
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
	q => \u_vga|v_cnt\(7));

-- Location: LCCOMB_X29_Y20_N0
\u_vga|vga_gen~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~7_combout\ = (!\u_vga|v_cnt\(2) & (!\u_vga|v_cnt\(1) & !\u_vga|v_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(2),
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(0),
	combout => \u_vga|vga_gen~7_combout\);

-- Location: LCCOMB_X29_Y20_N6
\u_vga|vga_gen~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~31_combout\ = ((\u_vga|vga_gen~8_combout\ & ((\u_vga|vga_gen~7_combout\) # (!\u_vga|update_elements_position~0_combout\)))) # (!\u_vga|v_cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~8_combout\,
	datab => \u_vga|update_elements_position~0_combout\,
	datac => \u_vga|v_cnt\(7),
	datad => \u_vga|vga_gen~7_combout\,
	combout => \u_vga|vga_gen~31_combout\);

-- Location: LCCOMB_X28_Y21_N22
\u_vga|Add24~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~16_combout\ = (\u_vga|v_cnt\(8) & (\u_vga|Add24~15\ $ (GND))) # (!\u_vga|v_cnt\(8) & (!\u_vga|Add24~15\ & VCC))
-- \u_vga|Add24~17\ = CARRY((\u_vga|v_cnt\(8) & !\u_vga|Add24~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(8),
	datad => VCC,
	cin => \u_vga|Add24~15\,
	combout => \u_vga|Add24~16_combout\,
	cout => \u_vga|Add24~17\);

-- Location: LCCOMB_X27_Y21_N22
\u_vga|v_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt~7_combout\ = (\u_vga|Add24~16_combout\ & \u_vga|vga_gen~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add24~16_combout\,
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt~7_combout\);

-- Location: FF_X27_Y21_N23
\u_vga|v_cnt[8]\ : dffeas
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
	q => \u_vga|v_cnt\(8));

-- Location: LCCOMB_X28_Y20_N10
\u_vga|vga_gen~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~32_combout\ = (!\u_vga|v_cnt\(10) & (((\u_vga|vga_gen~31_combout\ & !\u_vga|v_cnt\(8))) # (!\u_vga|v_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~31_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|v_cnt\(8),
	combout => \u_vga|vga_gen~32_combout\);

-- Location: LCCOMB_X30_Y17_N2
\u_vga|vga_gen~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~33_combout\ = ((\u_vga|vga_gen~32_combout\) # ((\u_vga|vga_gen~13_combout\ & !\u_vga|Equal1~1_combout\))) # (!\u_vga|h_cnt\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~13_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|Equal1~1_combout\,
	datad => \u_vga|vga_gen~32_combout\,
	combout => \u_vga|vga_gen~33_combout\);

-- Location: LCCOMB_X28_Y21_N24
\u_vga|Add24~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~18_combout\ = (\u_vga|v_cnt\(9) & (!\u_vga|Add24~17\)) # (!\u_vga|v_cnt\(9) & ((\u_vga|Add24~17\) # (GND)))
-- \u_vga|Add24~19\ = CARRY((!\u_vga|Add24~17\) # (!\u_vga|v_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(9),
	datad => VCC,
	cin => \u_vga|Add24~17\,
	combout => \u_vga|Add24~18_combout\,
	cout => \u_vga|Add24~19\);

-- Location: LCCOMB_X28_Y21_N0
\u_vga|v_cnt[9]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[9]~6_combout\ = (\u_vga|v_cnt[4]~1_combout\ & (\u_vga|vga_gen~33_combout\ & ((\u_vga|Add24~18_combout\)))) # (!\u_vga|v_cnt[4]~1_combout\ & (((\u_vga|v_cnt\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~33_combout\,
	datab => \u_vga|v_cnt[4]~1_combout\,
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|Add24~18_combout\,
	combout => \u_vga|v_cnt[9]~6_combout\);

-- Location: FF_X28_Y21_N1
\u_vga|v_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt[9]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(9));

-- Location: LCCOMB_X28_Y21_N26
\u_vga|Add24~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add24~20_combout\ = \u_vga|v_cnt\(10) $ (!\u_vga|Add24~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(10),
	cin => \u_vga|Add24~19\,
	combout => \u_vga|Add24~20_combout\);

-- Location: LCCOMB_X28_Y21_N4
\u_vga|v_cnt[10]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_cnt[10]~8_combout\ = (\u_vga|v_cnt[4]~1_combout\ & (\u_vga|Add24~20_combout\ & ((\u_vga|vga_gen~33_combout\)))) # (!\u_vga|v_cnt[4]~1_combout\ & (((\u_vga|v_cnt\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add24~20_combout\,
	datab => \u_vga|v_cnt[4]~1_combout\,
	datac => \u_vga|v_cnt\(10),
	datad => \u_vga|vga_gen~33_combout\,
	combout => \u_vga|v_cnt[10]~8_combout\);

-- Location: FF_X28_Y21_N5
\u_vga|v_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_cnt[10]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_cnt\(10));

-- Location: LCCOMB_X28_Y21_N2
\u_vga|vga_gen~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~1_combout\ = (!\u_vga|v_cnt\(10) & ((!\u_vga|v_cnt\(8)) # (!\u_vga|v_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|v_cnt\(8),
	combout => \u_vga|vga_gen~1_combout\);

-- Location: LCCOMB_X26_Y21_N0
\u_vga|LessThan13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan13~0_combout\ = (!\u_vga|h_cnt\(10) & (((\u_vga|Equal1~0_combout\) # (!\u_vga|h_cnt\(9))) # (!\u_vga|h_cnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(10),
	datab => \u_vga|h_cnt\(8),
	datac => \u_vga|h_cnt\(9),
	datad => \u_vga|Equal1~0_combout\,
	combout => \u_vga|LessThan13~0_combout\);

-- Location: LCCOMB_X28_Y20_N30
\u_vga|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal9~0_combout\ = (!\u_vga|v_cnt\(5) & (!\u_vga|v_cnt\(4) & !\u_vga|v_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(5),
	datac => \u_vga|v_cnt\(4),
	datad => \u_vga|v_cnt\(3),
	combout => \u_vga|Equal9~0_combout\);

-- Location: LCCOMB_X28_Y20_N28
\u_vga|Equal9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal9~1_combout\ = (\u_vga|v_cnt\(7) & \u_vga|v_cnt\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|v_cnt\(7),
	datad => \u_vga|v_cnt\(6),
	combout => \u_vga|Equal9~1_combout\);

-- Location: LCCOMB_X29_Y20_N2
\u_vga|LessThan11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~0_combout\ = (\u_vga|v_cnt\(7)) # ((\u_vga|v_cnt\(6) & ((\u_vga|v_cnt\(5)) # (\u_vga|update_elements_position~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|update_elements_position~0_combout\,
	combout => \u_vga|LessThan11~0_combout\);

-- Location: LCCOMB_X28_Y20_N6
\u_vga|vga_gen~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~0_combout\ = (\u_vga|v_cnt\(9) & (((\u_vga|LessThan11~0_combout\)))) # (!\u_vga|v_cnt\(9) & ((\u_vga|Equal9~0_combout\) # ((!\u_vga|Equal9~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal9~0_combout\,
	datab => \u_vga|Equal9~1_combout\,
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|LessThan11~0_combout\,
	combout => \u_vga|vga_gen~0_combout\);

-- Location: LCCOMB_X26_Y22_N14
\u_vga|vga_gen~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~2_combout\ = (((!\u_vga|v_cnt\(8) & \u_vga|vga_gen~0_combout\)) # (!\u_vga|LessThan13~0_combout\)) # (!\u_vga|vga_gen~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~1_combout\,
	datab => \u_vga|LessThan13~0_combout\,
	datac => \u_vga|v_cnt\(8),
	datad => \u_vga|vga_gen~0_combout\,
	combout => \u_vga|vga_gen~2_combout\);

-- Location: LCCOMB_X28_Y20_N26
\u_vga|vga_gen~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~5_combout\ = (!\u_vga|v_cnt\(9) & (((!\u_vga|v_cnt\(5) & !\u_vga|v_cnt\(6))) # (!\u_vga|v_cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datab => \u_vga|v_cnt\(5),
	datac => \u_vga|v_cnt\(7),
	datad => \u_vga|v_cnt\(6),
	combout => \u_vga|vga_gen~5_combout\);

-- Location: LCCOMB_X28_Y20_N0
\u_vga|vga_gen~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~6_combout\ = (!\u_vga|v_cnt\(8) & ((\u_vga|vga_gen~5_combout\) # ((\u_vga|v_cnt\(9) & \u_vga|LessThan11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~5_combout\,
	datab => \u_vga|v_cnt\(8),
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|LessThan11~0_combout\,
	combout => \u_vga|vga_gen~6_combout\);

-- Location: LCCOMB_X28_Y20_N4
\u_vga|Equal9~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal9~2_combout\ = (!\u_vga|v_cnt\(8) & (!\u_vga|v_cnt\(9) & !\u_vga|v_cnt\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(8),
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|v_cnt\(10),
	combout => \u_vga|Equal9~2_combout\);

-- Location: LCCOMB_X28_Y20_N20
\u_vga|Equal9~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal9~3_combout\ = (\u_vga|v_cnt\(0) & (\u_vga|v_cnt\(2) & \u_vga|v_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(0),
	datab => \u_vga|v_cnt\(2),
	datad => \u_vga|v_cnt\(1),
	combout => \u_vga|Equal9~3_combout\);

-- Location: LCCOMB_X28_Y20_N8
\u_vga|Equal9~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal9~4_combout\ = (\u_vga|Equal9~0_combout\ & (\u_vga|Equal9~1_combout\ & (\u_vga|Equal9~2_combout\ & \u_vga|Equal9~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal9~0_combout\,
	datab => \u_vga|Equal9~1_combout\,
	datac => \u_vga|Equal9~2_combout\,
	datad => \u_vga|Equal9~3_combout\,
	combout => \u_vga|Equal9~4_combout\);

-- Location: LCCOMB_X26_Y22_N20
\u_vga|green_signal~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~2_combout\ = ((!\u_vga|Equal9~4_combout\ & ((\u_vga|vga_gen~6_combout\) # (!\u_vga|vga_gen~1_combout\)))) # (!\u_vga|LessThan13~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~6_combout\,
	datab => \u_vga|LessThan13~0_combout\,
	datac => \u_vga|Equal9~4_combout\,
	datad => \u_vga|vga_gen~1_combout\,
	combout => \u_vga|green_signal~2_combout\);

-- Location: LCCOMB_X30_Y19_N30
\u_vga|Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal1~2_combout\ = (\u_vga|h_cnt\(9) & (\u_vga|h_cnt\(8) & !\u_vga|h_cnt\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datac => \u_vga|h_cnt\(8),
	datad => \u_vga|h_cnt\(10),
	combout => \u_vga|Equal1~2_combout\);

-- Location: LCCOMB_X27_Y21_N30
\u_vga|Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal1~3_combout\ = (\u_vga|Equal1~2_combout\ & (\u_vga|h_cnt\(4) & (\u_vga|Equal1~0_combout\ & \u_vga|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal1~2_combout\,
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|Equal1~0_combout\,
	datad => \u_vga|Equal1~1_combout\,
	combout => \u_vga|Equal1~3_combout\);

-- Location: LCCOMB_X25_Y20_N26
\u_vga|vga_gen~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~34_combout\ = (!\u_vga|Equal9~4_combout\) # (!\u_vga|Equal1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Equal1~3_combout\,
	datad => \u_vga|Equal9~4_combout\,
	combout => \u_vga|vga_gen~34_combout\);

-- Location: LCCOMB_X25_Y20_N6
\u_vga|current_submarine_line[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[4]~16_combout\ = (\u_vga|current_submarine_line[4]~15_combout\ & (\u_vga|current_submarine_line~6_combout\ & VCC)) # (!\u_vga|current_submarine_line[4]~15_combout\ & (\u_vga|current_submarine_line~6_combout\ $ (VCC)))
-- \u_vga|current_submarine_line[4]~17\ = CARRY((!\u_vga|current_submarine_line[4]~15_combout\ & \u_vga|current_submarine_line~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line[4]~15_combout\,
	datab => \u_vga|current_submarine_line~6_combout\,
	datad => VCC,
	combout => \u_vga|current_submarine_line[4]~16_combout\,
	cout => \u_vga|current_submarine_line[4]~17\);

-- Location: LCCOMB_X28_Y20_N12
\u_vga|LessThan11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan11~1_combout\ = (!\u_vga|v_cnt\(10) & (((!\u_vga|LessThan11~0_combout\ & !\u_vga|v_cnt\(8))) # (!\u_vga|v_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan11~0_combout\,
	datab => \u_vga|v_cnt\(10),
	datac => \u_vga|v_cnt\(9),
	datad => \u_vga|v_cnt\(8),
	combout => \u_vga|LessThan11~1_combout\);

-- Location: FF_X25_Y20_N7
\u_vga|current_submarine_line[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine_line[4]~16_combout\,
	ena => \u_vga|LessThan11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine_line\(4));

-- Location: LCCOMB_X25_Y20_N0
\u_vga|current_submarine_line~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line~6_combout\ = (\u_vga|current_submarine_line\(4) & ((!\u_vga|Equal9~4_combout\) # (!\u_vga|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line\(4),
	datac => \u_vga|Equal1~3_combout\,
	datad => \u_vga|Equal9~4_combout\,
	combout => \u_vga|current_submarine_line~6_combout\);

-- Location: FF_X25_Y20_N3
\u_vga|current_submarine_line[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine_line~7_combout\,
	ena => \u_vga|LessThan11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine_line\(2));

-- Location: LCCOMB_X25_Y20_N2
\u_vga|current_submarine_line~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line~7_combout\ = (\u_vga|current_submarine_line\(2)) # ((\u_vga|Equal1~3_combout\ & \u_vga|Equal9~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal1~3_combout\,
	datac => \u_vga|current_submarine_line\(2),
	datad => \u_vga|Equal9~4_combout\,
	combout => \u_vga|current_submarine_line~7_combout\);

-- Location: LCCOMB_X26_Y20_N8
\u_vga|Add19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~0_combout\ = (\u_vga|current_submarine_line~7_combout\ & (\u_vga|v_cnt\(0) $ (VCC))) # (!\u_vga|current_submarine_line~7_combout\ & ((\u_vga|v_cnt\(0)) # (GND)))
-- \u_vga|Add19~1\ = CARRY((\u_vga|v_cnt\(0)) # (!\u_vga|current_submarine_line~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line~7_combout\,
	datab => \u_vga|v_cnt\(0),
	datad => VCC,
	combout => \u_vga|Add19~0_combout\,
	cout => \u_vga|Add19~1\);

-- Location: LCCOMB_X26_Y20_N10
\u_vga|Add19~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~2_combout\ = (\u_vga|current_submarine_line~7_combout\ & ((\u_vga|v_cnt\(1) & (!\u_vga|Add19~1\)) # (!\u_vga|v_cnt\(1) & ((\u_vga|Add19~1\) # (GND))))) # (!\u_vga|current_submarine_line~7_combout\ & ((\u_vga|v_cnt\(1) & (\u_vga|Add19~1\ & 
-- VCC)) # (!\u_vga|v_cnt\(1) & (!\u_vga|Add19~1\))))
-- \u_vga|Add19~3\ = CARRY((\u_vga|current_submarine_line~7_combout\ & ((!\u_vga|Add19~1\) # (!\u_vga|v_cnt\(1)))) # (!\u_vga|current_submarine_line~7_combout\ & (!\u_vga|v_cnt\(1) & !\u_vga|Add19~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line~7_combout\,
	datab => \u_vga|v_cnt\(1),
	datad => VCC,
	cin => \u_vga|Add19~1\,
	combout => \u_vga|Add19~2_combout\,
	cout => \u_vga|Add19~3\);

-- Location: LCCOMB_X26_Y20_N12
\u_vga|Add19~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~4_combout\ = ((\u_vga|current_submarine_line~7_combout\ $ (\u_vga|v_cnt\(2) $ (\u_vga|Add19~3\)))) # (GND)
-- \u_vga|Add19~5\ = CARRY((\u_vga|current_submarine_line~7_combout\ & (\u_vga|v_cnt\(2) & !\u_vga|Add19~3\)) # (!\u_vga|current_submarine_line~7_combout\ & ((\u_vga|v_cnt\(2)) # (!\u_vga|Add19~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line~7_combout\,
	datab => \u_vga|v_cnt\(2),
	datad => VCC,
	cin => \u_vga|Add19~3\,
	combout => \u_vga|Add19~4_combout\,
	cout => \u_vga|Add19~5\);

-- Location: LCCOMB_X26_Y20_N14
\u_vga|Add19~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~6_combout\ = (\u_vga|v_cnt\(3) & (\u_vga|Add19~5\ & VCC)) # (!\u_vga|v_cnt\(3) & (!\u_vga|Add19~5\))
-- \u_vga|Add19~7\ = CARRY((!\u_vga|v_cnt\(3) & !\u_vga|Add19~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(3),
	datad => VCC,
	cin => \u_vga|Add19~5\,
	combout => \u_vga|Add19~6_combout\,
	cout => \u_vga|Add19~7\);

-- Location: LCCOMB_X26_Y20_N16
\u_vga|Add19~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~8_combout\ = ((\u_vga|current_submarine_line~6_combout\ $ (\u_vga|v_cnt\(4) $ (\u_vga|Add19~7\)))) # (GND)
-- \u_vga|Add19~9\ = CARRY((\u_vga|current_submarine_line~6_combout\ & (\u_vga|v_cnt\(4) & !\u_vga|Add19~7\)) # (!\u_vga|current_submarine_line~6_combout\ & ((\u_vga|v_cnt\(4)) # (!\u_vga|Add19~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line~6_combout\,
	datab => \u_vga|v_cnt\(4),
	datad => VCC,
	cin => \u_vga|Add19~7\,
	combout => \u_vga|Add19~8_combout\,
	cout => \u_vga|Add19~9\);

-- Location: LCCOMB_X26_Y20_N4
\u_vga|current_submarine_line[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[4]~8_combout\ = (!\u_vga|Add19~4_combout\ & (!\u_vga|Add19~0_combout\ & !\u_vga|Add19~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add19~4_combout\,
	datac => \u_vga|Add19~0_combout\,
	datad => \u_vga|Add19~2_combout\,
	combout => \u_vga|current_submarine_line[4]~8_combout\);

-- Location: LCCOMB_X27_Y20_N6
\u_vga|current_submarine_line[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[4]~14_combout\ = ((\u_vga|Add19~6_combout\) # (!\u_vga|Equal1~3_combout\)) # (!\u_vga|current_submarine_line[4]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine_line[4]~8_combout\,
	datac => \u_vga|Equal1~3_combout\,
	datad => \u_vga|Add19~6_combout\,
	combout => \u_vga|current_submarine_line[4]~14_combout\);

-- Location: LCCOMB_X27_Y20_N18
\u_vga|current_submarine_line[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[4]~15_combout\ = ((\u_vga|vga_gen~2_combout\) # ((\u_vga|current_submarine_line[4]~14_combout\) # (!\u_vga|vga_gen~4_combout\))) # (!\u_vga|Add19~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add19~8_combout\,
	datab => \u_vga|vga_gen~2_combout\,
	datac => \u_vga|vga_gen~4_combout\,
	datad => \u_vga|current_submarine_line[4]~14_combout\,
	combout => \u_vga|current_submarine_line[4]~15_combout\);

-- Location: LCCOMB_X25_Y20_N8
\u_vga|current_submarine_line[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[5]~18_combout\ = (\u_vga|current_submarine_line[4]~17\ & (((!\u_vga|current_submarine_line\(5))) # (!\u_vga|vga_gen~34_combout\))) # (!\u_vga|current_submarine_line[4]~17\ & (((\u_vga|vga_gen~34_combout\ & 
-- \u_vga|current_submarine_line\(5))) # (GND)))
-- \u_vga|current_submarine_line[5]~19\ = CARRY(((!\u_vga|current_submarine_line[4]~17\) # (!\u_vga|current_submarine_line\(5))) # (!\u_vga|vga_gen~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~34_combout\,
	datab => \u_vga|current_submarine_line\(5),
	datad => VCC,
	cin => \u_vga|current_submarine_line[4]~17\,
	combout => \u_vga|current_submarine_line[5]~18_combout\,
	cout => \u_vga|current_submarine_line[5]~19\);

-- Location: FF_X25_Y20_N9
\u_vga|current_submarine_line[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine_line[5]~18_combout\,
	ena => \u_vga|LessThan11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine_line\(5));

-- Location: LCCOMB_X25_Y20_N10
\u_vga|current_submarine_line[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[6]~20_combout\ = (\u_vga|current_submarine_line[5]~19\ & (((\u_vga|current_submarine_line\(6)) # (!\u_vga|vga_gen~34_combout\)))) # (!\u_vga|current_submarine_line[5]~19\ & ((((\u_vga|current_submarine_line\(6)) # 
-- (!\u_vga|vga_gen~34_combout\)))))
-- \u_vga|current_submarine_line[6]~21\ = CARRY((!\u_vga|current_submarine_line[5]~19\ & ((\u_vga|current_submarine_line\(6)) # (!\u_vga|vga_gen~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010000001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line\(6),
	datab => \u_vga|vga_gen~34_combout\,
	datad => VCC,
	cin => \u_vga|current_submarine_line[5]~19\,
	combout => \u_vga|current_submarine_line[6]~20_combout\,
	cout => \u_vga|current_submarine_line[6]~21\);

-- Location: FF_X25_Y20_N11
\u_vga|current_submarine_line[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine_line[6]~20_combout\,
	ena => \u_vga|LessThan11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine_line\(6));

-- Location: LCCOMB_X25_Y20_N12
\u_vga|current_submarine_line[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[7]~22_combout\ = (\u_vga|current_submarine_line\(7) & (((!\u_vga|current_submarine_line[6]~21\)))) # (!\u_vga|current_submarine_line\(7) & ((\u_vga|vga_gen~34_combout\ & ((\u_vga|current_submarine_line[6]~21\) # (GND))) # 
-- (!\u_vga|vga_gen~34_combout\ & (!\u_vga|current_submarine_line[6]~21\))))
-- \u_vga|current_submarine_line[7]~23\ = CARRY(((!\u_vga|current_submarine_line\(7) & \u_vga|vga_gen~34_combout\)) # (!\u_vga|current_submarine_line[6]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101101001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line\(7),
	datab => \u_vga|vga_gen~34_combout\,
	datad => VCC,
	cin => \u_vga|current_submarine_line[6]~21\,
	combout => \u_vga|current_submarine_line[7]~22_combout\,
	cout => \u_vga|current_submarine_line[7]~23\);

-- Location: FF_X25_Y20_N13
\u_vga|current_submarine_line[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine_line[7]~22_combout\,
	ena => \u_vga|LessThan11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine_line\(7));

-- Location: LCCOMB_X25_Y20_N14
\u_vga|current_submarine_line[8]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[8]~24_combout\ = (\u_vga|current_submarine_line[7]~23\ & (\u_vga|vga_gen~34_combout\ & (\u_vga|current_submarine_line\(8) & VCC))) # (!\u_vga|current_submarine_line[7]~23\ & ((((\u_vga|vga_gen~34_combout\ & 
-- \u_vga|current_submarine_line\(8))))))
-- \u_vga|current_submarine_line[8]~25\ = CARRY((\u_vga|vga_gen~34_combout\ & (\u_vga|current_submarine_line\(8) & !\u_vga|current_submarine_line[7]~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011100001000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~34_combout\,
	datab => \u_vga|current_submarine_line\(8),
	datad => VCC,
	cin => \u_vga|current_submarine_line[7]~23\,
	combout => \u_vga|current_submarine_line[8]~24_combout\,
	cout => \u_vga|current_submarine_line[8]~25\);

-- Location: FF_X25_Y20_N15
\u_vga|current_submarine_line[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine_line[8]~24_combout\,
	ena => \u_vga|LessThan11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine_line\(8));

-- Location: LCCOMB_X25_Y20_N16
\u_vga|current_submarine_line[9]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line[9]~26_combout\ = \u_vga|current_submarine_line[8]~25\ $ (((\u_vga|vga_gen~34_combout\ & \u_vga|current_submarine_line\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~34_combout\,
	datad => \u_vga|current_submarine_line\(9),
	cin => \u_vga|current_submarine_line[8]~25\,
	combout => \u_vga|current_submarine_line[9]~26_combout\);

-- Location: FF_X25_Y20_N17
\u_vga|current_submarine_line[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine_line[9]~26_combout\,
	ena => \u_vga|LessThan11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine_line\(9));

-- Location: LCCOMB_X25_Y20_N24
\u_vga|current_submarine_line~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line~13_combout\ = (\u_vga|current_submarine_line\(9) & ((!\u_vga|Equal9~4_combout\) # (!\u_vga|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine_line\(9),
	datac => \u_vga|Equal1~3_combout\,
	datad => \u_vga|Equal9~4_combout\,
	combout => \u_vga|current_submarine_line~13_combout\);

-- Location: LCCOMB_X25_Y20_N18
\u_vga|current_submarine_line~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line~12_combout\ = (\u_vga|current_submarine_line\(8) & ((!\u_vga|Equal9~4_combout\) # (!\u_vga|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine_line\(8),
	datac => \u_vga|Equal1~3_combout\,
	datad => \u_vga|Equal9~4_combout\,
	combout => \u_vga|current_submarine_line~12_combout\);

-- Location: LCCOMB_X25_Y20_N4
\u_vga|current_submarine_line~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line~11_combout\ = (\u_vga|current_submarine_line\(7)) # ((\u_vga|Equal9~4_combout\ & \u_vga|Equal1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line\(7),
	datab => \u_vga|Equal9~4_combout\,
	datac => \u_vga|Equal1~3_combout\,
	combout => \u_vga|current_submarine_line~11_combout\);

-- Location: LCCOMB_X25_Y20_N30
\u_vga|current_submarine_line~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line~10_combout\ = (\u_vga|current_submarine_line\(6)) # ((\u_vga|Equal1~3_combout\ & \u_vga|Equal9~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line\(6),
	datac => \u_vga|Equal1~3_combout\,
	datad => \u_vga|Equal9~4_combout\,
	combout => \u_vga|current_submarine_line~10_combout\);

-- Location: LCCOMB_X25_Y20_N20
\u_vga|current_submarine_line~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine_line~9_combout\ = (\u_vga|current_submarine_line\(5) & ((!\u_vga|Equal9~4_combout\) # (!\u_vga|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine_line\(5),
	datac => \u_vga|Equal1~3_combout\,
	datad => \u_vga|Equal9~4_combout\,
	combout => \u_vga|current_submarine_line~9_combout\);

-- Location: LCCOMB_X26_Y20_N18
\u_vga|Add19~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~10_combout\ = (\u_vga|v_cnt\(5) & ((\u_vga|current_submarine_line~9_combout\ & (!\u_vga|Add19~9\)) # (!\u_vga|current_submarine_line~9_combout\ & (\u_vga|Add19~9\ & VCC)))) # (!\u_vga|v_cnt\(5) & ((\u_vga|current_submarine_line~9_combout\ & 
-- ((\u_vga|Add19~9\) # (GND))) # (!\u_vga|current_submarine_line~9_combout\ & (!\u_vga|Add19~9\))))
-- \u_vga|Add19~11\ = CARRY((\u_vga|v_cnt\(5) & (\u_vga|current_submarine_line~9_combout\ & !\u_vga|Add19~9\)) # (!\u_vga|v_cnt\(5) & ((\u_vga|current_submarine_line~9_combout\) # (!\u_vga|Add19~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|current_submarine_line~9_combout\,
	datad => VCC,
	cin => \u_vga|Add19~9\,
	combout => \u_vga|Add19~10_combout\,
	cout => \u_vga|Add19~11\);

-- Location: LCCOMB_X26_Y20_N20
\u_vga|Add19~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~12_combout\ = ((\u_vga|v_cnt\(6) $ (\u_vga|current_submarine_line~10_combout\ $ (\u_vga|Add19~11\)))) # (GND)
-- \u_vga|Add19~13\ = CARRY((\u_vga|v_cnt\(6) & ((!\u_vga|Add19~11\) # (!\u_vga|current_submarine_line~10_combout\))) # (!\u_vga|v_cnt\(6) & (!\u_vga|current_submarine_line~10_combout\ & !\u_vga|Add19~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(6),
	datab => \u_vga|current_submarine_line~10_combout\,
	datad => VCC,
	cin => \u_vga|Add19~11\,
	combout => \u_vga|Add19~12_combout\,
	cout => \u_vga|Add19~13\);

-- Location: LCCOMB_X26_Y20_N22
\u_vga|Add19~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~14_combout\ = (\u_vga|v_cnt\(7) & ((\u_vga|current_submarine_line~11_combout\ & (!\u_vga|Add19~13\)) # (!\u_vga|current_submarine_line~11_combout\ & (\u_vga|Add19~13\ & VCC)))) # (!\u_vga|v_cnt\(7) & 
-- ((\u_vga|current_submarine_line~11_combout\ & ((\u_vga|Add19~13\) # (GND))) # (!\u_vga|current_submarine_line~11_combout\ & (!\u_vga|Add19~13\))))
-- \u_vga|Add19~15\ = CARRY((\u_vga|v_cnt\(7) & (\u_vga|current_submarine_line~11_combout\ & !\u_vga|Add19~13\)) # (!\u_vga|v_cnt\(7) & ((\u_vga|current_submarine_line~11_combout\) # (!\u_vga|Add19~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datab => \u_vga|current_submarine_line~11_combout\,
	datad => VCC,
	cin => \u_vga|Add19~13\,
	combout => \u_vga|Add19~14_combout\,
	cout => \u_vga|Add19~15\);

-- Location: LCCOMB_X26_Y20_N24
\u_vga|Add19~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~16_combout\ = ((\u_vga|v_cnt\(8) $ (\u_vga|current_submarine_line~12_combout\ $ (\u_vga|Add19~15\)))) # (GND)
-- \u_vga|Add19~17\ = CARRY((\u_vga|v_cnt\(8) & ((!\u_vga|Add19~15\) # (!\u_vga|current_submarine_line~12_combout\))) # (!\u_vga|v_cnt\(8) & (!\u_vga|current_submarine_line~12_combout\ & !\u_vga|Add19~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(8),
	datab => \u_vga|current_submarine_line~12_combout\,
	datad => VCC,
	cin => \u_vga|Add19~15\,
	combout => \u_vga|Add19~16_combout\,
	cout => \u_vga|Add19~17\);

-- Location: LCCOMB_X26_Y20_N26
\u_vga|Add19~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~18_combout\ = (\u_vga|v_cnt\(9) & ((\u_vga|current_submarine_line~13_combout\ & (!\u_vga|Add19~17\)) # (!\u_vga|current_submarine_line~13_combout\ & (\u_vga|Add19~17\ & VCC)))) # (!\u_vga|v_cnt\(9) & 
-- ((\u_vga|current_submarine_line~13_combout\ & ((\u_vga|Add19~17\) # (GND))) # (!\u_vga|current_submarine_line~13_combout\ & (!\u_vga|Add19~17\))))
-- \u_vga|Add19~19\ = CARRY((\u_vga|v_cnt\(9) & (\u_vga|current_submarine_line~13_combout\ & !\u_vga|Add19~17\)) # (!\u_vga|v_cnt\(9) & ((\u_vga|current_submarine_line~13_combout\) # (!\u_vga|Add19~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datab => \u_vga|current_submarine_line~13_combout\,
	datad => VCC,
	cin => \u_vga|Add19~17\,
	combout => \u_vga|Add19~18_combout\,
	cout => \u_vga|Add19~19\);

-- Location: LCCOMB_X26_Y20_N28
\u_vga|Add19~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add19~20_combout\ = \u_vga|v_cnt\(10) $ (\u_vga|Add19~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|v_cnt\(10),
	cin => \u_vga|Add19~19\,
	combout => \u_vga|Add19~20_combout\);

-- Location: LCCOMB_X26_Y20_N2
\u_vga|vga_gen~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~3_combout\ = (!\u_vga|Add19~14_combout\ & (!\u_vga|Add19~12_combout\ & (!\u_vga|Add19~10_combout\ & !\u_vga|Add19~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add19~14_combout\,
	datab => \u_vga|Add19~12_combout\,
	datac => \u_vga|Add19~10_combout\,
	datad => \u_vga|Add19~16_combout\,
	combout => \u_vga|vga_gen~3_combout\);

-- Location: LCCOMB_X26_Y20_N0
\u_vga|vga_gen~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~4_combout\ = (!\u_vga|Add19~20_combout\ & (!\u_vga|Add19~18_combout\ & \u_vga|vga_gen~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add19~20_combout\,
	datac => \u_vga|Add19~18_combout\,
	datad => \u_vga|vga_gen~3_combout\,
	combout => \u_vga|vga_gen~4_combout\);

-- Location: LCCOMB_X27_Y20_N12
\u_vga|LessThan14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan14~0_combout\ = ((\u_vga|Add19~8_combout\) # ((!\u_vga|current_submarine_line[4]~8_combout\ & \u_vga|Add19~6_combout\))) # (!\u_vga|vga_gen~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~4_combout\,
	datab => \u_vga|current_submarine_line[4]~8_combout\,
	datac => \u_vga|Add19~8_combout\,
	datad => \u_vga|Add19~6_combout\,
	combout => \u_vga|LessThan14~0_combout\);

-- Location: LCCOMB_X28_Y20_N24
\u_vga|update_elements_position~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~1_combout\ = (\u_vga|v_cnt\(9) & (!\u_vga|v_cnt\(10) & !\u_vga|v_cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(9),
	datab => \u_vga|v_cnt\(10),
	datad => \u_vga|v_cnt\(8),
	combout => \u_vga|update_elements_position~1_combout\);

-- Location: LCCOMB_X29_Y20_N4
\u_vga|update_elements_position~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~3_combout\ = (\u_vga|v_cnt\(5) & (\u_vga|update_elements_position~1_combout\ & (!\u_vga|v_cnt\(7) & \u_vga|update_elements_position~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(5),
	datab => \u_vga|update_elements_position~1_combout\,
	datac => \u_vga|v_cnt\(7),
	datad => \u_vga|update_elements_position~0_combout\,
	combout => \u_vga|update_elements_position~3_combout\);

-- Location: LCCOMB_X29_Y20_N14
\u_vga|update_elements_position~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~2_combout\ = (!\u_vga|v_cnt\(2) & (\u_vga|v_cnt\(1) & (\u_vga|v_cnt\(0) & \u_vga|v_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(2),
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(0),
	datad => \u_vga|v_cnt\(6),
	combout => \u_vga|update_elements_position~2_combout\);

-- Location: LCCOMB_X29_Y20_N22
\u_vga|update_elements_position~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_elements_position~4_combout\ = (\u_vga|update_elements_position~3_combout\ & (\u_vga|update_elements_position~2_combout\ & \u_vga|Equal1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|update_elements_position~3_combout\,
	datac => \u_vga|update_elements_position~2_combout\,
	datad => \u_vga|Equal1~3_combout\,
	combout => \u_vga|update_elements_position~4_combout\);

-- Location: LCCOMB_X31_Y19_N10
\u_vga|current_submarine[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[0]~5_combout\ = \u_vga|current_submarine\(0) $ (VCC)
-- \u_vga|current_submarine[0]~6\ = CARRY(\u_vga|current_submarine\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(0),
	datad => VCC,
	combout => \u_vga|current_submarine[0]~5_combout\,
	cout => \u_vga|current_submarine[0]~6\);

-- Location: LCCOMB_X31_Y19_N12
\u_vga|current_submarine[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[1]~7_combout\ = (\u_vga|current_submarine\(1) & (!\u_vga|current_submarine[0]~6\)) # (!\u_vga|current_submarine\(1) & ((\u_vga|current_submarine[0]~6\) # (GND)))
-- \u_vga|current_submarine[1]~8\ = CARRY((!\u_vga|current_submarine[0]~6\) # (!\u_vga|current_submarine\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(1),
	datad => VCC,
	cin => \u_vga|current_submarine[0]~6\,
	combout => \u_vga|current_submarine[1]~7_combout\,
	cout => \u_vga|current_submarine[1]~8\);

-- Location: LCCOMB_X28_Y20_N14
\u_vga|vga_gen~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~27_combout\ = (!\u_vga|v_cnt\(6) & (((\u_vga|v_cnt\(0) & \u_vga|v_cnt\(1))) # (!\u_vga|Equal9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(0),
	datab => \u_vga|v_cnt\(6),
	datac => \u_vga|Equal9~0_combout\,
	datad => \u_vga|v_cnt\(1),
	combout => \u_vga|vga_gen~27_combout\);

-- Location: LCCOMB_X29_Y20_N30
\u_vga|vga_gen~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~29_combout\ = (\u_vga|v_cnt\(2) & (\u_vga|v_cnt\(7))) # (!\u_vga|v_cnt\(2) & ((\u_vga|v_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datac => \u_vga|v_cnt\(2),
	datad => \u_vga|v_cnt\(6),
	combout => \u_vga|vga_gen~29_combout\);

-- Location: LCCOMB_X29_Y20_N12
\u_vga|vga_gen~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~28_combout\ = (!\u_vga|v_cnt\(7) & (((!\u_vga|v_cnt\(4)) # (!\u_vga|v_cnt\(3))) # (!\u_vga|v_cnt\(5))))

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
	combout => \u_vga|vga_gen~28_combout\);

-- Location: LCCOMB_X29_Y20_N20
\u_vga|vga_gen~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~30_combout\ = (\u_vga|vga_gen~27_combout\) # (((\u_vga|vga_gen~29_combout\) # (\u_vga|vga_gen~28_combout\)) # (!\u_vga|update_elements_position~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~27_combout\,
	datab => \u_vga|update_elements_position~1_combout\,
	datac => \u_vga|vga_gen~29_combout\,
	datad => \u_vga|vga_gen~28_combout\,
	combout => \u_vga|vga_gen~30_combout\);

-- Location: LCCOMB_X30_Y18_N18
\u_vga|v_sync~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|v_sync~feeder_combout\ = \u_vga|vga_gen~30_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|vga_gen~30_combout\,
	combout => \u_vga|v_sync~feeder_combout\);

-- Location: FF_X30_Y18_N19
\u_vga|v_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|v_sync~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|v_sync~q\);

-- Location: LCCOMB_X31_Y19_N0
\u_vga|current_submarine[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[2]~10_combout\ = (\u_vga|update_elements_position~4_combout\) # ((!\u_vga|v_sync~q\ & \u_vga|update_submarines~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|update_elements_position~4_combout\,
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|current_submarine[2]~10_combout\);

-- Location: FF_X31_Y19_N13
\u_vga|current_submarine[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[1]~7_combout\,
	sclr => \u_vga|current_submarine[2]~9_combout\,
	ena => \u_vga|current_submarine[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(1));

-- Location: LCCOMB_X31_Y19_N14
\u_vga|current_submarine[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[2]~11_combout\ = (\u_vga|current_submarine\(2) & (\u_vga|current_submarine[1]~8\ $ (GND))) # (!\u_vga|current_submarine\(2) & (!\u_vga|current_submarine[1]~8\ & VCC))
-- \u_vga|current_submarine[2]~12\ = CARRY((\u_vga|current_submarine\(2) & !\u_vga|current_submarine[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine\(2),
	datad => VCC,
	cin => \u_vga|current_submarine[1]~8\,
	combout => \u_vga|current_submarine[2]~11_combout\,
	cout => \u_vga|current_submarine[2]~12\);

-- Location: FF_X31_Y19_N15
\u_vga|current_submarine[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[2]~11_combout\,
	sclr => \u_vga|current_submarine[2]~9_combout\,
	ena => \u_vga|current_submarine[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(2));

-- Location: LCCOMB_X31_Y19_N16
\u_vga|current_submarine[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[3]~13_combout\ = (\u_vga|current_submarine\(3) & (!\u_vga|current_submarine[2]~12\)) # (!\u_vga|current_submarine\(3) & ((\u_vga|current_submarine[2]~12\) # (GND)))
-- \u_vga|current_submarine[3]~14\ = CARRY((!\u_vga|current_submarine[2]~12\) # (!\u_vga|current_submarine\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_submarine\(3),
	datad => VCC,
	cin => \u_vga|current_submarine[2]~12\,
	combout => \u_vga|current_submarine[3]~13_combout\,
	cout => \u_vga|current_submarine[3]~14\);

-- Location: FF_X31_Y19_N17
\u_vga|current_submarine[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[3]~13_combout\,
	sclr => \u_vga|current_submarine[2]~9_combout\,
	ena => \u_vga|current_submarine[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(3));

-- Location: LCCOMB_X31_Y19_N18
\u_vga|current_submarine[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[4]~15_combout\ = \u_vga|current_submarine[3]~14\ $ (!\u_vga|current_submarine\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|current_submarine\(4),
	cin => \u_vga|current_submarine[3]~14\,
	combout => \u_vga|current_submarine[4]~15_combout\);

-- Location: FF_X31_Y19_N19
\u_vga|current_submarine[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[4]~15_combout\,
	sclr => \u_vga|current_submarine[2]~9_combout\,
	ena => \u_vga|current_submarine[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(4));

-- Location: LCCOMB_X31_Y19_N22
\u_vga|current_submarine[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_submarine[2]~9_combout\ = (\u_vga|update_elements_position~4_combout\) # ((!\u_vga|Equal6~0_combout\ & \u_vga|current_submarine\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal6~0_combout\,
	datac => \u_vga|update_elements_position~4_combout\,
	datad => \u_vga|current_submarine\(4),
	combout => \u_vga|current_submarine[2]~9_combout\);

-- Location: FF_X31_Y19_N11
\u_vga|current_submarine[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|current_submarine[0]~5_combout\,
	sclr => \u_vga|current_submarine[2]~9_combout\,
	ena => \u_vga|current_submarine[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_submarine\(0));

-- Location: LCCOMB_X31_Y19_N30
\u_vga|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal6~0_combout\ = (\u_vga|current_submarine\(0)) # (((\u_vga|current_submarine\(2)) # (\u_vga|current_submarine\(1))) # (!\u_vga|current_submarine\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(0),
	datab => \u_vga|current_submarine\(3),
	datac => \u_vga|current_submarine\(2),
	datad => \u_vga|current_submarine\(1),
	combout => \u_vga|Equal6~0_combout\);

-- Location: LCCOMB_X30_Y20_N2
\u_vga|update_submarines~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_submarines~0_combout\ = (\u_vga|update_submarines~q\ & ((\u_vga|Equal6~0_combout\) # ((\u_vga|v_sync~q\) # (!\u_vga|current_submarine\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal6~0_combout\,
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|current_submarine\(4),
	combout => \u_vga|update_submarines~0_combout\);

-- Location: LCCOMB_X30_Y20_N12
\u_vga|update_submarines~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_submarines~1_combout\ = (\u_vga|update_submarines~0_combout\) # ((\u_vga|Equal1~3_combout\ & (\u_vga|update_elements_position~3_combout\ & \u_vga|update_elements_position~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal1~3_combout\,
	datab => \u_vga|update_elements_position~3_combout\,
	datac => \u_vga|update_submarines~0_combout\,
	datad => \u_vga|update_elements_position~2_combout\,
	combout => \u_vga|update_submarines~1_combout\);

-- Location: LCCOMB_X30_Y20_N8
\u_vga|update_submarines~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_submarines~feeder_combout\ = \u_vga|update_submarines~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|update_submarines~1_combout\,
	combout => \u_vga|update_submarines~feeder_combout\);

-- Location: FF_X30_Y20_N9
\u_vga|update_submarines\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|update_submarines~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|update_submarines~q\);

-- Location: LCCOMB_X35_Y19_N24
\u_vga|first_part~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_part~0_combout\ = \u_vga|first_part~q\ $ (((!\u_vga|v_sync~q\ & (!\u_vga|update_elements_position~4_combout\ & \u_vga|update_submarines~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_part~q\,
	datab => \u_vga|v_sync~q\,
	datac => \u_vga|update_elements_position~4_combout\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|first_part~0_combout\);

-- Location: LCCOMB_X35_Y19_N0
\u_vga|first_part~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_part~feeder_combout\ = \u_vga|first_part~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|first_part~0_combout\,
	combout => \u_vga|first_part~feeder_combout\);

-- Location: FF_X35_Y19_N1
\u_vga|first_part\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_part~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_part~q\);

-- Location: LCCOMB_X35_Y19_N10
\u_vga|Add7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~0_combout\ = \u_vga|current_rocket\(0) $ (VCC)
-- \u_vga|Add7~1\ = CARRY(\u_vga|current_rocket\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_rocket\(0),
	datad => VCC,
	combout => \u_vga|Add7~0_combout\,
	cout => \u_vga|Add7~1\);

-- Location: LCCOMB_X31_Y19_N28
\u_vga|update_rockets~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_rockets~0_combout\ = (!\u_vga|Equal6~0_combout\ & (\u_vga|update_submarines~q\ & (!\u_vga|v_sync~q\ & \u_vga|current_submarine\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal6~0_combout\,
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|current_submarine\(4),
	combout => \u_vga|update_rockets~0_combout\);

-- Location: LCCOMB_X31_Y19_N20
\u_vga|update_rockets~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_rockets~1_combout\ = (!\u_vga|update_elements_position~4_combout\ & ((\u_vga|update_rockets~0_combout\) # ((!\u_vga|new_elements~2_combout\ & \u_vga|update_rockets~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_rockets~0_combout\,
	datab => \u_vga|update_elements_position~4_combout\,
	datac => \u_vga|new_elements~2_combout\,
	datad => \u_vga|update_rockets~q\,
	combout => \u_vga|update_rockets~1_combout\);

-- Location: LCCOMB_X31_Y19_N4
\u_vga|update_rockets~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|update_rockets~feeder_combout\ = \u_vga|update_rockets~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|update_rockets~1_combout\,
	combout => \u_vga|update_rockets~feeder_combout\);

-- Location: FF_X31_Y19_N5
\u_vga|update_rockets\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|update_rockets~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|update_rockets~q\);

-- Location: LCCOMB_X35_Y19_N26
\u_vga|current_rocket[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket[0]~1_combout\ = (\u_vga|update_rockets~q\ & (!\u_vga|update_elements_position~4_combout\ & (!\u_vga|v_sync~q\ & !\u_vga|update_submarines~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_rockets~q\,
	datab => \u_vga|update_elements_position~4_combout\,
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|current_rocket[0]~1_combout\);

-- Location: FF_X35_Y19_N11
\u_vga|current_rocket[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~0_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(0));

-- Location: LCCOMB_X35_Y19_N12
\u_vga|Add7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~2_combout\ = (\u_vga|current_rocket\(1) & (!\u_vga|Add7~1\)) # (!\u_vga|current_rocket\(1) & ((\u_vga|Add7~1\) # (GND)))
-- \u_vga|Add7~3\ = CARRY((!\u_vga|Add7~1\) # (!\u_vga|current_rocket\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_rocket\(1),
	datad => VCC,
	cin => \u_vga|Add7~1\,
	combout => \u_vga|Add7~2_combout\,
	cout => \u_vga|Add7~3\);

-- Location: LCCOMB_X35_Y19_N14
\u_vga|Add7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~4_combout\ = (\u_vga|current_rocket\(2) & (\u_vga|Add7~3\ $ (GND))) # (!\u_vga|current_rocket\(2) & (!\u_vga|Add7~3\ & VCC))
-- \u_vga|Add7~5\ = CARRY((\u_vga|current_rocket\(2) & !\u_vga|Add7~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_rocket\(2),
	datad => VCC,
	cin => \u_vga|Add7~3\,
	combout => \u_vga|Add7~4_combout\,
	cout => \u_vga|Add7~5\);

-- Location: LCCOMB_X35_Y19_N28
\u_vga|current_rocket~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket~2_combout\ = (\u_vga|Add7~4_combout\ & ((\u_vga|Equal7~0_combout\) # ((\u_vga|current_rocket\(4)) # (!\u_vga|current_rocket\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal7~0_combout\,
	datab => \u_vga|current_rocket\(5),
	datac => \u_vga|Add7~4_combout\,
	datad => \u_vga|current_rocket\(4),
	combout => \u_vga|current_rocket~2_combout\);

-- Location: FF_X35_Y19_N29
\u_vga|current_rocket[2]\ : dffeas
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
	q => \u_vga|current_rocket\(2));

-- Location: LCCOMB_X35_Y19_N16
\u_vga|Add7~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~6_combout\ = (\u_vga|current_rocket\(3) & (!\u_vga|Add7~5\)) # (!\u_vga|current_rocket\(3) & ((\u_vga|Add7~5\) # (GND)))
-- \u_vga|Add7~7\ = CARRY((!\u_vga|Add7~5\) # (!\u_vga|current_rocket\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_rocket\(3),
	datad => VCC,
	cin => \u_vga|Add7~5\,
	combout => \u_vga|Add7~6_combout\,
	cout => \u_vga|Add7~7\);

-- Location: FF_X35_Y19_N17
\u_vga|current_rocket[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~6_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(3));

-- Location: LCCOMB_X35_Y19_N18
\u_vga|Add7~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~8_combout\ = (\u_vga|current_rocket\(4) & (\u_vga|Add7~7\ $ (GND))) # (!\u_vga|current_rocket\(4) & (!\u_vga|Add7~7\ & VCC))
-- \u_vga|Add7~9\ = CARRY((\u_vga|current_rocket\(4) & !\u_vga|Add7~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_rocket\(4),
	datad => VCC,
	cin => \u_vga|Add7~7\,
	combout => \u_vga|Add7~8_combout\,
	cout => \u_vga|Add7~9\);

-- Location: FF_X35_Y19_N19
\u_vga|current_rocket[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add7~8_combout\,
	ena => \u_vga|current_rocket[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|current_rocket\(4));

-- Location: LCCOMB_X35_Y19_N20
\u_vga|Add7~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add7~10_combout\ = \u_vga|current_rocket\(5) $ (\u_vga|Add7~9\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|current_rocket\(5),
	cin => \u_vga|Add7~9\,
	combout => \u_vga|Add7~10_combout\);

-- Location: LCCOMB_X35_Y19_N4
\u_vga|current_rocket~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket~3_combout\ = (\u_vga|Add7~10_combout\ & ((\u_vga|Equal7~0_combout\) # ((\u_vga|current_rocket\(4)) # (!\u_vga|current_rocket\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal7~0_combout\,
	datab => \u_vga|current_rocket\(4),
	datac => \u_vga|current_rocket\(5),
	datad => \u_vga|Add7~10_combout\,
	combout => \u_vga|current_rocket~3_combout\);

-- Location: FF_X35_Y19_N5
\u_vga|current_rocket[5]\ : dffeas
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
	q => \u_vga|current_rocket\(5));

-- Location: LCCOMB_X35_Y19_N6
\u_vga|current_rocket~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|current_rocket~0_combout\ = (\u_vga|Add7~2_combout\ & (((\u_vga|Equal7~0_combout\) # (\u_vga|current_rocket\(4))) # (!\u_vga|current_rocket\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add7~2_combout\,
	datab => \u_vga|current_rocket\(5),
	datac => \u_vga|Equal7~0_combout\,
	datad => \u_vga|current_rocket\(4),
	combout => \u_vga|current_rocket~0_combout\);

-- Location: FF_X35_Y19_N7
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

-- Location: LCCOMB_X35_Y19_N2
\u_vga|Equal7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal7~0_combout\ = (\u_vga|current_rocket\(1)) # (((\u_vga|current_rocket\(3)) # (!\u_vga|current_rocket\(0))) # (!\u_vga|current_rocket\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_rocket\(1),
	datab => \u_vga|current_rocket\(2),
	datac => \u_vga|current_rocket\(3),
	datad => \u_vga|current_rocket\(0),
	combout => \u_vga|Equal7~0_combout\);

-- Location: LCCOMB_X35_Y19_N30
\u_vga|Equal7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal7~1_combout\ = (\u_vga|current_rocket\(4)) # (!\u_vga|current_rocket\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|current_rocket\(5),
	datad => \u_vga|current_rocket\(4),
	combout => \u_vga|Equal7~1_combout\);

-- Location: LCCOMB_X34_Y19_N20
\u_vga|new_elements~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|new_elements~2_combout\ = (!\u_vga|update_submarines~q\ & (!\u_vga|Equal7~0_combout\ & (!\u_vga|Equal7~1_combout\ & !\u_vga|v_sync~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|Equal7~0_combout\,
	datac => \u_vga|Equal7~1_combout\,
	datad => \u_vga|v_sync~q\,
	combout => \u_vga|new_elements~2_combout\);

-- Location: LCCOMB_X31_Y19_N2
\u_vga|new_elements~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|new_elements~0_combout\ = (\u_vga|update_submarines~q\) # ((\u_vga|v_sync~q\) # (!\u_vga|ask_read~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|ask_read~q\,
	datad => \u_vga|v_sync~q\,
	combout => \u_vga|new_elements~0_combout\);

-- Location: LCCOMB_X34_Y19_N0
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

-- Location: LCCOMB_X34_Y19_N28
\u_vga|cycle_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|cycle_cnt~1_combout\ = (!\u_vga|Equal8~1_combout\ & \u_vga|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal8~1_combout\,
	datad => \u_vga|Add0~0_combout\,
	combout => \u_vga|cycle_cnt~1_combout\);

-- Location: FF_X34_Y19_N29
\u_vga|cycle_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|cycle_cnt~1_combout\,
	ena => \u_vga|update_elements_position~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(0));

-- Location: LCCOMB_X34_Y19_N2
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

-- Location: FF_X34_Y19_N3
\u_vga|cycle_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add0~2_combout\,
	ena => \u_vga|update_elements_position~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(1));

-- Location: LCCOMB_X34_Y19_N4
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

-- Location: LCCOMB_X34_Y19_N26
\u_vga|cycle_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|cycle_cnt~0_combout\ = (\u_vga|Add0~4_combout\ & !\u_vga|Equal8~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add0~4_combout\,
	datad => \u_vga|Equal8~1_combout\,
	combout => \u_vga|cycle_cnt~0_combout\);

-- Location: FF_X34_Y19_N27
\u_vga|cycle_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|cycle_cnt~0_combout\,
	ena => \u_vga|update_elements_position~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(2));

-- Location: LCCOMB_X34_Y19_N6
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

-- Location: FF_X34_Y19_N7
\u_vga|cycle_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add0~6_combout\,
	ena => \u_vga|update_elements_position~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(3));

-- Location: LCCOMB_X34_Y19_N22
\u_vga|Equal8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal8~0_combout\ = (!\u_vga|cycle_cnt\(3) & (!\u_vga|cycle_cnt\(1) & (\u_vga|cycle_cnt\(2) & !\u_vga|cycle_cnt\(0))))

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
	combout => \u_vga|Equal8~0_combout\);

-- Location: LCCOMB_X34_Y19_N8
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

-- Location: FF_X34_Y19_N9
\u_vga|cycle_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|Add0~8_combout\,
	ena => \u_vga|update_elements_position~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(4));

-- Location: LCCOMB_X34_Y19_N10
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

-- Location: LCCOMB_X34_Y19_N16
\u_vga|cycle_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|cycle_cnt~2_combout\ = (!\u_vga|Equal8~1_combout\ & \u_vga|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal8~1_combout\,
	datad => \u_vga|Add0~10_combout\,
	combout => \u_vga|cycle_cnt~2_combout\);

-- Location: FF_X34_Y19_N17
\u_vga|cycle_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|cycle_cnt~2_combout\,
	ena => \u_vga|update_elements_position~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(5));

-- Location: LCCOMB_X34_Y19_N12
\u_vga|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add0~12_combout\ = \u_vga|cycle_cnt\(6) $ (!\u_vga|Add0~11\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|cycle_cnt\(6),
	cin => \u_vga|Add0~11\,
	combout => \u_vga|Add0~12_combout\);

-- Location: LCCOMB_X34_Y19_N14
\u_vga|cycle_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|cycle_cnt~3_combout\ = (!\u_vga|Equal8~1_combout\ & \u_vga|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Equal8~1_combout\,
	datad => \u_vga|Add0~12_combout\,
	combout => \u_vga|cycle_cnt~3_combout\);

-- Location: FF_X34_Y19_N15
\u_vga|cycle_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|cycle_cnt~3_combout\,
	ena => \u_vga|update_elements_position~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|cycle_cnt\(6));

-- Location: LCCOMB_X34_Y19_N24
\u_vga|Equal8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal8~1_combout\ = (\u_vga|Equal8~0_combout\ & (\u_vga|cycle_cnt\(6) & (!\u_vga|cycle_cnt\(4) & \u_vga|cycle_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal8~0_combout\,
	datab => \u_vga|cycle_cnt\(6),
	datac => \u_vga|cycle_cnt\(4),
	datad => \u_vga|cycle_cnt\(5),
	combout => \u_vga|Equal8~1_combout\);

-- Location: LCCOMB_X31_Y19_N24
\u_vga|new_elements~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|new_elements~1_combout\ = (!\u_vga|new_elements~q\ & ((\u_vga|update_rockets~q\) # ((\u_vga|new_elements~0_combout\) # (!\u_vga|Equal8~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_rockets~q\,
	datab => \u_vga|new_elements~0_combout\,
	datac => \u_vga|new_elements~q\,
	datad => \u_vga|Equal8~1_combout\,
	combout => \u_vga|new_elements~1_combout\);

-- Location: LCCOMB_X32_Y19_N30
\u_vga|new_elements~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|new_elements~3_combout\ = (\u_vga|update_elements_position~4_combout\) # ((!\u_vga|new_elements~1_combout\ & ((!\u_vga|update_rockets~q\) # (!\u_vga|new_elements~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|new_elements~2_combout\,
	datab => \u_vga|new_elements~1_combout\,
	datac => \u_vga|update_rockets~q\,
	datad => \u_vga|update_elements_position~4_combout\,
	combout => \u_vga|new_elements~3_combout\);

-- Location: LCCOMB_X32_Y19_N6
\u_vga|new_elements~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|new_elements~feeder_combout\ = \u_vga|new_elements~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|new_elements~3_combout\,
	combout => \u_vga|new_elements~feeder_combout\);

-- Location: FF_X32_Y19_N7
\u_vga|new_elements\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|new_elements~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|new_elements~q\);

-- Location: LCCOMB_X32_Y19_N4
\u_vga|tmp_random[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|tmp_random[7]~0_combout\ = (!\u_vga|new_elements~q\ & (!\u_vga|update_rockets~q\ & \u_vga|Equal8~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|new_elements~q\,
	datac => \u_vga|update_rockets~q\,
	datad => \u_vga|Equal8~1_combout\,
	combout => \u_vga|tmp_random[7]~0_combout\);

-- Location: LCCOMB_X31_Y18_N22
\u_vga|ask_read~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|ask_read~0_combout\ = (\u_vga|tmp_random[7]~0_combout\ & (!\u_vga|v_sync~q\ & (!\u_vga|update_elements_position~4_combout\ & !\u_vga|update_submarines~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|tmp_random[7]~0_combout\,
	datab => \u_vga|v_sync~q\,
	datac => \u_vga|update_elements_position~4_combout\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|ask_read~0_combout\);

-- Location: LCCOMB_X27_Y21_N18
\u_vga|nb_submarines[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[0]~4_combout\ = \u_vga|nb_submarines\(0) $ (((\u_vga|ask_read~0_combout\ & \u_vga|ask_read~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|ask_read~0_combout\,
	datac => \u_vga|ask_read~q\,
	datad => \u_vga|nb_submarines\(0),
	combout => \u_vga|nb_submarines[0]~4_combout\);

-- Location: FF_X27_Y21_N13
\u_vga|nb_submarines[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|nb_submarines[0]~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|nb_submarines\(0));

-- Location: LCCOMB_X27_Y21_N26
\u_vga|nb_submarines[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[1]~0_combout\ = \u_vga|nb_submarines\(1) $ (((\u_vga|ask_read~0_combout\ & (\u_vga|ask_read~q\ & \u_vga|nb_submarines\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|ask_read~0_combout\,
	datab => \u_vga|ask_read~q\,
	datac => \u_vga|nb_submarines\(1),
	datad => \u_vga|nb_submarines\(0),
	combout => \u_vga|nb_submarines[1]~0_combout\);

-- Location: LCCOMB_X27_Y21_N10
\u_vga|nb_submarines[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[1]~feeder_combout\ = \u_vga|nb_submarines[1]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|nb_submarines[1]~0_combout\,
	combout => \u_vga|nb_submarines[1]~feeder_combout\);

-- Location: FF_X27_Y21_N11
\u_vga|nb_submarines[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|nb_submarines[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|nb_submarines\(1));

-- Location: LCCOMB_X27_Y21_N28
\u_vga|nb_submarines[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[2]~1_combout\ = (\u_vga|nb_submarines\(1) & (\u_vga|ask_read~q\ & (\u_vga|nb_submarines\(0) & \u_vga|ask_read~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|nb_submarines\(1),
	datab => \u_vga|ask_read~q\,
	datac => \u_vga|nb_submarines\(0),
	datad => \u_vga|ask_read~0_combout\,
	combout => \u_vga|nb_submarines[2]~1_combout\);

-- Location: LCCOMB_X27_Y21_N12
\u_vga|nb_submarines[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[2]~2_combout\ = \u_vga|nb_submarines\(2) $ (\u_vga|nb_submarines[2]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|nb_submarines\(2),
	datad => \u_vga|nb_submarines[2]~1_combout\,
	combout => \u_vga|nb_submarines[2]~2_combout\);

-- Location: FF_X27_Y21_N25
\u_vga|nb_submarines[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|nb_submarines[2]~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|nb_submarines\(2));

-- Location: LCCOMB_X27_Y21_N24
\u_vga|nb_submarines[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|nb_submarines[3]~3_combout\ = \u_vga|nb_submarines\(3) $ (((\u_vga|nb_submarines\(2) & \u_vga|nb_submarines[2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|nb_submarines\(3),
	datac => \u_vga|nb_submarines\(2),
	datad => \u_vga|nb_submarines[2]~1_combout\,
	combout => \u_vga|nb_submarines[3]~3_combout\);

-- Location: FF_X27_Y21_N7
\u_vga|nb_submarines[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|nb_submarines[3]~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|nb_submarines\(3));

-- Location: LCCOMB_X27_Y21_N6
\u_vga|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan0~0_combout\ = ((!\u_vga|nb_submarines\(1) & !\u_vga|nb_submarines\(2))) # (!\u_vga|nb_submarines\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|nb_submarines\(1),
	datac => \u_vga|nb_submarines\(3),
	datad => \u_vga|nb_submarines\(2),
	combout => \u_vga|LessThan0~0_combout\);

-- Location: LCCOMB_X29_Y18_N2
\u_vga|tmp_random[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|tmp_random[2]~4_combout\ = !\u_vga|Add8~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|Add8~2_combout\,
	combout => \u_vga|tmp_random[2]~4_combout\);

-- Location: LCCOMB_X31_Y18_N4
\u_vga|tmp_random[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|tmp_random[7]~1_combout\ = (\u_vga|LessThan0~0_combout\ & (!\u_vga|ask_read~q\ & !\u_vga|update_submarines~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|LessThan0~0_combout\,
	datac => \u_vga|ask_read~q\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|tmp_random[7]~1_combout\);

-- Location: LCCOMB_X29_Y17_N30
\u_vga|tmp_random[7]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|tmp_random[7]~2_combout\ = (\u_vga|tmp_random[7]~1_combout\ & (\u_vga|tmp_random[7]~0_combout\ & (!\u_vga|update_elements_position~4_combout\ & !\u_vga|v_sync~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|tmp_random[7]~1_combout\,
	datab => \u_vga|tmp_random[7]~0_combout\,
	datac => \u_vga|update_elements_position~4_combout\,
	datad => \u_vga|v_sync~q\,
	combout => \u_vga|tmp_random[7]~2_combout\);

-- Location: FF_X29_Y18_N3
\u_vga|tmp_random[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|tmp_random[2]~4_combout\,
	ena => \u_vga|tmp_random[7]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|tmp_random\(2));

-- Location: LCCOMB_X28_Y18_N18
\u_vga|Add8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~0_combout\ = \u_vga|tmp_random\(1) $ (GND)
-- \u_vga|Add8~1\ = CARRY(!\u_vga|tmp_random\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|tmp_random\(1),
	datad => VCC,
	combout => \u_vga|Add8~0_combout\,
	cout => \u_vga|Add8~1\);

-- Location: LCCOMB_X29_Y18_N16
\u_vga|tmp_random[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|tmp_random[1]~5_combout\ = !\u_vga|Add8~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|tmp_random[1]~5_combout\);

-- Location: FF_X29_Y18_N17
\u_vga|tmp_random[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|tmp_random[1]~5_combout\,
	ena => \u_vga|tmp_random[7]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|tmp_random\(1));

-- Location: LCCOMB_X28_Y18_N20
\u_vga|Add8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~2_combout\ = (\u_vga|tmp_random\(2) & ((\u_vga|Add8~1\) # (GND))) # (!\u_vga|tmp_random\(2) & (!\u_vga|Add8~1\))
-- \u_vga|Add8~3\ = CARRY((\u_vga|tmp_random\(2)) # (!\u_vga|Add8~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|tmp_random\(2),
	datad => VCC,
	cin => \u_vga|Add8~1\,
	combout => \u_vga|Add8~2_combout\,
	cout => \u_vga|Add8~3\);

-- Location: LCCOMB_X28_Y18_N10
\u_vga|tmp_random[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|tmp_random[4]~6_combout\ = !\u_vga|Add8~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add8~6_combout\,
	combout => \u_vga|tmp_random[4]~6_combout\);

-- Location: FF_X28_Y18_N11
\u_vga|tmp_random[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|tmp_random[4]~6_combout\,
	ena => \u_vga|tmp_random[7]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|tmp_random\(4));

-- Location: LCCOMB_X28_Y18_N22
\u_vga|Add8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~4_combout\ = (\u_vga|tmp_random\(3) & (!\u_vga|Add8~3\ & VCC)) # (!\u_vga|tmp_random\(3) & (\u_vga|Add8~3\ $ (GND)))
-- \u_vga|Add8~5\ = CARRY((!\u_vga|tmp_random\(3) & !\u_vga|Add8~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|tmp_random\(3),
	datad => VCC,
	cin => \u_vga|Add8~3\,
	combout => \u_vga|Add8~4_combout\,
	cout => \u_vga|Add8~5\);

-- Location: LCCOMB_X28_Y18_N12
\u_vga|tmp_random[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|tmp_random[3]~3_combout\ = !\u_vga|Add8~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add8~4_combout\,
	combout => \u_vga|tmp_random[3]~3_combout\);

-- Location: FF_X28_Y18_N13
\u_vga|tmp_random[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|tmp_random[3]~3_combout\,
	ena => \u_vga|tmp_random[7]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|tmp_random\(3));

-- Location: LCCOMB_X28_Y18_N24
\u_vga|Add8~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~6_combout\ = (\u_vga|tmp_random\(4) & ((\u_vga|Add8~5\) # (GND))) # (!\u_vga|tmp_random\(4) & (!\u_vga|Add8~5\))
-- \u_vga|Add8~7\ = CARRY((\u_vga|tmp_random\(4)) # (!\u_vga|Add8~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|tmp_random\(4),
	datad => VCC,
	cin => \u_vga|Add8~5\,
	combout => \u_vga|Add8~6_combout\,
	cout => \u_vga|Add8~7\);

-- Location: LCCOMB_X29_Y17_N28
\u_vga|Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~3_combout\ = (\u_vga|Add8~2_combout\ & \u_vga|Add8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~2_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|Decoder0~3_combout\);

-- Location: LCCOMB_X29_Y18_N18
\u_vga|tmp_random[5]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|tmp_random[5]~7_combout\ = !\u_vga|Add8~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add8~8_combout\,
	combout => \u_vga|tmp_random[5]~7_combout\);

-- Location: FF_X29_Y18_N19
\u_vga|tmp_random[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|tmp_random[5]~7_combout\,
	ena => \u_vga|tmp_random[7]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|tmp_random\(5));

-- Location: LCCOMB_X28_Y18_N26
\u_vga|Add8~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add8~8_combout\ = \u_vga|Add8~7\ $ (\u_vga|tmp_random\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|tmp_random\(5),
	cin => \u_vga|Add8~7\,
	combout => \u_vga|Add8~8_combout\);

-- Location: LCCOMB_X30_Y17_N20
\u_vga|Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~2_combout\ = (!\u_vga|Mux0~16_combout\ & (\u_vga|tmp_random[7]~2_combout\ & (!\u_vga|Add8~8_combout\ & \u_vga|Add8~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~16_combout\,
	datab => \u_vga|tmp_random[7]~2_combout\,
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|Add8~6_combout\,
	combout => \u_vga|Decoder0~2_combout\);

-- Location: LCCOMB_X30_Y17_N18
\u_vga|submarines[22]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[22]~7_combout\ = (\u_vga|submarines\(22)) # ((\u_vga|Decoder0~3_combout\ & (!\u_vga|Add8~4_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(22),
	datab => \u_vga|Decoder0~3_combout\,
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|submarines[22]~7_combout\);

-- Location: FF_X30_Y17_N13
\u_vga|submarines[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[22]~7_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(22));

-- Location: LCCOMB_X28_Y18_N28
\u_vga|Decoder0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~9_combout\ = (!\u_vga|Add8~4_combout\ & \u_vga|Add8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|Decoder0~9_combout\);

-- Location: LCCOMB_X28_Y18_N14
\u_vga|Decoder0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~10_combout\ = (!\u_vga|Add8~6_combout\ & (!\u_vga|Mux0~16_combout\ & (\u_vga|Decoder0~9_combout\ & \u_vga|tmp_random[7]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~6_combout\,
	datab => \u_vga|Mux0~16_combout\,
	datac => \u_vga|Decoder0~9_combout\,
	datad => \u_vga|tmp_random[7]~2_combout\,
	combout => \u_vga|Decoder0~10_combout\);

-- Location: LCCOMB_X28_Y18_N6
\u_vga|submarines[6]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[6]~29_combout\ = (\u_vga|submarines\(6)) # ((\u_vga|Decoder0~10_combout\ & (!\u_vga|Add8~8_combout\ & \u_vga|Add8~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(6),
	datab => \u_vga|Decoder0~10_combout\,
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|Add8~2_combout\,
	combout => \u_vga|submarines[6]~29_combout\);

-- Location: LCCOMB_X28_Y18_N30
\u_vga|submarines[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[6]~feeder_combout\ = \u_vga|submarines[6]~29_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines[6]~29_combout\,
	combout => \u_vga|submarines[6]~feeder_combout\);

-- Location: FF_X28_Y18_N31
\u_vga|submarines[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(6));

-- Location: LCCOMB_X29_Y17_N22
\u_vga|Mux0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~13_combout\ = (\u_vga|Add8~6_combout\ & ((\u_vga|submarines\(22)) # ((\u_vga|Add8~4_combout\)))) # (!\u_vga|Add8~6_combout\ & (((!\u_vga|Add8~4_combout\ & \u_vga|submarines\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~6_combout\,
	datab => \u_vga|submarines\(22),
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|submarines\(6),
	combout => \u_vga|Mux0~13_combout\);

-- Location: LCCOMB_X28_Y17_N0
\u_vga|Decoder0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~11_combout\ = (!\u_vga|Add8~8_combout\ & (\u_vga|Add8~2_combout\ & \u_vga|Add8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~8_combout\,
	datab => \u_vga|Add8~2_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|Decoder0~11_combout\);

-- Location: LCCOMB_X29_Y17_N8
\u_vga|Decoder0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~7_combout\ = (!\u_vga|Add8~6_combout\ & (\u_vga|tmp_random[7]~2_combout\ & !\u_vga|Mux0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~6_combout\,
	datac => \u_vga|tmp_random[7]~2_combout\,
	datad => \u_vga|Mux0~16_combout\,
	combout => \u_vga|Decoder0~7_combout\);

-- Location: LCCOMB_X28_Y17_N24
\u_vga|submarines[14]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[14]~24_combout\ = (\u_vga|submarines\(14)) # ((\u_vga|Decoder0~11_combout\ & (\u_vga|Decoder0~7_combout\ & \u_vga|Add8~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(14),
	datab => \u_vga|Decoder0~11_combout\,
	datac => \u_vga|Decoder0~7_combout\,
	datad => \u_vga|Add8~4_combout\,
	combout => \u_vga|submarines[14]~24_combout\);

-- Location: FF_X28_Y17_N1
\u_vga|submarines[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[14]~24_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(14));

-- Location: LCCOMB_X29_Y17_N24
\u_vga|submarines[30]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[30]~9_combout\ = (\u_vga|submarines\(30)) # ((\u_vga|Decoder0~3_combout\ & (\u_vga|Add8~4_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~3_combout\,
	datab => \u_vga|submarines\(30),
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|submarines[30]~9_combout\);

-- Location: FF_X29_Y17_N29
\u_vga|submarines[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[30]~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(30));

-- Location: LCCOMB_X29_Y17_N16
\u_vga|Mux0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~14_combout\ = (\u_vga|Mux0~13_combout\ & (((\u_vga|submarines\(30))) # (!\u_vga|Add8~4_combout\))) # (!\u_vga|Mux0~13_combout\ & (\u_vga|Add8~4_combout\ & (\u_vga|submarines\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~13_combout\,
	datab => \u_vga|Add8~4_combout\,
	datac => \u_vga|submarines\(14),
	datad => \u_vga|submarines\(30),
	combout => \u_vga|Mux0~14_combout\);

-- Location: LCCOMB_X29_Y18_N30
\u_vga|Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~1_combout\ = (!\u_vga|Add8~2_combout\ & (!\u_vga|Add8~4_combout\ & !\u_vga|Add8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add8~2_combout\,
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|Decoder0~1_combout\);

-- Location: LCCOMB_X28_Y17_N20
\u_vga|submarines[0]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[0]~28_combout\ = (\u_vga|submarines\(0)) # ((!\u_vga|Add8~8_combout\ & (\u_vga|Decoder0~7_combout\ & \u_vga|Decoder0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~8_combout\,
	datab => \u_vga|Decoder0~7_combout\,
	datac => \u_vga|submarines\(0),
	datad => \u_vga|Decoder0~1_combout\,
	combout => \u_vga|submarines[0]~28_combout\);

-- Location: LCCOMB_X28_Y17_N26
\u_vga|submarines[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[0]~feeder_combout\ = \u_vga|submarines[0]~28_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines[0]~28_combout\,
	combout => \u_vga|submarines[0]~feeder_combout\);

-- Location: FF_X28_Y17_N27
\u_vga|submarines[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(0));

-- Location: LCCOMB_X28_Y17_N22
\u_vga|submarines[8]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[8]~22_combout\ = (\u_vga|Add8~4_combout\ & (!\u_vga|Add8~8_combout\ & !\u_vga|Add8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~4_combout\,
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|submarines[8]~22_combout\);

-- Location: LCCOMB_X29_Y17_N6
\u_vga|submarines[8]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[8]~23_combout\ = (\u_vga|submarines\(8)) # ((!\u_vga|Add8~2_combout\ & (\u_vga|Decoder0~7_combout\ & \u_vga|submarines[8]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~2_combout\,
	datab => \u_vga|submarines\(8),
	datac => \u_vga|Decoder0~7_combout\,
	datad => \u_vga|submarines[8]~22_combout\,
	combout => \u_vga|submarines[8]~23_combout\);

-- Location: LCCOMB_X29_Y17_N20
\u_vga|submarines[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[8]~feeder_combout\ = \u_vga|submarines[8]~23_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|submarines[8]~23_combout\,
	combout => \u_vga|submarines[8]~feeder_combout\);

-- Location: FF_X29_Y17_N21
\u_vga|submarines[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(8));

-- Location: LCCOMB_X28_Y17_N14
\u_vga|Mux0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~10_combout\ = (\u_vga|Add8~4_combout\ & ((\u_vga|Add8~6_combout\) # ((\u_vga|submarines\(8))))) # (!\u_vga|Add8~4_combout\ & (!\u_vga|Add8~6_combout\ & (\u_vga|submarines\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~4_combout\,
	datab => \u_vga|Add8~6_combout\,
	datac => \u_vga|submarines\(0),
	datad => \u_vga|submarines\(8),
	combout => \u_vga|Mux0~10_combout\);

-- Location: LCCOMB_X31_Y17_N26
\u_vga|submarines[16]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[16]~12_combout\ = (\u_vga|submarines\(16)) # ((\u_vga|Decoder0~2_combout\ & \u_vga|Decoder0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Decoder0~2_combout\,
	datac => \u_vga|submarines\(16),
	datad => \u_vga|Decoder0~1_combout\,
	combout => \u_vga|submarines[16]~12_combout\);

-- Location: LCCOMB_X31_Y17_N22
\u_vga|submarines[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[16]~feeder_combout\ = \u_vga|submarines[16]~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines[16]~12_combout\,
	combout => \u_vga|submarines[16]~feeder_combout\);

-- Location: FF_X31_Y17_N23
\u_vga|submarines[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[16]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(16));

-- Location: LCCOMB_X29_Y17_N2
\u_vga|Decoder0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~4_combout\ = (!\u_vga|Add8~2_combout\ & !\u_vga|Add8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~2_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|Decoder0~4_combout\);

-- Location: LCCOMB_X29_Y17_N18
\u_vga|submarines[24]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[24]~10_combout\ = (\u_vga|submarines\(24)) # ((\u_vga|Decoder0~4_combout\ & (\u_vga|Add8~4_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(24),
	datab => \u_vga|Decoder0~4_combout\,
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|submarines[24]~10_combout\);

-- Location: FF_X29_Y17_N3
\u_vga|submarines[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[24]~10_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(24));

-- Location: LCCOMB_X29_Y17_N26
\u_vga|Mux0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~11_combout\ = (\u_vga|Mux0~10_combout\ & (((\u_vga|submarines\(24)) # (!\u_vga|Add8~6_combout\)))) # (!\u_vga|Mux0~10_combout\ & (\u_vga|submarines\(16) & (\u_vga|Add8~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~10_combout\,
	datab => \u_vga|submarines\(16),
	datac => \u_vga|Add8~6_combout\,
	datad => \u_vga|submarines\(24),
	combout => \u_vga|Mux0~11_combout\);

-- Location: LCCOMB_X30_Y17_N14
\u_vga|Decoder0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~5_combout\ = (\u_vga|Add8~0_combout\ & !\u_vga|Add8~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~0_combout\,
	datac => \u_vga|Add8~2_combout\,
	combout => \u_vga|Decoder0~5_combout\);

-- Location: LCCOMB_X31_Y17_N8
\u_vga|submarines[10]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[10]~20_combout\ = (\u_vga|Add8~4_combout\ & (!\u_vga|Add8~8_combout\ & (!\u_vga|Add8~6_combout\ & \u_vga|Decoder0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~4_combout\,
	datab => \u_vga|Add8~8_combout\,
	datac => \u_vga|Add8~6_combout\,
	datad => \u_vga|Decoder0~5_combout\,
	combout => \u_vga|submarines[10]~20_combout\);

-- Location: LCCOMB_X31_Y17_N18
\u_vga|submarines[10]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[10]~21_combout\ = (\u_vga|submarines\(10)) # ((!\u_vga|Mux0~16_combout\ & (\u_vga|submarines[10]~20_combout\ & \u_vga|tmp_random[7]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(10),
	datab => \u_vga|Mux0~16_combout\,
	datac => \u_vga|submarines[10]~20_combout\,
	datad => \u_vga|tmp_random[7]~2_combout\,
	combout => \u_vga|submarines[10]~21_combout\);

-- Location: LCCOMB_X31_Y17_N20
\u_vga|submarines[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[10]~feeder_combout\ = \u_vga|submarines[10]~21_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|submarines[10]~21_combout\,
	combout => \u_vga|submarines[10]~feeder_combout\);

-- Location: FF_X31_Y17_N21
\u_vga|submarines[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(10));

-- Location: LCCOMB_X31_Y17_N12
\u_vga|submarines[26]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[26]~13_combout\ = (\u_vga|submarines\(26)) # ((\u_vga|Decoder0~5_combout\ & (\u_vga|Decoder0~2_combout\ & \u_vga|Add8~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~5_combout\,
	datab => \u_vga|Decoder0~2_combout\,
	datac => \u_vga|submarines\(26),
	datad => \u_vga|Add8~4_combout\,
	combout => \u_vga|submarines[26]~13_combout\);

-- Location: LCCOMB_X31_Y17_N14
\u_vga|submarines[26]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[26]~feeder_combout\ = \u_vga|submarines[26]~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines[26]~13_combout\,
	combout => \u_vga|submarines[26]~feeder_combout\);

-- Location: FF_X31_Y17_N15
\u_vga|submarines[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[26]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(26));

-- Location: LCCOMB_X28_Y18_N16
\u_vga|submarines[2]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[2]~27_combout\ = (\u_vga|submarines\(2)) # ((!\u_vga|Add8~8_combout\ & (\u_vga|Decoder0~10_combout\ & !\u_vga|Add8~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~8_combout\,
	datab => \u_vga|Decoder0~10_combout\,
	datac => \u_vga|submarines\(2),
	datad => \u_vga|Add8~2_combout\,
	combout => \u_vga|submarines[2]~27_combout\);

-- Location: LCCOMB_X28_Y18_N4
\u_vga|submarines[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[2]~feeder_combout\ = \u_vga|submarines[2]~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|submarines[2]~27_combout\,
	combout => \u_vga|submarines[2]~feeder_combout\);

-- Location: FF_X28_Y18_N5
\u_vga|submarines[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(2));

-- Location: LCCOMB_X31_Y17_N28
\u_vga|submarines[18]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[18]~11_combout\ = (\u_vga|submarines\(18)) # ((\u_vga|Decoder0~5_combout\ & (\u_vga|Decoder0~2_combout\ & !\u_vga|Add8~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~5_combout\,
	datab => \u_vga|Decoder0~2_combout\,
	datac => \u_vga|submarines\(18),
	datad => \u_vga|Add8~4_combout\,
	combout => \u_vga|submarines[18]~11_combout\);

-- Location: LCCOMB_X31_Y17_N24
\u_vga|submarines[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[18]~feeder_combout\ = \u_vga|submarines[18]~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|submarines[18]~11_combout\,
	combout => \u_vga|submarines[18]~feeder_combout\);

-- Location: FF_X31_Y17_N25
\u_vga|submarines[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[18]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(18));

-- Location: LCCOMB_X30_Y17_N16
\u_vga|Mux0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~8_combout\ = (\u_vga|Add8~6_combout\ & (((\u_vga|Add8~4_combout\) # (\u_vga|submarines\(18))))) # (!\u_vga|Add8~6_combout\ & (\u_vga|submarines\(2) & (!\u_vga|Add8~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(2),
	datab => \u_vga|Add8~6_combout\,
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|submarines\(18),
	combout => \u_vga|Mux0~8_combout\);

-- Location: LCCOMB_X30_Y17_N26
\u_vga|Mux0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~9_combout\ = (\u_vga|Add8~4_combout\ & ((\u_vga|Mux0~8_combout\ & ((\u_vga|submarines\(26)))) # (!\u_vga|Mux0~8_combout\ & (\u_vga|submarines\(10))))) # (!\u_vga|Add8~4_combout\ & (((\u_vga|Mux0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(10),
	datab => \u_vga|Add8~4_combout\,
	datac => \u_vga|submarines\(26),
	datad => \u_vga|Mux0~8_combout\,
	combout => \u_vga|Mux0~9_combout\);

-- Location: LCCOMB_X29_Y17_N0
\u_vga|Mux0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~12_combout\ = (\u_vga|Add8~0_combout\ & (((\u_vga|Add8~2_combout\) # (\u_vga|Mux0~9_combout\)))) # (!\u_vga|Add8~0_combout\ & (\u_vga|Mux0~11_combout\ & (!\u_vga|Add8~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~11_combout\,
	datab => \u_vga|Add8~0_combout\,
	datac => \u_vga|Add8~2_combout\,
	datad => \u_vga|Mux0~9_combout\,
	combout => \u_vga|Mux0~12_combout\);

-- Location: LCCOMB_X28_Y17_N2
\u_vga|submarines[12]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[12]~34_combout\ = (\u_vga|Add8~4_combout\ & (\u_vga|Add8~2_combout\ & !\u_vga|Add8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~4_combout\,
	datab => \u_vga|Add8~2_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|submarines[12]~34_combout\);

-- Location: LCCOMB_X28_Y17_N16
\u_vga|submarines[12]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[12]~19_combout\ = (\u_vga|submarines\(12)) # ((\u_vga|Decoder0~7_combout\ & (!\u_vga|Add8~8_combout\ & \u_vga|submarines[12]~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~7_combout\,
	datab => \u_vga|submarines\(12),
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|submarines[12]~34_combout\,
	combout => \u_vga|submarines[12]~19_combout\);

-- Location: LCCOMB_X28_Y17_N4
\u_vga|submarines[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[12]~feeder_combout\ = \u_vga|submarines[12]~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|submarines[12]~19_combout\,
	combout => \u_vga|submarines[12]~feeder_combout\);

-- Location: FF_X28_Y17_N5
\u_vga|submarines[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(12));

-- Location: LCCOMB_X28_Y17_N12
\u_vga|submarines[4]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[4]~25_combout\ = (!\u_vga|Add8~4_combout\ & (\u_vga|Add8~2_combout\ & !\u_vga|Add8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~4_combout\,
	datab => \u_vga|Add8~2_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|submarines[4]~25_combout\);

-- Location: LCCOMB_X28_Y17_N30
\u_vga|submarines[4]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[4]~26_combout\ = (\u_vga|submarines\(4)) # ((\u_vga|submarines[4]~25_combout\ & (!\u_vga|Add8~8_combout\ & \u_vga|Decoder0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines[4]~25_combout\,
	datab => \u_vga|Add8~8_combout\,
	datac => \u_vga|Decoder0~7_combout\,
	datad => \u_vga|submarines\(4),
	combout => \u_vga|submarines[4]~26_combout\);

-- Location: FF_X28_Y17_N13
\u_vga|submarines[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[4]~26_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(4));

-- Location: LCCOMB_X28_Y17_N8
\u_vga|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~6_combout\ = (\u_vga|Add8~4_combout\ & ((\u_vga|submarines\(12)) # ((\u_vga|Add8~6_combout\)))) # (!\u_vga|Add8~4_combout\ & (((!\u_vga|Add8~6_combout\ & \u_vga|submarines\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~4_combout\,
	datab => \u_vga|submarines\(12),
	datac => \u_vga|Add8~6_combout\,
	datad => \u_vga|submarines\(4),
	combout => \u_vga|Mux0~6_combout\);

-- Location: LCCOMB_X29_Y17_N4
\u_vga|Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~0_combout\ = (\u_vga|Add8~2_combout\ & !\u_vga|Add8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~2_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|Decoder0~0_combout\);

-- Location: LCCOMB_X29_Y17_N10
\u_vga|submarines[28]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[28]~6_combout\ = (\u_vga|submarines\(28)) # ((\u_vga|Decoder0~0_combout\ & (\u_vga|Add8~4_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~0_combout\,
	datab => \u_vga|submarines\(28),
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|submarines[28]~6_combout\);

-- Location: FF_X29_Y17_N5
\u_vga|submarines[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[28]~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(28));

-- Location: LCCOMB_X30_Y17_N0
\u_vga|submarines[20]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[20]~8_combout\ = (\u_vga|submarines\(20)) # ((!\u_vga|Add8~4_combout\ & (\u_vga|Decoder0~0_combout\ & \u_vga|Decoder0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(20),
	datab => \u_vga|Add8~4_combout\,
	datac => \u_vga|Decoder0~0_combout\,
	datad => \u_vga|Decoder0~2_combout\,
	combout => \u_vga|submarines[20]~8_combout\);

-- Location: FF_X30_Y17_N7
\u_vga|submarines[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[20]~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(20));

-- Location: LCCOMB_X29_Y17_N12
\u_vga|Mux0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~7_combout\ = (\u_vga|Add8~6_combout\ & ((\u_vga|Mux0~6_combout\ & (\u_vga|submarines\(28))) # (!\u_vga|Mux0~6_combout\ & ((\u_vga|submarines\(20)))))) # (!\u_vga|Add8~6_combout\ & (\u_vga|Mux0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~6_combout\,
	datab => \u_vga|Mux0~6_combout\,
	datac => \u_vga|submarines\(28),
	datad => \u_vga|submarines\(20),
	combout => \u_vga|Mux0~7_combout\);

-- Location: LCCOMB_X30_Y17_N28
\u_vga|Mux0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~15_combout\ = (\u_vga|Add8~2_combout\ & ((\u_vga|Mux0~12_combout\ & (\u_vga|Mux0~14_combout\)) # (!\u_vga|Mux0~12_combout\ & ((\u_vga|Mux0~7_combout\))))) # (!\u_vga|Add8~2_combout\ & (((\u_vga|Mux0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~2_combout\,
	datab => \u_vga|Mux0~14_combout\,
	datac => \u_vga|Mux0~12_combout\,
	datad => \u_vga|Mux0~7_combout\,
	combout => \u_vga|Mux0~15_combout\);

-- Location: LCCOMB_X31_Y17_N30
\u_vga|Decoder0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~6_combout\ = (\u_vga|tmp_random[7]~2_combout\ & (\u_vga|Add8~6_combout\ & !\u_vga|Mux0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|tmp_random[7]~2_combout\,
	datab => \u_vga|Add8~6_combout\,
	datad => \u_vga|Mux0~16_combout\,
	combout => \u_vga|Decoder0~6_combout\);

-- Location: LCCOMB_X31_Y17_N10
\u_vga|submarines[48]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[48]~14_combout\ = (\u_vga|submarines\(48)) # ((\u_vga|Decoder0~6_combout\ & (\u_vga|Add8~8_combout\ & \u_vga|Decoder0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~6_combout\,
	datab => \u_vga|submarines\(48),
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|Decoder0~1_combout\,
	combout => \u_vga|submarines[48]~14_combout\);

-- Location: FF_X31_Y17_N31
\u_vga|submarines[48]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[48]~14_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(48));

-- Location: LCCOMB_X29_Y18_N4
\u_vga|submarines[32]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[32]~17_combout\ = (\u_vga|submarines\(32)) # ((\u_vga|Add8~8_combout\ & (\u_vga|Decoder0~1_combout\ & \u_vga|Decoder0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~8_combout\,
	datab => \u_vga|Decoder0~1_combout\,
	datac => \u_vga|Decoder0~7_combout\,
	datad => \u_vga|submarines\(32),
	combout => \u_vga|submarines[32]~17_combout\);

-- Location: LCCOMB_X29_Y18_N10
\u_vga|submarines[32]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[32]~feeder_combout\ = \u_vga|submarines[32]~17_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines[32]~17_combout\,
	combout => \u_vga|submarines[32]~feeder_combout\);

-- Location: FF_X29_Y18_N11
\u_vga|submarines[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[32]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(32));

-- Location: LCCOMB_X28_Y18_N0
\u_vga|submarines[34]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[34]~16_combout\ = (\u_vga|submarines\(34)) # ((\u_vga|Add8~8_combout\ & (\u_vga|Decoder0~10_combout\ & !\u_vga|Add8~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~8_combout\,
	datab => \u_vga|submarines\(34),
	datac => \u_vga|Decoder0~10_combout\,
	datad => \u_vga|Add8~2_combout\,
	combout => \u_vga|submarines[34]~16_combout\);

-- Location: FF_X28_Y18_N25
\u_vga|submarines[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[34]~16_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(34));

-- Location: LCCOMB_X29_Y18_N20
\u_vga|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~2_combout\ = (\u_vga|Add8~2_combout\ & (((\u_vga|Add8~0_combout\)))) # (!\u_vga|Add8~2_combout\ & ((\u_vga|Add8~0_combout\ & ((\u_vga|submarines\(34)))) # (!\u_vga|Add8~0_combout\ & (\u_vga|submarines\(32)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(32),
	datab => \u_vga|Add8~2_combout\,
	datac => \u_vga|submarines\(34),
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|Mux0~2_combout\);

-- Location: LCCOMB_X29_Y18_N22
\u_vga|submarines[38]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[38]~18_combout\ = (\u_vga|submarines\(38)) # ((\u_vga|Add8~2_combout\ & (\u_vga|Add8~8_combout\ & \u_vga|Decoder0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(38),
	datab => \u_vga|Add8~2_combout\,
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|Decoder0~10_combout\,
	combout => \u_vga|submarines[38]~18_combout\);

-- Location: LCCOMB_X29_Y18_N26
\u_vga|submarines[38]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[38]~feeder_combout\ = \u_vga|submarines[38]~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|submarines[38]~18_combout\,
	combout => \u_vga|submarines[38]~feeder_combout\);

-- Location: FF_X29_Y18_N27
\u_vga|submarines[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[38]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(38));

-- Location: LCCOMB_X29_Y18_N12
\u_vga|Decoder0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~8_combout\ = (!\u_vga|Add8~4_combout\ & (\u_vga|Add8~2_combout\ & (!\u_vga|Add8~0_combout\ & \u_vga|Decoder0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~4_combout\,
	datab => \u_vga|Add8~2_combout\,
	datac => \u_vga|Add8~0_combout\,
	datad => \u_vga|Decoder0~7_combout\,
	combout => \u_vga|Decoder0~8_combout\);

-- Location: LCCOMB_X29_Y18_N14
\u_vga|submarines[36]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[36]~15_combout\ = (\u_vga|submarines\(36)) # ((\u_vga|Decoder0~8_combout\ & \u_vga|Add8~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~8_combout\,
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|submarines\(36),
	combout => \u_vga|submarines[36]~15_combout\);

-- Location: LCCOMB_X29_Y18_N24
\u_vga|submarines[36]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[36]~feeder_combout\ = \u_vga|submarines[36]~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|submarines[36]~15_combout\,
	combout => \u_vga|submarines[36]~feeder_combout\);

-- Location: FF_X29_Y18_N25
\u_vga|submarines[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[36]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(36));

-- Location: LCCOMB_X30_Y18_N14
\u_vga|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~3_combout\ = (\u_vga|Add8~2_combout\ & ((\u_vga|Mux0~2_combout\ & (\u_vga|submarines\(38))) # (!\u_vga|Mux0~2_combout\ & ((\u_vga|submarines\(36)))))) # (!\u_vga|Add8~2_combout\ & (\u_vga|Mux0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~2_combout\,
	datab => \u_vga|Mux0~2_combout\,
	datac => \u_vga|submarines\(38),
	datad => \u_vga|submarines\(36),
	combout => \u_vga|Mux0~3_combout\);

-- Location: LCCOMB_X30_Y18_N16
\u_vga|submarines[46]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[46]~32_combout\ = (\u_vga|Add8~4_combout\ & (\u_vga|Add8~2_combout\ & \u_vga|Add8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add8~4_combout\,
	datac => \u_vga|Add8~2_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|submarines[46]~32_combout\);

-- Location: LCCOMB_X30_Y18_N26
\u_vga|submarines[46]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[46]~33_combout\ = (\u_vga|submarines\(46)) # ((\u_vga|Decoder0~7_combout\ & (\u_vga|submarines[46]~32_combout\ & \u_vga|Add8~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~7_combout\,
	datab => \u_vga|submarines[46]~32_combout\,
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|submarines\(46),
	combout => \u_vga|submarines[46]~33_combout\);

-- Location: LCCOMB_X30_Y18_N0
\u_vga|submarines[46]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[46]~feeder_combout\ = \u_vga|submarines[46]~33_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines[46]~33_combout\,
	combout => \u_vga|submarines[46]~feeder_combout\);

-- Location: FF_X30_Y18_N1
\u_vga|submarines[46]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[46]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(46));

-- Location: LCCOMB_X30_Y18_N30
\u_vga|Decoder0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Decoder0~12_combout\ = (\u_vga|Add8~8_combout\ & (\u_vga|Add8~4_combout\ & \u_vga|Decoder0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~8_combout\,
	datab => \u_vga|Add8~4_combout\,
	datad => \u_vga|Decoder0~7_combout\,
	combout => \u_vga|Decoder0~12_combout\);

-- Location: LCCOMB_X30_Y18_N22
\u_vga|submarines[44]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[44]~36_combout\ = (\u_vga|submarines\(44)) # ((\u_vga|Add8~2_combout\ & (\u_vga|Decoder0~12_combout\ & !\u_vga|Add8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~2_combout\,
	datab => \u_vga|submarines\(44),
	datac => \u_vga|Decoder0~12_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|submarines[44]~36_combout\);

-- Location: LCCOMB_X30_Y18_N2
\u_vga|submarines[44]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[44]~feeder_combout\ = \u_vga|submarines[44]~36_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|submarines[44]~36_combout\,
	combout => \u_vga|submarines[44]~feeder_combout\);

-- Location: FF_X30_Y18_N3
\u_vga|submarines[44]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[44]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(44));

-- Location: LCCOMB_X30_Y18_N6
\u_vga|submarines[40]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[40]~30_combout\ = (\u_vga|Add8~4_combout\ & (\u_vga|Add8~8_combout\ & !\u_vga|Add8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add8~4_combout\,
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|submarines[40]~30_combout\);

-- Location: LCCOMB_X30_Y18_N10
\u_vga|submarines[40]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[40]~31_combout\ = (\u_vga|submarines\(40)) # ((\u_vga|Decoder0~7_combout\ & (\u_vga|submarines[40]~30_combout\ & !\u_vga|Add8~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Decoder0~7_combout\,
	datab => \u_vga|submarines[40]~30_combout\,
	datac => \u_vga|Add8~2_combout\,
	datad => \u_vga|submarines\(40),
	combout => \u_vga|submarines[40]~31_combout\);

-- Location: LCCOMB_X30_Y18_N20
\u_vga|submarines[40]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[40]~feeder_combout\ = \u_vga|submarines[40]~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines[40]~31_combout\,
	combout => \u_vga|submarines[40]~feeder_combout\);

-- Location: FF_X30_Y18_N21
\u_vga|submarines[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|submarines[40]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(40));

-- Location: LCCOMB_X30_Y18_N24
\u_vga|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~0_combout\ = (\u_vga|Add8~0_combout\ & (((\u_vga|Add8~2_combout\)))) # (!\u_vga|Add8~0_combout\ & ((\u_vga|Add8~2_combout\ & (\u_vga|submarines\(44))) # (!\u_vga|Add8~2_combout\ & ((\u_vga|submarines\(40))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~0_combout\,
	datab => \u_vga|submarines\(44),
	datac => \u_vga|Add8~2_combout\,
	datad => \u_vga|submarines\(40),
	combout => \u_vga|Mux0~0_combout\);

-- Location: LCCOMB_X30_Y18_N8
\u_vga|submarines[42]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|submarines[42]~35_combout\ = (\u_vga|submarines\(42)) # ((\u_vga|Add8~0_combout\ & (\u_vga|Decoder0~12_combout\ & !\u_vga|Add8~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~0_combout\,
	datab => \u_vga|submarines\(42),
	datac => \u_vga|Decoder0~12_combout\,
	datad => \u_vga|Add8~2_combout\,
	combout => \u_vga|submarines[42]~35_combout\);

-- Location: FF_X30_Y18_N31
\u_vga|submarines[42]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|submarines[42]~35_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|submarines\(42));

-- Location: LCCOMB_X30_Y18_N12
\u_vga|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~1_combout\ = (\u_vga|Mux0~0_combout\ & ((\u_vga|submarines\(46)) # ((!\u_vga|Add8~0_combout\)))) # (!\u_vga|Mux0~0_combout\ & (((\u_vga|submarines\(42) & \u_vga|Add8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(46),
	datab => \u_vga|Mux0~0_combout\,
	datac => \u_vga|submarines\(42),
	datad => \u_vga|Add8~0_combout\,
	combout => \u_vga|Mux0~1_combout\);

-- Location: LCCOMB_X31_Y18_N30
\u_vga|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~4_combout\ = (!\u_vga|Add8~6_combout\ & ((\u_vga|Add8~4_combout\ & ((\u_vga|Mux0~1_combout\))) # (!\u_vga|Add8~4_combout\ & (\u_vga|Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux0~3_combout\,
	datab => \u_vga|Add8~6_combout\,
	datac => \u_vga|Add8~4_combout\,
	datad => \u_vga|Mux0~1_combout\,
	combout => \u_vga|Mux0~4_combout\);

-- Location: LCCOMB_X31_Y17_N6
\u_vga|Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~5_combout\ = (\u_vga|Mux0~4_combout\) # ((\u_vga|Add8~6_combout\ & (\u_vga|submarines\(48) & \u_vga|Decoder0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add8~6_combout\,
	datab => \u_vga|submarines\(48),
	datac => \u_vga|Mux0~4_combout\,
	datad => \u_vga|Decoder0~1_combout\,
	combout => \u_vga|Mux0~5_combout\);

-- Location: LCCOMB_X30_Y17_N22
\u_vga|Mux0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux0~16_combout\ = (\u_vga|Add8~8_combout\ & ((\u_vga|Mux0~5_combout\))) # (!\u_vga|Add8~8_combout\ & (\u_vga|Mux0~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mux0~15_combout\,
	datac => \u_vga|Add8~8_combout\,
	datad => \u_vga|Mux0~5_combout\,
	combout => \u_vga|Mux0~16_combout\);

-- Location: LCCOMB_X28_Y19_N16
\u_vga|ask_read~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|ask_read~1_combout\ = (\u_vga|LessThan0~0_combout\ & ((!\u_vga|Mux0~16_combout\))) # (!\u_vga|LessThan0~0_combout\ & (\u_vga|ask_read~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|LessThan0~0_combout\,
	datac => \u_vga|ask_read~q\,
	datad => \u_vga|Mux0~16_combout\,
	combout => \u_vga|ask_read~1_combout\);

-- Location: FF_X28_Y19_N17
\u_vga|ask_read\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|ask_read~1_combout\,
	sclr => \u_vga|ask_read~q\,
	ena => \u_vga|ask_read~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|ask_read~q\);

-- Location: LCCOMB_X31_Y18_N24
\u_vga|wr_en_a~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|wr_en_a~2_combout\ = (!\u_vga|update_elements_position~4_combout\ & ((\u_vga|update_submarines~q\ & (\u_vga|first_part~q\)) # (!\u_vga|update_submarines~q\ & ((\u_vga|ask_read~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_elements_position~4_combout\,
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|first_part~q\,
	datad => \u_vga|ask_read~q\,
	combout => \u_vga|wr_en_a~2_combout\);

-- Location: LCCOMB_X31_Y18_N8
\u_vga|rd_en_a~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|rd_en_a~0_combout\ = ((!\u_vga|ask_read~q\ & ((\u_vga|Mux0~16_combout\) # (!\u_vga|LessThan0~0_combout\)))) # (!\u_vga|tmp_random[7]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan0~0_combout\,
	datab => \u_vga|Mux0~16_combout\,
	datac => \u_vga|tmp_random[7]~0_combout\,
	datad => \u_vga|ask_read~q\,
	combout => \u_vga|rd_en_a~0_combout\);

-- Location: LCCOMB_X31_Y18_N20
\u_vga|rd_en_a~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|rd_en_a~1_combout\ = (\u_vga|update_elements_position~4_combout\) # ((!\u_vga|v_sync~q\ & ((\u_vga|update_submarines~q\) # (!\u_vga|rd_en_a~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_elements_position~4_combout\,
	datab => \u_vga|v_sync~q\,
	datac => \u_vga|rd_en_a~0_combout\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|rd_en_a~1_combout\);

-- Location: FF_X31_Y18_N25
\u_vga|wr_en_a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|wr_en_a~2_combout\,
	ena => \u_vga|rd_en_a~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|wr_en_a~q\);

-- Location: LCCOMB_X31_Y18_N26
\u_vga|rd_en_a~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|rd_en_a~2_combout\ = !\u_vga|wr_en_a~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|wr_en_a~2_combout\,
	combout => \u_vga|rd_en_a~2_combout\);

-- Location: FF_X31_Y18_N27
\u_vga|rd_en_a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|rd_en_a~2_combout\,
	ena => \u_vga|rd_en_a~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|rd_en_a~q\);

-- Location: LCCOMB_X25_Y20_N28
\u_vga|rd_en_b~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|rd_en_b~0_combout\ = (\u_vga|rd_en_b~q\) # ((\u_vga|LessThan11~1_combout\ & ((!\u_vga|vga_gen~34_combout\) # (!\u_vga|current_submarine_line[4]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line[4]~15_combout\,
	datab => \u_vga|LessThan11~1_combout\,
	datac => \u_vga|rd_en_b~q\,
	datad => \u_vga|vga_gen~34_combout\,
	combout => \u_vga|rd_en_b~0_combout\);

-- Location: FF_X25_Y20_N29
\u_vga|rd_en_b\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|rd_en_b~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|rd_en_b~q\);

-- Location: LCCOMB_X31_Y18_N10
\u_vga|address_a[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a[0]~5_combout\ = (\u_vga|first_part~q\ & (\u_vga|current_submarine\(1) & VCC)) # (!\u_vga|first_part~q\ & (\u_vga|current_submarine\(1) $ (VCC)))
-- \u_vga|address_a[0]~6\ = CARRY((!\u_vga|first_part~q\ & \u_vga|current_submarine\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_part~q\,
	datab => \u_vga|current_submarine\(1),
	datad => VCC,
	combout => \u_vga|address_a[0]~5_combout\,
	cout => \u_vga|address_a[0]~6\);

-- Location: LCCOMB_X31_Y18_N6
\u_vga|address_a[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a[4]~7_combout\ = ((\u_vga|Mux0~16_combout\) # ((\u_vga|ask_read~q\) # (!\u_vga|tmp_random[7]~0_combout\))) # (!\u_vga|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan0~0_combout\,
	datab => \u_vga|Mux0~16_combout\,
	datac => \u_vga|tmp_random[7]~0_combout\,
	datad => \u_vga|ask_read~q\,
	combout => \u_vga|address_a[4]~7_combout\);

-- Location: LCCOMB_X31_Y18_N0
\u_vga|address_a[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a[4]~8_combout\ = (\u_vga|update_elements_position~4_combout\) # ((!\u_vga|v_sync~q\ & ((\u_vga|update_submarines~q\) # (!\u_vga|address_a[4]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|address_a[4]~7_combout\,
	datab => \u_vga|v_sync~q\,
	datac => \u_vga|update_elements_position~4_combout\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|address_a[4]~8_combout\);

-- Location: FF_X31_Y18_N11
\u_vga|address_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a[0]~5_combout\,
	asdata => \u_vga|Add8~0_combout\,
	sclr => \u_vga|update_elements_position~4_combout\,
	sload => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|address_a[4]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a\(0));

-- Location: LCCOMB_X31_Y18_N12
\u_vga|address_a[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a[1]~9_combout\ = (\u_vga|current_submarine\(2) & (!\u_vga|address_a[0]~6\)) # (!\u_vga|current_submarine\(2) & ((\u_vga|address_a[0]~6\) # (GND)))
-- \u_vga|address_a[1]~10\ = CARRY((!\u_vga|address_a[0]~6\) # (!\u_vga|current_submarine\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(2),
	datad => VCC,
	cin => \u_vga|address_a[0]~6\,
	combout => \u_vga|address_a[1]~9_combout\,
	cout => \u_vga|address_a[1]~10\);

-- Location: FF_X31_Y18_N13
\u_vga|address_a[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a[1]~9_combout\,
	asdata => \u_vga|Add8~2_combout\,
	sclr => \u_vga|update_elements_position~4_combout\,
	sload => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|address_a[4]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a\(1));

-- Location: LCCOMB_X31_Y18_N14
\u_vga|address_a[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a[2]~11_combout\ = (\u_vga|current_submarine\(3) & (\u_vga|address_a[1]~10\ $ (GND))) # (!\u_vga|current_submarine\(3) & (!\u_vga|address_a[1]~10\ & VCC))
-- \u_vga|address_a[2]~12\ = CARRY((\u_vga|current_submarine\(3) & !\u_vga|address_a[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(3),
	datad => VCC,
	cin => \u_vga|address_a[1]~10\,
	combout => \u_vga|address_a[2]~11_combout\,
	cout => \u_vga|address_a[2]~12\);

-- Location: FF_X31_Y18_N15
\u_vga|address_a[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a[2]~11_combout\,
	asdata => \u_vga|Add8~4_combout\,
	sclr => \u_vga|update_elements_position~4_combout\,
	sload => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|address_a[4]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a\(2));

-- Location: LCCOMB_X31_Y18_N16
\u_vga|address_a[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a[3]~13_combout\ = (\u_vga|current_submarine\(4) & (!\u_vga|address_a[2]~12\)) # (!\u_vga|current_submarine\(4) & ((\u_vga|address_a[2]~12\) # (GND)))
-- \u_vga|address_a[3]~14\ = CARRY((!\u_vga|address_a[2]~12\) # (!\u_vga|current_submarine\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine\(4),
	datad => VCC,
	cin => \u_vga|address_a[2]~12\,
	combout => \u_vga|address_a[3]~13_combout\,
	cout => \u_vga|address_a[3]~14\);

-- Location: FF_X31_Y18_N17
\u_vga|address_a[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a[3]~13_combout\,
	asdata => \u_vga|Add8~6_combout\,
	sclr => \u_vga|update_elements_position~4_combout\,
	sload => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|address_a[4]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a\(3));

-- Location: LCCOMB_X31_Y18_N18
\u_vga|address_a[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_a[4]~15_combout\ = !\u_vga|address_a[3]~14\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|address_a[3]~14\,
	combout => \u_vga|address_a[4]~15_combout\);

-- Location: FF_X31_Y18_N19
\u_vga|address_a[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_a[4]~15_combout\,
	asdata => \u_vga|Add8~8_combout\,
	sclr => \u_vga|update_elements_position~4_combout\,
	sload => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|address_a[4]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_a\(4));

-- Location: LCCOMB_X34_Y17_N0
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

-- Location: LCCOMB_X27_Y20_N20
\u_vga|address_b[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b[0]~5_combout\ = \u_vga|address_b\(0) $ (VCC)
-- \u_vga|address_b[0]~6\ = CARRY(\u_vga|address_b\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|address_b\(0),
	datad => VCC,
	combout => \u_vga|address_b[0]~5_combout\,
	cout => \u_vga|address_b[0]~6\);

-- Location: LCCOMB_X25_Y20_N22
\u_vga|rd_en_b~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|rd_en_b~1_combout\ = (\u_vga|LessThan11~1_combout\ & (((\u_vga|Equal1~3_combout\ & \u_vga|Equal9~4_combout\)) # (!\u_vga|current_submarine_line[4]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|current_submarine_line[4]~15_combout\,
	datab => \u_vga|LessThan11~1_combout\,
	datac => \u_vga|Equal1~3_combout\,
	datad => \u_vga|Equal9~4_combout\,
	combout => \u_vga|rd_en_b~1_combout\);

-- Location: FF_X27_Y20_N21
\u_vga|address_b[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b[0]~5_combout\,
	sclr => \u_vga|current_submarine_line[4]~15_combout\,
	ena => \u_vga|rd_en_b~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b\(0));

-- Location: LCCOMB_X27_Y20_N22
\u_vga|address_b[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b[1]~7_combout\ = (\u_vga|address_b\(1) & (!\u_vga|address_b[0]~6\)) # (!\u_vga|address_b\(1) & ((\u_vga|address_b[0]~6\) # (GND)))
-- \u_vga|address_b[1]~8\ = CARRY((!\u_vga|address_b[0]~6\) # (!\u_vga|address_b\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|address_b\(1),
	datad => VCC,
	cin => \u_vga|address_b[0]~6\,
	combout => \u_vga|address_b[1]~7_combout\,
	cout => \u_vga|address_b[1]~8\);

-- Location: FF_X27_Y20_N23
\u_vga|address_b[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b[1]~7_combout\,
	sclr => \u_vga|current_submarine_line[4]~15_combout\,
	ena => \u_vga|rd_en_b~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b\(1));

-- Location: LCCOMB_X27_Y20_N24
\u_vga|address_b[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b[2]~9_combout\ = (\u_vga|address_b\(2) & (\u_vga|address_b[1]~8\ $ (GND))) # (!\u_vga|address_b\(2) & (!\u_vga|address_b[1]~8\ & VCC))
-- \u_vga|address_b[2]~10\ = CARRY((\u_vga|address_b\(2) & !\u_vga|address_b[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|address_b\(2),
	datad => VCC,
	cin => \u_vga|address_b[1]~8\,
	combout => \u_vga|address_b[2]~9_combout\,
	cout => \u_vga|address_b[2]~10\);

-- Location: FF_X27_Y20_N25
\u_vga|address_b[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b[2]~9_combout\,
	sclr => \u_vga|current_submarine_line[4]~15_combout\,
	ena => \u_vga|rd_en_b~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b\(2));

-- Location: LCCOMB_X27_Y20_N26
\u_vga|address_b[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b[3]~11_combout\ = (\u_vga|address_b\(3) & (!\u_vga|address_b[2]~10\)) # (!\u_vga|address_b\(3) & ((\u_vga|address_b[2]~10\) # (GND)))
-- \u_vga|address_b[3]~12\ = CARRY((!\u_vga|address_b[2]~10\) # (!\u_vga|address_b\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|address_b\(3),
	datad => VCC,
	cin => \u_vga|address_b[2]~10\,
	combout => \u_vga|address_b[3]~11_combout\,
	cout => \u_vga|address_b[3]~12\);

-- Location: FF_X27_Y20_N27
\u_vga|address_b[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b[3]~11_combout\,
	sclr => \u_vga|current_submarine_line[4]~15_combout\,
	ena => \u_vga|rd_en_b~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b\(3));

-- Location: LCCOMB_X27_Y20_N28
\u_vga|address_b[4]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|address_b[4]~13_combout\ = \u_vga|address_b[3]~12\ $ (!\u_vga|address_b\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|address_b\(4),
	cin => \u_vga|address_b[3]~12\,
	combout => \u_vga|address_b[4]~13_combout\);

-- Location: FF_X27_Y20_N29
\u_vga|address_b[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|address_b[4]~13_combout\,
	sclr => \u_vga|current_submarine_line[4]~15_combout\,
	ena => \u_vga|rd_en_b~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|address_b\(4));

-- Location: LCCOMB_X35_Y18_N6
\u_vga|first_data[4]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[4]~3_combout\ = (\u_vga|update_submarines~q\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26)) # (!\u_vga|first_data[4]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datab => \u_vga|first_data[4]~2_combout\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|first_data[4]~3_combout\);

-- Location: LCCOMB_X34_Y19_N18
\u_vga|first_data[11]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[11]~25_combout\ = (\u_vga|ask_read~q\ & (!\u_vga|update_submarines~q\ & (!\u_vga|update_rockets~q\ & !\u_vga|new_elements~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|ask_read~q\,
	datab => \u_vga|update_submarines~q\,
	datac => \u_vga|update_rockets~q\,
	datad => \u_vga|new_elements~q\,
	combout => \u_vga|first_data[11]~25_combout\);

-- Location: M9K_X33_Y17_N0
\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ram1_submarine:u_ram1_submarine|altsyncram:altsyncram_component|altsyncram_b3o3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 18,
	port_b_first_address => 0,
	port_b_first_bit_number => 10,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \u_vga|wr_en_a~q\,
	portare => \u_vga|rd_en_a~q\,
	portbwe => GND,
	portbre => \u_vga|rd_en_b~q\,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portbdatain => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAIN_bus\,
	portaaddr => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\,
	portbdataout => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X35_Y17_N14
\u_vga|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal2~0_combout\ = (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17) & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18) & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16) & 
-- !\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17),
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18),
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16),
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24),
	combout => \u_vga|Equal2~0_combout\);

-- Location: LCCOMB_X35_Y17_N20
\u_vga|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal3~0_combout\ = (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22) & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21) & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19) & 
-- !\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22),
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21),
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19),
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20),
	combout => \u_vga|Equal3~0_combout\);

-- Location: LCCOMB_X35_Y17_N6
\u_vga|Equal3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal3~1_combout\ = (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23) & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25) & (\u_vga|Equal2~0_combout\ & \u_vga|Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23),
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25),
	datac => \u_vga|Equal2~0_combout\,
	datad => \u_vga|Equal3~0_combout\,
	combout => \u_vga|Equal3~1_combout\);

-- Location: LCCOMB_X36_Y17_N22
\u_vga|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~20_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & ((GND) # (!\u_vga|Add2~19\))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (\u_vga|Add2~19\ $ (GND)))
-- \u_vga|Add2~21\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26)) # (!\u_vga|Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datad => VCC,
	cin => \u_vga|Add2~19\,
	combout => \u_vga|Add2~20_combout\,
	cout => \u_vga|Add2~21\);

-- Location: LCCOMB_X36_Y17_N24
\u_vga|Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~22_combout\ = \u_vga|Add2~21\ $ (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	cin => \u_vga|Add2~21\,
	combout => \u_vga|Add2~22_combout\);

-- Location: LCCOMB_X36_Y18_N22
\u_vga|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~18_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25) & (!\u_vga|Add1~17\)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25) & ((\u_vga|Add1~17\) # (GND)))
-- \u_vga|Add1~19\ = CARRY((!\u_vga|Add1~17\) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25),
	datad => VCC,
	cin => \u_vga|Add1~17\,
	combout => \u_vga|Add1~18_combout\,
	cout => \u_vga|Add1~19\);

-- Location: LCCOMB_X36_Y18_N24
\u_vga|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~20_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (\u_vga|Add1~19\ $ (GND))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (!\u_vga|Add1~19\ & VCC))
-- \u_vga|Add1~21\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & !\u_vga|Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datad => VCC,
	cin => \u_vga|Add1~19\,
	combout => \u_vga|Add1~20_combout\,
	cout => \u_vga|Add1~21\);

-- Location: LCCOMB_X36_Y18_N26
\u_vga|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~22_combout\ = \u_vga|Add1~21\ $ (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	cin => \u_vga|Add1~21\,
	combout => \u_vga|Add1~22_combout\);

-- Location: LCCOMB_X35_Y17_N10
\u_vga|first_data[11]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[11]~26_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (((\u_vga|Add1~22_combout\)))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (\u_vga|Equal3~1_combout\ $ 
-- ((\u_vga|Add2~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal3~1_combout\,
	datab => \u_vga|Add2~22_combout\,
	datac => \u_vga|Add1~22_combout\,
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	combout => \u_vga|first_data[11]~26_combout\);

-- Location: LCCOMB_X34_Y18_N18
\u_vga|first_data[11]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[11]~27_combout\ = (\u_vga|first_data[11]~25_combout\) # ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & \u_vga|first_data[11]~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	datac => \u_vga|first_data[11]~25_combout\,
	datad => \u_vga|first_data[11]~26_combout\,
	combout => \u_vga|first_data[11]~27_combout\);

-- Location: LCCOMB_X31_Y18_N28
\u_vga|first_data[10]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[10]~28_combout\ = (\u_vga|update_submarines~q\ & (((!\u_vga|first_part~q\)))) # (!\u_vga|update_submarines~q\ & (\u_vga|tmp_random[7]~0_combout\ & (\u_vga|ask_read~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|tmp_random[7]~0_combout\,
	datab => \u_vga|ask_read~q\,
	datac => \u_vga|first_part~q\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|first_data[10]~28_combout\);

-- Location: LCCOMB_X34_Y18_N16
\u_vga|first_data[10]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[10]~29_combout\ = (!\u_vga|update_elements_position~4_combout\ & (\u_vga|first_data[10]~28_combout\ & !\u_vga|v_sync~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_elements_position~4_combout\,
	datab => \u_vga|first_data[10]~28_combout\,
	datad => \u_vga|v_sync~q\,
	combout => \u_vga|first_data[10]~29_combout\);

-- Location: FF_X34_Y18_N19
\u_vga|first_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data[11]~27_combout\,
	ena => \u_vga|first_data[10]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(11));

-- Location: LCCOMB_X34_Y18_N0
\u_vga|data_a~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~25_combout\ = (\u_vga|first_data\(11)) # (!\u_vga|update_submarines~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|first_data\(11),
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|data_a~25_combout\);

-- Location: LCCOMB_X34_Y19_N30
\u_vga|data_a[25]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[25]~1_combout\ = (\u_vga|new_elements~q\) # ((\u_vga|update_rockets~q\) # ((!\u_vga|Equal8~1_combout\) # (!\u_vga|ask_read~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|new_elements~q\,
	datab => \u_vga|update_rockets~q\,
	datac => \u_vga|ask_read~q\,
	datad => \u_vga|Equal8~1_combout\,
	combout => \u_vga|data_a[25]~1_combout\);

-- Location: LCCOMB_X34_Y18_N28
\u_vga|data_a[25]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[25]~2_combout\ = (\u_vga|update_submarines~q\ & ((!\u_vga|first_part~q\))) # (!\u_vga|update_submarines~q\ & (\u_vga|data_a[25]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a[25]~1_combout\,
	datab => \u_vga|first_part~q\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|data_a[25]~2_combout\);

-- Location: LCCOMB_X34_Y18_N20
\u_vga|data_a[25]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[25]~3_combout\ = (!\u_vga|update_elements_position~4_combout\ & (!\u_vga|data_a[25]~2_combout\ & !\u_vga|v_sync~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_elements_position~4_combout\,
	datab => \u_vga|data_a[25]~2_combout\,
	datad => \u_vga|v_sync~q\,
	combout => \u_vga|data_a[25]~3_combout\);

-- Location: FF_X34_Y18_N1
\u_vga|data_a[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~25_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(27));

-- Location: LCCOMB_X36_Y18_N4
\u_vga|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~0_combout\ = \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16) $ (VCC)
-- \u_vga|Add1~1\ = CARRY(\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16),
	datad => VCC,
	combout => \u_vga|Add1~0_combout\,
	cout => \u_vga|Add1~1\);

-- Location: LCCOMB_X36_Y18_N6
\u_vga|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~2_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17) & (!\u_vga|Add1~1\)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17) & ((\u_vga|Add1~1\) # (GND)))
-- \u_vga|Add1~3\ = CARRY((!\u_vga|Add1~1\) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17),
	datad => VCC,
	cin => \u_vga|Add1~1\,
	combout => \u_vga|Add1~2_combout\,
	cout => \u_vga|Add1~3\);

-- Location: LCCOMB_X36_Y18_N8
\u_vga|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~4_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18) & (\u_vga|Add1~3\ $ (GND))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18) & (!\u_vga|Add1~3\ & VCC))
-- \u_vga|Add1~5\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18) & !\u_vga|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18),
	datad => VCC,
	cin => \u_vga|Add1~3\,
	combout => \u_vga|Add1~4_combout\,
	cout => \u_vga|Add1~5\);

-- Location: LCCOMB_X36_Y18_N10
\u_vga|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~6_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19) & (!\u_vga|Add1~5\)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19) & ((\u_vga|Add1~5\) # (GND)))
-- \u_vga|Add1~7\ = CARRY((!\u_vga|Add1~5\) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19),
	datad => VCC,
	cin => \u_vga|Add1~5\,
	combout => \u_vga|Add1~6_combout\,
	cout => \u_vga|Add1~7\);

-- Location: LCCOMB_X36_Y18_N12
\u_vga|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~8_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20) & (\u_vga|Add1~7\ $ (GND))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20) & (!\u_vga|Add1~7\ & VCC))
-- \u_vga|Add1~9\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20) & !\u_vga|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20),
	datad => VCC,
	cin => \u_vga|Add1~7\,
	combout => \u_vga|Add1~8_combout\,
	cout => \u_vga|Add1~9\);

-- Location: LCCOMB_X36_Y18_N14
\u_vga|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~10_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21) & (!\u_vga|Add1~9\)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21) & ((\u_vga|Add1~9\) # (GND)))
-- \u_vga|Add1~11\ = CARRY((!\u_vga|Add1~9\) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21),
	datad => VCC,
	cin => \u_vga|Add1~9\,
	combout => \u_vga|Add1~10_combout\,
	cout => \u_vga|Add1~11\);

-- Location: LCCOMB_X36_Y18_N16
\u_vga|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~12_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22) & (\u_vga|Add1~11\ $ (GND))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22) & (!\u_vga|Add1~11\ & VCC))
-- \u_vga|Add1~13\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22) & !\u_vga|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22),
	datad => VCC,
	cin => \u_vga|Add1~11\,
	combout => \u_vga|Add1~12_combout\,
	cout => \u_vga|Add1~13\);

-- Location: LCCOMB_X36_Y18_N18
\u_vga|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~14_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23) & (!\u_vga|Add1~13\)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23) & ((\u_vga|Add1~13\) # (GND)))
-- \u_vga|Add1~15\ = CARRY((!\u_vga|Add1~13\) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23),
	datad => VCC,
	cin => \u_vga|Add1~13\,
	combout => \u_vga|Add1~14_combout\,
	cout => \u_vga|Add1~15\);

-- Location: LCCOMB_X36_Y18_N20
\u_vga|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add1~16_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24) & (\u_vga|Add1~15\ $ (GND))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24) & (!\u_vga|Add1~15\ & VCC))
-- \u_vga|Add1~17\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24) & !\u_vga|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24),
	datad => VCC,
	cin => \u_vga|Add1~15\,
	combout => \u_vga|Add1~16_combout\,
	cout => \u_vga|Add1~17\);

-- Location: LCCOMB_X35_Y18_N16
\u_vga|first_data[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[4]~4_combout\ = (!\u_vga|first_data[4]~2_combout\) # (!\u_vga|update_submarines~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|update_submarines~q\,
	datad => \u_vga|first_data[4]~2_combout\,
	combout => \u_vga|first_data[4]~4_combout\);

-- Location: LCCOMB_X36_Y17_N2
\u_vga|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~0_combout\ = \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16) $ (VCC)
-- \u_vga|Add2~1\ = CARRY(\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16),
	datad => VCC,
	combout => \u_vga|Add2~0_combout\,
	cout => \u_vga|Add2~1\);

-- Location: LCCOMB_X36_Y17_N4
\u_vga|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~2_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17) & (\u_vga|Add2~1\ & VCC)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17) & (!\u_vga|Add2~1\))
-- \u_vga|Add2~3\ = CARRY((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17) & !\u_vga|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17),
	datad => VCC,
	cin => \u_vga|Add2~1\,
	combout => \u_vga|Add2~2_combout\,
	cout => \u_vga|Add2~3\);

-- Location: LCCOMB_X36_Y17_N6
\u_vga|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~4_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18) & ((GND) # (!\u_vga|Add2~3\))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18) & (\u_vga|Add2~3\ $ (GND)))
-- \u_vga|Add2~5\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18)) # (!\u_vga|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18),
	datad => VCC,
	cin => \u_vga|Add2~3\,
	combout => \u_vga|Add2~4_combout\,
	cout => \u_vga|Add2~5\);

-- Location: LCCOMB_X36_Y17_N8
\u_vga|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~6_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19) & (\u_vga|Add2~5\ & VCC)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19) & (!\u_vga|Add2~5\))
-- \u_vga|Add2~7\ = CARRY((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19) & !\u_vga|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19),
	datad => VCC,
	cin => \u_vga|Add2~5\,
	combout => \u_vga|Add2~6_combout\,
	cout => \u_vga|Add2~7\);

-- Location: LCCOMB_X36_Y17_N10
\u_vga|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~8_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20) & ((GND) # (!\u_vga|Add2~7\))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20) & (\u_vga|Add2~7\ $ (GND)))
-- \u_vga|Add2~9\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20)) # (!\u_vga|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20),
	datad => VCC,
	cin => \u_vga|Add2~7\,
	combout => \u_vga|Add2~8_combout\,
	cout => \u_vga|Add2~9\);

-- Location: LCCOMB_X36_Y17_N12
\u_vga|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~10_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21) & (\u_vga|Add2~9\ & VCC)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21) & (!\u_vga|Add2~9\))
-- \u_vga|Add2~11\ = CARRY((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21) & !\u_vga|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21),
	datad => VCC,
	cin => \u_vga|Add2~9\,
	combout => \u_vga|Add2~10_combout\,
	cout => \u_vga|Add2~11\);

-- Location: LCCOMB_X36_Y17_N14
\u_vga|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~12_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22) & ((GND) # (!\u_vga|Add2~11\))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22) & (\u_vga|Add2~11\ $ (GND)))
-- \u_vga|Add2~13\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22)) # (!\u_vga|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22),
	datad => VCC,
	cin => \u_vga|Add2~11\,
	combout => \u_vga|Add2~12_combout\,
	cout => \u_vga|Add2~13\);

-- Location: LCCOMB_X36_Y17_N16
\u_vga|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~14_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23) & (\u_vga|Add2~13\ & VCC)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23) & (!\u_vga|Add2~13\))
-- \u_vga|Add2~15\ = CARRY((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23) & !\u_vga|Add2~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23),
	datad => VCC,
	cin => \u_vga|Add2~13\,
	combout => \u_vga|Add2~14_combout\,
	cout => \u_vga|Add2~15\);

-- Location: LCCOMB_X36_Y17_N18
\u_vga|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~16_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24) & ((GND) # (!\u_vga|Add2~15\))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24) & (\u_vga|Add2~15\ $ (GND)))
-- \u_vga|Add2~17\ = CARRY((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24)) # (!\u_vga|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24),
	datad => VCC,
	cin => \u_vga|Add2~15\,
	combout => \u_vga|Add2~16_combout\,
	cout => \u_vga|Add2~17\);

-- Location: LCCOMB_X36_Y17_N20
\u_vga|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add2~18_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25) & (\u_vga|Add2~17\ & VCC)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25) & (!\u_vga|Add2~17\))
-- \u_vga|Add2~19\ = CARRY((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25) & !\u_vga|Add2~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25),
	datad => VCC,
	cin => \u_vga|Add2~17\,
	combout => \u_vga|Add2~18_combout\,
	cout => \u_vga|Add2~19\);

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

-- Location: LCCOMB_X32_Y23_N6
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

-- Location: LCCOMB_X40_Y21_N24
\u_spi_ee_config|oDATA_YH_xhdl2[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\ = (\u_spi_ee_config|high_byte_d~q\ & (\u_spi_ee_config|low_byte_dataY[7]~0_combout\ & \u_spi_ee_config|direction~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|high_byte_d~q\,
	datac => \u_spi_ee_config|low_byte_dataY[7]~0_combout\,
	datad => \u_spi_ee_config|direction~q\,
	combout => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\);

-- Location: FF_X32_Y23_N7
\u_spi_ee_config|oDATA_YH_xhdl2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|oDATA_YH_xhdl2[1]~feeder_combout\,
	ena => \u_spi_ee_config|oDATA_YH_xhdl2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|oDATA_YH_xhdl2\(1));

-- Location: FF_X35_Y18_N7
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

-- Location: LCCOMB_X35_Y18_N18
\u_vga|first_data~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~5_combout\ = (\u_vga|first_data[4]~3_combout\ & (\u_vga|first_data[4]~4_combout\)) # (!\u_vga|first_data[4]~3_combout\ & ((\u_vga|first_data[4]~4_combout\ & ((\u_vga|sign_g_y~q\))) # (!\u_vga|first_data[4]~4_combout\ & 
-- (\u_vga|Add2~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~3_combout\,
	datab => \u_vga|first_data[4]~4_combout\,
	datac => \u_vga|Add2~18_combout\,
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|first_data~5_combout\);

-- Location: LCCOMB_X35_Y18_N24
\u_vga|first_data~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~6_combout\ = (\u_vga|first_data[4]~3_combout\ & ((\u_vga|first_data~5_combout\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25)))) # (!\u_vga|first_data~5_combout\ & (\u_vga|Add1~18_combout\)))) # 
-- (!\u_vga|first_data[4]~3_combout\ & (((\u_vga|first_data~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~3_combout\,
	datab => \u_vga|Add1~18_combout\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25),
	datad => \u_vga|first_data~5_combout\,
	combout => \u_vga|first_data~6_combout\);

-- Location: LCCOMB_X35_Y18_N26
\u_vga|data_a[25]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[25]~26_combout\ = (!\u_vga|update_elements_position~4_combout\ & (!\u_vga|v_sync~q\ & ((\u_vga|update_submarines~q\) # (!\u_vga|data_a[25]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_elements_position~4_combout\,
	datab => \u_vga|data_a[25]~1_combout\,
	datac => \u_vga|v_sync~q\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|data_a[25]~26_combout\);

-- Location: LCCOMB_X35_Y18_N30
\u_vga|first_data[9]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[9]~33_combout\ = (\u_vga|data_a[25]~26_combout\ & ((!\u_vga|first_part~q\) # (!\u_vga|update_submarines~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|data_a[25]~26_combout\,
	datab => \u_vga|update_submarines~q\,
	datad => \u_vga|first_part~q\,
	combout => \u_vga|first_data[9]~33_combout\);

-- Location: FF_X35_Y18_N25
\u_vga|first_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~6_combout\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(9));

-- Location: LCCOMB_X34_Y18_N6
\u_vga|data_a~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~15_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|first_data\(9))) # (!\u_vga|update_submarines~q\ & ((\u_vga|sign_g_y~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_vga|first_data\(9),
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|data_a~15_combout\);

-- Location: FF_X34_Y18_N7
\u_vga|data_a[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~15_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(25));

-- Location: M9K_X33_Y18_N0
\u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ram1_submarine:u_ram1_submarine|altsyncram:altsyncram_component|altsyncram_b3o3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 18,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \u_vga|wr_en_a~q\,
	portare => \u_vga|rd_en_a~q\,
	portbwe => GND,
	portbre => \u_vga|rd_en_b~q\,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portbdatain => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\,
	portaaddr => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\,
	portbdataout => \u_ram1_submarine|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X35_Y17_N30
\u_vga|first_data~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~7_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & ((\u_vga|Add1~16_combout\))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (\u_vga|Add2~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datac => \u_vga|Add2~16_combout\,
	datad => \u_vga|Add1~16_combout\,
	combout => \u_vga|first_data~7_combout\);

-- Location: LCCOMB_X35_Y17_N24
\u_vga|first_data~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~8_combout\ = (\u_vga|first_data~7_combout\ & ((\u_vga|first_data[4]~2_combout\) # ((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24))))) # 
-- (!\u_vga|first_data~7_combout\ & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data~7_combout\,
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	datac => \u_vga|first_data[4]~2_combout\,
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(24),
	combout => \u_vga|first_data~8_combout\);

-- Location: FF_X35_Y17_N25
\u_vga|first_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~8_combout\,
	sclr => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(8));

-- Location: LCCOMB_X35_Y17_N16
\u_vga|data_a~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~16_combout\ = (\u_vga|update_submarines~q\ & \u_vga|first_data\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datad => \u_vga|first_data\(8),
	combout => \u_vga|data_a~16_combout\);

-- Location: LCCOMB_X34_Y17_N20
\u_vga|data_a[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[24]~feeder_combout\ = \u_vga|data_a~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|data_a~16_combout\,
	combout => \u_vga|data_a[24]~feeder_combout\);

-- Location: FF_X34_Y17_N21
\u_vga|data_a[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a[24]~feeder_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(24));

-- Location: LCCOMB_X35_Y18_N4
\u_vga|first_data~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~9_combout\ = (\u_vga|first_data[4]~3_combout\ & ((\u_vga|Add1~14_combout\) # ((\u_vga|first_data[4]~4_combout\)))) # (!\u_vga|first_data[4]~3_combout\ & (((\u_vga|Add2~14_combout\ & !\u_vga|first_data[4]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~3_combout\,
	datab => \u_vga|Add1~14_combout\,
	datac => \u_vga|Add2~14_combout\,
	datad => \u_vga|first_data[4]~4_combout\,
	combout => \u_vga|first_data~9_combout\);

-- Location: LCCOMB_X35_Y18_N28
\u_vga|first_data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~10_combout\ = (\u_vga|first_data[4]~4_combout\ & ((\u_vga|first_data~9_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23))) # (!\u_vga|first_data~9_combout\ & ((\u_vga|sign_g_y~q\))))) # 
-- (!\u_vga|first_data[4]~4_combout\ & (((\u_vga|first_data~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23),
	datab => \u_vga|first_data[4]~4_combout\,
	datac => \u_vga|first_data~9_combout\,
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|first_data~10_combout\);

-- Location: FF_X35_Y18_N29
\u_vga|first_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~10_combout\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(7));

-- Location: LCCOMB_X34_Y18_N4
\u_vga|data_a~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~17_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|first_data\(7))) # (!\u_vga|update_submarines~q\ & ((\u_vga|sign_g_y~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|first_data\(7),
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|data_a~17_combout\);

-- Location: FF_X34_Y18_N5
\u_vga|data_a[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~17_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(23));

-- Location: LCCOMB_X35_Y18_N10
\u_vga|first_data~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~11_combout\ = (\u_vga|first_data[4]~4_combout\ & (((\u_vga|first_data[4]~3_combout\) # (\u_vga|sign_g_y~q\)))) # (!\u_vga|first_data[4]~4_combout\ & (\u_vga|Add2~12_combout\ & (!\u_vga|first_data[4]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add2~12_combout\,
	datab => \u_vga|first_data[4]~4_combout\,
	datac => \u_vga|first_data[4]~3_combout\,
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|first_data~11_combout\);

-- Location: LCCOMB_X35_Y18_N22
\u_vga|first_data~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~12_combout\ = (\u_vga|first_data[4]~3_combout\ & ((\u_vga|first_data~11_combout\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22)))) # (!\u_vga|first_data~11_combout\ & (\u_vga|Add1~12_combout\)))) # 
-- (!\u_vga|first_data[4]~3_combout\ & (((\u_vga|first_data~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~3_combout\,
	datab => \u_vga|Add1~12_combout\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22),
	datad => \u_vga|first_data~11_combout\,
	combout => \u_vga|first_data~12_combout\);

-- Location: FF_X35_Y18_N23
\u_vga|first_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~12_combout\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(6));

-- Location: LCCOMB_X34_Y18_N14
\u_vga|data_a~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~18_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|first_data\(6))) # (!\u_vga|update_submarines~q\ & ((\u_vga|sign_g_y~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|first_data\(6),
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|data_a~18_combout\);

-- Location: FF_X34_Y18_N15
\u_vga|data_a[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~18_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(22));

-- Location: LCCOMB_X35_Y18_N12
\u_vga|first_data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~13_combout\ = (\u_vga|first_data[4]~4_combout\ & (((\u_vga|first_data[4]~3_combout\)))) # (!\u_vga|first_data[4]~4_combout\ & ((\u_vga|first_data[4]~3_combout\ & (\u_vga|Add1~10_combout\)) # (!\u_vga|first_data[4]~3_combout\ & 
-- ((\u_vga|Add2~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add1~10_combout\,
	datab => \u_vga|first_data[4]~4_combout\,
	datac => \u_vga|Add2~10_combout\,
	datad => \u_vga|first_data[4]~3_combout\,
	combout => \u_vga|first_data~13_combout\);

-- Location: LCCOMB_X35_Y18_N20
\u_vga|first_data~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~14_combout\ = (\u_vga|first_data~13_combout\ & (((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21))) # (!\u_vga|first_data[4]~4_combout\))) # (!\u_vga|first_data~13_combout\ & (\u_vga|first_data[4]~4_combout\ & 
-- ((\u_vga|sign_g_y~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data~13_combout\,
	datab => \u_vga|first_data[4]~4_combout\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21),
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|first_data~14_combout\);

-- Location: FF_X35_Y18_N21
\u_vga|first_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~14_combout\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(5));

-- Location: LCCOMB_X34_Y18_N24
\u_vga|data_a~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~19_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|first_data\(5))) # (!\u_vga|update_submarines~q\ & ((\u_vga|sign_g_y~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_vga|first_data\(5),
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|data_a~19_combout\);

-- Location: FF_X34_Y18_N25
\u_vga|data_a[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~19_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(21));

-- Location: LCCOMB_X35_Y18_N2
\u_vga|first_data~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~15_combout\ = (\u_vga|first_data[4]~3_combout\ & (\u_vga|first_data[4]~4_combout\)) # (!\u_vga|first_data[4]~3_combout\ & ((\u_vga|first_data[4]~4_combout\ & ((\u_vga|sign_g_y~q\))) # (!\u_vga|first_data[4]~4_combout\ & 
-- (\u_vga|Add2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~3_combout\,
	datab => \u_vga|first_data[4]~4_combout\,
	datac => \u_vga|Add2~8_combout\,
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|first_data~15_combout\);

-- Location: LCCOMB_X35_Y18_N14
\u_vga|first_data~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~16_combout\ = (\u_vga|first_data[4]~3_combout\ & ((\u_vga|first_data~15_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20))) # (!\u_vga|first_data~15_combout\ & ((\u_vga|Add1~8_combout\))))) # 
-- (!\u_vga|first_data[4]~3_combout\ & (((\u_vga|first_data~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~3_combout\,
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20),
	datac => \u_vga|Add1~8_combout\,
	datad => \u_vga|first_data~15_combout\,
	combout => \u_vga|first_data~16_combout\);

-- Location: FF_X35_Y18_N15
\u_vga|first_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~16_combout\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(4));

-- Location: LCCOMB_X34_Y18_N26
\u_vga|data_a~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~20_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|first_data\(4))) # (!\u_vga|update_submarines~q\ & ((\u_vga|sign_g_y~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_vga|first_data\(4),
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|data_a~20_combout\);

-- Location: FF_X34_Y18_N27
\u_vga|data_a[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~20_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(20));

-- Location: LCCOMB_X35_Y18_N0
\u_vga|first_data~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~17_combout\ = (\u_vga|first_data[4]~3_combout\ & ((\u_vga|first_data[4]~4_combout\) # ((\u_vga|Add1~6_combout\)))) # (!\u_vga|first_data[4]~3_combout\ & (!\u_vga|first_data[4]~4_combout\ & ((\u_vga|Add2~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~3_combout\,
	datab => \u_vga|first_data[4]~4_combout\,
	datac => \u_vga|Add1~6_combout\,
	datad => \u_vga|Add2~6_combout\,
	combout => \u_vga|first_data~17_combout\);

-- Location: LCCOMB_X35_Y18_N8
\u_vga|first_data~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~18_combout\ = (\u_vga|first_data[4]~4_combout\ & ((\u_vga|first_data~17_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19))) # (!\u_vga|first_data~17_combout\ & ((\u_vga|sign_g_y~q\))))) # 
-- (!\u_vga|first_data[4]~4_combout\ & (((\u_vga|first_data~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19),
	datab => \u_vga|first_data[4]~4_combout\,
	datac => \u_vga|first_data~17_combout\,
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|first_data~18_combout\);

-- Location: FF_X35_Y18_N9
\u_vga|first_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~18_combout\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(3));

-- Location: LCCOMB_X34_Y18_N8
\u_vga|data_a~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~21_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|first_data\(3))) # (!\u_vga|update_submarines~q\ & ((\u_vga|sign_g_y~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_vga|first_data\(3),
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|data_a~21_combout\);

-- Location: FF_X34_Y18_N9
\u_vga|data_a[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~21_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(19));

-- Location: LCCOMB_X34_Y21_N16
\u_vga|second_data~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data~21_combout\ = (\u_vga|first_part~q\ & ((\u_vga|update_submarines~q\ & ((\u_vga|data_a~13_combout\))) # (!\u_vga|update_submarines~q\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(11))))) # (!\u_vga|first_part~q\ & 
-- (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(11),
	datab => \u_vga|first_part~q\,
	datac => \u_vga|data_a~13_combout\,
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|second_data~21_combout\);

-- Location: FF_X34_Y21_N17
\u_vga|second_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data~21_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(11));

-- Location: LCCOMB_X36_Y21_N4
\u_vga|Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~0_combout\ = \u_vga|second_data\(0) $ (VCC)
-- \u_vga|Add5~1\ = CARRY(\u_vga|second_data\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(0),
	datad => VCC,
	combout => \u_vga|Add5~0_combout\,
	cout => \u_vga|Add5~1\);

-- Location: LCCOMB_X35_Y21_N0
\u_vga|Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~0_combout\ = \u_vga|second_data\(0) $ (VCC)
-- \u_vga|Add4~1\ = CARRY(\u_vga|second_data\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(0),
	datad => VCC,
	combout => \u_vga|Add4~0_combout\,
	cout => \u_vga|Add4~1\);

-- Location: LCCOMB_X34_Y21_N24
\u_vga|Add5~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~29_combout\ = (\u_vga|second_data\(10) & ((\u_vga|Add4~0_combout\))) # (!\u_vga|second_data\(10) & (\u_vga|Add5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~0_combout\,
	datac => \u_vga|Add4~0_combout\,
	datad => \u_vga|second_data\(10),
	combout => \u_vga|Add5~29_combout\);

-- Location: LCCOMB_X34_Y21_N18
\u_vga|second_data[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[0]~1_combout\ = (\u_vga|second_data~18_combout\ & (\u_vga|second_data\(0))) # (!\u_vga|second_data~18_combout\ & ((\u_vga|Add5~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data~18_combout\,
	datac => \u_vga|second_data\(0),
	datad => \u_vga|Add5~29_combout\,
	combout => \u_vga|second_data[0]~1_combout\);

-- Location: LCCOMB_X31_Y17_N4
\u_vga|second_data[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[4]~14_combout\ = (!\u_vga|first_part~q\) # (!\u_vga|update_submarines~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|update_submarines~q\,
	datad => \u_vga|first_part~q\,
	combout => \u_vga|second_data[4]~14_combout\);

-- Location: FF_X34_Y21_N19
\u_vga|second_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[0]~1_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(0),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(0));

-- Location: LCCOMB_X35_Y21_N2
\u_vga|Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~2_combout\ = (\u_vga|second_data\(1) & (!\u_vga|Add4~1\)) # (!\u_vga|second_data\(1) & ((\u_vga|Add4~1\) # (GND)))
-- \u_vga|Add4~3\ = CARRY((!\u_vga|Add4~1\) # (!\u_vga|second_data\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(1),
	datad => VCC,
	cin => \u_vga|Add4~1\,
	combout => \u_vga|Add4~2_combout\,
	cout => \u_vga|Add4~3\);

-- Location: LCCOMB_X35_Y21_N4
\u_vga|Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~4_combout\ = (\u_vga|second_data\(2) & (\u_vga|Add4~3\ $ (GND))) # (!\u_vga|second_data\(2) & (!\u_vga|Add4~3\ & VCC))
-- \u_vga|Add4~5\ = CARRY((\u_vga|second_data\(2) & !\u_vga|Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(2),
	datad => VCC,
	cin => \u_vga|Add4~3\,
	combout => \u_vga|Add4~4_combout\,
	cout => \u_vga|Add4~5\);

-- Location: LCCOMB_X36_Y21_N6
\u_vga|Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~2_combout\ = (\u_vga|second_data\(1) & (\u_vga|Add5~1\ & VCC)) # (!\u_vga|second_data\(1) & (!\u_vga|Add5~1\))
-- \u_vga|Add5~3\ = CARRY((!\u_vga|second_data\(1) & !\u_vga|Add5~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(1),
	datad => VCC,
	cin => \u_vga|Add5~1\,
	combout => \u_vga|Add5~2_combout\,
	cout => \u_vga|Add5~3\);

-- Location: LCCOMB_X36_Y21_N8
\u_vga|Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~4_combout\ = (\u_vga|second_data\(2) & ((GND) # (!\u_vga|Add5~3\))) # (!\u_vga|second_data\(2) & (\u_vga|Add5~3\ $ (GND)))
-- \u_vga|Add5~5\ = CARRY((\u_vga|second_data\(2)) # (!\u_vga|Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(2),
	datad => VCC,
	cin => \u_vga|Add5~3\,
	combout => \u_vga|Add5~4_combout\,
	cout => \u_vga|Add5~5\);

-- Location: LCCOMB_X35_Y21_N30
\u_vga|Add5~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~27_combout\ = (\u_vga|second_data\(10) & (\u_vga|Add4~4_combout\)) # (!\u_vga|second_data\(10) & ((\u_vga|Add5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add4~4_combout\,
	datac => \u_vga|Add5~4_combout\,
	datad => \u_vga|second_data\(10),
	combout => \u_vga|Add5~27_combout\);

-- Location: LCCOMB_X34_Y21_N2
\u_vga|second_data[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[2]~3_combout\ = (\u_vga|second_data~18_combout\ & ((\u_vga|second_data\(2)))) # (!\u_vga|second_data~18_combout\ & (\u_vga|Add5~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~27_combout\,
	datac => \u_vga|second_data\(2),
	datad => \u_vga|second_data~18_combout\,
	combout => \u_vga|second_data[2]~3_combout\);

-- Location: FF_X34_Y21_N3
\u_vga|second_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[2]~3_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(2),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(2));

-- Location: LCCOMB_X36_Y21_N10
\u_vga|Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~6_combout\ = (\u_vga|second_data\(3) & (\u_vga|Add5~5\ & VCC)) # (!\u_vga|second_data\(3) & (!\u_vga|Add5~5\))
-- \u_vga|Add5~7\ = CARRY((!\u_vga|second_data\(3) & !\u_vga|Add5~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(3),
	datad => VCC,
	cin => \u_vga|Add5~5\,
	combout => \u_vga|Add5~6_combout\,
	cout => \u_vga|Add5~7\);

-- Location: LCCOMB_X35_Y21_N6
\u_vga|Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~6_combout\ = (\u_vga|second_data\(3) & (!\u_vga|Add4~5\)) # (!\u_vga|second_data\(3) & ((\u_vga|Add4~5\) # (GND)))
-- \u_vga|Add4~7\ = CARRY((!\u_vga|Add4~5\) # (!\u_vga|second_data\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(3),
	datad => VCC,
	cin => \u_vga|Add4~5\,
	combout => \u_vga|Add4~6_combout\,
	cout => \u_vga|Add4~7\);

-- Location: LCCOMB_X35_Y20_N20
\u_vga|Add5~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~26_combout\ = (\u_vga|second_data\(10) & ((\u_vga|Add4~6_combout\))) # (!\u_vga|second_data\(10) & (\u_vga|Add5~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(10),
	datac => \u_vga|Add5~6_combout\,
	datad => \u_vga|Add4~6_combout\,
	combout => \u_vga|Add5~26_combout\);

-- Location: LCCOMB_X35_Y20_N16
\u_vga|second_data[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[3]~4_combout\ = (\u_vga|second_data~18_combout\ & (\u_vga|second_data\(3))) # (!\u_vga|second_data~18_combout\ & ((\u_vga|Add5~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data~18_combout\,
	datac => \u_vga|second_data\(3),
	datad => \u_vga|Add5~26_combout\,
	combout => \u_vga|second_data[3]~4_combout\);

-- Location: FF_X35_Y20_N17
\u_vga|second_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[3]~4_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(3),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(3));

-- Location: LCCOMB_X36_Y21_N12
\u_vga|Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~8_combout\ = (\u_vga|second_data\(4) & ((GND) # (!\u_vga|Add5~7\))) # (!\u_vga|second_data\(4) & (\u_vga|Add5~7\ $ (GND)))
-- \u_vga|Add5~9\ = CARRY((\u_vga|second_data\(4)) # (!\u_vga|Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(4),
	datad => VCC,
	cin => \u_vga|Add5~7\,
	combout => \u_vga|Add5~8_combout\,
	cout => \u_vga|Add5~9\);

-- Location: LCCOMB_X36_Y21_N14
\u_vga|Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~10_combout\ = (\u_vga|second_data\(5) & (\u_vga|Add5~9\ & VCC)) # (!\u_vga|second_data\(5) & (!\u_vga|Add5~9\))
-- \u_vga|Add5~11\ = CARRY((!\u_vga|second_data\(5) & !\u_vga|Add5~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(5),
	datad => VCC,
	cin => \u_vga|Add5~9\,
	combout => \u_vga|Add5~10_combout\,
	cout => \u_vga|Add5~11\);

-- Location: LCCOMB_X35_Y21_N8
\u_vga|Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~8_combout\ = (\u_vga|second_data\(4) & (\u_vga|Add4~7\ $ (GND))) # (!\u_vga|second_data\(4) & (!\u_vga|Add4~7\ & VCC))
-- \u_vga|Add4~9\ = CARRY((\u_vga|second_data\(4) & !\u_vga|Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(4),
	datad => VCC,
	cin => \u_vga|Add4~7\,
	combout => \u_vga|Add4~8_combout\,
	cout => \u_vga|Add4~9\);

-- Location: LCCOMB_X35_Y21_N10
\u_vga|Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~10_combout\ = (\u_vga|second_data\(5) & (!\u_vga|Add4~9\)) # (!\u_vga|second_data\(5) & ((\u_vga|Add4~9\) # (GND)))
-- \u_vga|Add4~11\ = CARRY((!\u_vga|Add4~9\) # (!\u_vga|second_data\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(5),
	datad => VCC,
	cin => \u_vga|Add4~9\,
	combout => \u_vga|Add4~10_combout\,
	cout => \u_vga|Add4~11\);

-- Location: LCCOMB_X35_Y20_N10
\u_vga|Add5~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~24_combout\ = (\u_vga|second_data\(10) & ((\u_vga|Add4~10_combout\))) # (!\u_vga|second_data\(10) & (\u_vga|Add5~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(10),
	datac => \u_vga|Add5~10_combout\,
	datad => \u_vga|Add4~10_combout\,
	combout => \u_vga|Add5~24_combout\);

-- Location: LCCOMB_X35_Y20_N24
\u_vga|second_data[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[5]~6_combout\ = (\u_vga|second_data~18_combout\ & (\u_vga|second_data\(5))) # (!\u_vga|second_data~18_combout\ & ((\u_vga|Add5~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data~18_combout\,
	datac => \u_vga|second_data\(5),
	datad => \u_vga|Add5~24_combout\,
	combout => \u_vga|second_data[5]~6_combout\);

-- Location: FF_X35_Y20_N25
\u_vga|second_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[5]~6_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(5),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(5));

-- Location: LCCOMB_X35_Y21_N12
\u_vga|Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~12_combout\ = (\u_vga|second_data\(6) & (\u_vga|Add4~11\ $ (GND))) # (!\u_vga|second_data\(6) & (!\u_vga|Add4~11\ & VCC))
-- \u_vga|Add4~13\ = CARRY((\u_vga|second_data\(6) & !\u_vga|Add4~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(6),
	datad => VCC,
	cin => \u_vga|Add4~11\,
	combout => \u_vga|Add4~12_combout\,
	cout => \u_vga|Add4~13\);

-- Location: LCCOMB_X35_Y21_N14
\u_vga|Add4~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~14_combout\ = (\u_vga|second_data\(7) & (!\u_vga|Add4~13\)) # (!\u_vga|second_data\(7) & ((\u_vga|Add4~13\) # (GND)))
-- \u_vga|Add4~15\ = CARRY((!\u_vga|Add4~13\) # (!\u_vga|second_data\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(7),
	datad => VCC,
	cin => \u_vga|Add4~13\,
	combout => \u_vga|Add4~14_combout\,
	cout => \u_vga|Add4~15\);

-- Location: LCCOMB_X36_Y21_N16
\u_vga|Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~12_combout\ = (\u_vga|second_data\(6) & ((GND) # (!\u_vga|Add5~11\))) # (!\u_vga|second_data\(6) & (\u_vga|Add5~11\ $ (GND)))
-- \u_vga|Add5~13\ = CARRY((\u_vga|second_data\(6)) # (!\u_vga|Add5~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(6),
	datad => VCC,
	cin => \u_vga|Add5~11\,
	combout => \u_vga|Add5~12_combout\,
	cout => \u_vga|Add5~13\);

-- Location: LCCOMB_X36_Y21_N18
\u_vga|Add5~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~14_combout\ = (\u_vga|second_data\(7) & (\u_vga|Add5~13\ & VCC)) # (!\u_vga|second_data\(7) & (!\u_vga|Add5~13\))
-- \u_vga|Add5~15\ = CARRY((!\u_vga|second_data\(7) & !\u_vga|Add5~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(7),
	datad => VCC,
	cin => \u_vga|Add5~13\,
	combout => \u_vga|Add5~14_combout\,
	cout => \u_vga|Add5~15\);

-- Location: LCCOMB_X35_Y20_N18
\u_vga|Add5~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~22_combout\ = (\u_vga|second_data\(10) & (\u_vga|Add4~14_combout\)) # (!\u_vga|second_data\(10) & ((\u_vga|Add5~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~14_combout\,
	datac => \u_vga|second_data\(10),
	datad => \u_vga|Add5~14_combout\,
	combout => \u_vga|Add5~22_combout\);

-- Location: LCCOMB_X35_Y20_N12
\u_vga|second_data[7]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[7]~8_combout\ = (\u_vga|second_data~18_combout\ & (\u_vga|second_data\(7))) # (!\u_vga|second_data~18_combout\ & ((\u_vga|Add5~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data~18_combout\,
	datac => \u_vga|second_data\(7),
	datad => \u_vga|Add5~22_combout\,
	combout => \u_vga|second_data[7]~8_combout\);

-- Location: FF_X35_Y20_N13
\u_vga|second_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[7]~8_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(7),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(7));

-- Location: LCCOMB_X36_Y21_N20
\u_vga|Add5~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~16_combout\ = (\u_vga|second_data\(8) & ((GND) # (!\u_vga|Add5~15\))) # (!\u_vga|second_data\(8) & (\u_vga|Add5~15\ $ (GND)))
-- \u_vga|Add5~17\ = CARRY((\u_vga|second_data\(8)) # (!\u_vga|Add5~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(8),
	datad => VCC,
	cin => \u_vga|Add5~15\,
	combout => \u_vga|Add5~16_combout\,
	cout => \u_vga|Add5~17\);

-- Location: LCCOMB_X35_Y21_N16
\u_vga|Add4~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~16_combout\ = (\u_vga|second_data\(8) & (\u_vga|Add4~15\ $ (GND))) # (!\u_vga|second_data\(8) & (!\u_vga|Add4~15\ & VCC))
-- \u_vga|Add4~17\ = CARRY((\u_vga|second_data\(8) & !\u_vga|Add4~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(8),
	datad => VCC,
	cin => \u_vga|Add4~15\,
	combout => \u_vga|Add4~16_combout\,
	cout => \u_vga|Add4~17\);

-- Location: LCCOMB_X35_Y21_N26
\u_vga|Add5~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~21_combout\ = (\u_vga|second_data\(10) & ((\u_vga|Add4~16_combout\))) # (!\u_vga|second_data\(10) & (\u_vga|Add5~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(10),
	datac => \u_vga|Add5~16_combout\,
	datad => \u_vga|Add4~16_combout\,
	combout => \u_vga|Add5~21_combout\);

-- Location: LCCOMB_X34_Y21_N28
\u_vga|second_data[8]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[8]~9_combout\ = (\u_vga|second_data~18_combout\ & (\u_vga|second_data\(8))) # (!\u_vga|second_data~18_combout\ & ((\u_vga|Add5~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data~18_combout\,
	datac => \u_vga|second_data\(8),
	datad => \u_vga|Add5~21_combout\,
	combout => \u_vga|second_data[8]~9_combout\);

-- Location: FF_X34_Y21_N29
\u_vga|second_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[8]~9_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(8),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(8));

-- Location: LCCOMB_X35_Y21_N18
\u_vga|Add4~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~18_combout\ = (\u_vga|second_data\(9) & (!\u_vga|Add4~17\)) # (!\u_vga|second_data\(9) & ((\u_vga|Add4~17\) # (GND)))
-- \u_vga|Add4~19\ = CARRY((!\u_vga|Add4~17\) # (!\u_vga|second_data\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(9),
	datad => VCC,
	cin => \u_vga|Add4~17\,
	combout => \u_vga|Add4~18_combout\,
	cout => \u_vga|Add4~19\);

-- Location: LCCOMB_X35_Y21_N20
\u_vga|Add4~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~20_combout\ = (\u_vga|second_data\(10) & (\u_vga|Add4~19\ $ (GND))) # (!\u_vga|second_data\(10) & (!\u_vga|Add4~19\ & VCC))
-- \u_vga|Add4~21\ = CARRY((\u_vga|second_data\(10) & !\u_vga|Add4~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(10),
	datad => VCC,
	cin => \u_vga|Add4~19\,
	combout => \u_vga|Add4~20_combout\,
	cout => \u_vga|Add4~21\);

-- Location: LCCOMB_X35_Y21_N22
\u_vga|Add4~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add4~22_combout\ = \u_vga|second_data\(11) $ (\u_vga|Add4~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(11),
	cin => \u_vga|Add4~21\,
	combout => \u_vga|Add4~22_combout\);

-- Location: LCCOMB_X34_Y21_N22
\u_vga|data_a~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~13_combout\ = (\u_vga|second_data\(11) & ((\u_vga|Add4~22_combout\) # (!\u_vga|second_data\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(10),
	datab => \u_vga|second_data\(11),
	datad => \u_vga|Add4~22_combout\,
	combout => \u_vga|data_a~13_combout\);

-- Location: LCCOMB_X34_Y21_N10
\u_vga|data_a~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~14_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|data_a~13_combout\)) # (!\u_vga|update_submarines~q\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_vga|data_a~13_combout\,
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(11),
	combout => \u_vga|data_a~14_combout\);

-- Location: FF_X34_Y21_N11
\u_vga|data_a[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~14_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(11));

-- Location: LCCOMB_X34_Y17_N6
\u_vga|second_data~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data~20_combout\ = (\u_vga|update_submarines~q\ & ((\u_vga|first_part~q\ & ((\u_vga|data_a[9]~0_combout\))) # (!\u_vga|first_part~q\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(9))))) # (!\u_vga|update_submarines~q\ & 
-- (((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|first_part~q\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(9),
	datad => \u_vga|data_a[9]~0_combout\,
	combout => \u_vga|second_data~20_combout\);

-- Location: FF_X34_Y17_N7
\u_vga|second_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data~20_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(9));

-- Location: LCCOMB_X36_Y21_N22
\u_vga|Add5~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~18_combout\ = \u_vga|second_data\(9) $ (!\u_vga|Add5~17\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data\(9),
	cin => \u_vga|Add5~17\,
	combout => \u_vga|Add5~18_combout\);

-- Location: LCCOMB_X35_Y21_N24
\u_vga|Add5~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~20_combout\ = (\u_vga|second_data\(10) & ((\u_vga|Add4~18_combout\))) # (!\u_vga|second_data\(10) & (\u_vga|Add5~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~18_combout\,
	datab => \u_vga|Add4~18_combout\,
	datad => \u_vga|second_data\(10),
	combout => \u_vga|Add5~20_combout\);

-- Location: LCCOMB_X34_Y17_N28
\u_vga|data_a[9]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[9]~0_combout\ = (\u_vga|second_data~18_combout\ & (\u_vga|second_data\(9))) # (!\u_vga|second_data~18_combout\ & ((\u_vga|Add5~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(9),
	datab => \u_vga|second_data~18_combout\,
	datad => \u_vga|Add5~20_combout\,
	combout => \u_vga|data_a[9]~0_combout\);

-- Location: FF_X34_Y17_N29
\u_vga|data_a[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a[9]~0_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(9),
	sload => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(9));

-- Location: LCCOMB_X35_Y17_N2
\u_vga|data_a~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~4_combout\ = (\u_vga|update_submarines~q\ & ((\u_vga|second_data[8]~9_combout\))) # (!\u_vga|update_submarines~q\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(8),
	datad => \u_vga|second_data[8]~9_combout\,
	combout => \u_vga|data_a~4_combout\);

-- Location: LCCOMB_X34_Y17_N10
\u_vga|data_a[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[8]~feeder_combout\ = \u_vga|data_a~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|data_a~4_combout\,
	combout => \u_vga|data_a[8]~feeder_combout\);

-- Location: FF_X34_Y17_N11
\u_vga|data_a[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a[8]~feeder_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(8));

-- Location: LCCOMB_X35_Y20_N28
\u_vga|data_a~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~5_combout\ = (\u_vga|update_submarines~q\ & ((\u_vga|second_data[7]~8_combout\))) # (!\u_vga|update_submarines~q\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(7),
	datad => \u_vga|second_data[7]~8_combout\,
	combout => \u_vga|data_a~5_combout\);

-- Location: FF_X34_Y18_N21
\u_vga|data_a[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|data_a~5_combout\,
	sload => VCC,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(7));

-- Location: LCCOMB_X34_Y18_N2
\u_vga|data_a~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~6_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|second_data[6]~7_combout\)) # (!\u_vga|update_submarines~q\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_vga|second_data[6]~7_combout\,
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(6),
	combout => \u_vga|data_a~6_combout\);

-- Location: FF_X34_Y18_N3
\u_vga|data_a[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~6_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(6));

-- Location: LCCOMB_X35_Y20_N4
\u_vga|data_a~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~7_combout\ = (\u_vga|update_submarines~q\ & ((\u_vga|second_data[5]~6_combout\))) # (!\u_vga|update_submarines~q\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(5),
	datad => \u_vga|second_data[5]~6_combout\,
	combout => \u_vga|data_a~7_combout\);

-- Location: FF_X34_Y18_N29
\u_vga|data_a[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|data_a~7_combout\,
	sload => VCC,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(5));

-- Location: FF_X35_Y20_N23
\u_vga|second_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[4]~5_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(4),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(4));

-- Location: LCCOMB_X35_Y21_N28
\u_vga|Add5~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~25_combout\ = (\u_vga|second_data\(10) & (\u_vga|Add4~8_combout\)) # (!\u_vga|second_data\(10) & ((\u_vga|Add5~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add4~8_combout\,
	datac => \u_vga|Add5~8_combout\,
	datad => \u_vga|second_data\(10),
	combout => \u_vga|Add5~25_combout\);

-- Location: LCCOMB_X35_Y20_N22
\u_vga|second_data[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[4]~5_combout\ = (\u_vga|second_data~18_combout\ & (\u_vga|second_data\(4))) # (!\u_vga|second_data~18_combout\ & ((\u_vga|Add5~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data~18_combout\,
	datac => \u_vga|second_data\(4),
	datad => \u_vga|Add5~25_combout\,
	combout => \u_vga|second_data[4]~5_combout\);

-- Location: LCCOMB_X35_Y20_N26
\u_vga|data_a~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~8_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|second_data[4]~5_combout\)) # (!\u_vga|update_submarines~q\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data[4]~5_combout\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(4),
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|data_a~8_combout\);

-- Location: LCCOMB_X34_Y20_N8
\u_vga|data_a[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[4]~feeder_combout\ = \u_vga|data_a~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|data_a~8_combout\,
	combout => \u_vga|data_a[4]~feeder_combout\);

-- Location: FF_X34_Y20_N9
\u_vga|data_a[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a[4]~feeder_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(4));

-- Location: LCCOMB_X34_Y18_N10
\u_vga|data_a~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~9_combout\ = (\u_vga|update_submarines~q\ & ((\u_vga|second_data[3]~4_combout\))) # (!\u_vga|update_submarines~q\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(3),
	datad => \u_vga|second_data[3]~4_combout\,
	combout => \u_vga|data_a~9_combout\);

-- Location: FF_X34_Y18_N11
\u_vga|data_a[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~9_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(3));

-- Location: LCCOMB_X34_Y21_N12
\u_vga|data_a~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~10_combout\ = (\u_vga|update_submarines~q\ & ((\u_vga|second_data[2]~3_combout\))) # (!\u_vga|update_submarines~q\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(2),
	datad => \u_vga|second_data[2]~3_combout\,
	combout => \u_vga|data_a~10_combout\);

-- Location: FF_X34_Y18_N17
\u_vga|data_a[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|data_a~10_combout\,
	sload => VCC,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(2));

-- Location: FF_X34_Y21_N5
\u_vga|second_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[1]~2_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(1),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(1));

-- Location: LCCOMB_X34_Y21_N26
\u_vga|Add5~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~28_combout\ = (\u_vga|second_data\(10) & ((\u_vga|Add4~2_combout\))) # (!\u_vga|second_data\(10) & (\u_vga|Add5~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(10),
	datac => \u_vga|Add5~2_combout\,
	datad => \u_vga|Add4~2_combout\,
	combout => \u_vga|Add5~28_combout\);

-- Location: LCCOMB_X34_Y21_N4
\u_vga|second_data[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[1]~2_combout\ = (\u_vga|second_data~18_combout\ & ((\u_vga|second_data\(1)))) # (!\u_vga|second_data~18_combout\ & (\u_vga|Add5~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add5~28_combout\,
	datac => \u_vga|second_data\(1),
	datad => \u_vga|second_data~18_combout\,
	combout => \u_vga|second_data[1]~2_combout\);

-- Location: LCCOMB_X34_Y21_N6
\u_vga|data_a~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~11_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|second_data[1]~2_combout\)) # (!\u_vga|update_submarines~q\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data[1]~2_combout\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(1),
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|data_a~11_combout\);

-- Location: FF_X34_Y21_N7
\u_vga|data_a[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~11_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(1));

-- Location: LCCOMB_X34_Y21_N20
\u_vga|data_a~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~12_combout\ = (\u_vga|update_submarines~q\ & ((\u_vga|second_data[0]~1_combout\))) # (!\u_vga|update_submarines~q\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(0),
	datad => \u_vga|second_data[0]~1_combout\,
	combout => \u_vga|data_a~12_combout\);

-- Location: FF_X34_Y21_N21
\u_vga|data_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~12_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(0));

-- Location: LCCOMB_X35_Y17_N26
\u_vga|first_data[10]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[10]~31_combout\ = (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & ((\u_vga|Add2~20_combout\) # (\u_vga|Equal3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datab => \u_vga|Add2~20_combout\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	datad => \u_vga|Equal3~1_combout\,
	combout => \u_vga|first_data[10]~31_combout\);

-- Location: LCCOMB_X36_Y17_N0
\u_vga|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal2~1_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19) & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21) & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20) & 
-- \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(19),
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(21),
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(20),
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(22),
	combout => \u_vga|Equal2~1_combout\);

-- Location: LCCOMB_X36_Y17_N30
\u_vga|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal2~2_combout\ = (\u_vga|Equal2~0_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23) & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25) & \u_vga|Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal2~0_combout\,
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(23),
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(25),
	datad => \u_vga|Equal2~1_combout\,
	combout => \u_vga|Equal2~2_combout\);

-- Location: LCCOMB_X35_Y17_N28
\u_vga|first_data[10]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[10]~30_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (((!\u_vga|Equal2~2_combout\ & \u_vga|Add1~20_combout\)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	datac => \u_vga|Equal2~2_combout\,
	datad => \u_vga|Add1~20_combout\,
	combout => \u_vga|first_data[10]~30_combout\);

-- Location: LCCOMB_X34_Y18_N22
\u_vga|first_data[10]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[10]~32_combout\ = (\u_vga|first_data[11]~25_combout\ & (((!\u_vga|sign_g_y~q\)))) # (!\u_vga|first_data[11]~25_combout\ & ((\u_vga|first_data[10]~31_combout\) # ((\u_vga|first_data[10]~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[10]~31_combout\,
	datab => \u_vga|first_data[10]~30_combout\,
	datac => \u_vga|first_data[11]~25_combout\,
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|first_data[10]~32_combout\);

-- Location: FF_X34_Y18_N23
\u_vga|first_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data[10]~32_combout\,
	ena => \u_vga|first_data[10]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(10));

-- Location: LCCOMB_X34_Y18_N12
\u_vga|data_a~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~28_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|first_data\(10))) # (!\u_vga|update_submarines~q\ & ((!\u_vga|sign_g_y~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_vga|first_data\(10),
	datad => \u_vga|sign_g_y~q\,
	combout => \u_vga|data_a~28_combout\);

-- Location: FF_X34_Y18_N13
\u_vga|data_a[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~28_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(26));

-- Location: LCCOMB_X35_Y17_N8
\u_vga|first_data~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~19_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (\u_vga|Add1~4_combout\)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & ((\u_vga|Add2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datab => \u_vga|Add1~4_combout\,
	datad => \u_vga|Add2~4_combout\,
	combout => \u_vga|first_data~19_combout\);

-- Location: LCCOMB_X35_Y17_N22
\u_vga|first_data~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~20_combout\ = (\u_vga|first_data[4]~2_combout\ & ((\u_vga|first_data~19_combout\) # ((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18))))) # 
-- (!\u_vga|first_data[4]~2_combout\ & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~2_combout\,
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	datac => \u_vga|first_data~19_combout\,
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(18),
	combout => \u_vga|first_data~20_combout\);

-- Location: FF_X35_Y17_N23
\u_vga|first_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~20_combout\,
	sclr => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(2));

-- Location: LCCOMB_X35_Y17_N18
\u_vga|data_a~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~22_combout\ = (\u_vga|update_submarines~q\ & \u_vga|first_data\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datac => \u_vga|first_data\(2),
	combout => \u_vga|data_a~22_combout\);

-- Location: LCCOMB_X34_Y17_N18
\u_vga|data_a[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[18]~feeder_combout\ = \u_vga|data_a~22_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|data_a~22_combout\,
	combout => \u_vga|data_a[18]~feeder_combout\);

-- Location: FF_X34_Y17_N19
\u_vga|data_a[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a[18]~feeder_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(18));

-- Location: LCCOMB_X36_Y17_N28
\u_vga|first_data~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~21_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & ((\u_vga|Add1~2_combout\))) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (\u_vga|Add2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datac => \u_vga|Add2~2_combout\,
	datad => \u_vga|Add1~2_combout\,
	combout => \u_vga|first_data~21_combout\);

-- Location: LCCOMB_X35_Y17_N12
\u_vga|first_data~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~22_combout\ = (\u_vga|first_data[4]~2_combout\ & ((\u_vga|first_data~21_combout\) # ((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17))))) # 
-- (!\u_vga|first_data[4]~2_combout\ & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~2_combout\,
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(17),
	datad => \u_vga|first_data~21_combout\,
	combout => \u_vga|first_data~22_combout\);

-- Location: FF_X35_Y17_N13
\u_vga|first_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~22_combout\,
	sclr => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(1));

-- Location: LCCOMB_X35_Y17_N4
\u_vga|data_a~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~23_combout\ = (\u_vga|update_submarines~q\ & \u_vga|first_data\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datad => \u_vga|first_data\(1),
	combout => \u_vga|data_a~23_combout\);

-- Location: LCCOMB_X34_Y17_N12
\u_vga|data_a[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a[17]~feeder_combout\ = \u_vga|data_a~23_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|data_a~23_combout\,
	combout => \u_vga|data_a[17]~feeder_combout\);

-- Location: FF_X34_Y17_N13
\u_vga|data_a[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a[17]~feeder_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(17));

-- Location: LCCOMB_X35_Y17_N0
\u_vga|first_data[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data[4]~2_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (!\u_vga|Equal2~2_combout\)) # 
-- (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & ((!\u_vga|Equal3~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	datac => \u_vga|Equal2~2_combout\,
	datad => \u_vga|Equal3~1_combout\,
	combout => \u_vga|first_data[4]~2_combout\);

-- Location: LCCOMB_X36_Y18_N2
\u_vga|first_data~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~23_combout\ = (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & (\u_vga|Add1~0_combout\)) # (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26) & ((\u_vga|Add2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(26),
	datac => \u_vga|Add1~0_combout\,
	datad => \u_vga|Add2~0_combout\,
	combout => \u_vga|first_data~23_combout\);

-- Location: LCCOMB_X36_Y18_N28
\u_vga|first_data~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_data~24_combout\ = (\u_vga|first_data[4]~2_combout\ & ((\u_vga|first_data~23_combout\) # ((!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16))))) # 
-- (!\u_vga|first_data[4]~2_combout\ & (!\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27) & (\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_data[4]~2_combout\,
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(27),
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(16),
	datad => \u_vga|first_data~23_combout\,
	combout => \u_vga|first_data~24_combout\);

-- Location: FF_X36_Y18_N29
\u_vga|first_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_data~24_combout\,
	sclr => \u_vga|ALT_INV_update_submarines~q\,
	ena => \u_vga|first_data[9]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_data\(0));

-- Location: LCCOMB_X34_Y18_N30
\u_vga|data_a~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~24_combout\ = (\u_vga|update_submarines~q\ & \u_vga|first_data\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|update_submarines~q\,
	datad => \u_vga|first_data\(0),
	combout => \u_vga|data_a~24_combout\);

-- Location: FF_X34_Y18_N31
\u_vga|data_a[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~24_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(16));

-- Location: FF_X34_Y21_N9
\u_vga|second_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[10]~0_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(10),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(10));

-- Location: LCCOMB_X36_Y21_N24
\u_vga|second_data~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data~16_combout\ = (!\u_vga|second_data\(6) & (!\u_vga|second_data\(7) & !\u_vga|second_data\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(6),
	datac => \u_vga|second_data\(7),
	datad => \u_vga|second_data\(5),
	combout => \u_vga|second_data~16_combout\);

-- Location: LCCOMB_X36_Y21_N26
\u_vga|second_data~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data~15_combout\ = (!\u_vga|second_data\(10) & (!\u_vga|second_data\(9) & (!\u_vga|second_data\(4) & !\u_vga|second_data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(10),
	datab => \u_vga|second_data\(9),
	datac => \u_vga|second_data\(4),
	datad => \u_vga|second_data\(3),
	combout => \u_vga|second_data~15_combout\);

-- Location: LCCOMB_X36_Y21_N28
\u_vga|Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal4~0_combout\ = (!\u_vga|second_data\(2) & (!\u_vga|second_data\(0) & (!\u_vga|second_data\(1) & !\u_vga|second_data\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(2),
	datab => \u_vga|second_data\(0),
	datac => \u_vga|second_data\(1),
	datad => \u_vga|second_data\(8),
	combout => \u_vga|Equal4~0_combout\);

-- Location: LCCOMB_X36_Y21_N2
\u_vga|second_data~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data~17_combout\ = (\u_vga|second_data~16_combout\ & (\u_vga|second_data~15_combout\ & \u_vga|Equal4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data~16_combout\,
	datac => \u_vga|second_data~15_combout\,
	datad => \u_vga|Equal4~0_combout\,
	combout => \u_vga|second_data~17_combout\);

-- Location: LCCOMB_X34_Y21_N30
\u_vga|second_data~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data~18_combout\ = (\u_vga|second_data~17_combout\) # (((\u_vga|second_data\(10) & \u_vga|Equal4~2_combout\)) # (!\u_vga|second_data\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(10),
	datab => \u_vga|second_data~17_combout\,
	datac => \u_vga|Equal4~2_combout\,
	datad => \u_vga|second_data\(11),
	combout => \u_vga|second_data~18_combout\);

-- Location: LCCOMB_X36_Y20_N28
\u_vga|Add5~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add5~23_combout\ = (\u_vga|second_data\(10) & (\u_vga|Add4~12_combout\)) # (!\u_vga|second_data\(10) & ((\u_vga|Add5~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add4~12_combout\,
	datac => \u_vga|second_data\(10),
	datad => \u_vga|Add5~12_combout\,
	combout => \u_vga|Add5~23_combout\);

-- Location: LCCOMB_X35_Y20_N14
\u_vga|second_data[6]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[6]~7_combout\ = (\u_vga|second_data~18_combout\ & (\u_vga|second_data\(6))) # (!\u_vga|second_data~18_combout\ & ((\u_vga|Add5~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data~18_combout\,
	datac => \u_vga|second_data\(6),
	datad => \u_vga|Add5~23_combout\,
	combout => \u_vga|second_data[6]~7_combout\);

-- Location: FF_X35_Y20_N15
\u_vga|second_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_data[6]~7_combout\,
	asdata => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(6),
	sload => \u_vga|second_data[4]~14_combout\,
	ena => \u_vga|data_a[25]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_data\(6));

-- Location: LCCOMB_X36_Y21_N0
\u_vga|Equal4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal4~1_combout\ = (\u_vga|second_data\(3) & (\u_vga|second_data\(9) & (\u_vga|second_data\(4) & \u_vga|second_data\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(3),
	datab => \u_vga|second_data\(9),
	datac => \u_vga|second_data\(4),
	datad => \u_vga|second_data\(5),
	combout => \u_vga|Equal4~1_combout\);

-- Location: LCCOMB_X36_Y21_N30
\u_vga|Equal4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Equal4~2_combout\ = (\u_vga|second_data\(6) & (\u_vga|Equal4~0_combout\ & (\u_vga|second_data\(7) & \u_vga|Equal4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_data\(6),
	datab => \u_vga|Equal4~0_combout\,
	datac => \u_vga|second_data\(7),
	datad => \u_vga|Equal4~1_combout\,
	combout => \u_vga|Equal4~2_combout\);

-- Location: LCCOMB_X34_Y21_N0
\u_vga|second_data~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data~19_combout\ = (\u_vga|second_data~17_combout\) # ((!\u_vga|Equal4~2_combout\ & (\u_vga|Add4~20_combout\ & \u_vga|second_data\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Equal4~2_combout\,
	datab => \u_vga|second_data~17_combout\,
	datac => \u_vga|Add4~20_combout\,
	datad => \u_vga|second_data\(10),
	combout => \u_vga|second_data~19_combout\);

-- Location: LCCOMB_X34_Y21_N8
\u_vga|second_data[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_data[10]~0_combout\ = (\u_vga|second_data\(11) & (\u_vga|second_data~19_combout\)) # (!\u_vga|second_data\(11) & ((\u_vga|second_data\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data~19_combout\,
	datac => \u_vga|second_data\(10),
	datad => \u_vga|second_data\(11),
	combout => \u_vga|second_data[10]~0_combout\);

-- Location: LCCOMB_X34_Y21_N14
\u_vga|data_a~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|data_a~27_combout\ = (\u_vga|update_submarines~q\ & (\u_vga|second_data[10]~0_combout\)) # (!\u_vga|update_submarines~q\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_a\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_data[10]~0_combout\,
	datac => \u_ram1_submarine|altsyncram_component|auto_generated|q_a\(10),
	datad => \u_vga|update_submarines~q\,
	combout => \u_vga|data_a~27_combout\);

-- Location: FF_X34_Y21_N15
\u_vga|data_a[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|data_a~27_combout\,
	ena => \u_vga|data_a[25]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|data_a\(10));

-- Location: LCCOMB_X26_Y22_N6
\u_vga|second_row[9]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row[9]~11_combout\ = (!\u_vga|vga_gen~2_combout\ & \u_vga|LessThan11~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|vga_gen~2_combout\,
	datad => \u_vga|LessThan11~1_combout\,
	combout => \u_vga|second_row[9]~11_combout\);

-- Location: FF_X32_Y19_N13
\u_vga|first_row[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~10_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(11));

-- Location: LCCOMB_X26_Y20_N6
\u_vga|vga_gen~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~12_combout\ = (!\u_vga|Add19~4_combout\ & (!\u_vga|h_cnt\(10) & (!\u_vga|h_cnt\(3) & !\u_vga|Add19~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add19~4_combout\,
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|Add19~2_combout\,
	combout => \u_vga|vga_gen~12_combout\);

-- Location: LCCOMB_X26_Y21_N28
\u_vga|vga_gen~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~14_combout\ = (!\u_vga|h_cnt\(0) & (\u_vga|Add19~0_combout\ & (!\u_vga|h_cnt\(1) & !\u_vga|h_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datab => \u_vga|Add19~0_combout\,
	datac => \u_vga|h_cnt\(1),
	datad => \u_vga|h_cnt\(2),
	combout => \u_vga|vga_gen~14_combout\);

-- Location: LCCOMB_X26_Y21_N30
\u_vga|vga_gen~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~15_combout\ = (!\u_vga|Add19~6_combout\ & (\u_vga|vga_gen~13_combout\ & \u_vga|vga_gen~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add19~6_combout\,
	datab => \u_vga|vga_gen~13_combout\,
	datad => \u_vga|vga_gen~14_combout\,
	combout => \u_vga|vga_gen~15_combout\);

-- Location: LCCOMB_X26_Y20_N30
\u_vga|vga_gen~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~16_combout\ = (\u_vga|vga_gen~12_combout\ & (\u_vga|vga_gen~4_combout\ & (\u_vga|vga_gen~15_combout\ & !\u_vga|Add19~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~12_combout\,
	datab => \u_vga|vga_gen~4_combout\,
	datac => \u_vga|vga_gen~15_combout\,
	datad => \u_vga|Add19~8_combout\,
	combout => \u_vga|vga_gen~16_combout\);

-- Location: LCCOMB_X32_Y19_N12
\u_vga|first_row~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~10_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(27))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(27),
	datac => \u_vga|first_row\(11),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~10_combout\);

-- Location: FF_X32_Y18_N7
\u_vga|first_row[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~0_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(9));

-- Location: LCCOMB_X32_Y18_N6
\u_vga|first_row~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~0_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(25))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(25),
	datac => \u_vga|first_row\(9),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~0_combout\);

-- Location: FF_X32_Y18_N13
\u_vga|first_row[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~1_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(8));

-- Location: LCCOMB_X32_Y18_N12
\u_vga|first_row~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~1_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(24))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(24),
	datac => \u_vga|first_row\(8),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~1_combout\);

-- Location: FF_X32_Y18_N23
\u_vga|first_row[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~2_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(7));

-- Location: LCCOMB_X32_Y18_N22
\u_vga|first_row~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~2_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(23))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(23),
	datac => \u_vga|first_row\(7),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~2_combout\);

-- Location: FF_X30_Y19_N5
\u_vga|first_row[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~3_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(6));

-- Location: LCCOMB_X30_Y19_N4
\u_vga|first_row~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~3_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(22))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(22),
	datab => \u_vga|vga_gen~16_combout\,
	datac => \u_vga|first_row\(6),
	combout => \u_vga|first_row~3_combout\);

-- Location: FF_X30_Y19_N3
\u_vga|first_row[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~4_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(5));

-- Location: LCCOMB_X30_Y19_N2
\u_vga|first_row~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~4_combout\ = (\u_vga|vga_gen~16_combout\ & ((\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(21)))) # (!\u_vga|vga_gen~16_combout\ & (\u_vga|first_row\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|vga_gen~16_combout\,
	datac => \u_vga|first_row\(5),
	datad => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(21),
	combout => \u_vga|first_row~4_combout\);

-- Location: FF_X32_Y18_N17
\u_vga|first_row[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~5_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(4));

-- Location: LCCOMB_X32_Y18_N16
\u_vga|first_row~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~5_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(20))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(20),
	datac => \u_vga|first_row\(4),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~5_combout\);

-- Location: FF_X32_Y18_N27
\u_vga|first_row[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~6_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(3));

-- Location: LCCOMB_X32_Y18_N26
\u_vga|first_row~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~6_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(19))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(19),
	datac => \u_vga|first_row\(3),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~6_combout\);

-- Location: LCCOMB_X29_Y19_N20
\u_vga|Add17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add17~0_combout\ = (\u_vga|first_row~5_combout\ & (\u_vga|first_row~6_combout\ $ (VCC))) # (!\u_vga|first_row~5_combout\ & (\u_vga|first_row~6_combout\ & VCC))
-- \u_vga|Add17~1\ = CARRY((\u_vga|first_row~5_combout\ & \u_vga|first_row~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_row~5_combout\,
	datab => \u_vga|first_row~6_combout\,
	datad => VCC,
	combout => \u_vga|Add17~0_combout\,
	cout => \u_vga|Add17~1\);

-- Location: LCCOMB_X29_Y19_N22
\u_vga|Add17~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add17~2_combout\ = (\u_vga|first_row~4_combout\ & (\u_vga|Add17~1\ & VCC)) # (!\u_vga|first_row~4_combout\ & (!\u_vga|Add17~1\))
-- \u_vga|Add17~3\ = CARRY((!\u_vga|first_row~4_combout\ & !\u_vga|Add17~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_row~4_combout\,
	datad => VCC,
	cin => \u_vga|Add17~1\,
	combout => \u_vga|Add17~2_combout\,
	cout => \u_vga|Add17~3\);

-- Location: LCCOMB_X29_Y19_N24
\u_vga|Add17~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add17~4_combout\ = (\u_vga|first_row~3_combout\ & (\u_vga|Add17~3\ $ (GND))) # (!\u_vga|first_row~3_combout\ & (!\u_vga|Add17~3\ & VCC))
-- \u_vga|Add17~5\ = CARRY((\u_vga|first_row~3_combout\ & !\u_vga|Add17~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_row~3_combout\,
	datad => VCC,
	cin => \u_vga|Add17~3\,
	combout => \u_vga|Add17~4_combout\,
	cout => \u_vga|Add17~5\);

-- Location: LCCOMB_X29_Y19_N26
\u_vga|Add17~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add17~6_combout\ = (\u_vga|first_row~2_combout\ & (!\u_vga|Add17~5\)) # (!\u_vga|first_row~2_combout\ & ((\u_vga|Add17~5\) # (GND)))
-- \u_vga|Add17~7\ = CARRY((!\u_vga|Add17~5\) # (!\u_vga|first_row~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|first_row~2_combout\,
	datad => VCC,
	cin => \u_vga|Add17~5\,
	combout => \u_vga|Add17~6_combout\,
	cout => \u_vga|Add17~7\);

-- Location: LCCOMB_X29_Y19_N28
\u_vga|Add17~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add17~8_combout\ = (\u_vga|first_row~1_combout\ & (\u_vga|Add17~7\ $ (GND))) # (!\u_vga|first_row~1_combout\ & (!\u_vga|Add17~7\ & VCC))
-- \u_vga|Add17~9\ = CARRY((\u_vga|first_row~1_combout\ & !\u_vga|Add17~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|first_row~1_combout\,
	datad => VCC,
	cin => \u_vga|Add17~7\,
	combout => \u_vga|Add17~8_combout\,
	cout => \u_vga|Add17~9\);

-- Location: LCCOMB_X29_Y19_N30
\u_vga|Add17~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add17~10_combout\ = \u_vga|Add17~9\ $ (\u_vga|first_row~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|first_row~0_combout\,
	cin => \u_vga|Add17~9\,
	combout => \u_vga|Add17~10_combout\);

-- Location: FF_X32_Y19_N21
\u_vga|first_row[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~7_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(2));

-- Location: LCCOMB_X32_Y19_N20
\u_vga|first_row~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~7_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(18))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(18),
	datac => \u_vga|first_row\(2),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~7_combout\);

-- Location: FF_X32_Y18_N25
\u_vga|first_row[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~8_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(1));

-- Location: LCCOMB_X32_Y18_N24
\u_vga|first_row~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~8_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(17))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(17),
	datac => \u_vga|first_row\(1),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~8_combout\);

-- Location: FF_X32_Y19_N3
\u_vga|first_row[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|first_row~9_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|first_row\(0));

-- Location: LCCOMB_X32_Y19_N2
\u_vga|first_row~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|first_row~9_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(16))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|first_row\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(16),
	datac => \u_vga|first_row\(0),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|first_row~9_combout\);

-- Location: LCCOMB_X29_Y19_N0
\u_vga|LessThan16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~1_cout\ = CARRY((\u_vga|h_cnt\(0) & !\u_vga|first_row~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datab => \u_vga|first_row~9_combout\,
	datad => VCC,
	cout => \u_vga|LessThan16~1_cout\);

-- Location: LCCOMB_X29_Y19_N2
\u_vga|LessThan16~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~3_cout\ = CARRY((\u_vga|first_row~8_combout\ & ((!\u_vga|LessThan16~1_cout\) # (!\u_vga|h_cnt\(1)))) # (!\u_vga|first_row~8_combout\ & (!\u_vga|h_cnt\(1) & !\u_vga|LessThan16~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_row~8_combout\,
	datab => \u_vga|h_cnt\(1),
	datad => VCC,
	cin => \u_vga|LessThan16~1_cout\,
	cout => \u_vga|LessThan16~3_cout\);

-- Location: LCCOMB_X29_Y19_N4
\u_vga|LessThan16~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~5_cout\ = CARRY((\u_vga|h_cnt\(2) & ((!\u_vga|LessThan16~3_cout\) # (!\u_vga|first_row~7_combout\))) # (!\u_vga|h_cnt\(2) & (!\u_vga|first_row~7_combout\ & !\u_vga|LessThan16~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|first_row~7_combout\,
	datad => VCC,
	cin => \u_vga|LessThan16~3_cout\,
	cout => \u_vga|LessThan16~5_cout\);

-- Location: LCCOMB_X29_Y19_N6
\u_vga|LessThan16~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~7_cout\ = CARRY((\u_vga|h_cnt\(3) & (!\u_vga|first_row~6_combout\ & !\u_vga|LessThan16~5_cout\)) # (!\u_vga|h_cnt\(3) & ((!\u_vga|LessThan16~5_cout\) # (!\u_vga|first_row~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|first_row~6_combout\,
	datad => VCC,
	cin => \u_vga|LessThan16~5_cout\,
	cout => \u_vga|LessThan16~7_cout\);

-- Location: LCCOMB_X29_Y19_N8
\u_vga|LessThan16~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~9_cout\ = CARRY((\u_vga|h_cnt\(4) & ((!\u_vga|LessThan16~7_cout\) # (!\u_vga|Add17~0_combout\))) # (!\u_vga|h_cnt\(4) & (!\u_vga|Add17~0_combout\ & !\u_vga|LessThan16~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|Add17~0_combout\,
	datad => VCC,
	cin => \u_vga|LessThan16~7_cout\,
	cout => \u_vga|LessThan16~9_cout\);

-- Location: LCCOMB_X29_Y19_N10
\u_vga|LessThan16~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~11_cout\ = CARRY((\u_vga|Add17~2_combout\ & ((!\u_vga|LessThan16~9_cout\) # (!\u_vga|h_cnt\(5)))) # (!\u_vga|Add17~2_combout\ & (!\u_vga|h_cnt\(5) & !\u_vga|LessThan16~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add17~2_combout\,
	datab => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|LessThan16~9_cout\,
	cout => \u_vga|LessThan16~11_cout\);

-- Location: LCCOMB_X29_Y19_N12
\u_vga|LessThan16~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~13_cout\ = CARRY((\u_vga|h_cnt\(6) & ((!\u_vga|LessThan16~11_cout\) # (!\u_vga|Add17~4_combout\))) # (!\u_vga|h_cnt\(6) & (!\u_vga|Add17~4_combout\ & !\u_vga|LessThan16~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|Add17~4_combout\,
	datad => VCC,
	cin => \u_vga|LessThan16~11_cout\,
	cout => \u_vga|LessThan16~13_cout\);

-- Location: LCCOMB_X29_Y19_N14
\u_vga|LessThan16~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~15_cout\ = CARRY((\u_vga|Add17~6_combout\ & ((!\u_vga|LessThan16~13_cout\) # (!\u_vga|h_cnt\(7)))) # (!\u_vga|Add17~6_combout\ & (!\u_vga|h_cnt\(7) & !\u_vga|LessThan16~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add17~6_combout\,
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|LessThan16~13_cout\,
	cout => \u_vga|LessThan16~15_cout\);

-- Location: LCCOMB_X29_Y19_N16
\u_vga|LessThan16~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~17_cout\ = CARRY((\u_vga|h_cnt\(8) & ((!\u_vga|LessThan16~15_cout\) # (!\u_vga|Add17~8_combout\))) # (!\u_vga|h_cnt\(8) & (!\u_vga|Add17~8_combout\ & !\u_vga|LessThan16~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|Add17~8_combout\,
	datad => VCC,
	cin => \u_vga|LessThan16~15_cout\,
	cout => \u_vga|LessThan16~17_cout\);

-- Location: LCCOMB_X29_Y19_N18
\u_vga|LessThan16~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan16~18_combout\ = (\u_vga|Add17~10_combout\ & (\u_vga|LessThan16~17_cout\ & \u_vga|h_cnt\(9))) # (!\u_vga|Add17~10_combout\ & ((\u_vga|LessThan16~17_cout\) # (\u_vga|h_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add17~10_combout\,
	datad => \u_vga|h_cnt\(9),
	cin => \u_vga|LessThan16~17_cout\,
	combout => \u_vga|LessThan16~18_combout\);

-- Location: LCCOMB_X30_Y19_N6
\u_vga|LessThan15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~1_cout\ = CARRY((\u_vga|first_row~9_combout\ & !\u_vga|h_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_row~9_combout\,
	datab => \u_vga|h_cnt\(0),
	datad => VCC,
	cout => \u_vga|LessThan15~1_cout\);

-- Location: LCCOMB_X30_Y19_N8
\u_vga|LessThan15~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~3_cout\ = CARRY((\u_vga|first_row~8_combout\ & (\u_vga|h_cnt\(1) & !\u_vga|LessThan15~1_cout\)) # (!\u_vga|first_row~8_combout\ & ((\u_vga|h_cnt\(1)) # (!\u_vga|LessThan15~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_row~8_combout\,
	datab => \u_vga|h_cnt\(1),
	datad => VCC,
	cin => \u_vga|LessThan15~1_cout\,
	cout => \u_vga|LessThan15~3_cout\);

-- Location: LCCOMB_X30_Y19_N10
\u_vga|LessThan15~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~5_cout\ = CARRY((\u_vga|h_cnt\(2) & (\u_vga|first_row~7_combout\ & !\u_vga|LessThan15~3_cout\)) # (!\u_vga|h_cnt\(2) & ((\u_vga|first_row~7_combout\) # (!\u_vga|LessThan15~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|first_row~7_combout\,
	datad => VCC,
	cin => \u_vga|LessThan15~3_cout\,
	cout => \u_vga|LessThan15~5_cout\);

-- Location: LCCOMB_X30_Y19_N12
\u_vga|LessThan15~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~7_cout\ = CARRY((\u_vga|first_row~6_combout\ & (\u_vga|h_cnt\(3) & !\u_vga|LessThan15~5_cout\)) # (!\u_vga|first_row~6_combout\ & ((\u_vga|h_cnt\(3)) # (!\u_vga|LessThan15~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_row~6_combout\,
	datab => \u_vga|h_cnt\(3),
	datad => VCC,
	cin => \u_vga|LessThan15~5_cout\,
	cout => \u_vga|LessThan15~7_cout\);

-- Location: LCCOMB_X30_Y19_N14
\u_vga|LessThan15~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~9_cout\ = CARRY((\u_vga|h_cnt\(4) & (\u_vga|first_row~5_combout\ & !\u_vga|LessThan15~7_cout\)) # (!\u_vga|h_cnt\(4) & ((\u_vga|first_row~5_combout\) # (!\u_vga|LessThan15~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|first_row~5_combout\,
	datad => VCC,
	cin => \u_vga|LessThan15~7_cout\,
	cout => \u_vga|LessThan15~9_cout\);

-- Location: LCCOMB_X30_Y19_N16
\u_vga|LessThan15~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~11_cout\ = CARRY((\u_vga|h_cnt\(5) & ((!\u_vga|LessThan15~9_cout\) # (!\u_vga|first_row~4_combout\))) # (!\u_vga|h_cnt\(5) & (!\u_vga|first_row~4_combout\ & !\u_vga|LessThan15~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|first_row~4_combout\,
	datad => VCC,
	cin => \u_vga|LessThan15~9_cout\,
	cout => \u_vga|LessThan15~11_cout\);

-- Location: LCCOMB_X30_Y19_N18
\u_vga|LessThan15~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~13_cout\ = CARRY((\u_vga|h_cnt\(6) & (\u_vga|first_row~3_combout\ & !\u_vga|LessThan15~11_cout\)) # (!\u_vga|h_cnt\(6) & ((\u_vga|first_row~3_combout\) # (!\u_vga|LessThan15~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|first_row~3_combout\,
	datad => VCC,
	cin => \u_vga|LessThan15~11_cout\,
	cout => \u_vga|LessThan15~13_cout\);

-- Location: LCCOMB_X30_Y19_N20
\u_vga|LessThan15~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~15_cout\ = CARRY((\u_vga|h_cnt\(7) & ((!\u_vga|LessThan15~13_cout\) # (!\u_vga|first_row~2_combout\))) # (!\u_vga|h_cnt\(7) & (!\u_vga|first_row~2_combout\ & !\u_vga|LessThan15~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(7),
	datab => \u_vga|first_row~2_combout\,
	datad => VCC,
	cin => \u_vga|LessThan15~13_cout\,
	cout => \u_vga|LessThan15~15_cout\);

-- Location: LCCOMB_X30_Y19_N22
\u_vga|LessThan15~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~17_cout\ = CARRY((\u_vga|first_row~1_combout\ & ((!\u_vga|LessThan15~15_cout\) # (!\u_vga|h_cnt\(8)))) # (!\u_vga|first_row~1_combout\ & (!\u_vga|h_cnt\(8) & !\u_vga|LessThan15~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|first_row~1_combout\,
	datab => \u_vga|h_cnt\(8),
	datad => VCC,
	cin => \u_vga|LessThan15~15_cout\,
	cout => \u_vga|LessThan15~17_cout\);

-- Location: LCCOMB_X30_Y19_N24
\u_vga|LessThan15~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan15~18_combout\ = (\u_vga|h_cnt\(9) & (\u_vga|LessThan15~17_cout\ & \u_vga|first_row~0_combout\)) # (!\u_vga|h_cnt\(9) & ((\u_vga|LessThan15~17_cout\) # (\u_vga|first_row~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|h_cnt\(9),
	datad => \u_vga|first_row~0_combout\,
	cin => \u_vga|LessThan15~17_cout\,
	combout => \u_vga|LessThan15~18_combout\);

-- Location: LCCOMB_X27_Y20_N8
\u_vga|red_signal~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~4_combout\ = (\u_vga|LessThan14~0_combout\) # ((\u_vga|first_row~10_combout\ & (!\u_vga|LessThan16~18_combout\ & !\u_vga|LessThan15~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan14~0_combout\,
	datab => \u_vga|first_row~10_combout\,
	datac => \u_vga|LessThan16~18_combout\,
	datad => \u_vga|LessThan15~18_combout\,
	combout => \u_vga|red_signal~4_combout\);

-- Location: LCCOMB_X27_Y20_N2
\u_vga|red_signal~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~2_combout\ = (\u_vga|vga_gen~4_combout\ & ((\u_vga|current_submarine_line[4]~8_combout\ & (\u_vga|Add19~8_combout\ & !\u_vga|Add19~6_combout\)) # (!\u_vga|current_submarine_line[4]~8_combout\ & (!\u_vga|Add19~8_combout\ & 
-- \u_vga|Add19~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~4_combout\,
	datab => \u_vga|current_submarine_line[4]~8_combout\,
	datac => \u_vga|Add19~8_combout\,
	datad => \u_vga|Add19~6_combout\,
	combout => \u_vga|red_signal~2_combout\);

-- Location: FF_X32_Y19_N1
\u_vga|second_row[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~0_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(9));

-- Location: LCCOMB_X32_Y19_N0
\u_vga|second_row~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~0_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(9))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(9),
	datac => \u_vga|second_row\(9),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~0_combout\);

-- Location: FF_X32_Y18_N29
\u_vga|second_row[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~1_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(8));

-- Location: LCCOMB_X32_Y18_N28
\u_vga|second_row~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~1_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(8))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(8),
	datac => \u_vga|second_row\(8),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~1_combout\);

-- Location: FF_X32_Y18_N31
\u_vga|second_row[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~2_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(7));

-- Location: LCCOMB_X32_Y18_N30
\u_vga|second_row~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~2_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(7))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(7),
	datac => \u_vga|second_row\(7),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~2_combout\);

-- Location: FF_X32_Y19_N27
\u_vga|second_row[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~3_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(6));

-- Location: LCCOMB_X32_Y19_N26
\u_vga|second_row~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~3_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(6))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(6),
	datac => \u_vga|second_row\(6),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~3_combout\);

-- Location: FF_X32_Y18_N1
\u_vga|second_row[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~4_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(5));

-- Location: LCCOMB_X32_Y18_N0
\u_vga|second_row~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~4_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(5))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(5),
	datac => \u_vga|second_row\(5),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~4_combout\);

-- Location: FF_X32_Y18_N11
\u_vga|second_row[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~5_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(4));

-- Location: LCCOMB_X32_Y18_N10
\u_vga|second_row~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~5_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(4))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(4),
	datac => \u_vga|second_row\(4),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~5_combout\);

-- Location: FF_X32_Y18_N5
\u_vga|second_row[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~6_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(3));

-- Location: LCCOMB_X32_Y18_N4
\u_vga|second_row~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~6_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(3))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(3),
	datac => \u_vga|second_row\(3),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~6_combout\);

-- Location: FF_X32_Y18_N15
\u_vga|second_row[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~7_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(2));

-- Location: LCCOMB_X32_Y18_N14
\u_vga|second_row~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~7_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(2))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(2),
	datac => \u_vga|second_row\(2),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~7_combout\);

-- Location: FF_X32_Y18_N9
\u_vga|second_row[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~8_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(1));

-- Location: LCCOMB_X32_Y18_N8
\u_vga|second_row~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~8_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(1))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(1),
	datac => \u_vga|second_row\(1),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~8_combout\);

-- Location: FF_X32_Y18_N3
\u_vga|second_row[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~9_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(0));

-- Location: LCCOMB_X32_Y18_N2
\u_vga|second_row~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~9_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(0))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(0),
	datac => \u_vga|second_row\(0),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~9_combout\);

-- Location: LCCOMB_X32_Y20_N0
\u_vga|LessThan18~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~1_cout\ = CARRY((\u_vga|second_row~9_combout\ & !\u_vga|h_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_row~9_combout\,
	datab => \u_vga|h_cnt\(0),
	datad => VCC,
	cout => \u_vga|LessThan18~1_cout\);

-- Location: LCCOMB_X32_Y20_N2
\u_vga|LessThan18~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~3_cout\ = CARRY((\u_vga|h_cnt\(1) & ((!\u_vga|LessThan18~1_cout\) # (!\u_vga|second_row~8_combout\))) # (!\u_vga|h_cnt\(1) & (!\u_vga|second_row~8_combout\ & !\u_vga|LessThan18~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|second_row~8_combout\,
	datad => VCC,
	cin => \u_vga|LessThan18~1_cout\,
	cout => \u_vga|LessThan18~3_cout\);

-- Location: LCCOMB_X32_Y20_N4
\u_vga|LessThan18~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~5_cout\ = CARRY((\u_vga|second_row~7_combout\ & ((!\u_vga|LessThan18~3_cout\) # (!\u_vga|h_cnt\(2)))) # (!\u_vga|second_row~7_combout\ & (!\u_vga|h_cnt\(2) & !\u_vga|LessThan18~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_row~7_combout\,
	datab => \u_vga|h_cnt\(2),
	datad => VCC,
	cin => \u_vga|LessThan18~3_cout\,
	cout => \u_vga|LessThan18~5_cout\);

-- Location: LCCOMB_X32_Y20_N6
\u_vga|LessThan18~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~7_cout\ = CARRY((\u_vga|h_cnt\(3) & ((!\u_vga|LessThan18~5_cout\) # (!\u_vga|second_row~6_combout\))) # (!\u_vga|h_cnt\(3) & (!\u_vga|second_row~6_combout\ & !\u_vga|LessThan18~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|second_row~6_combout\,
	datad => VCC,
	cin => \u_vga|LessThan18~5_cout\,
	cout => \u_vga|LessThan18~7_cout\);

-- Location: LCCOMB_X32_Y20_N8
\u_vga|LessThan18~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~9_cout\ = CARRY((\u_vga|second_row~5_combout\ & ((!\u_vga|LessThan18~7_cout\) # (!\u_vga|h_cnt\(4)))) # (!\u_vga|second_row~5_combout\ & (!\u_vga|h_cnt\(4) & !\u_vga|LessThan18~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_row~5_combout\,
	datab => \u_vga|h_cnt\(4),
	datad => VCC,
	cin => \u_vga|LessThan18~7_cout\,
	cout => \u_vga|LessThan18~9_cout\);

-- Location: LCCOMB_X32_Y20_N10
\u_vga|LessThan18~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~11_cout\ = CARRY((\u_vga|h_cnt\(5) & ((!\u_vga|LessThan18~9_cout\) # (!\u_vga|second_row~4_combout\))) # (!\u_vga|h_cnt\(5) & (!\u_vga|second_row~4_combout\ & !\u_vga|LessThan18~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|second_row~4_combout\,
	datad => VCC,
	cin => \u_vga|LessThan18~9_cout\,
	cout => \u_vga|LessThan18~11_cout\);

-- Location: LCCOMB_X32_Y20_N12
\u_vga|LessThan18~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~13_cout\ = CARRY((\u_vga|h_cnt\(6) & (\u_vga|second_row~3_combout\ & !\u_vga|LessThan18~11_cout\)) # (!\u_vga|h_cnt\(6) & ((\u_vga|second_row~3_combout\) # (!\u_vga|LessThan18~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|second_row~3_combout\,
	datad => VCC,
	cin => \u_vga|LessThan18~11_cout\,
	cout => \u_vga|LessThan18~13_cout\);

-- Location: LCCOMB_X32_Y20_N14
\u_vga|LessThan18~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~15_cout\ = CARRY((\u_vga|h_cnt\(7) & ((!\u_vga|LessThan18~13_cout\) # (!\u_vga|second_row~2_combout\))) # (!\u_vga|h_cnt\(7) & (!\u_vga|second_row~2_combout\ & !\u_vga|LessThan18~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(7),
	datab => \u_vga|second_row~2_combout\,
	datad => VCC,
	cin => \u_vga|LessThan18~13_cout\,
	cout => \u_vga|LessThan18~15_cout\);

-- Location: LCCOMB_X32_Y20_N16
\u_vga|LessThan18~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~17_cout\ = CARRY((\u_vga|h_cnt\(8) & (\u_vga|second_row~1_combout\ & !\u_vga|LessThan18~15_cout\)) # (!\u_vga|h_cnt\(8) & ((\u_vga|second_row~1_combout\) # (!\u_vga|LessThan18~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|second_row~1_combout\,
	datad => VCC,
	cin => \u_vga|LessThan18~15_cout\,
	cout => \u_vga|LessThan18~17_cout\);

-- Location: LCCOMB_X32_Y20_N18
\u_vga|LessThan18~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan18~18_combout\ = (\u_vga|h_cnt\(9) & (\u_vga|LessThan18~17_cout\ & \u_vga|second_row~0_combout\)) # (!\u_vga|h_cnt\(9) & ((\u_vga|LessThan18~17_cout\) # (\u_vga|second_row~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(9),
	datad => \u_vga|second_row~0_combout\,
	cin => \u_vga|LessThan18~17_cout\,
	combout => \u_vga|LessThan18~18_combout\);

-- Location: FF_X32_Y18_N21
\u_vga|second_row[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|second_row~10_combout\,
	ena => \u_vga|second_row[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|second_row\(11));

-- Location: LCCOMB_X32_Y18_N20
\u_vga|second_row~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|second_row~10_combout\ = (\u_vga|vga_gen~16_combout\ & (\u_ram1_submarine|altsyncram_component|auto_generated|q_b\(11))) # (!\u_vga|vga_gen~16_combout\ & ((\u_vga|second_row\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram1_submarine|altsyncram_component|auto_generated|q_b\(11),
	datac => \u_vga|second_row\(11),
	datad => \u_vga|vga_gen~16_combout\,
	combout => \u_vga|second_row~10_combout\);

-- Location: LCCOMB_X32_Y20_N20
\u_vga|Add18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~0_combout\ = (\u_vga|second_row~5_combout\ & (\u_vga|second_row~6_combout\ $ (VCC))) # (!\u_vga|second_row~5_combout\ & (\u_vga|second_row~6_combout\ & VCC))
-- \u_vga|Add18~1\ = CARRY((\u_vga|second_row~5_combout\ & \u_vga|second_row~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|second_row~5_combout\,
	datab => \u_vga|second_row~6_combout\,
	datad => VCC,
	combout => \u_vga|Add18~0_combout\,
	cout => \u_vga|Add18~1\);

-- Location: LCCOMB_X32_Y20_N22
\u_vga|Add18~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~2_combout\ = (\u_vga|second_row~4_combout\ & (\u_vga|Add18~1\ & VCC)) # (!\u_vga|second_row~4_combout\ & (!\u_vga|Add18~1\))
-- \u_vga|Add18~3\ = CARRY((!\u_vga|second_row~4_combout\ & !\u_vga|Add18~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_row~4_combout\,
	datad => VCC,
	cin => \u_vga|Add18~1\,
	combout => \u_vga|Add18~2_combout\,
	cout => \u_vga|Add18~3\);

-- Location: LCCOMB_X32_Y20_N24
\u_vga|Add18~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~4_combout\ = (\u_vga|second_row~3_combout\ & (\u_vga|Add18~3\ $ (GND))) # (!\u_vga|second_row~3_combout\ & (!\u_vga|Add18~3\ & VCC))
-- \u_vga|Add18~5\ = CARRY((\u_vga|second_row~3_combout\ & !\u_vga|Add18~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_row~3_combout\,
	datad => VCC,
	cin => \u_vga|Add18~3\,
	combout => \u_vga|Add18~4_combout\,
	cout => \u_vga|Add18~5\);

-- Location: LCCOMB_X32_Y20_N26
\u_vga|Add18~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~6_combout\ = (\u_vga|second_row~2_combout\ & (!\u_vga|Add18~5\)) # (!\u_vga|second_row~2_combout\ & ((\u_vga|Add18~5\) # (GND)))
-- \u_vga|Add18~7\ = CARRY((!\u_vga|Add18~5\) # (!\u_vga|second_row~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_row~2_combout\,
	datad => VCC,
	cin => \u_vga|Add18~5\,
	combout => \u_vga|Add18~6_combout\,
	cout => \u_vga|Add18~7\);

-- Location: LCCOMB_X32_Y20_N28
\u_vga|Add18~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~8_combout\ = (\u_vga|second_row~1_combout\ & (\u_vga|Add18~7\ $ (GND))) # (!\u_vga|second_row~1_combout\ & (!\u_vga|Add18~7\ & VCC))
-- \u_vga|Add18~9\ = CARRY((\u_vga|second_row~1_combout\ & !\u_vga|Add18~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|second_row~1_combout\,
	datad => VCC,
	cin => \u_vga|Add18~7\,
	combout => \u_vga|Add18~8_combout\,
	cout => \u_vga|Add18~9\);

-- Location: LCCOMB_X32_Y20_N30
\u_vga|Add18~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add18~10_combout\ = \u_vga|Add18~9\ $ (\u_vga|second_row~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|second_row~0_combout\,
	cin => \u_vga|Add18~9\,
	combout => \u_vga|Add18~10_combout\);

-- Location: LCCOMB_X31_Y20_N2
\u_vga|LessThan19~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~1_cout\ = CARRY((\u_vga|h_cnt\(0) & !\u_vga|second_row~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datab => \u_vga|second_row~9_combout\,
	datad => VCC,
	cout => \u_vga|LessThan19~1_cout\);

-- Location: LCCOMB_X31_Y20_N4
\u_vga|LessThan19~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~3_cout\ = CARRY((\u_vga|h_cnt\(1) & (\u_vga|second_row~8_combout\ & !\u_vga|LessThan19~1_cout\)) # (!\u_vga|h_cnt\(1) & ((\u_vga|second_row~8_combout\) # (!\u_vga|LessThan19~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|second_row~8_combout\,
	datad => VCC,
	cin => \u_vga|LessThan19~1_cout\,
	cout => \u_vga|LessThan19~3_cout\);

-- Location: LCCOMB_X31_Y20_N6
\u_vga|LessThan19~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~5_cout\ = CARRY((\u_vga|h_cnt\(2) & ((!\u_vga|LessThan19~3_cout\) # (!\u_vga|second_row~7_combout\))) # (!\u_vga|h_cnt\(2) & (!\u_vga|second_row~7_combout\ & !\u_vga|LessThan19~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|second_row~7_combout\,
	datad => VCC,
	cin => \u_vga|LessThan19~3_cout\,
	cout => \u_vga|LessThan19~5_cout\);

-- Location: LCCOMB_X31_Y20_N8
\u_vga|LessThan19~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~7_cout\ = CARRY((\u_vga|h_cnt\(3) & (!\u_vga|second_row~6_combout\ & !\u_vga|LessThan19~5_cout\)) # (!\u_vga|h_cnt\(3) & ((!\u_vga|LessThan19~5_cout\) # (!\u_vga|second_row~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|second_row~6_combout\,
	datad => VCC,
	cin => \u_vga|LessThan19~5_cout\,
	cout => \u_vga|LessThan19~7_cout\);

-- Location: LCCOMB_X31_Y20_N10
\u_vga|LessThan19~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~9_cout\ = CARRY((\u_vga|Add18~0_combout\ & (\u_vga|h_cnt\(4) & !\u_vga|LessThan19~7_cout\)) # (!\u_vga|Add18~0_combout\ & ((\u_vga|h_cnt\(4)) # (!\u_vga|LessThan19~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add18~0_combout\,
	datab => \u_vga|h_cnt\(4),
	datad => VCC,
	cin => \u_vga|LessThan19~7_cout\,
	cout => \u_vga|LessThan19~9_cout\);

-- Location: LCCOMB_X31_Y20_N12
\u_vga|LessThan19~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~11_cout\ = CARRY((\u_vga|h_cnt\(5) & (\u_vga|Add18~2_combout\ & !\u_vga|LessThan19~9_cout\)) # (!\u_vga|h_cnt\(5) & ((\u_vga|Add18~2_combout\) # (!\u_vga|LessThan19~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|Add18~2_combout\,
	datad => VCC,
	cin => \u_vga|LessThan19~9_cout\,
	cout => \u_vga|LessThan19~11_cout\);

-- Location: LCCOMB_X31_Y20_N14
\u_vga|LessThan19~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~13_cout\ = CARRY((\u_vga|h_cnt\(6) & ((!\u_vga|LessThan19~11_cout\) # (!\u_vga|Add18~4_combout\))) # (!\u_vga|h_cnt\(6) & (!\u_vga|Add18~4_combout\ & !\u_vga|LessThan19~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|Add18~4_combout\,
	datad => VCC,
	cin => \u_vga|LessThan19~11_cout\,
	cout => \u_vga|LessThan19~13_cout\);

-- Location: LCCOMB_X31_Y20_N16
\u_vga|LessThan19~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~15_cout\ = CARRY((\u_vga|Add18~6_combout\ & ((!\u_vga|LessThan19~13_cout\) # (!\u_vga|h_cnt\(7)))) # (!\u_vga|Add18~6_combout\ & (!\u_vga|h_cnt\(7) & !\u_vga|LessThan19~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add18~6_combout\,
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|LessThan19~13_cout\,
	cout => \u_vga|LessThan19~15_cout\);

-- Location: LCCOMB_X31_Y20_N18
\u_vga|LessThan19~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~17_cout\ = CARRY((\u_vga|h_cnt\(8) & ((!\u_vga|LessThan19~15_cout\) # (!\u_vga|Add18~8_combout\))) # (!\u_vga|h_cnt\(8) & (!\u_vga|Add18~8_combout\ & !\u_vga|LessThan19~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|Add18~8_combout\,
	datad => VCC,
	cin => \u_vga|LessThan19~15_cout\,
	cout => \u_vga|LessThan19~17_cout\);

-- Location: LCCOMB_X31_Y20_N20
\u_vga|LessThan19~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan19~18_combout\ = (\u_vga|Add18~10_combout\ & (\u_vga|LessThan19~17_cout\ & \u_vga|h_cnt\(9))) # (!\u_vga|Add18~10_combout\ & ((\u_vga|LessThan19~17_cout\) # (\u_vga|h_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add18~10_combout\,
	datad => \u_vga|h_cnt\(9),
	cin => \u_vga|LessThan19~17_cout\,
	combout => \u_vga|LessThan19~18_combout\);

-- Location: LCCOMB_X31_Y20_N0
\u_vga|red_signal~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~3_combout\ = (\u_vga|red_signal~2_combout\ & ((\u_vga|LessThan18~18_combout\) # ((\u_vga|LessThan19~18_combout\) # (!\u_vga|second_row~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~2_combout\,
	datab => \u_vga|LessThan18~18_combout\,
	datac => \u_vga|second_row~10_combout\,
	datad => \u_vga|LessThan19~18_combout\,
	combout => \u_vga|red_signal~3_combout\);

-- Location: LCCOMB_X27_Y22_N4
\u_vga|red_signal~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~5_combout\ = (!\u_vga|vga_gen~2_combout\ & (\u_vga|green_signal~2_combout\ & ((\u_vga|red_signal~3_combout\) # (!\u_vga|red_signal~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~2_combout\,
	datab => \u_vga|green_signal~2_combout\,
	datac => \u_vga|red_signal~4_combout\,
	datad => \u_vga|red_signal~3_combout\,
	combout => \u_vga|red_signal~5_combout\);

-- Location: LCCOMB_X27_Y20_N14
\u_vga|LessThan17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan17~0_combout\ = ((\u_vga|Add19~8_combout\ & ((\u_vga|Add19~6_combout\) # (!\u_vga|current_submarine_line[4]~8_combout\)))) # (!\u_vga|vga_gen~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~4_combout\,
	datab => \u_vga|current_submarine_line[4]~8_combout\,
	datac => \u_vga|Add19~8_combout\,
	datad => \u_vga|Add19~6_combout\,
	combout => \u_vga|LessThan17~0_combout\);

-- Location: LCCOMB_X26_Y22_N12
\u_vga|red_signal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~0_combout\ = (\u_vga|LessThan13~0_combout\ & ((\u_vga|Equal9~4_combout\) # ((!\u_vga|vga_gen~6_combout\ & \u_vga|vga_gen~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~6_combout\,
	datab => \u_vga|LessThan13~0_combout\,
	datac => \u_vga|Equal9~4_combout\,
	datad => \u_vga|vga_gen~1_combout\,
	combout => \u_vga|red_signal~0_combout\);

-- Location: LCCOMB_X27_Y20_N4
\u_vga|red_signal~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~1_combout\ = (!\u_vga|red_signal~0_combout\ & ((\u_vga|vga_gen~2_combout\) # ((\u_vga|LessThan17~0_combout\ & \u_vga|LessThan14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~2_combout\,
	datab => \u_vga|LessThan17~0_combout\,
	datac => \u_vga|red_signal~0_combout\,
	datad => \u_vga|LessThan14~0_combout\,
	combout => \u_vga|red_signal~1_combout\);

-- Location: LCCOMB_X27_Y22_N6
\u_vga|vga_gen~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~19_combout\ = (!\u_vga|h_cnt\(9) & (!\u_vga|h_cnt\(8) & (!\u_vga|v_cnt\(5) & !\u_vga|v_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(9),
	datab => \u_vga|h_cnt\(8),
	datac => \u_vga|v_cnt\(5),
	datad => \u_vga|v_cnt\(6),
	combout => \u_vga|vga_gen~19_combout\);

-- Location: LCCOMB_X27_Y22_N2
\u_vga|vga_gen~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~17_combout\ = (!\u_vga|v_cnt\(4) & (\u_vga|v_cnt\(3) & ((\u_vga|v_cnt\(1)) # (\u_vga|v_cnt\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(1),
	datab => \u_vga|v_cnt\(2),
	datac => \u_vga|v_cnt\(4),
	datad => \u_vga|v_cnt\(3),
	combout => \u_vga|vga_gen~17_combout\);

-- Location: LCCOMB_X27_Y22_N0
\u_vga|vga_gen~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~18_combout\ = (\u_vga|vga_gen~17_combout\) # ((\u_vga|v_cnt\(4) & ((!\u_vga|Equal9~3_combout\) # (!\u_vga|v_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(3),
	datab => \u_vga|Equal9~3_combout\,
	datac => \u_vga|v_cnt\(4),
	datad => \u_vga|vga_gen~17_combout\,
	combout => \u_vga|vga_gen~18_combout\);

-- Location: LCCOMB_X31_Y20_N26
\u_vga|vga_gen~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~20_combout\ = (!\u_vga|h_cnt\(4) & (!\u_vga|h_cnt\(3) & !\u_vga|h_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|h_cnt\(5),
	combout => \u_vga|vga_gen~20_combout\);

-- Location: LCCOMB_X31_Y20_N28
\u_vga|vga_gen~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~21_combout\ = (\u_vga|vga_gen~20_combout\) # ((!\u_vga|h_cnt\(7)) # (!\u_vga|h_cnt\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~20_combout\,
	datac => \u_vga|h_cnt\(6),
	datad => \u_vga|h_cnt\(7),
	combout => \u_vga|vga_gen~21_combout\);

-- Location: LCCOMB_X28_Y20_N22
\u_vga|vga_gen~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~22_combout\ = (!\u_vga|v_cnt\(7) & (!\u_vga|h_cnt\(10) & (\u_vga|Equal9~2_combout\ & \u_vga|vga_gen~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datab => \u_vga|h_cnt\(10),
	datac => \u_vga|Equal9~2_combout\,
	datad => \u_vga|vga_gen~21_combout\,
	combout => \u_vga|vga_gen~22_combout\);

-- Location: LCCOMB_X26_Y22_N2
\u_vga|vga_gen~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~23_combout\ = (\u_vga|vga_gen~19_combout\ & (\u_vga|vga_gen~18_combout\ & \u_vga|vga_gen~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~19_combout\,
	datac => \u_vga|vga_gen~18_combout\,
	datad => \u_vga|vga_gen~22_combout\,
	combout => \u_vga|vga_gen~23_combout\);

-- Location: LCCOMB_X28_Y20_N2
\u_vga|LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan2~0_combout\ = (\u_vga|v_cnt\(5) & ((\u_vga|v_cnt\(4)) # ((\u_vga|v_cnt\(3)) # (!\u_vga|vga_gen~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(4),
	datab => \u_vga|v_cnt\(5),
	datac => \u_vga|vga_gen~7_combout\,
	datad => \u_vga|v_cnt\(3),
	combout => \u_vga|LessThan2~0_combout\);

-- Location: LCCOMB_X28_Y20_N16
\u_vga|LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan2~1_combout\ = ((\u_vga|v_cnt\(7) & ((\u_vga|v_cnt\(6)) # (\u_vga|LessThan2~0_combout\)))) # (!\u_vga|Equal9~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(7),
	datab => \u_vga|v_cnt\(6),
	datac => \u_vga|Equal9~2_combout\,
	datad => \u_vga|LessThan2~0_combout\,
	combout => \u_vga|LessThan2~1_combout\);

-- Location: LCCOMB_X26_Y22_N24
\u_vga|red_signal~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~6_combout\ = (\u_vga|red_signal~q\ & (!\u_vga|vga_gen~23_combout\ & ((\u_vga|LessThan2~1_combout\) # (!\u_vga|LessThan13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~q\,
	datab => \u_vga|LessThan13~0_combout\,
	datac => \u_vga|vga_gen~23_combout\,
	datad => \u_vga|LessThan2~1_combout\,
	combout => \u_vga|red_signal~6_combout\);

-- Location: LCCOMB_X30_Y18_N4
\u_vga|Mux1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~11_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(3) & ((\u_vga|h_cnt\(4) & (\u_vga|submarines\(44))) # (!\u_vga|h_cnt\(4) & ((\u_vga|submarines\(40))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|submarines\(44),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|submarines\(40),
	combout => \u_vga|Mux1~11_combout\);

-- Location: LCCOMB_X30_Y18_N28
\u_vga|Mux1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~12_combout\ = (\u_vga|Mux1~11_combout\ & ((\u_vga|submarines\(46)) # ((!\u_vga|h_cnt\(3))))) # (!\u_vga|Mux1~11_combout\ & (((\u_vga|submarines\(42) & \u_vga|h_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(46),
	datab => \u_vga|Mux1~11_combout\,
	datac => \u_vga|submarines\(42),
	datad => \u_vga|h_cnt\(3),
	combout => \u_vga|Mux1~12_combout\);

-- Location: LCCOMB_X29_Y18_N8
\u_vga|Mux1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~4_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|submarines\(34)) # (\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines\(32) & ((!\u_vga|h_cnt\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(32),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|submarines\(34),
	datad => \u_vga|h_cnt\(4),
	combout => \u_vga|Mux1~4_combout\);

-- Location: LCCOMB_X29_Y18_N28
\u_vga|Mux1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~5_combout\ = (\u_vga|Mux1~4_combout\ & ((\u_vga|submarines\(38)) # ((!\u_vga|h_cnt\(4))))) # (!\u_vga|Mux1~4_combout\ & (((\u_vga|submarines\(36) & \u_vga|h_cnt\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(38),
	datab => \u_vga|submarines\(36),
	datac => \u_vga|Mux1~4_combout\,
	datad => \u_vga|h_cnt\(4),
	combout => \u_vga|Mux1~5_combout\);

-- Location: LCCOMB_X28_Y17_N28
\u_vga|Mux1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~8_combout\ = (\u_vga|h_cnt\(3) & ((\u_vga|h_cnt\(4)) # ((\u_vga|submarines\(2))))) # (!\u_vga|h_cnt\(3) & (!\u_vga|h_cnt\(4) & (\u_vga|submarines\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|submarines\(0),
	datad => \u_vga|submarines\(2),
	combout => \u_vga|Mux1~8_combout\);

-- Location: LCCOMB_X28_Y17_N10
\u_vga|Mux1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~9_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|Mux1~8_combout\ & ((\u_vga|submarines\(6)))) # (!\u_vga|Mux1~8_combout\ & (\u_vga|submarines\(4))))) # (!\u_vga|h_cnt\(4) & (((\u_vga|Mux1~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(4),
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|submarines\(6),
	datad => \u_vga|Mux1~8_combout\,
	combout => \u_vga|Mux1~9_combout\);

-- Location: LCCOMB_X28_Y17_N6
\u_vga|Mux1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~6_combout\ = (\u_vga|h_cnt\(3) & (((\u_vga|submarines\(10)) # (\u_vga|h_cnt\(4))))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines\(8) & ((!\u_vga|h_cnt\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(8),
	datab => \u_vga|submarines\(10),
	datac => \u_vga|h_cnt\(3),
	datad => \u_vga|h_cnt\(4),
	combout => \u_vga|Mux1~6_combout\);

-- Location: LCCOMB_X28_Y17_N18
\u_vga|Mux1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~7_combout\ = (\u_vga|h_cnt\(4) & ((\u_vga|Mux1~6_combout\ & (\u_vga|submarines\(14))) # (!\u_vga|Mux1~6_combout\ & ((\u_vga|submarines\(12)))))) # (!\u_vga|h_cnt\(4) & (((\u_vga|Mux1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(14),
	datab => \u_vga|h_cnt\(4),
	datac => \u_vga|submarines\(12),
	datad => \u_vga|Mux1~6_combout\,
	combout => \u_vga|Mux1~7_combout\);

-- Location: LCCOMB_X27_Y22_N28
\u_vga|Mux1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~10_combout\ = (\u_vga|h_cnt\(7) & (((\u_vga|h_cnt\(5))))) # (!\u_vga|h_cnt\(7) & ((\u_vga|h_cnt\(5) & ((\u_vga|Mux1~7_combout\))) # (!\u_vga|h_cnt\(5) & (\u_vga|Mux1~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~9_combout\,
	datab => \u_vga|Mux1~7_combout\,
	datac => \u_vga|h_cnt\(7),
	datad => \u_vga|h_cnt\(5),
	combout => \u_vga|Mux1~10_combout\);

-- Location: LCCOMB_X28_Y22_N28
\u_vga|Mux1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~13_combout\ = (\u_vga|h_cnt\(7) & ((\u_vga|Mux1~10_combout\ & (\u_vga|Mux1~12_combout\)) # (!\u_vga|Mux1~10_combout\ & ((\u_vga|Mux1~5_combout\))))) # (!\u_vga|h_cnt\(7) & (((\u_vga|Mux1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~12_combout\,
	datab => \u_vga|Mux1~5_combout\,
	datac => \u_vga|h_cnt\(7),
	datad => \u_vga|Mux1~10_combout\,
	combout => \u_vga|Mux1~13_combout\);

-- Location: LCCOMB_X29_Y17_N14
\u_vga|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~0_combout\ = (\u_vga|h_cnt\(5) & (((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & ((\u_vga|h_cnt\(3) & ((\u_vga|submarines\(22)))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(20),
	datab => \u_vga|h_cnt\(5),
	datac => \u_vga|submarines\(22),
	datad => \u_vga|h_cnt\(3),
	combout => \u_vga|Mux1~0_combout\);

-- Location: LCCOMB_X30_Y17_N24
\u_vga|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~1_combout\ = (\u_vga|h_cnt\(5) & ((\u_vga|Mux1~0_combout\ & ((\u_vga|submarines\(30)))) # (!\u_vga|Mux1~0_combout\ & (\u_vga|submarines\(28))))) # (!\u_vga|h_cnt\(5) & (((\u_vga|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|submarines\(28),
	datac => \u_vga|submarines\(30),
	datad => \u_vga|Mux1~0_combout\,
	combout => \u_vga|Mux1~1_combout\);

-- Location: LCCOMB_X31_Y17_N0
\u_vga|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~2_combout\ = (\u_vga|h_cnt\(5) & (((\u_vga|h_cnt\(3))))) # (!\u_vga|h_cnt\(5) & ((\u_vga|h_cnt\(3) & ((\u_vga|submarines\(18)))) # (!\u_vga|h_cnt\(3) & (\u_vga|submarines\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(16),
	datab => \u_vga|submarines\(18),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|h_cnt\(3),
	combout => \u_vga|Mux1~2_combout\);

-- Location: LCCOMB_X31_Y17_N16
\u_vga|Mux1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mux1~3_combout\ = (\u_vga|h_cnt\(5) & ((\u_vga|Mux1~2_combout\ & ((\u_vga|submarines\(26)))) # (!\u_vga|Mux1~2_combout\ & (\u_vga|submarines\(24))))) # (!\u_vga|h_cnt\(5) & (((\u_vga|Mux1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|submarines\(24),
	datab => \u_vga|submarines\(26),
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|Mux1~2_combout\,
	combout => \u_vga|Mux1~3_combout\);

-- Location: LCCOMB_X31_Y20_N22
\u_vga|red_signal~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~7_combout\ = (!\u_vga|h_cnt\(7) & ((\u_vga|h_cnt\(4) & (\u_vga|Mux1~1_combout\)) # (!\u_vga|h_cnt\(4) & ((\u_vga|Mux1~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mux1~1_combout\,
	datab => \u_vga|h_cnt\(7),
	datac => \u_vga|h_cnt\(4),
	datad => \u_vga|Mux1~3_combout\,
	combout => \u_vga|red_signal~7_combout\);

-- Location: LCCOMB_X31_Y20_N24
\u_vga|red_signal~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~8_combout\ = (\u_vga|red_signal~7_combout\) # ((\u_vga|h_cnt\(7) & (\u_vga|vga_gen~20_combout\ & \u_vga|submarines\(48))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~7_combout\,
	datab => \u_vga|h_cnt\(7),
	datac => \u_vga|vga_gen~20_combout\,
	datad => \u_vga|submarines\(48),
	combout => \u_vga|red_signal~8_combout\);

-- Location: LCCOMB_X32_Y22_N12
\u_vga|red_signal~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~9_combout\ = (\u_vga|vga_gen~23_combout\ & ((\u_vga|h_cnt\(6) & ((\u_vga|red_signal~8_combout\))) # (!\u_vga|h_cnt\(6) & (\u_vga|Mux1~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|Mux1~13_combout\,
	datac => \u_vga|vga_gen~23_combout\,
	datad => \u_vga|red_signal~8_combout\,
	combout => \u_vga|red_signal~9_combout\);

-- Location: LCCOMB_X26_Y22_N26
\u_vga|red_signal~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~10_combout\ = (\u_vga|red_signal~6_combout\) # ((!\u_vga|h_cnt\(2) & \u_vga|red_signal~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|red_signal~6_combout\,
	datac => \u_vga|h_cnt\(2),
	datad => \u_vga|red_signal~9_combout\,
	combout => \u_vga|red_signal~10_combout\);

-- Location: LCCOMB_X29_Y20_N8
\u_vga|vga_gen~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~9_combout\ = (\u_vga|v_cnt\(4) & ((\u_vga|v_cnt\(3)) # ((\u_vga|v_cnt\(2) & \u_vga|v_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|v_cnt\(2),
	datab => \u_vga|v_cnt\(1),
	datac => \u_vga|v_cnt\(3),
	datad => \u_vga|v_cnt\(4),
	combout => \u_vga|vga_gen~9_combout\);

-- Location: LCCOMB_X29_Y20_N18
\u_vga|vga_gen~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~10_combout\ = (!\u_vga|h_cnt\(10) & (\u_vga|v_cnt\(7) & ((\u_vga|vga_gen~9_combout\) # (!\u_vga|vga_gen~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(10),
	datab => \u_vga|v_cnt\(7),
	datac => \u_vga|vga_gen~9_combout\,
	datad => \u_vga|vga_gen~8_combout\,
	combout => \u_vga|vga_gen~10_combout\);

-- Location: LCCOMB_X30_Y23_N16
\u_vga|Add12~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~16_combout\ = (\u_vga|old_magn_g_y\(8) & (\u_vga|Add12~15\ $ (GND))) # (!\u_vga|old_magn_g_y\(8) & (!\u_vga|Add12~15\ & VCC))
-- \u_vga|Add12~17\ = CARRY((\u_vga|old_magn_g_y\(8) & !\u_vga|Add12~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(8),
	datad => VCC,
	cin => \u_vga|Add12~15\,
	combout => \u_vga|Add12~16_combout\,
	cout => \u_vga|Add12~17\);

-- Location: FF_X32_Y23_N27
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

-- Location: LCCOMB_X38_Y20_N26
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

-- Location: FF_X38_Y20_N27
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

-- Location: LCCOMB_X40_Y20_N20
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

-- Location: FF_X38_Y20_N23
\u_spi_ee_config|low_byte_dataY[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(7),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(7));

-- Location: FF_X32_Y23_N25
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

-- Location: LCCOMB_X38_Y20_N10
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

-- Location: FF_X38_Y20_N11
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

-- Location: FF_X32_Y23_N23
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

-- Location: FF_X32_Y23_N11
\u_spi_ee_config|low_byte_dataY[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(5),
	sload => VCC,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(5));

-- Location: FF_X32_Y23_N21
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

-- Location: LCCOMB_X32_Y23_N4
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

-- Location: FF_X32_Y23_N5
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

-- Location: FF_X32_Y23_N19
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

-- Location: FF_X38_Y20_N13
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

-- Location: FF_X32_Y23_N17
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

-- Location: LCCOMB_X38_Y20_N14
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

-- Location: FF_X38_Y20_N15
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

-- Location: FF_X32_Y23_N15
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

-- Location: LCCOMB_X32_Y23_N8
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

-- Location: FF_X32_Y23_N9
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

-- Location: FF_X32_Y23_N13
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

-- Location: LCCOMB_X32_Y23_N28
\u_spi_ee_config|low_byte_dataY[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_spi_ee_config|low_byte_dataY[0]~feeder_combout\ = \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_spi_ee_config|u_spi_controller|oS2P_DATA_xhdl2\(0),
	combout => \u_spi_ee_config|low_byte_dataY[0]~feeder_combout\);

-- Location: FF_X32_Y23_N29
\u_spi_ee_config|low_byte_dataY[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_spipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_spi_ee_config|low_byte_dataY[0]~feeder_combout\,
	ena => \u_spi_ee_config|low_byte_dataY[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_spi_ee_config|low_byte_dataY\(0));

-- Location: FF_X32_Y23_N31
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

-- Location: LCCOMB_X32_Y23_N30
\u_vga|Add11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~0_combout\ = \u_spi_ee_config|oDATA_YL_xhdl1\(0) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_spi_ee_config|oDATA_YL_xhdl1\(0),
	datad => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	combout => \u_vga|Add11~0_combout\);

-- Location: LCCOMB_X32_Y23_N10
\u_vga|Add11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~1_combout\ = (\u_vga|Add11~0_combout\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (VCC))) # (!\u_vga|Add11~0_combout\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) & VCC))
-- \u_vga|Add11~2\ = CARRY((\u_vga|Add11~0_combout\ & \u_spi_ee_config|oDATA_YH_xhdl2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add11~0_combout\,
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	combout => \u_vga|Add11~1_combout\,
	cout => \u_vga|Add11~2\);

-- Location: LCCOMB_X32_Y23_N12
\u_vga|Add11~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~3_combout\ = (\u_vga|Add11~2\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ ((!\u_spi_ee_config|oDATA_YL_xhdl1\(1))))) # (!\u_vga|Add11~2\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(1))) # (GND)))
-- \u_vga|Add11~4\ = CARRY((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (!\u_spi_ee_config|oDATA_YL_xhdl1\(1))) # (!\u_vga|Add11~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(1),
	datad => VCC,
	cin => \u_vga|Add11~2\,
	combout => \u_vga|Add11~3_combout\,
	cout => \u_vga|Add11~4\);

-- Location: LCCOMB_X32_Y23_N14
\u_vga|Add11~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~5_combout\ = (\u_vga|Add11~4\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(2) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add11~4\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(2) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (VCC))))
-- \u_vga|Add11~6\ = CARRY((!\u_vga|Add11~4\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(2) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(2),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add11~4\,
	combout => \u_vga|Add11~5_combout\,
	cout => \u_vga|Add11~6\);

-- Location: LCCOMB_X32_Y23_N16
\u_vga|Add11~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~7_combout\ = (\u_vga|Add11~6\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(3) $ ((!\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add11~6\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(3) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (GND)))
-- \u_vga|Add11~8\ = CARRY((\u_spi_ee_config|oDATA_YL_xhdl1\(3) $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (!\u_vga|Add11~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(3),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add11~6\,
	combout => \u_vga|Add11~7_combout\,
	cout => \u_vga|Add11~8\);

-- Location: LCCOMB_X32_Y23_N18
\u_vga|Add11~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~9_combout\ = (\u_vga|Add11~8\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(4))))) # (!\u_vga|Add11~8\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(4) $ (VCC))))
-- \u_vga|Add11~10\ = CARRY((!\u_vga|Add11~8\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(4),
	datad => VCC,
	cin => \u_vga|Add11~8\,
	combout => \u_vga|Add11~9_combout\,
	cout => \u_vga|Add11~10\);

-- Location: LCCOMB_X32_Y23_N20
\u_vga|Add11~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~11_combout\ = (\u_vga|Add11~10\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(5) $ ((!\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add11~10\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(5) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (GND)))
-- \u_vga|Add11~12\ = CARRY((\u_spi_ee_config|oDATA_YL_xhdl1\(5) $ (!\u_spi_ee_config|oDATA_YH_xhdl2\(1))) # (!\u_vga|Add11~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(5),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add11~10\,
	combout => \u_vga|Add11~11_combout\,
	cout => \u_vga|Add11~12\);

-- Location: LCCOMB_X32_Y23_N22
\u_vga|Add11~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~13_combout\ = (\u_vga|Add11~12\ & ((\u_spi_ee_config|oDATA_YL_xhdl1\(6) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1))))) # (!\u_vga|Add11~12\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(6) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (VCC))))
-- \u_vga|Add11~14\ = CARRY((!\u_vga|Add11~12\ & (\u_spi_ee_config|oDATA_YL_xhdl1\(6) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YL_xhdl1\(6),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datad => VCC,
	cin => \u_vga|Add11~12\,
	combout => \u_vga|Add11~13_combout\,
	cout => \u_vga|Add11~14\);

-- Location: LCCOMB_X32_Y23_N24
\u_vga|Add11~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~15_combout\ = (\u_vga|Add11~14\ & (\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ ((!\u_spi_ee_config|oDATA_YL_xhdl1\(7))))) # (!\u_vga|Add11~14\ & ((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YL_xhdl1\(7))) # (GND)))
-- \u_vga|Add11~16\ = CARRY((\u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (!\u_spi_ee_config|oDATA_YL_xhdl1\(7))) # (!\u_vga|Add11~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YL_xhdl1\(7),
	datad => VCC,
	cin => \u_vga|Add11~14\,
	combout => \u_vga|Add11~15_combout\,
	cout => \u_vga|Add11~16\);

-- Location: LCCOMB_X32_Y23_N26
\u_vga|Add11~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add11~17_combout\ = \u_spi_ee_config|oDATA_YH_xhdl2\(1) $ (\u_spi_ee_config|oDATA_YH_xhdl2\(0) $ (!\u_vga|Add11~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	datab => \u_spi_ee_config|oDATA_YH_xhdl2\(0),
	cin => \u_vga|Add11~16\,
	combout => \u_vga|Add11~17_combout\);

-- Location: FF_X30_Y23_N27
\u_vga|old_magn_g_y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|Add13~14_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(5));

-- Location: LCCOMB_X30_Y23_N0
\u_vga|Add12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~0_combout\ = (\u_vga|old_magn_g_y\(1) & (\u_vga|old_magn_g_y\(0) $ (VCC))) # (!\u_vga|old_magn_g_y\(1) & (\u_vga|old_magn_g_y\(0) & VCC))
-- \u_vga|Add12~1\ = CARRY((\u_vga|old_magn_g_y\(1) & \u_vga|old_magn_g_y\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(1),
	datab => \u_vga|old_magn_g_y\(0),
	datad => VCC,
	combout => \u_vga|Add12~0_combout\,
	cout => \u_vga|Add12~1\);

-- Location: LCCOMB_X31_Y23_N4
\u_vga|Add13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~1_cout\ = CARRY((\u_vga|Add11~1_combout\ & \u_vga|old_magn_g_y\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add11~1_combout\,
	datab => \u_vga|old_magn_g_y\(0),
	datad => VCC,
	cout => \u_vga|Add13~1_cout\);

-- Location: LCCOMB_X31_Y23_N6
\u_vga|Add13~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~3_cout\ = CARRY((\u_vga|Add12~0_combout\ & (!\u_vga|Add11~3_combout\ & !\u_vga|Add13~1_cout\)) # (!\u_vga|Add12~0_combout\ & ((!\u_vga|Add13~1_cout\) # (!\u_vga|Add11~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add12~0_combout\,
	datab => \u_vga|Add11~3_combout\,
	datad => VCC,
	cin => \u_vga|Add13~1_cout\,
	cout => \u_vga|Add13~3_cout\);

-- Location: LCCOMB_X31_Y23_N8
\u_vga|Add13~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~4_combout\ = ((\u_vga|Add12~2_combout\ $ (\u_vga|Add11~5_combout\ $ (!\u_vga|Add13~3_cout\)))) # (GND)
-- \u_vga|Add13~5\ = CARRY((\u_vga|Add12~2_combout\ & ((\u_vga|Add11~5_combout\) # (!\u_vga|Add13~3_cout\))) # (!\u_vga|Add12~2_combout\ & (\u_vga|Add11~5_combout\ & !\u_vga|Add13~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add12~2_combout\,
	datab => \u_vga|Add11~5_combout\,
	datad => VCC,
	cin => \u_vga|Add13~3_cout\,
	combout => \u_vga|Add13~4_combout\,
	cout => \u_vga|Add13~5\);

-- Location: FF_X31_Y23_N1
\u_vga|old_magn_g_y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|Add13~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(0));

-- Location: LCCOMB_X30_Y23_N2
\u_vga|Add12~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~2_combout\ = (\u_vga|old_magn_g_y\(1) & ((\u_vga|old_magn_g_y\(2) & (\u_vga|Add12~1\ & VCC)) # (!\u_vga|old_magn_g_y\(2) & (!\u_vga|Add12~1\)))) # (!\u_vga|old_magn_g_y\(1) & ((\u_vga|old_magn_g_y\(2) & (!\u_vga|Add12~1\)) # 
-- (!\u_vga|old_magn_g_y\(2) & ((\u_vga|Add12~1\) # (GND)))))
-- \u_vga|Add12~3\ = CARRY((\u_vga|old_magn_g_y\(1) & (!\u_vga|old_magn_g_y\(2) & !\u_vga|Add12~1\)) # (!\u_vga|old_magn_g_y\(1) & ((!\u_vga|Add12~1\) # (!\u_vga|old_magn_g_y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(1),
	datab => \u_vga|old_magn_g_y\(2),
	datad => VCC,
	cin => \u_vga|Add12~1\,
	combout => \u_vga|Add12~2_combout\,
	cout => \u_vga|Add12~3\);

-- Location: LCCOMB_X31_Y23_N10
\u_vga|Add13~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~6_combout\ = (\u_vga|Add11~7_combout\ & ((\u_vga|Add12~4_combout\ & (\u_vga|Add13~5\ & VCC)) # (!\u_vga|Add12~4_combout\ & (!\u_vga|Add13~5\)))) # (!\u_vga|Add11~7_combout\ & ((\u_vga|Add12~4_combout\ & (!\u_vga|Add13~5\)) # 
-- (!\u_vga|Add12~4_combout\ & ((\u_vga|Add13~5\) # (GND)))))
-- \u_vga|Add13~7\ = CARRY((\u_vga|Add11~7_combout\ & (!\u_vga|Add12~4_combout\ & !\u_vga|Add13~5\)) # (!\u_vga|Add11~7_combout\ & ((!\u_vga|Add13~5\) # (!\u_vga|Add12~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add11~7_combout\,
	datab => \u_vga|Add12~4_combout\,
	datad => VCC,
	cin => \u_vga|Add13~5\,
	combout => \u_vga|Add13~6_combout\,
	cout => \u_vga|Add13~7\);

-- Location: LCCOMB_X30_Y23_N22
\u_vga|old_magn_g_y[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|old_magn_g_y[1]~feeder_combout\ = \u_vga|Add13~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|Add13~6_combout\,
	combout => \u_vga|old_magn_g_y[1]~feeder_combout\);

-- Location: FF_X30_Y23_N23
\u_vga|old_magn_g_y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|old_magn_g_y[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(1));

-- Location: LCCOMB_X30_Y23_N4
\u_vga|Add12~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~4_combout\ = ((\u_vga|old_magn_g_y\(3) $ (\u_vga|old_magn_g_y\(2) $ (!\u_vga|Add12~3\)))) # (GND)
-- \u_vga|Add12~5\ = CARRY((\u_vga|old_magn_g_y\(3) & ((\u_vga|old_magn_g_y\(2)) # (!\u_vga|Add12~3\))) # (!\u_vga|old_magn_g_y\(3) & (\u_vga|old_magn_g_y\(2) & !\u_vga|Add12~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(3),
	datab => \u_vga|old_magn_g_y\(2),
	datad => VCC,
	cin => \u_vga|Add12~3\,
	combout => \u_vga|Add12~4_combout\,
	cout => \u_vga|Add12~5\);

-- Location: LCCOMB_X31_Y23_N12
\u_vga|Add13~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~8_combout\ = ((\u_vga|Add11~9_combout\ $ (\u_vga|Add12~6_combout\ $ (!\u_vga|Add13~7\)))) # (GND)
-- \u_vga|Add13~9\ = CARRY((\u_vga|Add11~9_combout\ & ((\u_vga|Add12~6_combout\) # (!\u_vga|Add13~7\))) # (!\u_vga|Add11~9_combout\ & (\u_vga|Add12~6_combout\ & !\u_vga|Add13~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add11~9_combout\,
	datab => \u_vga|Add12~6_combout\,
	datad => VCC,
	cin => \u_vga|Add13~7\,
	combout => \u_vga|Add13~8_combout\,
	cout => \u_vga|Add13~9\);

-- Location: FF_X30_Y23_N25
\u_vga|old_magn_g_y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|Add13~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(2));

-- Location: LCCOMB_X30_Y23_N6
\u_vga|Add12~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~6_combout\ = (\u_vga|old_magn_g_y\(3) & ((\u_vga|old_magn_g_y\(4) & (\u_vga|Add12~5\ & VCC)) # (!\u_vga|old_magn_g_y\(4) & (!\u_vga|Add12~5\)))) # (!\u_vga|old_magn_g_y\(3) & ((\u_vga|old_magn_g_y\(4) & (!\u_vga|Add12~5\)) # 
-- (!\u_vga|old_magn_g_y\(4) & ((\u_vga|Add12~5\) # (GND)))))
-- \u_vga|Add12~7\ = CARRY((\u_vga|old_magn_g_y\(3) & (!\u_vga|old_magn_g_y\(4) & !\u_vga|Add12~5\)) # (!\u_vga|old_magn_g_y\(3) & ((!\u_vga|Add12~5\) # (!\u_vga|old_magn_g_y\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(3),
	datab => \u_vga|old_magn_g_y\(4),
	datad => VCC,
	cin => \u_vga|Add12~5\,
	combout => \u_vga|Add12~6_combout\,
	cout => \u_vga|Add12~7\);

-- Location: LCCOMB_X31_Y23_N14
\u_vga|Add13~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~10_combout\ = (\u_vga|Add12~8_combout\ & ((\u_vga|Add11~11_combout\ & (\u_vga|Add13~9\ & VCC)) # (!\u_vga|Add11~11_combout\ & (!\u_vga|Add13~9\)))) # (!\u_vga|Add12~8_combout\ & ((\u_vga|Add11~11_combout\ & (!\u_vga|Add13~9\)) # 
-- (!\u_vga|Add11~11_combout\ & ((\u_vga|Add13~9\) # (GND)))))
-- \u_vga|Add13~11\ = CARRY((\u_vga|Add12~8_combout\ & (!\u_vga|Add11~11_combout\ & !\u_vga|Add13~9\)) # (!\u_vga|Add12~8_combout\ & ((!\u_vga|Add13~9\) # (!\u_vga|Add11~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add12~8_combout\,
	datab => \u_vga|Add11~11_combout\,
	datad => VCC,
	cin => \u_vga|Add13~9\,
	combout => \u_vga|Add13~10_combout\,
	cout => \u_vga|Add13~11\);

-- Location: FF_X30_Y23_N31
\u_vga|old_magn_g_y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|Add13~10_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(3));

-- Location: LCCOMB_X30_Y23_N8
\u_vga|Add12~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~8_combout\ = ((\u_vga|old_magn_g_y\(5) $ (\u_vga|old_magn_g_y\(4) $ (!\u_vga|Add12~7\)))) # (GND)
-- \u_vga|Add12~9\ = CARRY((\u_vga|old_magn_g_y\(5) & ((\u_vga|old_magn_g_y\(4)) # (!\u_vga|Add12~7\))) # (!\u_vga|old_magn_g_y\(5) & (\u_vga|old_magn_g_y\(4) & !\u_vga|Add12~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(5),
	datab => \u_vga|old_magn_g_y\(4),
	datad => VCC,
	cin => \u_vga|Add12~7\,
	combout => \u_vga|Add12~8_combout\,
	cout => \u_vga|Add12~9\);

-- Location: LCCOMB_X31_Y23_N16
\u_vga|Add13~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~12_combout\ = ((\u_vga|Add12~10_combout\ $ (\u_vga|Add11~13_combout\ $ (!\u_vga|Add13~11\)))) # (GND)
-- \u_vga|Add13~13\ = CARRY((\u_vga|Add12~10_combout\ & ((\u_vga|Add11~13_combout\) # (!\u_vga|Add13~11\))) # (!\u_vga|Add12~10_combout\ & (\u_vga|Add11~13_combout\ & !\u_vga|Add13~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add12~10_combout\,
	datab => \u_vga|Add11~13_combout\,
	datad => VCC,
	cin => \u_vga|Add13~11\,
	combout => \u_vga|Add13~12_combout\,
	cout => \u_vga|Add13~13\);

-- Location: FF_X30_Y23_N21
\u_vga|old_magn_g_y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|Add13~12_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(4));

-- Location: LCCOMB_X30_Y23_N10
\u_vga|Add12~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~10_combout\ = (\u_vga|old_magn_g_y\(5) & ((\u_vga|old_magn_g_y\(6) & (\u_vga|Add12~9\ & VCC)) # (!\u_vga|old_magn_g_y\(6) & (!\u_vga|Add12~9\)))) # (!\u_vga|old_magn_g_y\(5) & ((\u_vga|old_magn_g_y\(6) & (!\u_vga|Add12~9\)) # 
-- (!\u_vga|old_magn_g_y\(6) & ((\u_vga|Add12~9\) # (GND)))))
-- \u_vga|Add12~11\ = CARRY((\u_vga|old_magn_g_y\(5) & (!\u_vga|old_magn_g_y\(6) & !\u_vga|Add12~9\)) # (!\u_vga|old_magn_g_y\(5) & ((!\u_vga|Add12~9\) # (!\u_vga|old_magn_g_y\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(5),
	datab => \u_vga|old_magn_g_y\(6),
	datad => VCC,
	cin => \u_vga|Add12~9\,
	combout => \u_vga|Add12~10_combout\,
	cout => \u_vga|Add12~11\);

-- Location: LCCOMB_X31_Y23_N18
\u_vga|Add13~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~14_combout\ = (\u_vga|Add12~12_combout\ & ((\u_vga|Add11~15_combout\ & (\u_vga|Add13~13\ & VCC)) # (!\u_vga|Add11~15_combout\ & (!\u_vga|Add13~13\)))) # (!\u_vga|Add12~12_combout\ & ((\u_vga|Add11~15_combout\ & (!\u_vga|Add13~13\)) # 
-- (!\u_vga|Add11~15_combout\ & ((\u_vga|Add13~13\) # (GND)))))
-- \u_vga|Add13~15\ = CARRY((\u_vga|Add12~12_combout\ & (!\u_vga|Add11~15_combout\ & !\u_vga|Add13~13\)) # (!\u_vga|Add12~12_combout\ & ((!\u_vga|Add13~13\) # (!\u_vga|Add11~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add12~12_combout\,
	datab => \u_vga|Add11~15_combout\,
	datad => VCC,
	cin => \u_vga|Add13~13\,
	combout => \u_vga|Add13~14_combout\,
	cout => \u_vga|Add13~15\);

-- Location: LCCOMB_X31_Y23_N20
\u_vga|Add13~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~16_combout\ = ((\u_vga|Add12~14_combout\ $ (\u_vga|Add11~17_combout\ $ (!\u_vga|Add13~15\)))) # (GND)
-- \u_vga|Add13~17\ = CARRY((\u_vga|Add12~14_combout\ & ((\u_vga|Add11~17_combout\) # (!\u_vga|Add13~15\))) # (!\u_vga|Add12~14_combout\ & (\u_vga|Add11~17_combout\ & !\u_vga|Add13~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add12~14_combout\,
	datab => \u_vga|Add11~17_combout\,
	datad => VCC,
	cin => \u_vga|Add13~15\,
	combout => \u_vga|Add13~16_combout\,
	cout => \u_vga|Add13~17\);

-- Location: LCCOMB_X31_Y23_N22
\u_vga|Add13~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~18_combout\ = (\u_vga|Add12~16_combout\ & (!\u_vga|Add13~17\)) # (!\u_vga|Add12~16_combout\ & ((\u_vga|Add13~17\) # (GND)))
-- \u_vga|Add13~19\ = CARRY((!\u_vga|Add13~17\) # (!\u_vga|Add12~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Add12~16_combout\,
	datad => VCC,
	cin => \u_vga|Add13~17\,
	combout => \u_vga|Add13~18_combout\,
	cout => \u_vga|Add13~19\);

-- Location: FF_X30_Y23_N1
\u_vga|old_magn_g_y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|Add13~18_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(7));

-- Location: LCCOMB_X30_Y23_N12
\u_vga|Add12~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~12_combout\ = ((\u_vga|old_magn_g_y\(6) $ (\u_vga|old_magn_g_y\(7) $ (!\u_vga|Add12~11\)))) # (GND)
-- \u_vga|Add12~13\ = CARRY((\u_vga|old_magn_g_y\(6) & ((\u_vga|old_magn_g_y\(7)) # (!\u_vga|Add12~11\))) # (!\u_vga|old_magn_g_y\(6) & (\u_vga|old_magn_g_y\(7) & !\u_vga|Add12~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(6),
	datab => \u_vga|old_magn_g_y\(7),
	datad => VCC,
	cin => \u_vga|Add12~11\,
	combout => \u_vga|Add12~12_combout\,
	cout => \u_vga|Add12~13\);

-- Location: LCCOMB_X30_Y23_N14
\u_vga|Add12~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~14_combout\ = (\u_vga|old_magn_g_y\(8) & ((\u_vga|old_magn_g_y\(7) & (\u_vga|Add12~13\ & VCC)) # (!\u_vga|old_magn_g_y\(7) & (!\u_vga|Add12~13\)))) # (!\u_vga|old_magn_g_y\(8) & ((\u_vga|old_magn_g_y\(7) & (!\u_vga|Add12~13\)) # 
-- (!\u_vga|old_magn_g_y\(7) & ((\u_vga|Add12~13\) # (GND)))))
-- \u_vga|Add12~15\ = CARRY((\u_vga|old_magn_g_y\(8) & (!\u_vga|old_magn_g_y\(7) & !\u_vga|Add12~13\)) # (!\u_vga|old_magn_g_y\(8) & ((!\u_vga|Add12~13\) # (!\u_vga|old_magn_g_y\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|old_magn_g_y\(8),
	datab => \u_vga|old_magn_g_y\(7),
	datad => VCC,
	cin => \u_vga|Add12~13\,
	combout => \u_vga|Add12~14_combout\,
	cout => \u_vga|Add12~15\);

-- Location: LCCOMB_X30_Y23_N18
\u_vga|Add12~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add12~18_combout\ = \u_vga|Add12~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_vga|Add12~17\,
	combout => \u_vga|Add12~18_combout\);

-- Location: LCCOMB_X31_Y23_N24
\u_vga|Add13~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add13~20_combout\ = \u_vga|Add13~19\ $ (!\u_vga|Add12~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|Add12~18_combout\,
	cin => \u_vga|Add13~19\,
	combout => \u_vga|Add13~20_combout\);

-- Location: FF_X30_Y23_N13
\u_vga|old_magn_g_y[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|Add13~20_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(8));

-- Location: FF_X30_Y23_N29
\u_vga|old_magn_g_y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|Add13~16_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|old_magn_g_y\(6));

-- Location: LCCOMB_X30_Y23_N20
\u_vga|Mult0|mult_core|romout[1][12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][12]~0_combout\ = (\u_vga|Add13~18_combout\ & ((\u_vga|Add13~16_combout\) # ((\u_vga|Add13~14_combout\ & \u_vga|Add13~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~14_combout\,
	datab => \u_vga|Add13~16_combout\,
	datac => \u_vga|Add13~12_combout\,
	datad => \u_vga|Add13~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][12]~0_combout\);

-- Location: LCCOMB_X30_Y23_N26
\u_vga|Mult0|mult_core|romout[1][11]\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][11]~combout\ = (\u_vga|Add13~16_combout\ & (((\u_vga|Add13~14_combout\ & !\u_vga|Add13~18_combout\)))) # (!\u_vga|Add13~16_combout\ & (\u_vga|Add13~18_combout\ & ((!\u_vga|Add13~14_combout\) # 
-- (!\u_vga|Add13~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~16_combout\,
	datab => \u_vga|Add13~12_combout\,
	datac => \u_vga|Add13~14_combout\,
	datad => \u_vga|Add13~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][11]~combout\);

-- Location: LCCOMB_X30_Y23_N28
\u_vga|Mult0|mult_core|romout[1][10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][10]~1_combout\ = (\u_vga|Add13~14_combout\ & (\u_vga|Add13~18_combout\ $ (((\u_vga|Add13~12_combout\ & !\u_vga|Add13~16_combout\))))) # (!\u_vga|Add13~14_combout\ & ((\u_vga|Add13~16_combout\ & 
-- ((!\u_vga|Add13~18_combout\))) # (!\u_vga|Add13~16_combout\ & (\u_vga|Add13~12_combout\ & \u_vga|Add13~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~14_combout\,
	datab => \u_vga|Add13~12_combout\,
	datac => \u_vga|Add13~16_combout\,
	datad => \u_vga|Add13~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][10]~1_combout\);

-- Location: LCCOMB_X30_Y22_N26
\u_vga|Mult0|mult_core|romout[1][9]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][9]~2_combout\ = (\u_vga|Add13~16_combout\ & (\u_vga|Add13~12_combout\)) # (!\u_vga|Add13~16_combout\ & (!\u_vga|Add13~12_combout\ & ((\u_vga|Add13~14_combout\) # (\u_vga|Add13~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~16_combout\,
	datab => \u_vga|Add13~12_combout\,
	datac => \u_vga|Add13~14_combout\,
	datad => \u_vga|Add13~18_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][9]~2_combout\);

-- Location: LCCOMB_X31_Y22_N24
\u_vga|Mult0|mult_core|romout[0][12]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][12]~4_combout\ = (\u_vga|Add13~10_combout\ & ((\u_vga|Add13~8_combout\) # ((\u_vga|Add13~6_combout\ & \u_vga|Add13~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~6_combout\,
	datab => \u_vga|Add13~4_combout\,
	datac => \u_vga|Add13~10_combout\,
	datad => \u_vga|Add13~8_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][12]~4_combout\);

-- Location: LCCOMB_X30_Y22_N24
\u_vga|Mult0|mult_core|romout[1][8]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][8]~3_combout\ = (!\u_vga|Add13~14_combout\ & ((\u_vga|Add13~16_combout\) # ((\u_vga|Add13~18_combout\) # (\u_vga|Add13~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~16_combout\,
	datab => \u_vga|Add13~14_combout\,
	datac => \u_vga|Add13~18_combout\,
	datad => \u_vga|Add13~12_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][8]~3_combout\);

-- Location: LCCOMB_X31_Y23_N2
\u_vga|Mult0|mult_core|romout[1][7]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][7]~5_combout\ = (!\u_vga|Add13~12_combout\ & ((\u_vga|Add13~18_combout\) # ((\u_vga|Add13~16_combout\) # (\u_vga|Add13~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~18_combout\,
	datab => \u_vga|Add13~16_combout\,
	datac => \u_vga|Add13~14_combout\,
	datad => \u_vga|Add13~12_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][7]~5_combout\);

-- Location: LCCOMB_X31_Y22_N14
\u_vga|Mult0|mult_core|romout[0][11]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][11]~6_combout\ = (\u_vga|Add13~10_combout\ & (!\u_vga|Add13~8_combout\ & ((!\u_vga|Add13~6_combout\) # (!\u_vga|Add13~4_combout\)))) # (!\u_vga|Add13~10_combout\ & (((\u_vga|Add13~6_combout\ & \u_vga|Add13~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~10_combout\,
	datab => \u_vga|Add13~4_combout\,
	datac => \u_vga|Add13~6_combout\,
	datad => \u_vga|Add13~8_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][11]~6_combout\);

-- Location: LCCOMB_X30_Y22_N30
\u_vga|Mult0|mult_core|romout[1][6]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][6]~7_combout\ = (\u_vga|Add13~12_combout\) # ((\u_vga|Add13~14_combout\) # ((\u_vga|Add13~18_combout\) # (\u_vga|Add13~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~12_combout\,
	datab => \u_vga|Add13~14_combout\,
	datac => \u_vga|Add13~18_combout\,
	datad => \u_vga|Add13~16_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][6]~7_combout\);

-- Location: LCCOMB_X31_Y23_N0
\u_vga|Mult0|mult_core|romout[0][10]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][10]~8_combout\ = (\u_vga|Add13~6_combout\ & (\u_vga|Add13~10_combout\ $ (((\u_vga|Add13~4_combout\ & !\u_vga|Add13~8_combout\))))) # (!\u_vga|Add13~6_combout\ & ((\u_vga|Add13~10_combout\ & (\u_vga|Add13~4_combout\ & 
-- !\u_vga|Add13~8_combout\)) # (!\u_vga|Add13~10_combout\ & ((\u_vga|Add13~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~6_combout\,
	datab => \u_vga|Add13~10_combout\,
	datac => \u_vga|Add13~4_combout\,
	datad => \u_vga|Add13~8_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][10]~8_combout\);

-- Location: LCCOMB_X31_Y23_N28
\u_vga|Mult0|mult_core|romout[0][9]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][9]~10_combout\ = (\u_vga|Add13~8_combout\ & (\u_vga|Add13~4_combout\)) # (!\u_vga|Add13~8_combout\ & (!\u_vga|Add13~4_combout\ & ((\u_vga|Add13~6_combout\) # (\u_vga|Add13~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~8_combout\,
	datab => \u_vga|Add13~4_combout\,
	datac => \u_vga|Add13~6_combout\,
	datad => \u_vga|Add13~10_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][9]~10_combout\);

-- Location: LCCOMB_X31_Y23_N30
\u_vga|Mult0|mult_core|romout[1][5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][5]~9_combout\ = \u_vga|Add13~18_combout\ $ (((\u_vga|Add13~12_combout\) # ((\u_vga|Add13~14_combout\) # (\u_vga|Add13~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~18_combout\,
	datab => \u_vga|Add13~12_combout\,
	datac => \u_vga|Add13~14_combout\,
	datad => \u_vga|Add13~16_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][5]~9_combout\);

-- Location: LCCOMB_X30_Y22_N28
\u_vga|Mult0|mult_core|romout[1][4]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][4]~11_combout\ = \u_vga|Add13~16_combout\ $ (((\u_vga|Add13~12_combout\) # (\u_vga|Add13~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~12_combout\,
	datac => \u_vga|Add13~14_combout\,
	datad => \u_vga|Add13~16_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][4]~11_combout\);

-- Location: LCCOMB_X30_Y23_N24
\u_vga|Mult0|mult_core|romout[0][8]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][8]~12_combout\ = (!\u_vga|Add13~6_combout\ & ((\u_vga|Add13~4_combout\) # ((\u_vga|Add13~10_combout\) # (\u_vga|Add13~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~4_combout\,
	datab => \u_vga|Add13~10_combout\,
	datac => \u_vga|Add13~8_combout\,
	datad => \u_vga|Add13~6_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][8]~12_combout\);

-- Location: LCCOMB_X30_Y23_N30
\u_vga|Mult0|mult_core|romout[0][7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][7]~14_combout\ = (!\u_vga|Add13~4_combout\ & ((\u_vga|Add13~6_combout\) # ((\u_vga|Add13~8_combout\) # (\u_vga|Add13~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~6_combout\,
	datab => \u_vga|Add13~8_combout\,
	datac => \u_vga|Add13~10_combout\,
	datad => \u_vga|Add13~4_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][7]~14_combout\);

-- Location: LCCOMB_X30_Y22_N22
\u_vga|Mult0|mult_core|romout[1][3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[1][3]~13_combout\ = \u_vga|Add13~14_combout\ $ (\u_vga|Add13~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|Add13~14_combout\,
	datad => \u_vga|Add13~12_combout\,
	combout => \u_vga|Mult0|mult_core|romout[1][3]~13_combout\);

-- Location: LCCOMB_X31_Y23_N26
\u_vga|Mult0|mult_core|romout[0][6]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|romout[0][6]~15_combout\ = (\u_vga|Add13~6_combout\) # ((\u_vga|Add13~4_combout\) # ((\u_vga|Add13~10_combout\) # (\u_vga|Add13~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~6_combout\,
	datab => \u_vga|Add13~4_combout\,
	datac => \u_vga|Add13~10_combout\,
	datad => \u_vga|Add13~8_combout\,
	combout => \u_vga|Mult0|mult_core|romout[0][6]~15_combout\);

-- Location: LCCOMB_X30_Y22_N0
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\ = CARRY((\u_vga|Add13~12_combout\ & \u_vga|Mult0|mult_core|romout[0][6]~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~12_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][6]~15_combout\,
	datad => VCC,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\);

-- Location: LCCOMB_X30_Y22_N2
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\ = CARRY((\u_vga|Mult0|mult_core|romout[0][7]~14_combout\ & (!\u_vga|Mult0|mult_core|romout[1][3]~13_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\)) # 
-- (!\u_vga|Mult0|mult_core|romout[0][7]~14_combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\) # (!\u_vga|Mult0|mult_core|romout[1][3]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][7]~14_combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][3]~13_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1_cout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\);

-- Location: LCCOMB_X30_Y22_N4
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ = ((\u_vga|Mult0|mult_core|romout[1][4]~11_combout\ $ (\u_vga|Mult0|mult_core|romout[0][8]~12_combout\ $ (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ = CARRY((\u_vga|Mult0|mult_core|romout[1][4]~11_combout\ & ((\u_vga|Mult0|mult_core|romout[0][8]~12_combout\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\))) # 
-- (!\u_vga|Mult0|mult_core|romout[1][4]~11_combout\ & (\u_vga|Mult0|mult_core|romout[0][8]~12_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][4]~11_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][8]~12_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3_cout\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\);

-- Location: LCCOMB_X30_Y22_N6
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ = (\u_vga|Mult0|mult_core|romout[0][9]~10_combout\ & ((\u_vga|Mult0|mult_core|romout[1][5]~9_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ & VCC)) # 
-- (!\u_vga|Mult0|mult_core|romout[1][5]~9_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)))) # (!\u_vga|Mult0|mult_core|romout[0][9]~10_combout\ & ((\u_vga|Mult0|mult_core|romout[1][5]~9_combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # (!\u_vga|Mult0|mult_core|romout[1][5]~9_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ = CARRY((\u_vga|Mult0|mult_core|romout[0][9]~10_combout\ & (!\u_vga|Mult0|mult_core|romout[1][5]~9_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # 
-- (!\u_vga|Mult0|mult_core|romout[0][9]~10_combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (!\u_vga|Mult0|mult_core|romout[1][5]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[0][9]~10_combout\,
	datab => \u_vga|Mult0|mult_core|romout[1][5]~9_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\);

-- Location: LCCOMB_X30_Y22_N8
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ = ((\u_vga|Mult0|mult_core|romout[1][6]~7_combout\ $ (\u_vga|Mult0|mult_core|romout[0][10]~8_combout\ $ (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ = CARRY((\u_vga|Mult0|mult_core|romout[1][6]~7_combout\ & ((\u_vga|Mult0|mult_core|romout[0][10]~8_combout\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\))) # 
-- (!\u_vga|Mult0|mult_core|romout[1][6]~7_combout\ & (\u_vga|Mult0|mult_core|romout[0][10]~8_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][6]~7_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][10]~8_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\);

-- Location: LCCOMB_X30_Y22_N10
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ = (\u_vga|Mult0|mult_core|romout[1][7]~5_combout\ & ((\u_vga|Mult0|mult_core|romout[0][11]~6_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ & VCC)) # 
-- (!\u_vga|Mult0|mult_core|romout[0][11]~6_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)))) # (!\u_vga|Mult0|mult_core|romout[1][7]~5_combout\ & ((\u_vga|Mult0|mult_core|romout[0][11]~6_combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # (!\u_vga|Mult0|mult_core|romout[0][11]~6_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ = CARRY((\u_vga|Mult0|mult_core|romout[1][7]~5_combout\ & (!\u_vga|Mult0|mult_core|romout[0][11]~6_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # 
-- (!\u_vga|Mult0|mult_core|romout[1][7]~5_combout\ & ((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (!\u_vga|Mult0|mult_core|romout[0][11]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][7]~5_combout\,
	datab => \u_vga|Mult0|mult_core|romout[0][11]~6_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\);

-- Location: LCCOMB_X30_Y22_N12
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

-- Location: LCCOMB_X30_Y22_N14
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

-- Location: LCCOMB_X30_Y22_N16
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ = (\u_vga|Mult0|mult_core|romout[1][10]~1_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ $ (GND))) # (!\u_vga|Mult0|mult_core|romout[1][10]~1_combout\ & 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ & VCC))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ = CARRY((\u_vga|Mult0|mult_core|romout[1][10]~1_combout\ & !\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|romout[1][10]~1_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\);

-- Location: LCCOMB_X30_Y22_N18
\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ = (\u_vga|Mult0|mult_core|romout[1][11]~combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\)) # (!\u_vga|Mult0|mult_core|romout[1][11]~combout\ & 
-- ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\) # (GND)))
-- \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\ = CARRY((!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\) # (!\u_vga|Mult0|mult_core|romout[1][11]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|romout[1][11]~combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\,
	combout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\,
	cout => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\);

-- Location: LCCOMB_X30_Y22_N20
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

-- Location: LCCOMB_X29_Y22_N16
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ = (\u_vga|Add13~20_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ $ (VCC))) # (!\u_vga|Add13~20_combout\ & 
-- (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ & VCC))
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\ = CARRY((\u_vga|Add13~20_combout\ & \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	datad => VCC,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\);

-- Location: LCCOMB_X29_Y22_N18
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ = (\u_vga|Add13~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & 
-- (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\)))) # 
-- (!\u_vga|Add13~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\)) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & ((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\ = CARRY((\u_vga|Add13~20_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\)) # (!\u_vga|Add13~20_combout\ & ((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~1\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\);

-- Location: LCCOMB_X29_Y22_N20
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ = ((\u_vga|Add13~20_combout\ $ (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ $ 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\ = CARRY((\u_vga|Add13~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\) # 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\))) # (!\u_vga|Add13~20_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~3\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\);

-- Location: LCCOMB_X29_Y22_N22
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ = (\u_vga|Add13~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & 
-- (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\)))) # 
-- (!\u_vga|Add13~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\)) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & ((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\) # (GND)))))
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\ = CARRY((\u_vga|Add13~20_combout\ & (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\)) # (!\u_vga|Add13~20_combout\ & ((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~5\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\);

-- Location: LCCOMB_X29_Y22_N24
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ = ((\u_vga|Add13~20_combout\ $ (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ $ 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\ = CARRY((\u_vga|Add13~20_combout\ & ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\) # 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\))) # (!\u_vga|Add13~20_combout\ & (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Add13~20_combout\,
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~7\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\);

-- Location: LCCOMB_X29_Y22_N26
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ & (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\)) # 
-- (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ & ((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\) # (GND)))
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\ = CARRY((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~9\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\);

-- Location: LCCOMB_X29_Y22_N28
\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ = ((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ $ (\u_vga|Add13~20_combout\ $ 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\)))) # (GND)
-- \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~13\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ & ((\u_vga|Add13~20_combout\) # 
-- (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ & (\u_vga|Add13~20_combout\ & 
-- !\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\,
	datab => \u_vga|Add13~20_combout\,
	datad => VCC,
	cin => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~11\,
	combout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\,
	cout => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~13\);

-- Location: LCCOMB_X29_Y22_N30
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

-- Location: LCCOMB_X28_Y22_N6
\u_vga|left_bound[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[0]~10_combout\ = \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ $ (GND)
-- \u_vga|left_bound[0]~11\ = CARRY(!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	datad => VCC,
	combout => \u_vga|left_bound[0]~10_combout\,
	cout => \u_vga|left_bound[0]~11\);

-- Location: LCCOMB_X28_Y22_N8
\u_vga|left_bound[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[1]~12_combout\ = (\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ & ((\u_vga|left_bound[0]~11\) # (GND))) # (!\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ & (!\u_vga|left_bound[0]~11\))
-- \u_vga|left_bound[1]~13\ = CARRY((\u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\) # (!\u_vga|left_bound[0]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	datad => VCC,
	cin => \u_vga|left_bound[0]~11\,
	combout => \u_vga|left_bound[1]~12_combout\,
	cout => \u_vga|left_bound[1]~13\);

-- Location: LCCOMB_X28_Y22_N10
\u_vga|left_bound[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[2]~14_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ & (\u_vga|left_bound[1]~13\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ & ((GND) # 
-- (!\u_vga|left_bound[1]~13\)))
-- \u_vga|left_bound[2]~15\ = CARRY((!\u_vga|left_bound[1]~13\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\,
	datad => VCC,
	cin => \u_vga|left_bound[1]~13\,
	combout => \u_vga|left_bound[2]~14_combout\,
	cout => \u_vga|left_bound[2]~15\);

-- Location: LCCOMB_X28_Y22_N12
\u_vga|left_bound[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[3]~16_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & (!\u_vga|left_bound[2]~15\)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & 
-- (\u_vga|left_bound[2]~15\ & VCC))
-- \u_vga|left_bound[3]~17\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & !\u_vga|left_bound[2]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\,
	datad => VCC,
	cin => \u_vga|left_bound[2]~15\,
	combout => \u_vga|left_bound[3]~16_combout\,
	cout => \u_vga|left_bound[3]~17\);

-- Location: LCCOMB_X28_Y22_N14
\u_vga|left_bound[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[4]~18_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ & (\u_vga|left_bound[3]~17\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ & ((GND) # 
-- (!\u_vga|left_bound[3]~17\)))
-- \u_vga|left_bound[4]~19\ = CARRY((!\u_vga|left_bound[3]~17\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\,
	datad => VCC,
	cin => \u_vga|left_bound[3]~17\,
	combout => \u_vga|left_bound[4]~18_combout\,
	cout => \u_vga|left_bound[4]~19\);

-- Location: LCCOMB_X28_Y22_N16
\u_vga|left_bound[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[5]~20_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & (!\u_vga|left_bound[4]~19\)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & 
-- (\u_vga|left_bound[4]~19\ & VCC))
-- \u_vga|left_bound[5]~21\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & !\u_vga|left_bound[4]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\,
	datad => VCC,
	cin => \u_vga|left_bound[4]~19\,
	combout => \u_vga|left_bound[5]~20_combout\,
	cout => \u_vga|left_bound[5]~21\);

-- Location: LCCOMB_X28_Y22_N18
\u_vga|left_bound[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[6]~22_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ & (\u_vga|left_bound[5]~21\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ & ((GND) # 
-- (!\u_vga|left_bound[5]~21\)))
-- \u_vga|left_bound[6]~23\ = CARRY((!\u_vga|left_bound[5]~21\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\,
	datad => VCC,
	cin => \u_vga|left_bound[5]~21\,
	combout => \u_vga|left_bound[6]~22_combout\,
	cout => \u_vga|left_bound[6]~23\);

-- Location: LCCOMB_X28_Y22_N20
\u_vga|left_bound[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[7]~24_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ & ((\u_vga|left_bound[6]~23\) # (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ & 
-- (!\u_vga|left_bound[6]~23\))
-- \u_vga|left_bound[7]~25\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\) # (!\u_vga|left_bound[6]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\,
	datad => VCC,
	cin => \u_vga|left_bound[6]~23\,
	combout => \u_vga|left_bound[7]~24_combout\,
	cout => \u_vga|left_bound[7]~25\);

-- Location: LCCOMB_X28_Y22_N22
\u_vga|left_bound[8]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[8]~26_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ & (\u_vga|left_bound[7]~25\ $ (GND))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ & ((GND) # 
-- (!\u_vga|left_bound[7]~25\)))
-- \u_vga|left_bound[8]~27\ = CARRY((!\u_vga|left_bound[7]~25\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\,
	datad => VCC,
	cin => \u_vga|left_bound[7]~25\,
	combout => \u_vga|left_bound[8]~26_combout\,
	cout => \u_vga|left_bound[8]~27\);

-- Location: LCCOMB_X28_Y22_N24
\u_vga|left_bound[9]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|left_bound[9]~28_combout\ = \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\ $ (!\u_vga|left_bound[8]~27\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\,
	cin => \u_vga|left_bound[8]~27\,
	combout => \u_vga|left_bound[9]~28_combout\);

-- Location: LCCOMB_X29_Y22_N0
\u_vga|Add15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~0_combout\ = \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\ $ (VCC)
-- \u_vga|Add15~1\ = CARRY(\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~0_combout\,
	datad => VCC,
	combout => \u_vga|Add15~0_combout\,
	cout => \u_vga|Add15~1\);

-- Location: LCCOMB_X29_Y22_N2
\u_vga|Add15~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~2_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & (\u_vga|Add15~1\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & (!\u_vga|Add15~1\))
-- \u_vga|Add15~3\ = CARRY((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\ & !\u_vga|Add15~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~2_combout\,
	datad => VCC,
	cin => \u_vga|Add15~1\,
	combout => \u_vga|Add15~2_combout\,
	cout => \u_vga|Add15~3\);

-- Location: LCCOMB_X29_Y22_N4
\u_vga|Add15~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~4_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ & ((GND) # (!\u_vga|Add15~3\))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\ & (\u_vga|Add15~3\ $ (GND)))
-- \u_vga|Add15~5\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\) # (!\u_vga|Add15~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~4_combout\,
	datad => VCC,
	cin => \u_vga|Add15~3\,
	combout => \u_vga|Add15~4_combout\,
	cout => \u_vga|Add15~5\);

-- Location: LCCOMB_X29_Y22_N6
\u_vga|Add15~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~6_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & (\u_vga|Add15~5\ & VCC)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & (!\u_vga|Add15~5\))
-- \u_vga|Add15~7\ = CARRY((!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\ & !\u_vga|Add15~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~6_combout\,
	datad => VCC,
	cin => \u_vga|Add15~5\,
	combout => \u_vga|Add15~6_combout\,
	cout => \u_vga|Add15~7\);

-- Location: LCCOMB_X29_Y22_N8
\u_vga|Add15~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~8_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ & ((GND) # (!\u_vga|Add15~7\))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\ & (\u_vga|Add15~7\ $ (GND)))
-- \u_vga|Add15~9\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\) # (!\u_vga|Add15~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~8_combout\,
	datad => VCC,
	cin => \u_vga|Add15~7\,
	combout => \u_vga|Add15~8_combout\,
	cout => \u_vga|Add15~9\);

-- Location: LCCOMB_X29_Y22_N10
\u_vga|Add15~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~10_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ & (!\u_vga|Add15~9\)) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\ & ((\u_vga|Add15~9\) # (GND)))
-- \u_vga|Add15~11\ = CARRY((!\u_vga|Add15~9\) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~10_combout\,
	datad => VCC,
	cin => \u_vga|Add15~9\,
	combout => \u_vga|Add15~10_combout\,
	cout => \u_vga|Add15~11\);

-- Location: LCCOMB_X29_Y22_N12
\u_vga|Add15~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~12_combout\ = (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ & ((GND) # (!\u_vga|Add15~11\))) # (!\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\ & (\u_vga|Add15~11\ $ 
-- (GND)))
-- \u_vga|Add15~13\ = CARRY((\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\) # (!\u_vga|Add15~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~12_combout\,
	datad => VCC,
	cin => \u_vga|Add15~11\,
	combout => \u_vga|Add15~12_combout\,
	cout => \u_vga|Add15~13\);

-- Location: LCCOMB_X29_Y22_N14
\u_vga|Add15~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|Add15~14_combout\ = \u_vga|Add15~13\ $ (\u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|Mult0|mult_core|padder|sub_par_add|adder[0]|auto_generated|op_1~14_combout\,
	cin => \u_vga|Add15~13\,
	combout => \u_vga|Add15~14_combout\);

-- Location: FF_X28_Y22_N25
\u_vga|left_bound[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[9]~28_combout\,
	asdata => \u_vga|Add15~14_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(9));

-- Location: FF_X28_Y22_N23
\u_vga|left_bound[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[8]~26_combout\,
	asdata => \u_vga|Add15~12_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(8));

-- Location: FF_X28_Y22_N21
\u_vga|left_bound[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[7]~24_combout\,
	asdata => \u_vga|Add15~10_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(7));

-- Location: FF_X28_Y22_N19
\u_vga|left_bound[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[6]~22_combout\,
	asdata => \u_vga|Add15~8_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(6));

-- Location: FF_X28_Y22_N17
\u_vga|left_bound[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[5]~20_combout\,
	asdata => \u_vga|Add15~6_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(5));

-- Location: FF_X28_Y22_N13
\u_vga|left_bound[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[3]~16_combout\,
	asdata => \u_vga|Add15~2_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(3));

-- Location: FF_X28_Y22_N15
\u_vga|left_bound[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[4]~18_combout\,
	asdata => \u_vga|Add15~4_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(4));

-- Location: LCCOMB_X25_Y22_N20
\u_vga|right_bound[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_bound[4]~6_combout\ = (\u_vga|left_bound\(3) & (\u_vga|left_bound\(4) $ (VCC))) # (!\u_vga|left_bound\(3) & (\u_vga|left_bound\(4) & VCC))
-- \u_vga|right_bound[4]~7\ = CARRY((\u_vga|left_bound\(3) & \u_vga|left_bound\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_bound\(3),
	datab => \u_vga|left_bound\(4),
	datad => VCC,
	combout => \u_vga|right_bound[4]~6_combout\,
	cout => \u_vga|right_bound[4]~7\);

-- Location: LCCOMB_X25_Y22_N22
\u_vga|right_bound[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_bound[5]~8_combout\ = (\u_vga|left_bound\(5) & (\u_vga|right_bound[4]~7\ & VCC)) # (!\u_vga|left_bound\(5) & (!\u_vga|right_bound[4]~7\))
-- \u_vga|right_bound[5]~9\ = CARRY((!\u_vga|left_bound\(5) & !\u_vga|right_bound[4]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_bound\(5),
	datad => VCC,
	cin => \u_vga|right_bound[4]~7\,
	combout => \u_vga|right_bound[5]~8_combout\,
	cout => \u_vga|right_bound[5]~9\);

-- Location: LCCOMB_X25_Y22_N24
\u_vga|right_bound[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_bound[6]~10_combout\ = (\u_vga|left_bound\(6) & (\u_vga|right_bound[5]~9\ $ (GND))) # (!\u_vga|left_bound\(6) & (!\u_vga|right_bound[5]~9\ & VCC))
-- \u_vga|right_bound[6]~11\ = CARRY((\u_vga|left_bound\(6) & !\u_vga|right_bound[5]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_bound\(6),
	datad => VCC,
	cin => \u_vga|right_bound[5]~9\,
	combout => \u_vga|right_bound[6]~10_combout\,
	cout => \u_vga|right_bound[6]~11\);

-- Location: LCCOMB_X25_Y22_N26
\u_vga|right_bound[7]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_bound[7]~12_combout\ = (\u_vga|left_bound\(7) & (!\u_vga|right_bound[6]~11\)) # (!\u_vga|left_bound\(7) & ((\u_vga|right_bound[6]~11\) # (GND)))
-- \u_vga|right_bound[7]~13\ = CARRY((!\u_vga|right_bound[6]~11\) # (!\u_vga|left_bound\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|left_bound\(7),
	datad => VCC,
	cin => \u_vga|right_bound[6]~11\,
	combout => \u_vga|right_bound[7]~12_combout\,
	cout => \u_vga|right_bound[7]~13\);

-- Location: LCCOMB_X25_Y22_N28
\u_vga|right_bound[8]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_bound[8]~14_combout\ = (\u_vga|left_bound\(8) & (\u_vga|right_bound[7]~13\ $ (GND))) # (!\u_vga|left_bound\(8) & (!\u_vga|right_bound[7]~13\ & VCC))
-- \u_vga|right_bound[8]~15\ = CARRY((\u_vga|left_bound\(8) & !\u_vga|right_bound[7]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|left_bound\(8),
	datad => VCC,
	cin => \u_vga|right_bound[7]~13\,
	combout => \u_vga|right_bound[8]~14_combout\,
	cout => \u_vga|right_bound[8]~15\);

-- Location: LCCOMB_X25_Y22_N30
\u_vga|right_bound[9]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_bound[9]~16_combout\ = \u_vga|right_bound[8]~15\ $ (\u_vga|left_bound\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_vga|left_bound\(9),
	cin => \u_vga|right_bound[8]~15\,
	combout => \u_vga|right_bound[9]~16_combout\);

-- Location: FF_X25_Y22_N31
\u_vga|right_bound[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|right_bound[9]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(9));

-- Location: FF_X25_Y22_N17
\u_vga|right_bound[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|right_bound[8]~14_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(8));

-- Location: FF_X25_Y22_N15
\u_vga|right_bound[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|right_bound[7]~12_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(7));

-- Location: FF_X25_Y22_N13
\u_vga|right_bound[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|right_bound[6]~10_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(6));

-- Location: FF_X25_Y22_N11
\u_vga|right_bound[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|right_bound[5]~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(5));

-- Location: FF_X25_Y22_N9
\u_vga|right_bound[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|right_bound[4]~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(4));

-- Location: LCCOMB_X26_Y22_N10
\u_vga|right_bound[3]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|right_bound[3]~18_combout\ = !\u_vga|left_bound\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|left_bound\(3),
	combout => \u_vga|right_bound[3]~18_combout\);

-- Location: FF_X25_Y22_N7
\u_vga|right_bound[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|right_bound[3]~18_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(3));

-- Location: FF_X28_Y22_N11
\u_vga|left_bound[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[2]~14_combout\,
	asdata => \u_vga|Add15~0_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(2));

-- Location: FF_X25_Y22_N5
\u_vga|right_bound[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|left_bound\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(2));

-- Location: FF_X28_Y22_N9
\u_vga|left_bound[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[1]~12_combout\,
	asdata => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(1));

-- Location: FF_X25_Y22_N3
\u_vga|right_bound[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|left_bound\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(1));

-- Location: FF_X28_Y22_N7
\u_vga|left_bound[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	d => \u_vga|left_bound[0]~10_combout\,
	asdata => \u_vga|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	sload => \u_spi_ee_config|oDATA_YH_xhdl2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|left_bound\(0));

-- Location: FF_X25_Y22_N1
\u_vga|right_bound[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga|ALT_INV_v_sync~clkctrl_outclk\,
	asdata => \u_vga|left_bound\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|right_bound\(0));

-- Location: LCCOMB_X25_Y22_N0
\u_vga|LessThan8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~1_cout\ = CARRY((\u_vga|h_cnt\(0) & !\u_vga|right_bound\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(0),
	datab => \u_vga|right_bound\(0),
	datad => VCC,
	cout => \u_vga|LessThan8~1_cout\);

-- Location: LCCOMB_X25_Y22_N2
\u_vga|LessThan8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~3_cout\ = CARRY((\u_vga|h_cnt\(1) & (\u_vga|right_bound\(1) & !\u_vga|LessThan8~1_cout\)) # (!\u_vga|h_cnt\(1) & ((\u_vga|right_bound\(1)) # (!\u_vga|LessThan8~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|right_bound\(1),
	datad => VCC,
	cin => \u_vga|LessThan8~1_cout\,
	cout => \u_vga|LessThan8~3_cout\);

-- Location: LCCOMB_X25_Y22_N4
\u_vga|LessThan8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~5_cout\ = CARRY((\u_vga|h_cnt\(2) & ((!\u_vga|LessThan8~3_cout\) # (!\u_vga|right_bound\(2)))) # (!\u_vga|h_cnt\(2) & (!\u_vga|right_bound\(2) & !\u_vga|LessThan8~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|right_bound\(2),
	datad => VCC,
	cin => \u_vga|LessThan8~3_cout\,
	cout => \u_vga|LessThan8~5_cout\);

-- Location: LCCOMB_X25_Y22_N6
\u_vga|LessThan8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~7_cout\ = CARRY((\u_vga|right_bound\(3) & ((!\u_vga|LessThan8~5_cout\) # (!\u_vga|h_cnt\(3)))) # (!\u_vga|right_bound\(3) & (!\u_vga|h_cnt\(3) & !\u_vga|LessThan8~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_bound\(3),
	datab => \u_vga|h_cnt\(3),
	datad => VCC,
	cin => \u_vga|LessThan8~5_cout\,
	cout => \u_vga|LessThan8~7_cout\);

-- Location: LCCOMB_X25_Y22_N8
\u_vga|LessThan8~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~9_cout\ = CARRY((\u_vga|h_cnt\(4) & ((!\u_vga|LessThan8~7_cout\) # (!\u_vga|right_bound\(4)))) # (!\u_vga|h_cnt\(4) & (!\u_vga|right_bound\(4) & !\u_vga|LessThan8~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|right_bound\(4),
	datad => VCC,
	cin => \u_vga|LessThan8~7_cout\,
	cout => \u_vga|LessThan8~9_cout\);

-- Location: LCCOMB_X25_Y22_N10
\u_vga|LessThan8~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~11_cout\ = CARRY((\u_vga|right_bound\(5) & ((!\u_vga|LessThan8~9_cout\) # (!\u_vga|h_cnt\(5)))) # (!\u_vga|right_bound\(5) & (!\u_vga|h_cnt\(5) & !\u_vga|LessThan8~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_bound\(5),
	datab => \u_vga|h_cnt\(5),
	datad => VCC,
	cin => \u_vga|LessThan8~9_cout\,
	cout => \u_vga|LessThan8~11_cout\);

-- Location: LCCOMB_X25_Y22_N12
\u_vga|LessThan8~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~13_cout\ = CARRY((\u_vga|right_bound\(6) & (\u_vga|h_cnt\(6) & !\u_vga|LessThan8~11_cout\)) # (!\u_vga|right_bound\(6) & ((\u_vga|h_cnt\(6)) # (!\u_vga|LessThan8~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_bound\(6),
	datab => \u_vga|h_cnt\(6),
	datad => VCC,
	cin => \u_vga|LessThan8~11_cout\,
	cout => \u_vga|LessThan8~13_cout\);

-- Location: LCCOMB_X25_Y22_N14
\u_vga|LessThan8~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~15_cout\ = CARRY((\u_vga|h_cnt\(7) & (\u_vga|right_bound\(7) & !\u_vga|LessThan8~13_cout\)) # (!\u_vga|h_cnt\(7) & ((\u_vga|right_bound\(7)) # (!\u_vga|LessThan8~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(7),
	datab => \u_vga|right_bound\(7),
	datad => VCC,
	cin => \u_vga|LessThan8~13_cout\,
	cout => \u_vga|LessThan8~15_cout\);

-- Location: LCCOMB_X25_Y22_N16
\u_vga|LessThan8~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~17_cout\ = CARRY((\u_vga|h_cnt\(8) & ((!\u_vga|LessThan8~15_cout\) # (!\u_vga|right_bound\(8)))) # (!\u_vga|h_cnt\(8) & (!\u_vga|right_bound\(8) & !\u_vga|LessThan8~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|right_bound\(8),
	datad => VCC,
	cin => \u_vga|LessThan8~15_cout\,
	cout => \u_vga|LessThan8~17_cout\);

-- Location: LCCOMB_X25_Y22_N18
\u_vga|LessThan8~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan8~18_combout\ = (\u_vga|right_bound\(9) & (\u_vga|LessThan8~17_cout\ & \u_vga|h_cnt\(9))) # (!\u_vga|right_bound\(9) & ((\u_vga|LessThan8~17_cout\) # (\u_vga|h_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|right_bound\(9),
	datad => \u_vga|h_cnt\(9),
	cin => \u_vga|LessThan8~17_cout\,
	combout => \u_vga|LessThan8~18_combout\);

-- Location: LCCOMB_X27_Y22_N8
\u_vga|LessThan7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~1_cout\ = CARRY((\u_vga|left_bound\(0) & !\u_vga|h_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_bound\(0),
	datab => \u_vga|h_cnt\(0),
	datad => VCC,
	cout => \u_vga|LessThan7~1_cout\);

-- Location: LCCOMB_X27_Y22_N10
\u_vga|LessThan7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~3_cout\ = CARRY((\u_vga|h_cnt\(1) & ((!\u_vga|LessThan7~1_cout\) # (!\u_vga|left_bound\(1)))) # (!\u_vga|h_cnt\(1) & (!\u_vga|left_bound\(1) & !\u_vga|LessThan7~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(1),
	datab => \u_vga|left_bound\(1),
	datad => VCC,
	cin => \u_vga|LessThan7~1_cout\,
	cout => \u_vga|LessThan7~3_cout\);

-- Location: LCCOMB_X27_Y22_N12
\u_vga|LessThan7~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~5_cout\ = CARRY((\u_vga|h_cnt\(2) & (\u_vga|left_bound\(2) & !\u_vga|LessThan7~3_cout\)) # (!\u_vga|h_cnt\(2) & ((\u_vga|left_bound\(2)) # (!\u_vga|LessThan7~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|left_bound\(2),
	datad => VCC,
	cin => \u_vga|LessThan7~3_cout\,
	cout => \u_vga|LessThan7~5_cout\);

-- Location: LCCOMB_X27_Y22_N14
\u_vga|LessThan7~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~7_cout\ = CARRY((\u_vga|h_cnt\(3) & ((!\u_vga|LessThan7~5_cout\) # (!\u_vga|left_bound\(3)))) # (!\u_vga|h_cnt\(3) & (!\u_vga|left_bound\(3) & !\u_vga|LessThan7~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(3),
	datab => \u_vga|left_bound\(3),
	datad => VCC,
	cin => \u_vga|LessThan7~5_cout\,
	cout => \u_vga|LessThan7~7_cout\);

-- Location: LCCOMB_X27_Y22_N16
\u_vga|LessThan7~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~9_cout\ = CARRY((\u_vga|h_cnt\(4) & (\u_vga|left_bound\(4) & !\u_vga|LessThan7~7_cout\)) # (!\u_vga|h_cnt\(4) & ((\u_vga|left_bound\(4)) # (!\u_vga|LessThan7~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|left_bound\(4),
	datad => VCC,
	cin => \u_vga|LessThan7~7_cout\,
	cout => \u_vga|LessThan7~9_cout\);

-- Location: LCCOMB_X27_Y22_N18
\u_vga|LessThan7~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~11_cout\ = CARRY((\u_vga|h_cnt\(5) & ((!\u_vga|LessThan7~9_cout\) # (!\u_vga|left_bound\(5)))) # (!\u_vga|h_cnt\(5) & (!\u_vga|left_bound\(5) & !\u_vga|LessThan7~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(5),
	datab => \u_vga|left_bound\(5),
	datad => VCC,
	cin => \u_vga|LessThan7~9_cout\,
	cout => \u_vga|LessThan7~11_cout\);

-- Location: LCCOMB_X27_Y22_N20
\u_vga|LessThan7~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~13_cout\ = CARRY((\u_vga|h_cnt\(6) & (\u_vga|left_bound\(6) & !\u_vga|LessThan7~11_cout\)) # (!\u_vga|h_cnt\(6) & ((\u_vga|left_bound\(6)) # (!\u_vga|LessThan7~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|left_bound\(6),
	datad => VCC,
	cin => \u_vga|LessThan7~11_cout\,
	cout => \u_vga|LessThan7~13_cout\);

-- Location: LCCOMB_X27_Y22_N22
\u_vga|LessThan7~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~15_cout\ = CARRY((\u_vga|left_bound\(7) & (\u_vga|h_cnt\(7) & !\u_vga|LessThan7~13_cout\)) # (!\u_vga|left_bound\(7) & ((\u_vga|h_cnt\(7)) # (!\u_vga|LessThan7~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|left_bound\(7),
	datab => \u_vga|h_cnt\(7),
	datad => VCC,
	cin => \u_vga|LessThan7~13_cout\,
	cout => \u_vga|LessThan7~15_cout\);

-- Location: LCCOMB_X27_Y22_N24
\u_vga|LessThan7~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~17_cout\ = CARRY((\u_vga|h_cnt\(8) & (\u_vga|left_bound\(8) & !\u_vga|LessThan7~15_cout\)) # (!\u_vga|h_cnt\(8) & ((\u_vga|left_bound\(8)) # (!\u_vga|LessThan7~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(8),
	datab => \u_vga|left_bound\(8),
	datad => VCC,
	cin => \u_vga|LessThan7~15_cout\,
	cout => \u_vga|LessThan7~17_cout\);

-- Location: LCCOMB_X27_Y22_N26
\u_vga|LessThan7~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|LessThan7~18_combout\ = (\u_vga|h_cnt\(9) & (\u_vga|LessThan7~17_cout\ & \u_vga|left_bound\(9))) # (!\u_vga|h_cnt\(9) & ((\u_vga|LessThan7~17_cout\) # (\u_vga|left_bound\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(9),
	datad => \u_vga|left_bound\(9),
	cin => \u_vga|LessThan7~17_cout\,
	combout => \u_vga|LessThan7~18_combout\);

-- Location: LCCOMB_X26_Y22_N18
\u_vga|vga_gen~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~11_combout\ = (\u_vga|vga_gen~10_combout\ & (!\u_vga|LessThan2~1_combout\ & (!\u_vga|LessThan8~18_combout\ & !\u_vga|LessThan7~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~10_combout\,
	datab => \u_vga|LessThan2~1_combout\,
	datac => \u_vga|LessThan8~18_combout\,
	datad => \u_vga|LessThan7~18_combout\,
	combout => \u_vga|vga_gen~11_combout\);

-- Location: LCCOMB_X26_Y22_N4
\u_vga|red_signal~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|red_signal~11_combout\ = (\u_vga|red_signal~5_combout\ & (((\u_vga|red_signal~10_combout\) # (\u_vga|vga_gen~11_combout\)))) # (!\u_vga|red_signal~5_combout\ & (\u_vga|red_signal~1_combout\ & ((\u_vga|red_signal~10_combout\) # 
-- (\u_vga|vga_gen~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|red_signal~5_combout\,
	datab => \u_vga|red_signal~1_combout\,
	datac => \u_vga|red_signal~10_combout\,
	datad => \u_vga|vga_gen~11_combout\,
	combout => \u_vga|red_signal~11_combout\);

-- Location: FF_X26_Y22_N5
\u_vga|red_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|red_signal~11_combout\,
	ena => \u_vga|LessThan11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|red_signal~q\);

-- Location: FF_X26_Y21_N25
\u_vga|horizontal_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|LessThan13~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|horizontal_en~q\);

-- Location: FF_X28_Y20_N21
\u_vga|vertical_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|LessThan11~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|vertical_en~q\);

-- Location: LCCOMB_X28_Y18_N2
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

-- Location: FF_X28_Y18_N3
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

-- Location: LCCOMB_X27_Y6_N8
\u_vga|out_red~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_red~0_combout\ = (\u_vga|red_signal~q\ & \u_vga|video_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|red_signal~q\,
	datad => \u_vga|video_en~q\,
	combout => \u_vga|out_red~0_combout\);

-- Location: FF_X27_Y6_N9
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

-- Location: LCCOMB_X27_Y20_N0
\u_vga|green_signal~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~4_combout\ = (!\u_vga|LessThan14~0_combout\ & ((\u_vga|LessThan16~18_combout\) # (\u_vga|LessThan15~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan14~0_combout\,
	datac => \u_vga|LessThan16~18_combout\,
	datad => \u_vga|LessThan15~18_combout\,
	combout => \u_vga|green_signal~4_combout\);

-- Location: LCCOMB_X27_Y20_N30
\u_vga|green_signal~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~3_combout\ = (\u_vga|LessThan14~0_combout\ & (((\u_vga|LessThan17~0_combout\) # (!\u_vga|second_row~10_combout\)))) # (!\u_vga|LessThan14~0_combout\ & (!\u_vga|first_row~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan14~0_combout\,
	datab => \u_vga|first_row~10_combout\,
	datac => \u_vga|LessThan17~0_combout\,
	datad => \u_vga|second_row~10_combout\,
	combout => \u_vga|green_signal~3_combout\);

-- Location: LCCOMB_X27_Y20_N10
\u_vga|green_signal~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~5_combout\ = (\u_vga|LessThan14~0_combout\ & ((\u_vga|LessThan18~18_combout\) # (\u_vga|LessThan19~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan14~0_combout\,
	datac => \u_vga|LessThan18~18_combout\,
	datad => \u_vga|LessThan19~18_combout\,
	combout => \u_vga|green_signal~5_combout\);

-- Location: LCCOMB_X27_Y20_N16
\u_vga|green_signal~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~6_combout\ = (\u_vga|vga_gen~2_combout\) # ((\u_vga|green_signal~4_combout\) # ((\u_vga|green_signal~3_combout\) # (\u_vga|green_signal~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~2_combout\,
	datab => \u_vga|green_signal~4_combout\,
	datac => \u_vga|green_signal~3_combout\,
	datad => \u_vga|green_signal~5_combout\,
	combout => \u_vga|green_signal~6_combout\);

-- Location: LCCOMB_X26_Y22_N0
\u_vga|green_signal~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~11_combout\ = (!\u_vga|vga_gen~11_combout\ & (((!\u_vga|vga_gen~18_combout\) # (!\u_vga|vga_gen~22_combout\)) # (!\u_vga|vga_gen~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~19_combout\,
	datab => \u_vga|vga_gen~22_combout\,
	datac => \u_vga|vga_gen~18_combout\,
	datad => \u_vga|vga_gen~11_combout\,
	combout => \u_vga|green_signal~11_combout\);

-- Location: LCCOMB_X26_Y22_N16
\u_vga|green_signal~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~7_combout\ = (\u_vga|green_signal~11_combout\ & (((\u_vga|vga_gen~6_combout\) # (!\u_vga|LessThan13~0_combout\)) # (!\u_vga|vga_gen~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|vga_gen~1_combout\,
	datab => \u_vga|LessThan13~0_combout\,
	datac => \u_vga|vga_gen~6_combout\,
	datad => \u_vga|green_signal~11_combout\,
	combout => \u_vga|green_signal~7_combout\);

-- Location: LCCOMB_X26_Y22_N22
\u_vga|green_signal~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~8_combout\ = (\u_vga|green_signal~6_combout\ & ((\u_vga|green_signal~7_combout\) # ((\u_vga|LessThan13~0_combout\ & \u_vga|Equal9~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan13~0_combout\,
	datab => \u_vga|green_signal~6_combout\,
	datac => \u_vga|Equal9~4_combout\,
	datad => \u_vga|green_signal~7_combout\,
	combout => \u_vga|green_signal~8_combout\);

-- Location: LCCOMB_X26_Y22_N30
\u_vga|green_signal~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~9_combout\ = (\u_vga|green_signal~2_combout\ & ((\u_vga|LessThan2~1_combout\) # (!\u_vga|LessThan13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|green_signal~2_combout\,
	datac => \u_vga|LessThan2~1_combout\,
	datad => \u_vga|LessThan13~0_combout\,
	combout => \u_vga|green_signal~9_combout\);

-- Location: LCCOMB_X26_Y22_N8
\u_vga|green_signal~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|green_signal~10_combout\ = (\u_vga|LessThan11~1_combout\ & (((\u_vga|vga_gen~11_combout\) # (!\u_vga|green_signal~9_combout\)) # (!\u_vga|green_signal~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|LessThan11~1_combout\,
	datab => \u_vga|green_signal~6_combout\,
	datac => \u_vga|green_signal~9_combout\,
	datad => \u_vga|vga_gen~11_combout\,
	combout => \u_vga|green_signal~10_combout\);

-- Location: FF_X26_Y22_N23
\u_vga|green_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|green_signal~8_combout\,
	ena => \u_vga|green_signal~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|green_signal~q\);

-- Location: LCCOMB_X28_Y18_N8
\u_vga|out_green~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_green~0_combout\ = (\u_vga|green_signal~q\ & \u_vga|video_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|green_signal~q\,
	datad => \u_vga|video_en~q\,
	combout => \u_vga|out_green~0_combout\);

-- Location: FF_X28_Y18_N9
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

-- Location: LCCOMB_X26_Y22_N28
\u_vga|blue_signal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|blue_signal~0_combout\ = (\u_vga|green_signal~6_combout\ & ((\u_vga|red_signal~0_combout\) # (\u_vga|green_signal~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_vga|green_signal~6_combout\,
	datac => \u_vga|red_signal~0_combout\,
	datad => \u_vga|green_signal~11_combout\,
	combout => \u_vga|blue_signal~0_combout\);

-- Location: FF_X26_Y22_N29
\u_vga|blue_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|blue_signal~0_combout\,
	ena => \u_vga|green_signal~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|blue_signal~q\);

-- Location: LCCOMB_X27_Y6_N6
\u_vga|out_blue~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|out_blue~0_combout\ = (\u_vga|blue_signal~q\ & \u_vga|video_en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_vga|blue_signal~q\,
	datad => \u_vga|video_en~q\,
	combout => \u_vga|out_blue~0_combout\);

-- Location: FF_X27_Y6_N7
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

-- Location: LCCOMB_X30_Y19_N28
\u_vga|vga_gen~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~24_combout\ = (!\u_vga|h_cnt\(3) & (((!\u_vga|h_cnt\(1)) # (!\u_vga|h_cnt\(0))) # (!\u_vga|h_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(2),
	datab => \u_vga|h_cnt\(3),
	datac => \u_vga|h_cnt\(0),
	datad => \u_vga|h_cnt\(1),
	combout => \u_vga|vga_gen~24_combout\);

-- Location: LCCOMB_X30_Y19_N26
\u_vga|vga_gen~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~25_combout\ = (\u_vga|h_cnt\(5)) # ((\u_vga|h_cnt\(4) & ((\u_vga|h_cnt\(7)) # (!\u_vga|vga_gen~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(4),
	datab => \u_vga|vga_gen~24_combout\,
	datac => \u_vga|h_cnt\(5),
	datad => \u_vga|h_cnt\(7),
	combout => \u_vga|vga_gen~25_combout\);

-- Location: LCCOMB_X30_Y19_N0
\u_vga|vga_gen~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_vga|vga_gen~26_combout\ = (\u_vga|h_cnt\(7) $ (((!\u_vga|vga_gen~25_combout\) # (!\u_vga|h_cnt\(6))))) # (!\u_vga|Equal1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga|h_cnt\(6),
	datab => \u_vga|Equal1~2_combout\,
	datac => \u_vga|vga_gen~25_combout\,
	datad => \u_vga|h_cnt\(7),
	combout => \u_vga|vga_gen~26_combout\);

-- Location: FF_X30_Y19_N1
\u_vga|h_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \u_vga|vga_gen~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga|h_sync~q\);

-- Location: FF_X36_Y1_N29
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

-- Location: FF_X35_Y19_N13
\u_vga|out_v_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \u_vga|v_sync~q\,
	sload => VCC,
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


