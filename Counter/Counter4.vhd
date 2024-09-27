library Ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_Unsigned.all;
Entity Counter4 is
port( 
     clk   : in  std_logic                    ;
     clear : in  std_logic                    ;
     En    : in  std_logic                    ;
     Cout  : out std_logic_vector(3 downto 0) 
     );
End Entity;
Architecture Counter4_behave of Counter4 is
Signal S_Counter : std_logic_vector(3 downto 0):="0000" ;
Begin
Process(clk)
variable  SS_Counter : std_logic_vector(3 downto 0):="0000" ;
    Begin
         if clk'event and clk='1' then
            if EN='1' then
             if clear='1' then
                S_Counter <= "0000" ;
                SS_Counter:= "0000" ;
             else
                S_Counter  <=  SS_Counter    ;
                SS_Counter :=  SS_Counter + "0001" ;
             end if;
            elsif EN='0' then
                S_Counter <= "0000" ;
                SS_Counter:= "0000" ;
            End if;
         end if;
	end process;
Cout<= S_Counter;
End Architecture;
