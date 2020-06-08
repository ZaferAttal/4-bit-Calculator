LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
	PORT (
		 Input0 : IN STD_LOGIC_VECTOR (3 DOWNTO 0); 
		 Input1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 Input2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 Input3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 Input4 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 Input5 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 Input6 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 Input7 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		 Output : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END mux;

ARCHITECTURE Behavior OF mux IS	
BEGIN
	WITH sel SELECT
		    Output <= 	
					Input0 WHEN "000",
					Input1 WHEN "001",
					Input2 WHEN "010",
					Input3 WHEN "011",
            		Input4 WHEN "100", 
             		Input5 WHEN "101", 
            		Input6 WHEN "110",
             		Input7 WHEN OTHERS;

END Behavior;
