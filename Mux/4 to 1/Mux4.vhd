Library Ieee;
Use Ieee.std_logic_1164.all;
Entity Mux4 is
  port (
         Inmux  : in  Std_Logic_Vector( 3 downto 0)  ;
         OutMux : out Std_Logic                      ;
         Selmux : in  Std_Logic_Vector( 1 downto 0 ) 
        );
End Entity ;
Architecture Mux4_Behave of Mux4 is
Begin
  OutmUx <= 
          Inmux(0) When selmux="00"  else
          Inmux(1) When selmux="01"  else  
          Inmux(2) When selmux="10"  else
          Inmux(3) ;
End Architecture;
