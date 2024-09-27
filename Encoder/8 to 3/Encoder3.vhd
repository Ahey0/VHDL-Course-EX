library Ieee;
use ieee.std_logic_1164.all;
Entity Encoder3 is
 port(
      sel : out  std_logic_vector(2 downto 0) ;
      o   : in   std_logic_vector(7 downto 0) 
      );
End Entity;
Architecture Encoder3_behave of Encoder3 is
Begin
    Sel <= 
           "000" when o = "00000001" else
           "001" when o = "0000001-" else
           "010" when o = "000001--" else
           "011" when o = "00001---" else
           "100" when o = "0001----" else
           "101" when o = "001-----" else
           "110" when o = "01------" else
           "111" when o = "1-------" else
           "ZZZ"                          ;
End Architecture;


