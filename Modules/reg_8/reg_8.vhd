----------------------------------------------
-- reg_8								--
-- 											--
-- Standard 8 bit register with write			 			-- 
-- enable on rising edge							--
-- 								 			--
-- Original Project : SAP-1					--
-- By: Bryce Keen				 			--
-- 06/28/22 								--
----------------------------------------------


library ieee;
use IEEE.STD_LOGIC_1164.all;


entity reg_8 is
	port (
		CLK, WE:		in STD_lOGIC;						-- Clock and LB
		reg_in:			in STD_LOGIC_VECTOR(7 downto 0);	-- T state of the program
		reg_out:		out STD_LOGIC_VECTOR(7 downto 0)	-- T state of the program
	);
end;


architecture reg_8_arch of reg_8 is	
	signal reg:		STD_LOGIC_VECTOR(7 downto 0);
begin

	-- Logic
	process (CLK, WE) begin
		reg <= reg;
		if (CLK'event and CLK = '1' and WE = '1') then
			reg <= reg_in;
		end if;
	end process;
	
	-- Output Logic
	reg_out <= reg;
	
	
end reg_8_arch;
