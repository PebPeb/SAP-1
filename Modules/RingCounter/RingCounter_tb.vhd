----------------------------------------------
-- RingCounter_tb							--
----------------------------------------------


library ieee;
use IEEE.STD_LOGIC_1164.all;

entity RingCounter_tb is
end;

architecture tb of RingCounter_tb is	
	component RingCounter
		port (
			CLK, CLR:		in STD_lOGIC;						-- Clock and Clear/Reset
			T:				out STD_LOGIC_VECTOR(5 downto 0));	-- T state of the program
	end component;

	signal CLK, CLR:		STD_LOGIC;
	signal T: 				STD_LOGIC_VECTOR(5 downto 0);
begin

	UUT : RingCounter port map(CLK, CLR, T); 

	process begin
		CLK <= '1';
		wait for 5 ns; 
		CLK <= '0';
		wait for 5 ns;
	end process;
	
	process begin
		CLR <= '1';
		wait for 12 ns;
		CLR <= '0';
		wait for 275 ns;
		CLR <= '1';
		wait for 17 ns;
		CLR <= '0';
		wait for 100 ns;
		assert false report "simulation finished successfully" severity failure;
	end process;	
	
	
end tb;