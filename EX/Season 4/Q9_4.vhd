Library IEEE;
Use Ieee.Std_Logic_1164.ALl;
Entity Q9_4 IS
End Entity;
Architecture Q9_4_Behave Of Q9_4 Is
function toggle_when_event(a : in bit ,b: out bit);
return 
generate
       Begin 
            process(a)
                  Begin 
                        if b'event 
                           a <= Not a ;
                        end if;
            end process;
end function;
Signal a : bit := '1' ;
Signal t,e : bit := '0' ;
Begin
a <= '0' , '1' after 10 ns , '0' after 12 ns;
t <= toggle_when_event(t,a);
end;