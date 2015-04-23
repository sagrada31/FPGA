library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity vga is
	Port(
		CLOCK_50		: in std_logic;
		
		-- FOR THE ACCELEROMETER DATA
		data_x		: in std_logic_vector(9 downto 0);
		data_y		: in std_logic_vector(9 downto 0);
		
		-- FOR THE OUTPUT SIGNALS
		out_red		: out std_logic;
		out_green	: out std_logic;
		out_blue		: out std_logic;
		out_h_sync	: out std_logic;
		out_v_sync	: out std_logic;
	
		-- FOR THE RAM PROCESSING (SUBMARINES)
		data_a_sub			: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		data_b_sub			: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		address_a_sub		: buffer STD_LOGIC_VECTOR (5 DOWNTO 0);
		address_b_sub		: buffer STD_LOGIC_VECTOR (5 DOWNTO 0);
		wr_en_a_sub			: OUT STD_LOGIC  := '0';
		wr_en_b_sub			: OUT STD_LOGIC  := '0';
		q_a_sub				: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		q_b_sub				: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		
		-- FOR THE RAM PROCESSING (ROCKETS FROM THE SUBMARINES)
		data_a_roc			: OUT STD_LOGIC_VECTOR (107 DOWNTO 0);
		data_b_roc			: OUT STD_LOGIC_VECTOR (107 DOWNTO 0);
		address_a_roc		: buffer STD_LOGIC_VECTOR (6 DOWNTO 0);
		address_b_roc		: buffer STD_LOGIC_VECTOR (6 DOWNTO 0);
		wr_en_a_roc			: OUT STD_LOGIC  := '0';
		wr_en_b_roc			: OUT STD_LOGIC  := '0';
		q_a_roc				: IN STD_LOGIC_VECTOR (107 DOWNTO 0);
		q_b_roc				: IN STD_LOGIC_VECTOR (107 DOWNTO 0);
		
		-- FOR THE RAM PROCESSING (MISSILES FROM THE BOAT)
		data_a_mis			: OUT STD_LOGIC_VECTOR (107 DOWNTO 0);
		data_b_mis			: OUT STD_LOGIC_VECTOR (107 DOWNTO 0);
		address_a_mis		: buffer STD_LOGIC_VECTOR (5 DOWNTO 0);
		address_b_mis		: buffer STD_LOGIC_VECTOR (5 DOWNTO 0);
		wr_en_a_mis			: OUT STD_LOGIC  := '0';
		wr_en_b_mis			: OUT STD_LOGIC  := '0';
		q_a_mis				: IN STD_LOGIC_VECTOR (107 DOWNTO 0);
		q_b_mis				: IN STD_LOGIC_VECTOR (107 DOWNTO 0)
		);
		
		
end entity vga;

architecture vga_arch of vga is
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
	
	-- Signal positionning the boat
	signal left_boat		: std_logic_vector(9 downto 0);
	signal right_boat	: std_logic_vector(9 downto 0);
	signal top_boat		: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(150,10)); -- Fixed height
	signal bottom_boat	: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(160,10)); -- Fixed height
	
	-- To represent acceleration of both directions
	shared variable sign_g_y		: std_logic;
	shared variable magn_g_y		: std_logic_vector(8 downto 0);
	shared variable old_magn_g_y	: std_logic_vector(8 downto 0);
	shared variable tmp_magn_g_y	: std_logic_vector(10 downto 0);
	
	shared variable submarines : std_logic_vector(49 downto 0) := (others => '0');  -- 1 bit for signaling if there is a boat
	shared variable submarines_debug : std_logic_vector(50 downto 0) := (others => '0');
	
	shared variable index 					: integer range 0 to 200; -- normally 75 enough
	shared variable i_loop 					: integer range 0 to 200;
	
	-- Modes
	signal update_submarines 	: std_logic := '0';
	signal update_rockets 		: std_logic := '0';
	signal generate_subarine	: std_logic := '0';
	signal update_missiles		: std_logic := '0';
	signal cycle_cnt				: integer range 0 to 100 := 0;
	
	-- To update submarines
	signal current_submarine 			: integer range 0 to 49 := 0;
	signal read_sub	 					: std_logic := '1';
	signal wait_read_sub					: std_logic := '0';
	shared variable data_tmp_sub		: std_logic_vector (15 downto 0);
	shared variable data_sub_disp		: std_logic_vector (15 downto 0);
	
	-- To update rockets
	signal current_rocket				: integer range 0 to 74 := 0;
	signal read_roc	 					: std_logic := '1';
	signal wait_read_roc					: std_logic := '0';
	shared variable data_tmp_roc		: std_logic_vector (107 downto 0);
	shared variable data_roc_disp		: std_logic_vector (107 downto 0);
	shared variable new_roc_line 		: std_logic_vector (107 downto 0) := (others => '0');
	
		-- To update missiles
	signal current_missile				: integer range 0 to 54 := 54;
	signal read_mis	 					: std_logic := '1';
	signal wait_read_mis					: std_logic := '0';
	shared variable data_tmp_mis		: std_logic_vector (107 downto 0);
	shared variable data_mis_disp		: std_logic_vector (107 downto 0);
	shared variable new_mis_line 		: std_logic_vector (107 downto 0) := (others => '0');
	
	-- To generate rockets
	signal shooter 						: integer range 0 to 9 := 0;
	signal shift_shooter					: integer range 0 to 9 := 1;
	shared variable index_submarine	: integer range 0 to 49;
	shared variable index_rocket		: integer range 0 to 74;
	shared variable tmp_random		   : integer range 0 to 63 := 0;
	shared variable nb_submarines    : integer range 0 to 50 := 0; -- To count the number of submarines
	
	-- For the boat shoots
	shared variable boat_shoot			: std_logic := '0';
	
	-- For the display process
	shared variable current_sub_line			: integer range 199 to 599 := 199;
	shared variable current_rocket_line		: integer range -1 to 599 := 0;
	shared variable current_missile_line		: integer range 159 to 599 := 159;
	
	-- For the level configuration
	signal level							: integer range 0 to 3 := 1;						
	
	-- For the life
	signal life 							: std_logic_vector(4 downto 0) := (others => '1');
	signal index_life						: integer range 0 to 4 := 4;
	signal hit								: std_logic := '0';
	
begin

	update_elements_position : process(CLOCK_50)
	begin
		if(CLOCK_50 = '1') then
			
			-- Prepare to load the first line of submarines from memory (just before the v_sync)
			if(v_cnt = 635 and h_cnt = 799) then
				update_submarines <= '1';
				update_rockets <= '0';
				generate_subarine <= '0';
				update_missiles <= '0';
				current_submarine <= 0;
				
				boat_shoot := '0';
				
				if(cycle_cnt = 100) then
					cycle_cnt <= 0;
				else
					cycle_cnt <= cycle_cnt + 1;
				end if;
				
				if(cycle_cnt mod 50 = 0) then -- every 0.65s we change the submarines who shoot
					if(shooter < 9) then
						shooter <= shooter + 1; -- sub at index shooter, 10 + shooter , ... , 40 + shooter  will shoot every time we decide
					else
						if(shift_shooter < 9) then
							shooter <= shift_shooter; -- next time sub at index (shooter + shift_shooter), (10 + shooter shift_shooter) , ... , (40 + shooter + shift_shooter) will shoot every time we decide
							shift_shooter <= shift_shooter + 1;
						else 
							shooter <= 0;
							shift_shooter <=1;
						end if;
					end if;
				end if; 
				
			elsif(v_sync = '0') then
			
				-- Check if the player pushed the button (for the moment, shoot every sec)
				if (cycle_cnt = 100 and boat_shoot = '0') then
					boat_shoot := '1';
				end if;
		
				-- Update submarines position (and generate rockets if 1,3 sec elapsed)
				if (update_submarines = '1') then
						
					if(submarines(current_submarine) = '1') then
					
						if(read_sub = '1') then									-- Read mode
							address_a_sub <= "000000" + current_submarine; 	
							wr_en_a_sub <= '0';
							
							address_a_roc <= "0000000" + current_submarine + 25;
							wr_en_a_roc <= '0';
							
							read_sub <= '0'; wait_read_sub <= '1';
							
						elsif(read_sub = '0' and wait_read_sub = '1') then
							wait_read_sub <= '0';
							
						else															-- Write mode
			
							data_tmp_sub := q_a_sub;
							data_tmp_roc := q_a_roc;
							
							-- Update position (or direction if submarine on the edge)
							if(data_tmp_sub(10) = '1') then 					-- if it goes to the right
								if(data_tmp_sub(9 downto 0) = 760)then		-- if max at right
									data_tmp_sub(10) := '0';						-- reverse direction
								else
									data_tmp_sub(9 downto 0) := data_tmp_sub(9 downto 0) + 1; -- go to right
								end if;
							else 														-- if it goes to the left
								if(data_tmp_sub(9 downto 0) = 0)then		-- if max at left
									data_tmp_sub(10) := '1';						-- reverse direction
								else
									data_tmp_sub(9 downto 0) := data_tmp_sub(9 downto 0) - 1;	-- go to left
								end if;
							end if;
							
							data_a_sub(15 downto 0) <= "00001" & data_tmp_sub(10 downto 0);
							address_a_sub <= "000000" + current_submarine;
							wr_en_a_sub <= '1';
							
							-- Generate rockets : 
							--if level 1 : every 50*0,0138 = 0.69 second elapsed 5 lines shoot
							--if level 2 : every 25*0,0138 = 0.345 second elapsed 5 lines shoot
							--if level 3 : every 10*0,0138 = 0.138 second elapsed 5 lines shoot
							if( (level = 1 and cycle_cnt mod 50 = 0) or (level = 2 and cycle_cnt mod 25 = 0) or (level = 3 and cycle_cnt mod 10 = 0) ) then
							--if (cycle_cnt mod 25 = 0) then
								-- if there is a sub on one of the five current line designed to shoot it shoots
								if( (current_submarine = shooter) or (current_submarine = 10+shooter) or (current_submarine = 20+shooter) or (current_submarine = 30+shooter) or (current_submarine = 40+shooter)) then
									data_tmp_roc( to_integer(unsigned(data_tmp_sub(9 downto 0) + 16))/8 ) := '1';
								end if;
								-- Re-write the updated rocket line in the RAM (even if there is no modifications)
								data_a_roc <= data_tmp_roc;
								address_a_roc <= "0000000" + current_submarine + 25;
								wr_en_a_roc <= '1';
							end if;
							
							read_sub <= '1';
							
							if(current_submarine = 49) then
								current_submarine <= 0;
								update_submarines <= '0'; update_rockets <= '1';
							else
								current_submarine <= current_submarine + 1;
							end if;
							

						end if;
						
					else
					
						if(current_submarine = 49) then
							current_submarine <= 0;
							update_submarines <= '0'; update_rockets <= '1';
						else
							current_submarine <= current_submarine + 1;
						end if;
					
					end if;

				-- Update rockets positions
				elsif(update_rockets = '1') then
					-- Function of the level, the update is at a different rate :
					-- Level 1 : every 10*0.0138 = 0.138 s
					-- Level 2 : every 5*0.0138 = 0.069 s
					-- Level 3 : every 2*0.0138 = 0.0276 s
					if( (level = 1 and cycle_cnt mod 10 = 0) or (level = 2 and cycle_cnt mod 5 = 0) or (level = 3 and cycle_cnt mod 2 = 0) ) then
					--if(cycle_cnt mod 5 = 0) then -- To update the rockets position every 5*13 = 65 ms
						if(read_roc = '1') then									-- Read mode
							
							address_a_roc <= "0000001" + current_rocket;
							wr_en_a_roc <= '0';
							
							read_roc <= '0'; wait_read_roc <= '1';
							
						elsif(read_roc = '0' and wait_read_roc = '1') then
							wait_read_roc <= '0';
							
						else															-- Write mode
							data_tmp_roc := q_a_roc;
							
							if(current_rocket = 74) then
								data_a_roc <= new_roc_line;
							else
								data_a_roc <= data_tmp_roc;
							end if;
							
							address_a_roc <= "0000000" + current_rocket;
							wr_en_a_roc <= '1';
							
							read_roc <= '1';

							if(current_rocket = 74) then
								current_rocket <= 0;
								update_rockets <= '0'; generate_subarine <= '1';
							else
								current_rocket <= current_rocket + 1;
							end if;
						end if;
					else 
						current_rocket <= 0;
						update_rockets <= '0';
						generate_subarine <= '1';
					end if;
				-- Generate submarines
				elsif(generate_subarine = '1') then
					
					if(cycle_cnt = 100) then
						
						if(nb_submarines < 10) then -- if there is less than 10 submarines, we try to add one
							  
							tmp_random := to_integer(unsigned(magn_g_y(5 downto 0))); -- to take a random number
							if (tmp_random > 49) then -- 2^6 ==> can be up to 63
								tmp_random := tmp_random - 14;
							end if;
--							tmp_random <= tmp_random + 2;
							
							if(submarines(tmp_random) = '0') then -- No submarine in this line => create one
								if(sign_g_y = '1') then -- to choose the direction
									data_a_sub <= "000010" & (std_logic_vector(to_unsigned(760,10)));
								else
									data_a_sub <= "000011" & (std_logic_vector(to_unsigned(0,10)));
								end if;
								address_a_sub <= "000000" + tmp_random;
								wr_en_a_sub <= '1';
								submarines(tmp_random) := '1';
								nb_submarines := nb_submarines + 1;
								generate_subarine <= '0';
								update_missiles <= '1';

							else						 -- There is a submarine
--								tmp_random = tmp_random + 2;
--								if(tmp_random > 49) then
--									tmp_random = 0;
--								end if;
								wr_en_a_sub <= '0';
							end if;
							
						else
							generate_subarine <= '0';
							update_missiles <= '1';
						end if;
							
					end if;
				
				elsif(update_missiles = '1') then
					
					if(cycle_cnt mod 2 = 0) then -- To update the missiles positions every 5*13 = 65 ms
						if(read_mis = '1') then									-- Read mode
							
							if(current_missile > 0) then
								address_a_mis <= "000000" + current_missile - 1;
								wr_en_a_mis <= '0';
							end if;
							
							read_mis <= '0'; wait_read_mis <= '1';
							
						elsif(read_mis = '0' and wait_read_mis = '1') then
							wait_read_mis <= '0';
							
						else															-- Write mode
							
							if(current_missile = 0) then
								data_tmp_mis := new_mis_line;
								address_a_mis <= "000000";
								if(boat_shoot = '1') then
									data_tmp_mis(to_integer(unsigned(left_boat + 16))/8) := '1';
								end if;
							else
								data_tmp_mis := q_a_mis;
								address_a_mis <= "000000" + current_missile;
							end if;
							
							data_a_mis <= data_tmp_mis;
							wr_en_a_mis <= '1';
							
							read_mis <= '1';

							if(current_missile = 0) then
								current_missile <= 54;
								update_missiles <= '0';
							else
								current_missile <= current_missile - 1;
							end if;
						end if;
					else 
						current_missile <= 54;
						update_missiles <= '0';
					end if;
					
				
				end if;
			end if;
		end if;
	end process;
	
	boat : process(v_sync)
	begin

		if (v_sync = '0') then
	
			-- Get the sign of the acceleration over y
			sign_g_y := data_y(9);
			
			-- Get the magnitude of the acceleration over y
			if (sign_g_y = '0') then
				magn_g_y := (data_y(8 downto 0));
			else 
				magn_g_y := (NOT(data_y(8 downto 0))) + "000000001"; -- 2's complement
			end if;
			
			-- Filter
			tmp_magn_g_y := "00" & old_magn_g_y;
			tmp_magn_g_y := tmp_magn_g_y + tmp_magn_g_y + tmp_magn_g_y + ("00" & magn_g_y);
			magn_g_y := tmp_magn_g_y(10 downto 2); -- Division by 4

			
			-- Compute the horizontal position of the square
			if(sign_g_y = '0') then -- si positif
				left_boat <= std_logic_vector(to_unsigned(380-((380*(to_integer(unsigned(magn_g_y))))/256),10));
				--left_boat <= "0100101100" + magn_g_y(8 downto 1);
			else
				left_boat <= std_logic_vector(to_unsigned(380+((380*(to_integer(unsigned(magn_g_y))))/256),10));
				--left_boat <= "0100101100" - magn_g_y(8 downto 1);
			end if;
			right_boat <= left_boat + 40;
		
			old_magn_g_y := magn_g_y;
			
		end if;
	end process;

	
	---------------------------------------------------------------------------------------------------
	
	
	vga_gen : process
	begin

		wait until ( (CLOCK_50'event) and (CLOCK_50 = '1') ) ;
	
		-- Generate Screen
		if( v_cnt >= 0) and (v_cnt <= 599) then
			
			-- sky
			if( ((v_cnt >= 0) and (v_cnt <= 160)) and ((h_cnt >= 0) and (h_cnt <= 799)) ) then
				red_signal <= '0';
				green_signal <= '1';
				blue_signal <= '1';
			end if;
			
			-- boat
			if( ((v_cnt >= top_boat) and (v_cnt <= bottom_boat)) and ((h_cnt >= left_boat) and (h_cnt <= right_boat)) ) then
				red_signal <= '1';
				green_signal <= '0';
				blue_signal <= '0';
			end if;
			
			-- sea
			if( ((v_cnt >= 160) and (v_cnt <= 599)) and ((h_cnt >= 0) and (h_cnt <= 799)) ) then
				blue_signal <= '1';
				red_signal <= '0';
				green_signal <= '0';
			end if;
			
		-- submarines -------------------------------------------------------------------
			
			-- Initialize
			if( (v_cnt = 199) and (h_cnt = 799)) then
				current_sub_line := 199;
			
			-- Ask data
			elsif ( (v_cnt = current_sub_line) and (h_cnt = 800) ) then
				address_b_sub <= "000000" + ((current_sub_line - 199)/8);
				wr_en_b_sub <= '0';
			
			-- Get the data loaded from memory
			elsif( (v_cnt = current_sub_line ) and (h_cnt = 803) ) then
				data_sub_disp := q_b_sub;
				
				if(data_sub_disp(11) = '1') then
					submarines_debug((current_sub_line - 199)/8) := '1';
				else
					submarines_debug((current_sub_line - 199)/8) := '0';
				end if;
		
			end if;
			
			-- Display
			if( (v_cnt >= current_sub_line + 1 ) and ( v_cnt <= current_sub_line + 8 ) and (h_cnt >= 0) and (h_cnt <= 799) ) then
				if(data_sub_disp(11) = '1') then
					if( (h_cnt(9 downto 0) >= data_sub_disp(9 downto 0)) and (h_cnt(9 downto 0) <= data_sub_disp(9 downto 0) + 40) ) then
							blue_signal <= '0';
							red_signal <= '0';
							green_signal <= '0';
					end if;
				end if;
			end if;
			
			
			-- Prepare for loading the next line
			if( (v_cnt = current_sub_line + 8) and (h_cnt = 799) ) then
				current_sub_line := current_sub_line + 8;
			end if;
			

			
		-- Rockets -------------------------------------------------------------------
			
			-- Initialize
			if( (v_cnt = 599) and (h_cnt = 799)) then
				current_rocket_line := -1;
				hit <= '0';
			
			-- Ask data
			elsif ( (v_cnt = current_rocket_line + 1) and (h_cnt = 0) ) then
				address_b_roc <= "0000000" + ((current_rocket_line + 1)/8);
				wr_en_b_roc <= '0';
			
			-- Get the data loaded from memory
			elsif( (v_cnt = current_rocket_line + 1) and (h_cnt = 2) ) then
				data_roc_disp := q_b_roc;
			end if;
			
			-- Display
			if( (v_cnt >= current_rocket_line + 1 ) and ( v_cnt <= current_rocket_line + 8 ) and (h_cnt >= 0) and (h_cnt <= 799) ) then
				if( data_roc_disp(to_integer(unsigned(h_cnt)/8)) = '1' ) then
					blue_signal <= '0';
					red_signal <= '0';
					green_signal <= '0';
				end if;
				
				-- Remove a life if boat is touched
				if( (v_cnt = bottom_boat) and ((h_cnt >= left_boat) and (h_cnt <= right_boat)) ) then
					if( data_roc_disp(to_integer(unsigned(h_cnt)/8)) = '1' ) then
						-- We loose only one life at a time and we have a delay of 13ms of immunity when we lost 1
						if(hit = '0' and (cycle_cnt mod 10 = 0)) then
							life(index_life) <= '0';
							hit <= '1';
							if(index_life > 0) then
								index_life <= index_life - 1;
							end if;
						end if;
					end if;
				end if;
				
				
			end if;
			
			-- Prepare for loading the next line
			if( (v_cnt = current_rocket_line + 8) and (h_cnt = 799) ) then
				current_rocket_line := current_rocket_line + 8;
			end if;
			
			-- Missiles -------------------------------------------------------------------
			
			-- Initialize
			if( (v_cnt = 159) and (h_cnt = 799)) then
				current_missile_line := 159;
			
			-- Ask data
			elsif ( (v_cnt = current_missile_line) and (h_cnt = 800) ) then
				address_b_mis <= "000000" + ((current_missile_line - 159)/8);
				wr_en_b_mis <= '0';
			
			-- Get the data loaded from memory
			elsif( (v_cnt = current_missile_line ) and (h_cnt = 803) ) then
				data_mis_disp := q_b_mis;
				
			end if;
			
			-- Display
			if( (v_cnt >= current_missile_line + 1 ) and ( v_cnt <= current_missile_line + 8 ) and (h_cnt >= 0) and (h_cnt <= 799) ) then
				if( data_mis_disp(to_integer(unsigned(h_cnt)/8)) = '1' ) then
					blue_signal <= '0';
					red_signal <= '1';
					green_signal <= '0';
				end if;
			end if;
			
			
			-- Prepare for loading the next line
			if( (v_cnt = current_missile_line + 8) and (h_cnt = 799) ) then
				current_missile_line := current_missile_line + 8;
			end if;
			

			
--			-- DEBUG
--			if(v_cnt >= 10 and v_cnt <= 21 and h_cnt >= 0 and h_cnt <= 399) then
--				if (submarines(to_integer(unsigned(h_cnt) srl 3)) = '1') then
--					red_signal <= '1';
--					green_signal <= '0';
--					blue_signal <= '0';
--				else
--					red_signal <= '0';
--					green_signal <= '0';
--					blue_signal <= '0';
--				end if;
--				
--				if(to_integer(unsigned(h_cnt)) mod 8 = 0) then
--					red_signal <= '1';
--					green_signal <= '1';
--					blue_signal <= '0';
--				end if;
--			end if;
--			
--			-- DEBUG
--			if(v_cnt >= 30 and v_cnt <= 41 and h_cnt >= 0 and h_cnt <= 399) then
--				if (submarines_debug(to_integer(unsigned(h_cnt) srl 3)) = '1') then
--					red_signal <= '1';
--					green_signal <= '0';
--					blue_signal <= '0';
--				else
--					red_signal <= '0';
--					green_signal <= '0';
--					blue_signal <= '0';
--				end if;
--				
--				if(to_integer(unsigned(h_cnt)) mod 8 = 0) then
--					red_signal <= '1';
--					green_signal <= '1';
--					blue_signal <= '0';
--				end if;
--			end if;
			
			-- Life
			if(v_cnt >= 15 and v_cnt <= 30) then
				-- Display remaining life
				if (h_cnt >= 10 and h_cnt <= 89) then
					if (life(to_integer(unsigned(h_cnt - 10) srl 4)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
					else
						red_signal <= '0';
						green_signal <= '1';
						blue_signal <= '1';
					end if;
				end if;
				-- Display separators
				if(h_cnt >= 10 and h_cnt <= 90 and to_integer(unsigned(h_cnt-10)) mod 16 = 0) then
					red_signal <= '1';
					green_signal <= '1';
					blue_signal <= '0';
				end if;
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

		-- Generate Horizontal Enable
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
		out_red 		<= red_signal and video_en;
		out_green 	<= green_signal and video_en;
		out_blue 	<= blue_signal and video_en;
		out_h_sync	<= h_sync;
		out_v_sync	<= v_sync;

	end process vga_gen;

end architecture vga_arch;
