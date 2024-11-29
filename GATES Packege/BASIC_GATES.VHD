Library Ieee;
Use IEEE.STD_LOGIC_1164.All;
Package BASEIC_Utilities IS
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
Type qit is('0','1','Z','X');
Type qit_2d is ARRAY (qit,qit) Of qit;
Type qit_1d is Array (qit) OF qit;
TYPE qit_Vector Is Array (Natural RANGE <> ) Of qit;
SUBTYPE rit is qit range '0' TO 'Z' ;
Type rit_2d is ARRAY (rit,rit) Of rit;
Type rit_1d is Array (rit) OF rit;
TYPE rit_Vector Is Array (Natural RANGE <> ) Of rit;
TYPE Integer_Vector is ARRAY (Natural RANGE <> ) Of integer;
TYPE Natural_Vector is ARRAY (Natural RANGE <> ) Of Natural;
Type Logic_Data IS File Of Character;

Type capacitance is range 0 to integer'High 
    Units
          ffr;
          pfr=1000 ffr;
          nfr=1000 pfr;
          ufr=1000 nfr;
          mfr=1000 ufr;
          far=1000 mfr;
          kfr=1000 far;
    End Units;
Type Resistance is range 0 to integer'High 
    Units
          I_O ;
          ohms = 1000 I_O ;
          K_O  = 1000 ohms;
          M_O  = 1000 K_O ; 
          G_O  = 1000 M_O ;
    End Units;

END PACKAGE; 