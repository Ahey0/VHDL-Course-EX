Library Ieee;
Use Ieee.std_logic_1164.all;
Entity JK_FF is 
      Port(
            J,K : In  std_logic   ;
            clk : In  std_logic   ;
            Q   : Out std_logic   
          );
End Entity;
Architecture JK_FF_Behave Of JK_FF is
Signal Q_S : std_Logic :='0' ;
Begin
     Process( Clk ) 
            Begin 
                 If Clk'event And Clk='1'  then 
                      If    J='0' and K='0' then
                              Q_S <= Q_S     ; 
                      elsif J='1' and K='0' then
                              Q_S <= '1'     ;
                      elsif J='0' and K='1' then
                              Q_S <= '0'     ;
                      elsif J='1' and K='1' then
                              Q_S <= Not Q_S ;
                      End If;
                 End If;
       End Process;
Q <= Q_S ;
End Architecture ;     
