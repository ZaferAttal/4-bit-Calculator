library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity alu is
	Port( Operation: in STD_LOGIC_VECTOR (2 downto 0);
		  X: in STD_LOGIC_VECTOR (3 downto 0);
		  Y: in STD_LOGIC_VECTOR (3 downto 0);
		  Cin: in STD_LOGIC;
		  Cout: out STD_LOGIC;
		  Output: out STD_LOGIC_VECTOR (3 downto 0) );
		  
end alu;


architecture Behavioral of alu is

signal Outputt : STD_LOGIC_VECTOR (4 Downto 0) ;

begin
		process(Operation, X, Y, Cin)
		
		begin
		
		case Operation is
		
		WHEN "000" => Outputt <= ('0' & X);
		Output <= Outputt(3 Downto 0);
		Cout <= Outputt(4); 
		WHEN "001" => Outputt <= ('0' & X) +  Y + (Cin);
		Output <= Outputt(3 Downto 0);
		Cout <= Outputt(4);
		WHEN "010" => Outputt <= ('0' & X)- Y - (NOT Cin);
		Output <= Outputt(3 Downto 0);
		Cout <= Outputt(4);
		WHEN "011" => Outputt <= Y- ('0' & X) - (NOT Cin);
		Output <= Outputt(3 Downto 0);
		Cout <= Outputt(4);
		WHEN "100" => Outputt <= ('0' & X) OR Y;
		Output <= Outputt(3 Downto 0);
		Cout <= Outputt(4);
		WHEN "101" => Outputt <= ('0' & X) AND Y;
		Output <= Outputt(3 Downto 0);
		Cout <= Outputt(4);
		WHEN "110" => Outputt <= ('0' & X) XOR Y;
		Output <= Outputt(3 Downto 0);
		Cout <= Outputt(4);
		WHEN OTHERS => Outputt <= ('0' & X) XNOR Y;
		Output <= Outputt(3 Downto 0);
		Cout <= Outputt(4);

		end case;
		end process;
		
end Behavioral;