Library Ieee;
Use IEEE.STD_LOGIC_1164.All;
Package BASEIC_GATES IS
Component NAND2 is 
      Port(
           A,B : IN  STD_LOGIC ;
           C   : OUT STD_LOGIC 
           );
END COMPONENT;

COMPONENT NAND3 is 
      Port(
           A,B,C : IN  STD_LOGIC ;
           D     : OUT STD_LOGIC 
           );
END COMPONENT;

COMPONENT INV IS 
      Port(
           A  : IN  STD_LOGIC  ;
           B  : OUT STD_LOGIC  
          );
END COMPONENT;
END PACKAGE; 