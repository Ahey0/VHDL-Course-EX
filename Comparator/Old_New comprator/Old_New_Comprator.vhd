Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity OLD_New_Comprator is 
port (
      i    : in  Std_Logic_vector(7 downto 0 );
      clk  : in  Std_Logic;
      agtb : out Std_Logic;
      aeqb : out Std_Logic;
      altb : out Std_Logic
     );
End Entity;
Architecture OLD_New_Comprator_Behave OF OLD_New_Comprator is
Component Byte_Comprator_Flexable Is
      Port(
           A    :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0)    ;
           B    :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0)    ;
           GT   :  IN   STD_LOGIC                       ;
           EQ   :  IN   STD_LOGIC                       ;
           LT   :  IN   STD_LOGIC                       ;
           AGTB :  OUT  STD_LOGIC                       ;
           AEQB :  OUT  STD_LOGIC                       ;
           ALTB :  OUT  STD_LOGIC
           );
END Component;
--Signal A:   STD_LOGIC_VECTOR(7 DOWNTO 0)    ;
Signal B:   STD_LOGIC_VECTOR(7 DOWNTO 0)    ;
Component Byte_Latch is 
     port(
          A   : In  Std_Logic_vector(7 downto 0);
          O   : Out Std_Logic_vector(7 downto 0);
          Clk : in  std_logic
        );
End  Component;
Begin 
Q1 : Byte_Latch Port Map(i,B,clk);
Q2 : Byte_Comprator_Flexable port map (i,B,'0','1','0',agtb,aeqb,altb);
End;

--TB
Library Ieee;
Use Ieee.Std_Logic_1164.All;
Entity TB_OLD_New_Comprator is
End Entity;
Architecture TB_OLD_New_Comprator_Behave OF TB_OLD_New_Comprator is
Component OLD_New_Comprator
port (
      i    : in  Std_Logic_vector(7 downto 0 );
      clk  : in  Std_Logic;
      agtb : out Std_Logic;
      aeqb : out Std_Logic;
      altb : out Std_Logic
     );
End Component;
Signal i    : Std_Logic_vector(7 downto 0 );
Signal clk  : Std_Logic:='0';
Signal agtb : Std_Logic;
Signal aeqb : Std_Logic;
Signal altb : Std_Logic;
Begin
i <= "10100000","01000000" After 50 ns,"00000000" After 100 ns;
Process
  begin 
       clk <= not clk; 
       wait for 20 ns;
  End process;
QW1 : OLD_New_Comprator port map(i,clk,agtb,aeqb,altb);
End;