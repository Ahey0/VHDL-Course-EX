Library Ieee;
Use Ieee.std_logic_1164.all;
Entity T_FF is 
      Port(
            T   : In  std_logic   ;
            clk : In  std_logic   ;
            Q   : Out std_logic   
          );
End Entity;
Architecture T_FF_Behave Of T_FF is
Signal Q_S : std_Logic :='0' ;
Begin
     Process( Clk ) 
            Begin 
                 If Clk'event And Clk='1'  then 
                    Case T is 
                      When '0' => 
                           Q_S <= Q_S      ;
                      When '1' =>
                           Q_S <= Not  Q_S ;
                      When Others => 
                           Q_S <= Q_S ;
                    End Case;
                  End If;
       End Process;
Q <= Q_S ;
End Architecture ;     