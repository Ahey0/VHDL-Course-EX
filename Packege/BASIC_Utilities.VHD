 Library Ieee;
Use IEEE.STD_LOGIC_1164.All;
Package BASIC_Utilities IS
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
Type qit is('0','1','z','x');
Type qit_2d is ARRAY (qit,qit) Of qit;
Type qit_1d is Array (qit) OF qit;
TYPE qit_Vector Is Array (Natural RANGE <> ) Of qit;
SUBTYPE rit is qit range '0' TO 'z' ;
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
function "AND"(a,b:qit) return qit;
function "OR" (a,b:qit) return qit;
function "NOT"(a:qit)   return qit;
function "AND"(a,b:qit_vector) return qit_vector;
function "OR" (a,b:qit_vector) return qit_vector;
function "NOT"(a:qit_vector)   return qit_vector;
END BASIC_Utilities;
PACKAGE BODY BASIC_Utilities is
function "AND" (a,b:qit) return qit is
   Constant qit_and_table :qit_2d:=(('0','0','0','0'),
                                    ('0','1','1','x'),
                                    ('0','1','1','x'),
                                    ('0','x','x','x'));
Begin
     return qit_and_table(a,b);
End "AND";
                                    
function "OR" (a,b:qit) return qit is
   Constant qit_or_table :qit_2d:=(('0','1','1','x'),
                                    ('1','1','1','1'),
                                    ('1','1','1','1'),
                                    ('x','1','1','x'));
Begin
     return qit_or_table(a,b);
End "OR";

function "NOT"(a:qit)   return qit is
    Constant qit_not_table : qit_1d:=('1','0','0','x');
Begin
    Return qit_not_table(a);
End "Not";

function "AND"(a,b:qit_vector) return qit_vector is
   Variable r :qit_vector(a'range);
Begin
   Loop1 : For i IN a'range LOOP 
      r(i):=a(i) AND b(i);
   End LOOP LOOP1;
Return r;
End "AND";

function "OR" (a,b:qit_vector) return qit_vector is
   Variable r :qit_vector(a'range);
Begin
   Loop1 : For i IN a'range LOOP 
      r(i):=a(i) OR b(i);
   End LOOP LOOP1;
Return r;
End "OR";
function "NOT"(a:qit_vector)   return qit_vector is 
   Variable r :qit_vector(a'range);
Begin
   Loop1 : For i IN a'range LOOP 
      r(i):= NOT a(i) ;
   End LOOP LOOP1;
Return r;
End "NOT";

END BASIC_Utilities;