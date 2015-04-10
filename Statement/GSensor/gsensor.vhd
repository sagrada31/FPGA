---------------------------------------------------------------------------------
-- gsensor.vhd
-- sindredit@gmail.com 16 Feb 2012
-- Top level design
---------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity gsensor is
    -- Port -----------------------------------------------------------------------
    -- Comes from other files or from the card
    port (
	   CLOCK_50                : IN std_logic;   
      LED                     : OUT std_logic_vector(7 DOWNTO 0);   
      KEY                     : IN std_logic_vector(1 DOWNTO 0);   
      G_SENSOR_CS_N           : OUT std_logic;   -- G_Sensor chip select PIN_G5
      G_SENSOR_INT            : IN std_logic;   -- G_Sensor Interrupt PIN_M2
      I2C_SCLK                : OUT std_logic;  -- EEPROM clock PIN_F2  
      I2C_SDAT                : INOUT std_logic -- EEPROM data PIN_F1
        );
end entity;
    
-- Architecture ------------------------------------------------------------------
-- This file only
architecture synth of gsensor is

   --=======================================================
   --  REG/WIRE declarations
   --=======================================================
   SIGNAL dly_rst                  :  std_logic;   
   SIGNAL spi_clk                  :  std_logic;   
   SIGNAL spi_clk_out              :  std_logic;   
   SIGNAL data_x                   :  std_logic_vector(15 DOWNTO 0);   
   SIGNAL LED_xhdl1                :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL G_SENSOR_CS_N_xhdl2      :  std_logic;   
   SIGNAL I2C_SCLK_xhdl3           :  std_logic;   

BEGIN
   LED <= LED_xhdl1;
   G_SENSOR_CS_N <= G_SENSOR_CS_N_xhdl2;
   I2C_SCLK <= I2C_SCLK_xhdl3;
	
   -- u_reset_delay
   u_reset_delay : entity work.reset_delay 
      PORT MAP (
         iRSTN => KEY(0),
         iCLK => CLOCK_50,
         oRST => dly_rst);   
   
   -- u_spiipll
   u_spipll : entity work.spipll 
      PORT MAP (
         areset => dly_rst,
         inclk0 => CLOCK_50,
         c0 => spi_clk,
         c1 => spi_clk_out);   
   
   -- u_spi_ee_config
   u_spi_ee_config : entity work.spi_ee_config 
      PORT MAP (
         iRSTN => NOT dly_rst,
         iSPI_CLK => spi_clk,
         iSPI_CLK_OUT => spi_clk_out,
         iG_INT2 => G_SENSOR_INT,
         oDATA_L => data_x(7 DOWNTO 0),
         oDATA_H => data_x(15 DOWNTO 8),
         SPI_SDIO => I2C_SDAT,
         oSPI_CSN => G_SENSOR_CS_N_xhdl2,
         oSPI_CLK => I2C_SCLK_xhdl3);   
   
   -- u_led_driver
   u_led_driver : entity work.led_driver 
      PORT MAP (
         iRSTN => NOT dly_rst,
         iCLK => CLOCK_50,
         iDIG => data_x(9 DOWNTO 0),
         iG_INT2 => G_SENSOR_INT,
         oLED => LED_xhdl1);   
   

	
end synth;