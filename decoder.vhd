library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Decoder is
	Port (
	          Input: in STD_LOGIC_VECTOR (3 downto 0);                       
	          Output: out STD_LOGIC_VECTOR (7 downto 0));                
end Decoder;

architecture Behavioral of Decoder is
begin
process (Input)                  
begin
		case Input is           
		
			WHEN "0000" => Output <= "00000011";        
			WHEN "0001" => Output <= "10011111";        
			WHEN "0010" => Output <= "00100101";        
			WHEN "0011" => Output <= "00001101";        
			WHEN "0100" => Output <= "10011001";       
			WHEN "0101" => Output <= "01001001";        
			WHEN "0110" => Output <= "01000001";       
			WHEN "0111" => Output <= "00011111";
			WHEN "1000" => Output <= "00000001";        
			WHEN "1001" => Output <= "00001001";        
			WHEN "1010" => Output <= "00010001";        
			WHEN "1011" => Output <= "11000001";      
			WHEN "1100" => Output <= "11100101";      
			WHEN "1101" => Output <= "10000101";      
			WHEN "1110" => Output <= "01100001";      
			WHEN OTHERS => Output <= "01110001";  
			
			
end case;
	
	end process;

end Behavioral;
