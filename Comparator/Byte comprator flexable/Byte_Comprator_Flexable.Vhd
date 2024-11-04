Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity Byte_Comprator_Flexable Is
      Port(
           A    :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0)    ;
           B    :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0)    ;
           GT   :  IN   STD_LOGIC                       ;
           EQ   :  IN   STD_LOGIC                       ;
           LT   :  IN   STD_LOGIC                       ;
           AGTB :  OUT  STD_LOGIC                       ;
           AEQB :  OUT  STD_LOGIC                       ;
           ALTB :  OUT  STD_LOGIC
           );
END ENTITY;
ARCHITECTURE Byte_Comprator_Flexable_Behave OF Byte_Comprator_Flexable IS   
Component Bit_Comprator Is
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
END COmponent;
For ALL   : Bit_Comprator Use Entity Work.Bit_Comprator (Bit_Comprator_GATE_LEVEL);
Constant m : Integer :=8 ;
SIGNAL Im : STD_LOGIC_VECTOR((m-1)*3-1 Downto 0):= (others => '0');
Begin
C :  For I in 0 to m-1 Generate 
L:      IF I=0 Generate 
         LC : Bit_Comprator Port Map (A(i),B(i),GT,EQ,LT,IM(0),IM(1),IM(2));
        End Generate;
M:      IF I>0 AND I/=7 Generate 
         MC : Bit_Comprator Port Map 
                (A(i),B(i),IM(i*3-3),IM(i*3-2),IM(i*3-1),IM(i*3),IM(i*3+1),IM(i*3+2));
        END Generate;
H:      IF I=7 Generate
         HC : Bit_Comprator Port Map (A(i),B(i),IM(i*3-3),IM(i*3-2),IM(i*3-1),AGTB,AEQB,ALTB);
        End Generate;
     END Generate;
END Byte_Comprator_Flexable_Behave;
