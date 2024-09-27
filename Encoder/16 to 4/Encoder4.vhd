library Ieee;
use ieee.std_logic_1164.all;
Entity Encoder4 is
 port(
      sel : out  std_logic_vector(3 downto 0 ) ;
      o   : in   std_logic_vector(15 downto 0) 
      );
End Entity;
Architecture Encoder4_behave of Encoder4 is
Begin
    Sel <= 
           "0000" when o = "0000000000000001" else
           "0001" when o = "000000000000001-" else
           "0010" when o = "00000000000001--" else
           "0011" when o = "0000000000001---" else
           "0100" when o = "000000000001----" else
           "0101" when o = "00000000001-----" else
           "0110" when o = "0000000001------" else
           "0111" when o = "000000001-------" else
           "1000" when o = "00000001--------" else
           "1001" when o = "0000001---------" else
           "1010" when o = "000001----------" else
           "1011" when o = "00001-----------" else
           "1100" when o = "0001------------" else
           "1101" when o = "001-------------" else
           "1110" when o = "01--------------" else
           "1111" when o = "1---------------" else
           "ZZZZ"                                   ;
End Architecture;



