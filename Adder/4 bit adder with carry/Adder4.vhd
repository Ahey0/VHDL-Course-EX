Library Ieee;
Use Ieee.std_logic_1164.all;
Use Ieee.std_logic_Unsigned.all;
Entity Adder4 is
     Port(
          INData  :  In  Std_Logic_Vector( 3 downto 0 ) ;
          Outdata :  Out Std_Logic_Vector( 3 downto 0 ) ;
          Cin     :  In  Std_Logic                      ;
          Cout    :  Out Std_Logic                      
          );
End Entity;
Architecture Adder4_Behave Of Adder4 is 
Signal S_flow  :  Std_Logic_Vector(4 downto 0 ) := "00000" ;
Signal in_flow :  Std_Logic_Vector(4 downto 0 ) := "00000" ;
Begin 
In_flow <= '0' & InData ;
     Process( INData , In_flow  , Cin )
           Begin 
                  S_Flow <= In_flow + Cin ;
     End Process;
End Architecture;