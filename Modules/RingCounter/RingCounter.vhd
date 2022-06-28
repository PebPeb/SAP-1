----------------------------------------------
-- RingCounter								--
-- 											--
-- Keeps tracks of the current state of the --
-- of the computer				 			--
-- 								 			--
-- Original Project : SAP-1					--
-- By: Bryce Keen				 			--
-- 06/12/22 								--
----------------------------------------------


library ieee;
use IEEE.STD_LOGIC_1164.all;


entity RingCounter is
	port (
		CLK, CLR:		in STD_lOGIC;						-- Clock and Clear/Reset
		T:				out STD_LOGIC_VECTOR(5 downto 0)	-- T state of the program
	);
end;


architecture RingCounter_arch of RingCounter is	
	signal T_next:		STD_LOGIC_VECTOR(5 downto 0);

begin

	
	-- Logic
	process (CLK) begin
		T_next <= T_next;
		if (CLK'event and not CLK = '1') then
			T_next(0) <= T_next(5) or not (T_next(5) or T_next(4) or T_next(3) or T_next(2) or T_next(1) or T_next(0));
			T_next(1) <= T_next(0);
			T_next(2) <= T_next(1);
			T_next(3) <= T_next(2);
			T_next(4) <= T_next(3);
			T_next(5) <= T_next(4);
		end if;
	end process;
	
	-- Output Logic
	T <= B"000000" when CLR = '1' else T_next;
	
	
end RingCounter_arch;
