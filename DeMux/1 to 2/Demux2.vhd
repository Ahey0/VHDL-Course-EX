Library Ieee;
Use Ieee.Std_Logic_1164.all;
Entity Demux2 is
    port( 
          Sel  :  in  Std_Logic                       ;
          Fin  :  in  Std_Logic                       ;
          Outd :  out std_logic_vector( 1 downto 0 ) 
         );
End Entity;
Architecture Demux2_Behave Of Demux2 is
Begin 
    Process(Sel , Fin )
        Begin
              If Fin='1' then 
                 case sel is
                    when '0' =>
                           Outd <= "01" ;
                    when '1' =>
                           Outd <= "10" ;
                    when others => 
                           
                 end case;
              Else 
                           Outd <= "00" ;
              end if;
     end process;
End Architecture;