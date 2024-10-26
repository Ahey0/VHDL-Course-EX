Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity Der_Flop Is
      Port(
           IND    : IN  Std_Logic    ;
           EN     : IN  Std_Logic    ;
           Reset  : IN  Std_Logic    ;
           Clk    : IN  Std_Logic    ;
           OUTD   : Out Std_Logic:='0'    
           );
End Entity;
Architecture Der_Flop_Behave Of Der_Flop  is
Begin 
     Process(Clk)
            Begin
                 If Clk'event And Clk='1' Then 
                    If Reset='1' Then 
                       OUTD <= '0'    ;
                    Else 
                       If En='1' Then
                           OUTD <= IND ;
                       End If;
                    End IF;
                 End If;
      End process;
End Architecture;

-- Structral 
Architecture Der_Flop_Structral Of Der_Flop  is
Component  Mux2 is
  port (
         Inmux0 : in  Std_Logic                      ;
         Inmux1 : in  Std_Logic                      ;
         OutMux : out Std_Logic                      ;
         Selmux : in  Std_Logic
        );
End Component;
Component Dff_r is
   port (
         ind   : in  std_logic  ;
         outd  : out std_logic  ;
         Reset : In  std_logic  ;
         clk   : in  std_logic
         );
End Component;
Signal D_K_S : STD_LOGIC ;
Signal D_S   : STD_LOGIC ;
Begin
M1 : Mux2  Port Map(D_K_S,IND,D_S,EN);
D1 : Dff_r Port Map(D_S,D_K_S,Reset,Clk);
OUTD <= D_K_S ;
End Architecture;