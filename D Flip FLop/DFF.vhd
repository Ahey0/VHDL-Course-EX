Library Ieee;
Use ieee.Std_Logic_1164.all;
Entity D_ff is
   port (
         ind  : in  std_logic  ;
         outd : out std_logic  ;
         clk  : in  std_logic
        );
End Entity;
Architecture D_ff_behave Of D_ff is
Begin
    Process( clk )
        Begin
           if Clk'event and clk='1' then 
              outd <= ind ;
           End if;
    End process;
End Architecture;