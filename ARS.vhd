library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity ars is 

Port ( 
ars_in 	: in STD_LOGIC_VECTOR (3 DOWNTO 0); 
ars_out : out STD_LOGIC_VECTOR (3 DOWNTO 0)); 
end ars;
 
architecture Behavioral of ars is 
begin 

process (ars_in) 

begin 
ars_out(3) <= ars_in(3); 
ars_out(2) <= ars_in(3); 
ars_out(1) <= ars_in(2); 
ars_out(0) <= ars_in(1); 

end process; 
end Behavioral; 
