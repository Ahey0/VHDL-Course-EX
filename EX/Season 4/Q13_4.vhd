Library IEEE;
Use Ieee.Std_Logic_1164.ALl;
Entity Example13 IS
End Entity;
ARchitecture Example13_Behave Of Example13 Is
Signal y,x,N_x : bit;
Signal w  : time := 5 ns ;
Begin
    y <= '1','0'  after 4 ns , '1' after 18 ns; 
     N_x <= y After w ;
     x <= N_x ;
End;