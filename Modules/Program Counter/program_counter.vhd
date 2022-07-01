----------------------------------------------
-- program_counter								--
-- 											--
-- Keeps track of the program location						--
-- 								 			--
-- Original Project : SAP-1					--
-- By: Bryce Keen				 			--
-- 06/30/22 								--
----------------------------------------------


library ieee;
use IEEE.STD_LOGIC_1164.all;


entity program_counter is
	port (
		CLK, CLR:		in STD_lOGIC;						-- Clock and Clear
		CP, EP:			in STD_LOGIC;
		Adrs:			out STD_LOGIC_VECTOR(3 downto 0)
	);
end;


architecture program_counter_arch of program_counter is	
	signal count: 	 	STD_LOGIC_VECTOR(3 downto 0);
begin

	-- Logic
	process (CLK, CLR) begin
		
		if (CLR = '1') then
			count <= B"0000";
		elsif (CLK'event and CLK = '1') then
			count <= count + 1;
		end if;
	
	end process
	
	-- Output Logic
	Adrs <= count;
	
end program_counter_arch;
