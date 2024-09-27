Library Ieee;
Use Ieee.std_logic_1164.all;
Entity Mux8 is
  port (
         Inmux  : in  Std_Logic_Vector( 7 downto 0)  ;
         OutMux : out Std_Logic                      ;
         Selmux : in  Std_Logic_Vector( 2 downto 0 ) 
        );
End Entity ;
Architecture Mux8_Behave of Mux8 is
Begin 
   OutmUx <= 
   Inmux(0) When selmux="000"  else
   Inmux(1) When selmux="001"  else  
   Inmux(2) When selmux="010"  else
   Inmux(3) When selmux="011"  else
   Inmux(4) When selmux="100"  else  
   Inmux(5) When selmux="101"  else
   Inmux(6) When selmux="110"  else
   Inmux(7) ;
End Architecture;
