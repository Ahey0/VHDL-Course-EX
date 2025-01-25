Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
USE work.BASIC_Utilities.All;
Entity INV_Q Is
      Generic(
              tplh : Time :=5 ns ;
              tphl : Time :=3 ns 
              );
      Port   (
              I1  : IN    Qit ;
              O1  : OUT   Qit 
             );
End INV_Q;
Architecture Avarage_delay Of INV_Q Is
begin
     O1 <= Not I1 After(tplh +tphl)/2 ;
End Avarage_delay;
Entity NAND2_Q Is
      Generic(
              tplh : Time :=6 ns ;
              tphl : Time :=4 ns 
              );
      Port   (
              I1,I2: IN    Qit ;
              O1   : OUT   Qit 
             );
End Nand2_Q;
Architecture Avarage_delay Of NAND2_Q Is
begin
     O1 <= Not (I1 And  I2 ) After(tplh +tphl)/2 ;
End Avarage_delay;


