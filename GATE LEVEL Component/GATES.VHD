-- Gate Level Components

Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
Entity NAND2 is 
      Port(
           A,B : IN  STD_LOGIC ;
           C   : OUT STD_LOGIC 
           );
END ENTITY;

Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity NAND3 is 
      Port(
           A,B,C : IN  STD_LOGIC ;
           D     : OUT STD_LOGIC 
           );
END ENTITY;

Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
Entity INV IS 
      Port(
           A  : IN  STD_LOGIC  ;
           B  : OUT STD_LOGIC  
          );
END ENTITY;


ARCHITECTURE NAND2_SINGLE_DELAY OF NAND2 IS
Begin
     C <= A Nand B After 5 ns;
END NAND2_SINGLE_DELAY;

ARCHITECTURE NAND3_SINGLE_DELAY OF NAND3 IS
Begin
     D <= NOT(A AND B AND C) After 6 ns;
END NAND3_SINGLE_DELAY;

ARCHITECTURE INV_SINGLE_DELAY OF INV IS
Begin
     B <= Not A After 4 ns;
END  INV_SINGLE_DELAY;