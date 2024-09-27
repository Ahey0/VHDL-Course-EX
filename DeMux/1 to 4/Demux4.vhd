Library Ieee;
Use Ieee.Std_Logic_1164.all;
Entity Demux4 is
    port( 
          Sel  :  in  Std_Logic_Vector(1 downto 0)    ;
          Fin  :  in  Std_Logic                       ;
          Outd :  out std_logic_vector(3 downto 0 ) 
         );
End Entity;
Architecture Demux4_Behave Of Demux4 is
Begin 
    Process(Sel , Fin )
        Begin
              If Fin='1' then 
                 case sel is
                    when "00" =>
                           Outd <= "0001" ;
                    when "01" =>
                           Outd <= "0010" ;
                    when "10" =>
                           Outd <= "0100" ;
                    when "11" =>
                           Outd <= "1000" ;
                    when others =>        
                 end case;
              Else 
                           Outd <= "0000" ;
              end if;
     end process;
End Architecture;
