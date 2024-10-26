Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity Shifter IS 
      Port(
           INS   : IN  STD_LOGIC   ;
           EN    : IN  STD_LOGIC   ;
           Reset : IN  STD_LOGIC   ;
           CLK   : IN  STD_LOGIC   ;
           OUTS  : OUT STD_LOGIC_VECTOR(7 Downto 0)   
           );
End Entity;
Architecture Shifter_Flow Of Shifter  is
Signal OUTS_S : STD_LOGIC_VECTOR(7 Downto 0):="00000000";
Begin 
    Q1: BLOCK (CLK = '0' AND NOT CLK'STABLE)
             BEGIN 
                  OUTS_S <= GUARDED "00000000" WHEN Reset  = '1' ELSE
                  INS & OUTS_S (7 DOWNTO 1)  WHEN EN     = '1' ELSE
                  UNAFFECTED;
         END BLOCK;
OUTS<=OUTS_S;
End Architecture;


--
Architecture Shifter_Structural Of Shifter  is
Component Der_Flop Is
      Port(
           IND    : IN  Std_Logic    ;
           EN     : IN  Std_Logic    ;
           Reset  : IN  Std_Logic    ;
           Clk    : IN  Std_Logic    ;
           OUTD   : Out Std_Logic:='0'    
           );
End Component;
Signal OUTS_S : STD_LOGIC_VECTOR(7 Downto 0):="00000000";
Begin

DERF7 : Der_Flop Port Map (INS      , EN , Reset , CLK , OUTS_S(7));
DERF6 : Der_Flop Port Map (OUTS_S(7), EN , Reset , CLK , OUTS_S(6));
DERF5 : Der_Flop Port Map (OUTS_S(6), EN , Reset , CLK , OUTS_S(5));
DERF4 : Der_Flop Port Map (OUTS_S(5), EN , Reset , CLK , OUTS_S(4));
DERF3 : Der_Flop Port Map (OUTS_S(4), EN , Reset , CLK , OUTS_S(3));
DERF2 : Der_Flop Port Map (OUTS_S(3), EN , Reset , CLK , OUTS_S(2));
DERF1 : Der_Flop Port Map (OUTS_S(2), EN , Reset , CLK , OUTS_S(1));
DERF0 : Der_Flop Port Map (OUTS_S(1), EN , Reset , CLK , OUTS_S(0));

OUTS <= OUTS_S;
End Architecture;