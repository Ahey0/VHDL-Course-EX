Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
Entity Q6_4 Is
END Entity;
ARCHITECTURE Q6_4_Behave OF Q6_4 is
Type qit IS ('Z' ,'1','0','X');
Signal W   : qit:='0' ;
Signal x   : qit      ;
Signal y   : qit:='Z' ;
Signal z   : qit:='1' ;
Signal a,b : Bit      ;
Begin
a<='0','1' after 20 ns;
b<='0','1' after 40 ns;
p1 : Process
         Begin
                W <='1' After 8  ns ;
                W <='1' After 10 ns ;
                Wait Until a='1'    ;
                W <= '0'            ;
                y <= transport '1' after 5  ns;
                Wait Until b='1'    ;
                W <='1' After 10 ns ;
                W <='0' After 13 ns ;
                W <='Z' After 08 ns ;
                X <='1'             ;
                y <= transport '0' after 12 ns;
                y <= transport 'Z' after 12 ns;
                WAIT;
     End Process p1;
Z <= X;
End Architecture;
