Library Ieee;
Use Ieee.std_logic_1164.all;
Entity Mux2 is
  port (
         Inmux0 : in  Std_Logic                      ;
         Inmux1 : in  Std_Logic                      ;
         OutMux : out Std_Logic                      ;
         Selmux : in  Std_Logic
        );
End Entity ;
Architecture Mux2_Behave of Mux2 is
Begin
  OutmUx <= 
          Inmux0 When selmux='0'  else
          Inmux1 ;
End Architecture;

