library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registerr is
Port( 
			Data: in STD_LOGIC_VECTOR (3 downto 0);
			load: in STD_LOGIC;
			Reset: in STD_LOGIC;
			Clk: in STD_LOGIC;
			Output: out STD_LOGIC_VECTOR (3 downto 0));
end registerr;
architecture Behavioral of registerr is
begin
		process (Clk, load, Reset)
		begin
			if Clk'event and Clk ='1' then  
			
			if Reset = '1' then 
			Output <= "0000";   
			elsif Reset = '0' then
			if load = '1' then
			Output <= Data;    
end if;
			end if;
			end if;
end process;
end Behavioral;