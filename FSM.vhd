 LIBRARY ieee;
 use IEEE.STD_LOGIC_1164.ALL;
      ENTITY FSM IS
      PORT (
      		Load_A: OUT STD_LOGIC;
      		Load_B: OUT STD_LOGIC;
      		Cin: OUT STD_LOGIC;
      		ALUOP: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      		Input_Select: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      		Reset: OUT STD_LOGIC;
      		out_state: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
     		 Clock: IN STD_LOGIC;
      		RUN  : IN STD_LOGIC;
     		 MOP: IN STD_LOGIC_VECTOR  (3 DOWNTO 0));
       END FSM; 

      ARCHITECTURE Behavior OF FSM IS
       SIGNAL y_present, y_next : STD_LOGIC_VECTOR(4 DOWNTO 0);
       CONSTANT S0  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00001";
       CONSTANT S1  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00010";
       CONSTANT S2  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00100";
       CONSTANT S3  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01000";
       CONSTANT S4  : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10000";
       BEGIN
	PROCESS (RUN, y_present)       
	BEGIN
		CASE y_present IS
		  	WHEN S0 =>
				IF RUN='0' THEN y_next <= S0;
				ELSE y_next <= S1;
				END IF;
			WHEN S1 =>
				IF RUN='0' THEN y_next <= S0;
				ELSE  y_next <= S2;
				END IF;
			
                                   WHEN S2 =>
				IF RUN='0' THEN y_next <= S0;
				ELSE y_next <= S3;
				END IF;	
			WHEN S3 =>
				IF RUN='0' THEN y_next <= S0;
				ELSE y_next <= S4;
				END IF;
			WHEN S4 =>
				IF RUN='0' THEN  y_next <= S0;
				ELSE y_next <= S4;
				END IF;
			WHEN OTHERS =>
				y_next <= S0;
		END CASE;
	END PROCESS;

	PROCESS (Clock, RUN)
	BEGIN
		IF RUN='0' THEN
			y_present <= S0;
		ELSIF (Clock'EVENT AND Clock='1') THEN
			y_present <= y_next;
		END IF;
		END PROCESS;
		
      
    PROCESS (y_present, MOP)     
   begin
   IF MOP = "0000" then                       
	IF y_present = S0 then
			out_state <= "0000" ; 
			Input_select <= "000" ;
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "100" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ;
			Reset <= '0' ; 	
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ; 
       END IF;
      
     
       ELSIF MOP = "0001" then           
	IF y_present = S0 then 
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "100" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '1' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 	
	ELSIF y_present = S3 then
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then
			out_state <= "0100" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;
     
        END IF;
  
       
        ELSIF MOP = "0010" then                    
	IF y_present = S0 then 
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then
			out_state <= "0001" ;
			Input_select <= "110" ; 
			Load_A <= '1' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ;
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S3 then
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ; 

        END IF;
 
   
       ELSIF MOP = "0011" then                   
	IF y_present = S0 then 
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "110" ; 
			Load_A <= '0' ;
			Load_B <= '1' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;  	
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ;
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 

              END IF;
 
        ELSIF MOP = "0100" then           
	IF y_present = S0 then 
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;  
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 	
	ELSIF y_present = S3 then
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ;
         END IF;  
     
     
       ELSIF MOP = "0101" then         

	IF y_present = S0 then
			out_state <= "0000" ; 
			Input_select <= "000" ;
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ;  
			ALUop <= "000" ; 
			Reset <= '0' ;
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ;
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "100" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ; 
			Cin <= '0' ; 
			ALUop <= "001" ;
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
       END IF;
     
       ELSIF MOP = "0110" then              

	IF y_present = S0 then
			out_state <= "0000" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ; 
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "100" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ;
			Cin <= '1' ;
			ALUop <= "001" ; 
			Reset <= '0' ;  
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;
         END IF;
 
       ELSIF MOP = "0111" then                   

	IF y_present = S0 then 
			out_state <= "0000" ;
			Input_select <= "000" ;
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ;
			Reset <= '0' ;
	ELSIF y_present = S1 then
			out_state <= "0001" ;
			Input_select <= "100" ; 
			Load_A <= '0' ;
			Load_B <= '1' ; 
			Cin <= '0' ; 
			ALUop <= "001" ; 
			Reset <= '0' ;
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "100" ; 
			Load_A <= '1' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 	
	ELSIF y_present = S3 then
			out_state <= "0011" ;
			Input_select <= "110" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ; 
			Cin <= '0' ; 
			ALUop <= "001" ;
			Reset <= '0' ; 
	ELSIF y_present = S4 then
			out_state <= "0100" ;
			Input_select <= "000" ;
			Load_A <= '0' ;
			Load_B <= '0' ;
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ;
      END IF;
 
       ELSIF MOP = "1000" then                      

	IF y_present = S0 then 
			out_state <= "0000" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "101" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ; 
			Cin <= '1' ; 
			ALUop <= "001" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 	
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ;  
			Reset <= '0' ; 
       END IF;
       ELSIF MOP = "1001" then           

	IF y_present = S0 then
			out_state <= "0000" ;
			Input_select <= "000" ;
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;  
	ELSIF y_present = S1 then
			out_state <= "0001" ;
			Input_select <= "101" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ;
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ;  	
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ;

       END IF;
       ELSIF MOP = "1010" then         

	IF y_present = S0 then 
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;  
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "100" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ; 
			Cin <= '0' ; 
			ALUop <= "101" ;
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ;  
			Reset <= '0' ; 

       END IF;
       ELSIF MOP = "1011" then      
IF y_present = S0 then
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ;
			ALUop <= "000" ;
			Reset <= '0' ; 
	ELSIF y_present = S1 then
			out_state <= "0001" ;
			Input_select <= "100" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ;
			Cin <= '0' ; 
			ALUop <= "100" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ;
			ALUop <= "000" ;
			Reset <= '0' ;	
	ELSIF y_present = S3 then
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then
			out_state <= "0100" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ;  

       END IF;
       ELSIF MOP = "1100" then   

IF y_present = S0 then 
			out_state <= "0000" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ;
			Cin <= '0' ;
			ALUop <= "000" ;
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "100" ; 
			Load_A <= '0' ;
			Load_B <= '1' ; 
			Cin <= '0' ; 
			ALUop <= "110" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ;
			Reset <= '0' ; 	
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ;
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 

        END IF;
        ELSIF MOP = "1101" then   
  IF y_present = S0 then
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then
			out_state <= "0001" ;
			Input_select <= "010" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ; 
			Cin <= '0' ;
			ALUop <= "000" ;
			Reset <= '0' ; 
	ELSIF y_present = S2 then
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ;	
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ;
			Reset <= '0' ;

       END IF;
       ELSIF MOP = "1110" then   
IF y_present = S0 then
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "001" ; 
			Load_A <= '0' ; 
			Load_B <= '1' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ;
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S3 then
			out_state <= "0011" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 


        END IF;
        ELSIF MOP = "1111" then 
 IF y_present = S0 then
			out_state <= "0000" ; 
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
	  ELSIF y_present = S1 then 
			out_state <= "0001" ;
			Input_select <= "011" ;
			Load_A <= '0' ;
			Load_B <= '1' ; 
			Cin <= '0' ;
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S2 then 
			out_state <= "0010" ;
			Input_select <= "000" ; 
			Load_A <= '0' ;
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 	
	ELSIF y_present = S3 then 
			out_state <= "0011" ;
			Input_select <= "000" ;
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 
	ELSIF y_present = S4 then 
			out_state <= "0100" ;
			Input_select <= "000" ; 
			Load_A <= '0' ; 
			Load_B <= '0' ; 
			Cin <= '0' ; 
			ALUop <= "000" ; 
			Reset <= '0' ; 


	END IF; --end of the if statement
       END IF; --end of the if statement
       END PROCESS;--end of the process statement
       END Behavior;
