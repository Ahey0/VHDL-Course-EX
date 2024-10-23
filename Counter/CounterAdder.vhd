library Ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_Unsigned.all;
Entity CounterAdder is
port( 
     clk   : in  std_logic                    ;
     En    : In  Std_Logic                    ;
     Reset : in  std_logic                    ;
     Cout  : out std_logic
     );
End Entity;
Architecture CounterAdder_behave of CounterAdder is
Begin
    Process(clk)
      variable  S_Counter : Integer range 0 to 8 :=0 ;
        Begin
         if clk'event and clk='1' then
           If En='1' Then
            If  Reset='1' Then
               S_Counter := 0 ;
               Cout <= '0'    ;
            Else 
                If S_Counter = 8 Then
                   S_Counter := 0 ;
                   Cout <= '0'    ;
                Else 
                   S_Counter := S_Counter +1 ;
                   Cout <= '1' ;
                End If;
            End If;
           Else 
            S_Counter := 0 ;
               Cout <= '0' ; 
           End If;
          End If; 
    end process;
End Architecture;

