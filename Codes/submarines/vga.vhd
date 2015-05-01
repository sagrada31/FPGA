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
		Button		: in std_logic;
		
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
	signal left_boat					: std_logic_vector(9 downto 0);
	signal top_boat					: std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(152,10)); -- Fixed height
	shared variable tmp_left_boat	: std_logic_vector(12 downto 0);
	
	-- To represent acceleration along y axis
	shared variable sign_g_y		: std_logic;
	shared variable magn_g_y		: std_logic_vector(8 downto 0);
	
	shared variable submarines : std_logic_vector(49 downto 0) := (others => '0');  -- 1 bit for signaling if there is a boat
	
	-- Hard coded characters
	type char_tab is array(18 downto 0) of std_logic_vector(34 downto 0);
	signal characters				: char_tab;
	signal init						: std_logic := '1';
	
	-- Boat drawing
	type boat_design is array(7 downto 0) of std_logic_vector(39 downto 0);
	signal my_boat_design				: boat_design;
	
	-- Submarines drawing
	signal my_sub_design				: boat_design;
	
	-- Modes
	signal update_submarines 	: std_logic := '0';
	signal update_rockets 		: std_logic := '0';
	signal generate_subarine	: std_logic := '0';
	signal update_missiles		: std_logic := '0';
	signal cycle_cnt				: integer range 0 to 100 := 0;
	signal reset_game				: std_logic := '1';
	signal reset_timer			: integer range 0 to 288 := 0;
	
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
	signal boat_shoot			: std_logic := '0';
	
	-- For the display process
	shared variable current_sub_line			: integer range 199 to 599 := 199;
	shared variable current_rocket_line		: integer range -1 to 599 := 0;
	shared variable current_missile_line		: integer range 159 to 599 := 159;
	
	-- For the level
	signal level							: integer range 0 to 5 := 1;					
	
	-- For the lives
	shared variable lives				: integer range 0 to 5 := 5;
	signal hit								: std_logic := '0';
	signal timer_hit						: integer range 0 to 49 := 0;
	
	-- For the score
	shared variable score				: integer range 0 to 999 := 0;
	shared variable index_score		: integer range 0 to 9 := 0;
	
	-- For the button
	signal timer_button	: integer range 0 to 39 := 0;
	signal old_button		: std_logic := '0';
	signal pushed_button	: std_logic := '0';
	
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
				
				-- Check if the player pushed the button
				--if (Button = '0' and old_button = '1' and reset_game = '0') then
				if (Button = '0' and timer_button > 8 and reset_game = '0') then
					pushed_button <= '1';
				end if;
				--old_button <= button;
				if(timer_button < 19) then
					timer_button <= timer_button + 1;
				end if;
				if(pushed_button = '1' and timer_button = 19) then
					boat_shoot <= '1';
					timer_button <= 0;
					pushed_button <= '0';
				end if;
				
				if(cycle_cnt = 99) then
					cycle_cnt <= 0;
				else
					cycle_cnt <= cycle_cnt + 1;
				end if;
				
				if(cycle_cnt mod 50 = 0) then -- every 0.65s we change the submarines who shoot
					if(shooter < 9) then
						shooter <= shooter + 1; -- sub at shooter, 10 + shooter , ... , 40 + shooter  will shoot every time we decide
					else
						if(shift_shooter < 9) then
							shooter <= shift_shooter; -- next time sub at (shooter + shift_shooter), (10 + shooter shift_shooter) , ... , (40 + shooter + shift_shooter) will shoot every time we decide
							shift_shooter <= shift_shooter + 1;
						else 
							shooter <= 0;
							shift_shooter <=1;
						end if;
					end if;
				end if; 
				
			elsif(v_sync = '0') then
		
				-- Update submarines position (and generate rockets if 1,3 sec elapsed)
				if (update_submarines = '1') then
						
					if(submarines(current_submarine) = '1' or reset_game = '1') then
					
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
							
							if(data_tmp_sub(11) = '1') then
								-- Update position (or direction if submarine on the edge)
								if(data_tmp_sub(10) = '1') then 					-- if it goes to the right
									if(data_tmp_sub(9 downto 0) >= 760)then		-- if max at right
										data_tmp_sub(10) := '0';						-- reverse direction
									else
										data_tmp_sub(9 downto 0) := data_tmp_sub(9 downto 0) + level; -- go to right
									end if;
								else 														-- if it goes to the left
									if(data_tmp_sub(9 downto 0) = 0)then		-- if max at left
										data_tmp_sub(10) := '1';						-- reverse direction
									else
										if(data_tmp_sub(9 downto 0) >= level) then
											data_tmp_sub(9 downto 0) := data_tmp_sub(9 downto 0) - level;	-- go to left
										else
											data_tmp_sub(9 downto 0) := "0000000000";
										end if;
									end if;
								end if;
								
								data_a_sub(15 downto 0) <= "00001" & data_tmp_sub(10 downto 0);
								
								-- In case of reset
								if(reset_game = '1') then
									data_a_sub(15 downto 0) <= "0000000000000000";
								end if;
								
								address_a_sub <= "000000" + current_submarine;
								wr_en_a_sub <= '1';
								
								-- Generate rockets : 
								--if level 1 : every 50*0,0138 = 0.69 second elapsed 5 lines shoot
								--if level 2 : every 30*0,0138 = 0.414 second elapsed 5 lines shoot
								--if level 3 : every 20*0,0138 = 0.276 second elapsed 5 lines shoot
								--if level 4 : every 10*0,0138 = 0.138 second elapsed 5 lines shoot
								--if level 5 : every 5*0,0138 = 0.069 second elapsed 5 lines shoot
								
								if( (level = 1 and cycle_cnt mod 50 = 0) or (level = 2 and cycle_cnt mod 30 = 0) 
									or (level = 3 and cycle_cnt mod 20 = 0) or (level = 4 and cycle_cnt mod 10 = 0)
									or (level = 5 and cycle_cnt mod 5 = 0) ) then
									-- if there is a sub on one of the five current line designed to shoot it shoots
									if( (current_submarine = shooter) or (current_submarine = 10+shooter) or (current_submarine = 20+shooter) or (current_submarine = 30+shooter) or (current_submarine = 40+shooter)) then
										data_tmp_roc( to_integer(unsigned(data_tmp_sub(9 downto 0) + 16))/8 ) := '1';
									end if;
									-- Re-write the updated rocket line in the RAM (even if there is no modifications)
									data_a_roc <= data_tmp_roc;
									address_a_roc <= "0000000" + current_submarine + 25;
									wr_en_a_roc <= '1';
								end if;
							else
								submarines(current_submarine) := '0';
								nb_submarines := nb_submarines - 1;
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
					-- Level 3 : every 5*0.0138 = 0.069 s
					-- Level 4 : every 2*0.0138 = 0.0276 s
					-- Level 5 : every 2*0.0138 = 0.0276 s
					if( (level = 1 and cycle_cnt mod 10 = 0) or (level = 2 and cycle_cnt mod 5 = 0) 
						  or (level = 3 and cycle_cnt mod 5 = 0) or (level = 4 and cycle_cnt mod 2 = 0)
						  or (level = 5 and cycle_cnt mod 2 = 0)) then
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
							
							-- In case of reset
							if(reset_game = '1') then
								data_a_roc <= new_roc_line;
							end if;
							address_a_roc <= "0000000" + current_rocket;
							wr_en_a_roc <= '1';
							
							read_roc <= '1';

							if(current_rocket = 74) then
								current_rocket <= 0;
								update_rockets <= '0'; update_missiles <= '1';
							else
								current_rocket <= current_rocket + 1;
							end if;
						end if;
					else 
						current_rocket <= 0;
						update_rockets <= '0';
						update_missiles <= '1';
					end if;
				
				elsif(update_missiles = '1') then
					
					if(cycle_cnt mod 2 = 0) then -- To update the missiles positions every 2*13 = 26 ms
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
									boat_shoot <= '0';
								end if;
							else
								data_tmp_mis := q_a_mis;
								address_a_mis <= "000000" + current_missile;
							end if;
							
							data_a_mis <= data_tmp_mis;
							-- In case of reset
							if(reset_game = '1') then
								data_a_mis <= new_mis_line;
							end if;
							
							wr_en_a_mis <= '1';
							
							read_mis <= '1';

							if(current_missile = 0) then
								current_missile <= 54;
								update_missiles <= '0';
								generate_subarine <= '1';
							else
								current_missile <= current_missile - 1;
							end if;
						end if;
					else 
						current_missile <= 54;
						update_missiles <= '0';
						generate_subarine <= '1';
					end if;
				
				
				-- Generate submarines
				elsif(generate_subarine = '1') then
					
					-- Generate faster or slower according to the level
					if( ( (level = 1 and cycle_cnt mod 50 = 0) or (level = 2 and cycle_cnt mod 50 = 0)
						 or (level = 3 and cycle_cnt mod 25 = 0) or (level = 4 and cycle_cnt mod 25 = 0)
						 or (level = 5 and cycle_cnt mod 25 = 0) ) and reset_game = '0') then
						
						-- 10 submarines at level 1 and 2, 20 at level 3 and 4, and 30 at level 5
						if( ((level = 1 or level = 2) and nb_submarines < 10)
							or ((level = 3 or level = 4) and nb_submarines < 20) 
							or (level = 5 and nb_submarines < 30) )then 
							  
							--tmp_random := to_integer(unsigned(magn_g_y(2 downto 0) & h_cnt(2) & h_cnt(1) & h_cnt(0))); -- to take a random number
							tmp_random := to_integer(unsigned(magn_g_y(5 downto 0))); -- to take a random number
							if (tmp_random > 49) then -- 2^6 ==> can be up to 63
								tmp_random := tmp_random - 14;
							end if;
							
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

							else						 -- There is a submarine
								wr_en_a_sub <= '0';
							end if;
							
						else
							generate_subarine <= '0';
						end if;
					else 
						generate_subarine <= '0';
					end if;
					
					if(reset_game = '1') then
						nb_submarines := 0;
						submarines(49 downto 0) := std_logic_vector(to_unsigned(0,50));
					end if;
					
				end if;
			else
				wr_en_a_sub <= '0';
				wr_en_a_mis <= '0';
				wr_en_a_roc <= '0';
			end if;
		end if;
	end process;
	
	--- Retreive data from accelerometer for positioning the boat ----------------------------------------
	boat : process(v_sync)
	begin

		if (v_sync = '0') then
	
			-- Get the sign of the acceleration along y
			sign_g_y := data_y(9);
			
			-- Get the magnitude of the acceleration along y and compute the horizontal position of the boat
			if (sign_g_y = '0') then
				magn_g_y := (data_y(8 downto 0));
				tmp_left_boat := std_logic_vector(380 - to_unsigned((95*to_integer(unsigned(magn_g_y)))/64,13)); -- 380 / 256 = 95/64				
			else 
				magn_g_y := (NOT(data_y(8 downto 0))) + "000000001"; -- 2's complement
				tmp_left_boat := std_logic_vector(380 + to_unsigned((95*to_integer(unsigned(magn_g_y)))/64,13)); -- 380 / 256 = 95/64
			end if;
			
			-- Filter
			tmp_left_boat := ("000" & left_boat) + ("000" & left_boat) + ("000" & left_boat) + ("000" & left_boat) + ("000" & left_boat) + ("000" & left_boat) + ("000" & left_boat) + tmp_left_boat;
			left_boat <= tmp_left_boat(12 downto 3);
			
--			-- Compute the horizontal position of the boat
--			if(sign_g_y = '0') then
--				--left_boat <= std_logic_vector(to_unsigned(380-((380*(to_integer(unsigned(magn_g_y))))/256),10));
--				left_boat <= std_logic_vector(380 - to_unsigned((95*to_integer(unsigned(magn_g_y)))/64,10));
--			else
--				--left_boat <= std_logic_vector(to_unsigned(380+((380*(to_integer(unsigned(magn_g_y))))/256),10));
--				left_boat <= std_logic_vector(380 + to_unsigned((95*to_integer(unsigned(magn_g_y)))/64,10));
--			end if;
		
			
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
			if( ((v_cnt >= top_boat) and (v_cnt < top_boat + 8)) and ((h_cnt >= left_boat) and (h_cnt < left_boat + 40)) ) then
				if(my_boat_design(to_integer(unsigned(v_cnt) - unsigned(top_boat)))(to_integer(unsigned(h_cnt) - unsigned(left_boat))) = '1') then
					if(hit = '0') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '0';
					else
						-- To make it blink when touched
						if((timer_hit/10) mod 2 = 0) then
							red_signal <= '1';
							green_signal <= '1';
							blue_signal <= '0';
						else
							red_signal <= '1';
							green_signal <= '0';
							blue_signal <= '0';
						end if;
					end if;
				end if;
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
			end if;
			
			-- Display
			if( (v_cnt >= current_sub_line + 1 ) and ( v_cnt <= current_sub_line + 8 ) and (h_cnt >= 0) and (h_cnt <= 799) ) then
				if(data_sub_disp(11) = '1') then
					if( (h_cnt(9 downto 0) >= data_sub_disp(9 downto 0)) and (h_cnt(9 downto 0) < data_sub_disp(9 downto 0) + 40) ) then
						if(my_sub_design( to_integer(unsigned(v_cnt) - current_sub_line - 1))(to_integer(unsigned(h_cnt) - unsigned(data_sub_disp(9 downto 0)))) = '1') then				
							blue_signal <= '0';
							red_signal <= '1';
							green_signal <= '1';
						end if;
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
				-- We loose only one life at a time and we have a delay of 0,40 of immunity when we loose 1
				if( timer_hit = 29) then
					hit <= '0';
				else
					timer_hit <= timer_hit + 1;
				end if;
				
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
					red_signal <= '1';
					green_signal <= '1';
					
					-- Remove a life if boat is touched
					if( (v_cnt >= top_boat) and (v_cnt < top_boat + 8) and ((h_cnt >= left_boat) and (h_cnt < left_boat + 40)) ) then	
						-- To consider only the first time the rocket collides the boat
						if(hit = '0') then
							hit <= '1';
							timer_hit <= 0;
							if(lives > 1) then
								lives := lives - 1;
							else
								lives := 0;
								reset_game <= '1';
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
					
					-- Remove subarine if touched by missile
					if( (v_cnt >= current_sub_line + 1 ) and ( v_cnt <= current_sub_line + 8 ) and (h_cnt >= 0) and (h_cnt <= 799) ) then
						if(data_sub_disp(11) = '1') then
							if( (h_cnt(9 downto 0) >= data_sub_disp(9 downto 0)) and (h_cnt(9 downto 0) <= data_sub_disp(9 downto 0) + 40) ) then
								-- remove submarine
								address_b_sub <= "000000" + ((current_sub_line - 199)/8);
								data_b_sub <= "0000000000000000";
								wr_en_b_sub <= '1';
								-- remove missile
								address_b_mis <= "000000" + ((current_missile_line - 159)/8);
								data_mis_disp(to_integer(unsigned(h_cnt)/8)) := '0';
								data_b_mis <= data_mis_disp;
								wr_en_b_mis <= '1';
								-- update score and level
								score := score + 1;
								if(score < 10) then
									level <= 1;
								elsif(score >= 10 and score < 20) then
									level <= 2;
								elsif(score >= 20 and score < 30) then
									level <= 3;
								elsif(score >= 30 and score < 40) then
									level <= 4;
								elsif(score >= 40) then
									level <= 5;
								end if;
							end if;
						end if;
					end if;
					
				end if;
			end if;
			
			-- Prepare for loading the next line
			if( (v_cnt = current_missile_line + 8) and (h_cnt = 799) ) then
				current_missile_line := current_missile_line + 8;
			end if;
	
			-- Lives, level and score ----------------------------------------------------------------------------
			if(v_cnt >= 20 and v_cnt < 34) then
				-- lives ---------------------------------------------------------------------
				-- L
				if(h_cnt >= 50 and h_cnt < 60 and characters(10)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-50)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- I
				if(h_cnt >= 62 and h_cnt < 72 and characters(11)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-62)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- V
				if(h_cnt >= 74 and h_cnt < 84 and characters(12)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-74)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- E
				if(h_cnt >= 86 and h_cnt < 96 and characters(13)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-86)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- S
				if(h_cnt >= 98 and h_cnt < 108 and characters(14)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-98)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- :
				if(h_cnt >= 110 and h_cnt < 120 and characters(18)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-110)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- Value
				if(h_cnt >= 122 and h_cnt < 132 and characters(lives)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-122)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				
				-- level ---------------------------------------------------------------------
				-- L
				if(h_cnt >= 340 and h_cnt < 350 and characters(10)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-340)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- E
				if(h_cnt >= 352 and h_cnt < 362 and characters(13)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-352)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- V
				if(h_cnt >= 364 and h_cnt < 374 and characters(12)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-364)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- E
				if(h_cnt >= 376 and h_cnt < 386 and characters(13)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-376)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- L
				if(h_cnt >= 388 and h_cnt < 398 and characters(10)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-388)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- :
				if(h_cnt >= 400 and h_cnt < 410 and characters(18)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-400)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- Value
				if(h_cnt >= 412 and h_cnt < 422 and characters(level)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-412)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				
				-- Score ---------------------------------------------------------------------
				-- S
				if(h_cnt >= 630 and h_cnt < 640 and characters(14)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-630)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- C
				if(h_cnt >= 642 and h_cnt < 652 and characters(15)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-642)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- O
				if(h_cnt >= 654 and h_cnt < 664 and characters(16)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-654)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- R
				if(h_cnt >= 666 and h_cnt < 676 and characters(17)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-666)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- E
				if(h_cnt >= 678 and h_cnt < 688 and characters(13)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-678)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- :
				if(h_cnt >= 690 and h_cnt < 700 and characters(18)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-690)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- Value (hundred)
				index_score := score/100;
				if(h_cnt >= 702 and h_cnt < 712 and characters(index_score)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-702)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- Value (ten)
				index_score := (score/10)mod 10;
				if(h_cnt >= 714 and h_cnt < 724 and characters(index_score)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-714)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
				-- Value (unit)
				index_score := score mod 10;
				if(h_cnt >= 726 and h_cnt < 736 and characters(index_score)(to_integer((unsigned(v_cnt-20)/2)*5 + unsigned(h_cnt-726)/2)) = '1') then
						red_signal <= '1';
						green_signal <= '0';
						blue_signal <= '1';
				end if;
			end if;
		
		end if;
		
		-- Hard coded characters:
		if(init = '1') then
			characters(0) <= "01110100011001110101110011000101110"; -- 0
			characters(1) <= "11111001000010000100001010011000100"; -- 1
			characters(2) <= "11111000100010001000100001000101110"; -- 2
			characters(3) <= "01111100001000001000001000100011111"; -- 3
			characters(4) <= "01000010001111101001010100110001000"; -- 4
			characters(5) <= "01110100011000010000011110000111111"; -- 5
			characters(6) <= "01110100011000101111000010001001100"; -- 6
			characters(7) <= "00010000100001000100010001000011111"; -- 7
			characters(8) <= "01110100011000101110100011000101110"; -- 8
			characters(9) <= "01110100001000011110100011000101110"; -- 9
			characters(10) <= "11111000010000100001000010000100001"; -- L
			characters(11) <= "11111001000010000100001000010011111"; -- I
			characters(12) <= "00100010100101010001100011000110001"; -- V
			characters(13) <= "11111000010000101111000010000111111"; -- E
			characters(14) <= "01111100001000001110000010000111110"; -- S
			characters(15) <= "01110100010000100001000011000101110"; -- C
			characters(16) <= "01110100011000110001100011000101110"; -- O
			characters(17) <= "10001010010010101111100011000101111"; -- R
			characters(18) <= "00000001100011000000001100011000000"; -- :
			my_boat_design(0) <= "0000000000000000110011000000000000000000";
			my_boat_design(1) <= "0000000000000000110011000000000000000000";
			my_boat_design(2) <= "0000000000001111110011000000000000000000";
			my_boat_design(3) <= "0000000000111111111011000000111000000000";
			my_boat_design(4) <= "0000000001111111111111100011111111100000";
			my_boat_design(5) <= "1111111111111111111111111111111111111111";
			my_boat_design(6) <= "0111111111111111111111111111111111111110";
			my_boat_design(7) <= "0011111111111111111111111111111111111100";
			my_sub_design(0) <= "0000000000000000000011000000000000000000";
			my_sub_design(1) <= "0000000000000000000011000000000000000000";
			my_sub_design(2) <= "0000000000000000011111000000000000000000";
			my_sub_design(3) <= "0000000000000000111111110011000000000000";
			my_sub_design(4) <= "0011111111111111111111111111111111111100";
			my_sub_design(5) <= "1111111111111111111111111111111111111111";
			my_sub_design(6) <= "1111111111111111111111111111111111111111";
			my_sub_design(7) <= "0011111111111111111111111111111111111100";
			init <= '0';
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
			if(reset_game = '1') then 
				if(reset_timer = 288) then
					reset_game <= '0';
					reset_timer <= 0;
					lives := 5;
					score := 0;
					level <= 1;
				else
					reset_timer <= reset_timer + 1;
				end if;
			end if;
				
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
