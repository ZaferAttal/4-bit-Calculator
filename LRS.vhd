library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lrs is
    Port (
        Input : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
        Output : out  STD_LOGIC_VECTOR (3 DOWNTO 0));
end lrs;

architecture Behavioral of lrs is

begin 
process (Input)
	begin
		   Output(3) <= '0';
		   Output(2) <= Input(3);
		   Output(1) <= Input(2);
     	   Output(0) <= Input(1);
    end process;
end Behavioral;
