Library Ieee;
Use Ieee.Std_Logic_1164.all;
Entity Demux8 is
    port( 
          Sel  :  in  Std_Logic_Vector(2 downto 0)    ;
          Fin  :  in  Std_Logic                       ;
          Outd :  out std_logic_vector(7 downto 0 ) 
         );
End Entity;
Architecture Demux8_Behave Of Demux8 is
Begin 
    Process(Sel , Fin )
        Begin
              If Fin='1' then 
                 case sel is
                    when "000" =>
                           Outd <= "00000001" ;
                    when "001" =>
                           Outd <= "00000010" ;
                    when "010" =>
                           Outd <= "00000100" ;
                    when "011" =>
                           Outd <= "00001000" ;
                    when "100" =>
                           Outd <= "00010000" ;
                    when "101" =>
                           Outd <= "00100000" ;
                    when "110" =>
                           Outd <= "01000000" ;
                    when "111" =>
                           Outd <= "10000000" ;
                    when others =>        
                 end case;
              Else 
                           Outd <= "00000000" ;
              end if;
     end process;
End Architecture;

