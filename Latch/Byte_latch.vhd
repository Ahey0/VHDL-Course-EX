Library ieee;
use ieee.std_logic_1164.all;
Entity Byte_Latch is 
     port(
          A   : In  Std_Logic_vector(7 downto 0);
          O   : Out Std_Logic_vector(7 downto 0);
          Clk : in  std_logic
        );
End Entity;
Architecture Byte_Latch_Behave OF Byte_Latch is
Begin
Process(clk)
    Begin
        if clk='1' then
           o<= A ;
        end if;
end process;
End Architecture;