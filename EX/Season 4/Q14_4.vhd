Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
Entity Q14_4 IS
End Entity;
Architecture Q14_4_Behave OF Q14_4 Is
Type qit is ('0','1','z','x');
Signal a,b,c : qit:='0' ;
Begin 
a <='0' , '1' after 20 ns ,'z' after 30 ns , '1' after 40 ns , '0' after 50 ns;
b <= transport '0' , a after 14 ns;
c <='1',a after 10 ns ,'z' after 15 ns , b after 20 ns;
End;  