Library Ieee;
Use ieee.Std_Logic_1164.all;
Entity Dff_r is
   port (
         ind   : in  std_logic  ;
         outd  : out std_logic  ;
         Reset : In  std_logic  ;
         clk   : in  std_logic
        );
End Entity;
Architecture Dff_r_behave Of Dff_r is
Begin
    Process( clk )
        Begin
           if Clk'event and clk='1' then
              If Reset='0' Then  
                  outd <= ind ;
              Else 
                 Outd <= '0' ;
              End if;
          End if;
    End process;
End Architecture;
