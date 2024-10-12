Library Ieee;
Use Ieee.std_Logic_1164.all;
Use Ieee.Std_Logic_Unsigned.all;
Entity Reg4 is
  port(
       Inreg   : in  Std_logic_vector(3  downto 0 ) ;
       Outreg  : out Std_logic_vector(3  downto 0 ) ;
       Load    : in  Std_Logic                      ;
       Clear   : in  Std_Logic                      ;
       Incr    : in  Std_Logic                      ;
       Clk     : in  Std_Logic   
      );
End Entity;
Architecture Reg4_Behave Of Reg4 is 
Signal S  : Std_logic_vector(3 downto 0 ):="0000";
Begin
  Process(Clk) 
     Begin
         if clk'event and clk='1' Then
             if Clear='1' then 
                 S <= "0000"      ;
             elsif Incr='1' and S = "11111" Then 
                 S <= "0000"      ;
             elsif Incr='1' and S /= "1111" Then 
                 S <= S + "0001"  ;
             elsif Load='1' Then
                 S <= Inreg ;
             End if;
         End if;
   End process;
Outreg <= S ;
End Architecture;     

