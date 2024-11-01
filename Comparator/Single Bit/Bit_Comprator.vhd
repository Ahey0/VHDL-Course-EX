Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity Bit_Comprator Is
      Port(
           A    :  IN   STD_LOGIC    ;
           B    :  IN   STD_LOGIC    ;
           GT   :  IN   STD_LOGIC    ;
           EQ   :  IN   STD_LOGIC    ;
           LT   :  IN   STD_LOGIC    ;
           AGTB :  OUT  STD_LOGIC    ;
           AEQB :  OUT  STD_LOGIC    ;
           ALTB :  OUT  STD_LOGIC
           );
END ENTITY;

-- Behaverial 

Architecture Bit_Comprator_Behave OF Bit_Comprator  Is 
Begin
  
     AGTB   <= (A and GT ) OR ((Not B) and GT ) OR (A and (Not B)) ;
     AEQB   <= (A and B And EQ) OR ((Not A)   and (Not B) and EQ)  ; 
     ALTB   <= ((Not A) and LT) OR (B and LT) OR  ((Not A) and B)  ;
END Bit_Comprator_Behave;

--Gate level Design  

Architecture Bit_Comprator_GATE_LEVEL OF Bit_Comprator  Is 
Component n2 is 
      Port(
           A,B : IN  STD_LOGIC ;
           C   : OUT STD_LOGIC 
           );
END COMPONENT;
Component N3 is 
      Port(
           A,B,C : IN  STD_LOGIC ;
           D     : OUT STD_LOGIC 
           );
END COMPONENT;
Component n1 IS 
      Port(
           A  : IN  STD_LOGIC  ;
           B  : OUT STD_LOGIC  
          );
END COMPONENT;
For All : n1 Use Entity work.INV (INV_Single_Delay);
For All : n2 Use Entity work.NAND2 (NAND2_SINGLE_DELAY);
For All : n3 Use Entity work.NAND3 (NAND3_SINGLE_DELAY);
Signal I: STD_LOGIC_VECTOR(9 downto 0) ;
Begin
G0 : n1 Port Map (A,I(0));
G1 : n1 PORT MAP (B,I(1));
G2 : n2 PORT MAP (A,I(1),I(2));
G3 : n2 PORT MAP (A,GT,I(3));
G4 : n2 PORT MAP (I(1),GT,I(4));
G5 : n3 PORT MAP (I(2),I(3),I(4),AGTB);
G6 : n3 PORT MAP (I(0),I(1),EQ,I(5));
G7 : n3 PORT MAP (A,B,EQ,I(6));
G8 : n2 PORT MAP (I(5),I(6),AEQB);
G9 : n2 PORT MAP (I(0),B,I(7));
G10: n2 PORT MAP (I(0),LT,I(8));
G11: n2 PORT MAP (B,LT,I(9));
G12: n3 PORT MAP (I(7),I(8),I(9),ALTB);
END Bit_Comprator_GATE_LEVEL;

--TB
Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity TB_Bit_Comprator Is
END ENTITY;
ARCHITECTURE TB_Bit_Comprator_BEHAVE OF TB_Bit_Comprator IS 
Component J1 Is   
      Port(
           A    :  IN   STD_LOGIC    ;
           B    :  IN   STD_LOGIC    ;
           GT   :  IN   STD_LOGIC    ;
           EQ   :  IN   STD_LOGIC    ;
           LT   :  IN   STD_LOGIC    ;
           AGTB :  OUT  STD_LOGIC    ;
           AEQB :  OUT  STD_LOGIC    ;
           ALTB :  OUT  STD_LOGIC
           );
END Component;
FOR y1 : j1 USE ENTITY Work.Bit_Comprator (Bit_Comprator_Behave);
FOR y2 : j1 USE ENTITY Work.Bit_Comprator (Bit_Comprator_GATE_LEVEL);
SIGNAL  A     :    STD_LOGIC:='1'    ;
SIGNAL  B     :    STD_LOGIC:='0'    ;
SIGNAL  GT    :    STD_LOGIC:='0'    ;
SIGNAL  EQ    :    STD_LOGIC:='1'    ;
SIGNAL  LT    :    STD_LOGIC:='0'    ;
SIGNAL  AGTB1 :    STD_LOGIC         ;
SIGNAL  AEQB1 :    STD_LOGIC         ;
SIGNAL  ALTB1 :    STD_LOGIC         ;
SIGNAL  AGTB2 :    STD_LOGIC         ;
SIGNAL  AEQB2 :    STD_LOGIC         ;
SIGNAL  ALTB2 :    STD_LOGIC         ;
Begin
y1 : j1 Port Map (A,B,GT,EQ,LT,AGTB1,AEQB1,ALTB1);
y2 : j1 Port Map (A,B,GT,EQ,LT,AGTB2,AEQB2,ALTB2);
END;
