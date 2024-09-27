Library Ieee;
Use Ieee.Std_Logic_1164.all;
Use Ieee.Std_Logic_Unsigned.all;
Entity Comparator is
   Port(
         IN1     :  in   std_logic  ;
         IN2     :  in   std_logic  ;
         GRT     :  out  std_logic  ;
         Equal   :  out  std_logic  ;
         Smaller :  out  std_logic  
        );
End Entity;
Architecture Comparator_Behave of Comparator is
Begin 
  Smaller <=  ( Not IN1 ) and IN2  ;
  GRT     <=  ( Not IN2 ) and IN1  ;
  Equal   <=   Not ( IN1 Xor IN2 ) ;
End Architecture;
