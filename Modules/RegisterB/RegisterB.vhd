----------------------------------------------
-- RegisterB								--
-- 											--
-- Register B					 			-- 
-- 								 			--
-- Original Project : SAP-1					--
-- By: Bryce Keen				 			--
-- 06/28/22 								--
----------------------------------------------


library ieee;
use IEEE.STD_LOGIC_1164.all;


entity RegisterB is
	port (
		CLK, LB:		in STD_lOGIC;						-- Clock and LB
		Bin:			in STD_LOGIC_VECTOR(7 downto 0);	-- T state of the program
		Bout:			out STD_LOGIC_VECTOR(7 downto 0)	-- T state of the program
	);
end;


architecture RegisterB_arch of RegisterB is	
	signal B:		STD_LOGIC_VECTOR(7 downto 0);
begin

	-- Logic
	process (CLK, LB) begin
		B <= B;
		if (CLK'event and CLK = '1' and LB = '0') then
			B <= Bin;
		end if;
	end process;
	
	-- Output Logic
	Bout <= B;
	
	
end RegisterB_arch;