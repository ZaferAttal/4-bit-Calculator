library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
entity lls is 
Port ( 
lls_in : in STD_LOGIC_VECTOR (3 DOWNTO 0); 
lls_out : out STD_LOGIC_VECTOR (3 DOWNTO 0)); 
end lls; 

architecture Behavioral of lls is 
begin 
process (lls_in) 
begin 
lls_out(0) <= '0'; 
lls_out(1) <= lls_in(0); 
lls_out(3) <= lls_in(2); 
lls_out(2) <= lls_in(1); 
end process;
end Behavioral;
