library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity muxtwoone is                         

Port ( 
	Input1: in STD_LOGIC;                     
	Input2: in STD_LOGIC;         
	Selection: in STD_LOGIC;         
	Output: out STD_LOGIC);      
end muxtwoone;

architecture Behavioral of muxtwoone is

begin

with Selection select           
		Output <= Input1 when '0',        
		Input2 when OTHERS;       
end Behavioral;
