---------------------------------------------------------------------------------
-- spi_ee_config.vhd
-- Path: gsensor.vhd -> spi_ee_config.vhd
-- sindredit@gmail.com 16 Feb 2012
-- 
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity spi_ee_config is
  generic (
    IDLE_MSB                       :  integer := 14;    
    SI_DataL                       :  integer := 15;    
    SO_DataL                       :  integer := 7;    
    WRITE_MODE                     :  std_logic_vector(1 downto 0) := "00";    
    READ_MODE                      :  std_logic_vector(1 downto 0) := "10";    
    inI_NUMBER                     :  std_logic_vector(3 downto 0) := "1011";    
    IDLE                           :  std_logic := '0';    
    TRANSFER                       :  std_logic := '1';    
    BW_RATE                        :  std_logic_vector(5 downto 0) := "101100";    
    POWER_CONTROL                  :  std_logic_vector(5 downto 0) := "101101";    
    DATA_FORMAT                    :  std_logic_vector(5 downto 0) := "110001";    
    inT_ENABLE                     :  std_logic_vector(5 downto 0) := "101110";    
    inT_MAP                        :  std_logic_vector(5 downto 0) := "101111";    
    THRESH_ACT                     :  std_logic_vector(5 downto 0) := "100100";    
    THRESH_inACT                   :  std_logic_vector(5 downto 0) := "100101";    
    TIME_inACT                     :  std_logic_vector(5 downto 0) := "100110";    
    ACT_inACT_CTL                  :  std_logic_vector(5 downto 0) := "100111";    
    THRESH_FF                      :  std_logic_vector(5 downto 0) := "101000";    
    TIME_FF                        :  std_logic_vector(5 downto 0) := "101001";    
    inT_SOURCE                     :  std_logic_vector(5 downto 0) := "110000";    
    X_LB                           :  std_logic_vector(5 downto 0) := "110010";    
    X_HB                           :  std_logic_vector(5 downto 0) := "110011";    
    Y_LB                           :  std_logic_vector(5 downto 0) := "110100";    
    Y_HB                           :  std_logic_vector(5 downto 0) := "110101";    
    Z_LB                           :  std_logic_vector(5 downto 0) := "110110";    
    Z_HB                           :  std_logic_vector(5 downto 0) := "110111");    
  port (
    iRSTN                          : in std_logic;   
    iSPI_CLK                       : in std_logic;   
    iSPI_CLK_out                   : in std_logic;   
    iG_inT2                        : in std_logic;   
    oDATA_XL                        : out std_logic_vector(SO_DataL downto 0);   
    oDATA_XH                        : out std_logic_vector(SO_DataL downto 0);
	 oDATA_YL                        : out std_logic_vector(SO_DataL downto 0);   	 
    oDATA_YH                        : out std_logic_vector(SO_DataL downto 0);   
	 SPI_SDIO                       : inout std_logic;   
    oSPI_CSN                       : out std_logic;   
    oSPI_CLK                       : out std_logic);   
end spi_ee_config;

architecture translated OF spi_ee_config is
  component spi_controller
  generic (
    X_LB                   :  std_logic_vector(5 downto 0) := "110010";    
    Z_HB                   :  std_logic_vector(5 downto 0) := "110111";    
    Y_LB                   :  std_logic_vector(5 downto 0) := "110100";    
    READ_MODE              :  std_logic_vector(1 downto 0) := "10";    
    Z_LB                   :  std_logic_vector(5 downto 0) := "110110";    
    SI_DataL               :  integer := 15;    
    THRESH_ACT             :  std_logic_vector(5 downto 0) := "100100";    
    THRESH_inACT           :  std_logic_vector(5 downto 0) := "100101";    
    POWER_CONTROL          :  std_logic_vector(5 downto 0) := "101101";    
    SO_DataL               :  integer := 7;    
    inT_ENABLE             :  std_logic_vector(5 downto 0) := "101110";    
    THRESH_FF              :  std_logic_vector(5 downto 0) := "101000";    
    -- SPI State 
    TIME_FF                :  std_logic_vector(5 downto 0) := "101001";    
    TIME_inACT             :  std_logic_vector(5 downto 0) := "100110";    
    TRANSFER               :  std_logic := '1';    
    ACT_inACT_CTL          :  std_logic_vector(5 downto 0) := "100111";    
    DATA_FORMAT            :  std_logic_vector(5 downto 0) := "110001";    
    X_HB                   :  std_logic_vector(5 downto 0) := "110011";    
    inT_MAP                :  std_logic_vector(5 downto 0) := "101111";    
    Y_HB                   :  std_logic_vector(5 downto 0) := "110101"
  );    
  port (
    iRSTN                   : in  std_logic;
    iSPI_CLK                : in  std_logic;
    iSPI_CLK_out            : in  std_logic;
    iP2S_DATA               : in  std_logic_vector(SI_DataL downto 0);
    iSPI_GO                 : in  std_logic;
    oSPI_end                : out std_logic;
    oS2P_DATA               : out std_logic_vector(SO_DataL downto 0);
    SPI_SDIO                : inout std_logic;
    oSPI_CSN                : out std_logic;
    oSPI_CLK                : out std_logic
  );
  end component;

  signal ini_index                :  std_logic_vector(3 downto 0);  
  signal write_data               :  std_logic_vector(SI_DataL - 2 downto 0);   
  signal p2s_data                 :  std_logic_vector(SI_DataL downto 0);   
  signal spi_go                   :  std_logic;   
  signal spi_end                  :  std_logic;   
  signal s2p_data                 :  std_logic_vector(SO_DataL downto 0);   
  signal low_byte_dataX           :  std_logic_vector(SO_DataL downto 0);   
  signal low_byte_dataY           :  std_logic_vector(SO_DataL downto 0);   
  signal spi_state                :  std_logic;   
  signal high_byte                :  std_logic;   
  signal read_back                :  std_logic;   
  signal clear_status             :  std_logic;   
  signal read_ready               :  std_logic;   
  signal clear_status_d           :  std_logic_vector(3 downto 0);   
  signal high_byte_d              :  std_logic;   
  signal read_back_d              :  std_logic;   
  signal read_idle_count          :  std_logic_vector(IDLE_MSB downto 0);   
  signal oDATA_XL_xhdl1            :  std_logic_vector(SO_DataL downto 0);   
  signal oDATA_XH_xhdl2            :  std_logic_vector(SO_DataL downto 0);
  signal oDATA_YL_xhdl1            :  std_logic_vector(SO_DataL downto 0);   
  signal oDATA_YH_xhdl2            :  std_logic_vector(SO_DataL downto 0);   
  signal oSPI_CSN_xhdl3           :  std_logic;   
  signal oSPI_CLK_xhdl4           :  std_logic;   
  
  -- Alternate bewteen X and Y
  signal X								: std_logic := '0';
  signal Y								: std_logic := '1'; 
  signal turn							: std_logic := '0'; -- equals 0 to read X, equals 1 to read Y
  signal high_low						: std_logic := '1'; -- To read high bytes and low bytes
begin
  oDATA_XL <= oDATA_XL_xhdl1;
  oDATA_XH <= oDATA_XH_xhdl2;
  oDATA_YL <= oDATA_YL_xhdl1;
  oDATA_YH <= oDATA_YH_xhdl2;
  oSPI_CSN <= oSPI_CSN_xhdl3;
  oSPI_CLK <= oSPI_CLK_xhdl4;
  u_spi_controller : spi_controller 
    port map (
      iRSTN => iRSTN,
      iSPI_CLK => iSPI_CLK,
      iSPI_CLK_out => iSPI_CLK_out,
      iP2S_DATA => p2s_data,
      iSPI_GO => spi_go,
      oSPI_end => spi_end,
      oS2P_DATA => s2p_data,
      SPI_SDIO => SPI_SDIO,
      oSPI_CSN => oSPI_CSN_xhdl3,
      oSPI_CLK => oSPI_CLK_xhdl4
    );   
   

  process (ini_index)
  begin
     case ini_index is
        when "0000" =>
                 write_data <= THRESH_ACT & "00100000";    
        when "0001" =>
                 write_data <= THRESH_inACT & "00000011";    
        when "0010" =>
                 write_data <= TIME_inACT & "00000001";    
        when "0011" =>
                 write_data <= ACT_inACT_CTL & "01111111";    
        when "0100" =>
                 write_data <= THRESH_FF & "00001001";    
        when "0101" =>
                 write_data <= TIME_FF & "01000110";    
        when "0110" =>
                 write_data <= BW_RATE & "00001001";    
        when "0111" =>
                 write_data <= inT_ENABLE & "00010000";    
        when "1000" =>
                 write_data <= inT_MAP & "00010000";    
        when "1001" =>
                 write_data <= DATA_FORMAT & "01000000";    
        when OTHERS  =>
                 write_data <= POWER_CONTROL & "00001000";    
        
     end case;
  end process;

  process (iRSTN, iSPI_CLK)
  begin
    if (iRSTN = '0') then
      ini_index <= "0000";    
      spi_go <= '0';    
      spi_state <= IDLE;    
      read_idle_count <= (OTHERS => '0');    
      high_byte <= '0';    
      read_back <= '0';    
      clear_status <= '0';    
    elsif rising_edge(iSPI_CLK) then
      if (ini_index < inI_NUMBER) then
        case spi_state is
          when IDLE =>
            p2s_data <= WRITE_MODE & write_data;    
            spi_go <= '1';    
            spi_state <= TRANSFER;    
            
				  when TRANSFER =>
            if (spi_end = '1') then
              ini_index <= ini_index + "0001";    
              spi_go <= '0';    
              spi_state <= IDLE;    
            end if;
          when OTHERS =>
            NULL;
              
        end case;

      else
        case spi_state is
          when IDLE =>
            read_idle_count <= read_idle_count + "00000000000001";
							
            if (high_byte = '1') then
					--if(turn = X) then
						--p2s_data(15 downto 8) <= READ_MODE & X_HB;
					--else
						p2s_data(15 downto 8) <= READ_MODE & Y_HB;
					--end if;
					read_back <= '1';    
						
            else
              if (read_ready = '1') then
						--if(turn = X) then
							--p2s_data(15 downto 8) <= READ_MODE & X_LB;
						--else
							p2s_data(15 downto 8) <= READ_MODE & Y_LB;
						--end if;
						read_back <= '1';    
              else
                if (((NOT clear_status_d(3) AND iG_inT2) OR read_idle_count(IDLE_MSB)) = '1') then
                  p2s_data(15 downto 8) <= READ_MODE & inT_SOURCE;    
                  clear_status <= '1';  
                end if;
              end if;
            end if;
						
            if ((high_byte OR read_ready OR read_idle_count(IDLE_MSB) OR (NOT clear_status_d(3) AND iG_inT2)) = '1') then
              spi_go <= '1';    
              spi_state <= TRANSFER;    
            end if;
						
            if (read_back_d = '1') then
              if (high_byte_d = '1') then
                --if(turn = X) then
						--oDATA_XH_xhdl2 <= s2p_data;    
						--oDATA_XL_xhdl1 <= low_byte_dataX;    
					 --else
						oDATA_YH_xhdl2 <= s2p_data;    
						oDATA_YL_xhdl1 <= low_byte_dataY; 
					 --end if;
              else
					--if(turn = X) then
						--low_byte_dataX <= s2p_data;    
					--else
						low_byte_dataY <= s2p_data;
					--end if;
              end if;
            end if;
							
          when TRANSFER =>
            if (spi_end = '1') then
              spi_go <= '0';    
              spi_state <= IDLE;	
						
              if (read_back = '1') then
                read_back <= '0';
					 high_byte <= NOT high_byte;
					 --high_low <= NOT high_low;
					 --if(high_low = '0') then
					--	turn <= NOT turn;
					 --end if;
					 
                read_ready <= '0';    
						   
              else
                clear_status <= '0';    
                read_ready <= s2p_data(6);  
                read_idle_count <= (OTHERS => '0');    
              end if;
            end if;
            
          when OTHERS =>
            NULL;
              
        end case;
      end if;
    end if;
  end process;

  process (iRSTN, iSPI_CLK)
  begin
    if (iRSTN = '0') then
      high_byte_d <= '0';    
      read_back_d <= '0';    
      clear_status_d <= "0000";  
		
    elsif rising_edge(iSPI_CLK) then
      high_byte_d <= high_byte;
      read_back_d <= read_back;
      clear_status_d <= clear_status_d(2 downto 0) & clear_status;    
    end if;
  end process;

end translated;
