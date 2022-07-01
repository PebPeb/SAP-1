----------------------------------------------
-- reg_8_tb								--
----------------------------------------------


library ieee;
use IEEE.STD_LOGIC_1164.all;

entity reg_8_tb is
end;

architecture tb of reg_8_tb is	
	component reg_8
		port (
			CLK, WE:		in STD_lOGIC;						-- Clock and LB
			reg_in:			in STD_LOGIC_VECTOR(7 downto 0);	-- T state of the program
			reg_out:			out STD_LOGIC_VECTOR(7 downto 0)	-- T state of the program
		);
	end component;

	signal CLK, LB:			STD_LOGIC;
	signal Bin, Bout: 		STD_LOGIC_VECTOR(7 downto 0);
	
	signal not_LB:			STD_LOGIC;
begin

	UUT : reg_8 port map(CLK, not_LB, Bin, Bout); 
	not_LB <= not LB;

	process begin
		CLK <= '1';
		wait for 5 ns; 
		CLK <= '0';
		wait for 5 ns;
	end process;
	
	process begin
		Bin <= B"00000000";
		LB <= '0';
		wait for 95 ns;

		LB <= '1';
		Bin <= B"01100000";		
		wait for 20 ns;
		Bin <= B"00000110";				
		wait for 20 ns;
		
		LB <= '0';
		wait for 100 ns;
		
		assert false report "simulation finished successfully" severity failure;
	end process;	
	
	
end tb;
