Library IEEE;
Use Ieee.std_Logic_1164.All;
Entity Brief_D_Flip_Flop Is
Port(
     D,C : In  Bit ;
     Q   : Out Bit
     );
End Entity;
Architecture Falling_Edge Of Brief_D_Flip_Flop Is
Signal TMP : Bit ;
Begin
TMP <= D When (C='0' And Not C'Stable) Else TMP ;
Q <= Tmp After 8 ns;
End  Falling_Edge;
Library IEEE;
Use Ieee.std_Logic_1164.All;
Entity Brief_T_Flip_Flop Is
Port(
     T   : In  Bit ;
     Q   : Out Bit
     );
End Entity;
Architecture Toggle Of Brief_T_Flip_Flop Is
Signal TMP : Bit ;
Begin
TMP <= Not TMP When (
                          (T='0' And Not T'Stable)
                      and (T'Delayed'Stable(20 ns) )
                     )Else TMP ;
Q <= Tmp After 8 ns;
End Toggle;


Library IEEE;
Use Ieee.STD_Logic_1164.All;
Entity TB_D_F is
End Entity;
Architecture TB_D_F_Behave Of TB_D_F Is
Component Brief_T_Flip_Flop Is
Port(
     T   : In  Bit ;
     Q   : Out Bit
     );
End Component;
Component  Brief_D_Flip_Flop Is
Port(
     D,C : In  Bit ;
     Q   : Out Bit
     );
End component;
Signal A,B,C,D,CLk : Bit ;
Begin
U1 : Brief_T_Flip_Flop Port Map (C,D);
U2 : Brief_D_Flip_Flop Port Map (A,CLK,B);
CLK <= Not CLk after 5 ns;
C <= '0' , '1' after 7 ns , '0' after 27 ns , '1' after 57 ns;
A <= '0' , '1' after 9 ns , '0' after 37 ns , '1' after 67 ns; 
END;