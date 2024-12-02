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
SIGNAL Im : STD_LOGIC_VECTOR(0 to (m-1)*3-1):= (others => '0');
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


-- TB


Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity TB_Byte_Comprator_Flexable Is
END ENTITY;
ARCHITECTURE TB_Byte_Comprator_Flexable_Behave OF TB_Byte_Comprator_Flexable IS   
Component Byte_Comprator_Flexable IS
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
END Component;
Signal A1    :    STD_LOGIC_VECTOR(7 DOWNTO 0)    ;
Signal B1    :    STD_LOGIC_VECTOR(7 DOWNTO 0)    ;
Signal GT1   :    STD_LOGIC:='0'                  ;
Signal EQ1   :    STD_LOGIC:='1'                  ;
Signal LT1   :    STD_LOGIC:='0'                  ;
Signal AGTB1 :    STD_LOGIC                       ;
Signal AEQB1 :    STD_LOGIC                       ;
Signal ALTB1 :    STD_LOGIC                       ;
Begin 
UU1 : Byte_Comprator_Flexable  Port Map (A1,B1,GT1,EQ1,LT1,AGTB1,AEQB1,ALTB1);
A1<="10100000","01000000" After 20 ns,"00000000" After 40 ns;
B1<="01000000","10000000" After 30 ns,"11100000" After 50 ns;
END TB_Byte_Comprator_Flexable_Behave;
