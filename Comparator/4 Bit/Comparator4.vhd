Library Ieee;
Use Ieee.Std_Logic_1164.all;
Use Ieee.Std_Logic_Unsigned.all;
Entity Comparator4 is
   Port(
         IN1     :  in   std_logic_vector(3 downto 0 )  ;
         IN2     :  in   std_logic_vector(3 downto 0 )  ;
         GRT     :  out  std_logic  ;
         Equal   :  out  std_logic  ;
         Smaller :  out  std_logic  
        );
End Entity;
Architecture Comparator4_Behave of Comparator4 is
Signal g1,g2,g3,g0   : std_logic ;
Signal S1,S2,S3,S0   : std_logic ;
Signal S32,S321,S3210: Std_logic ;
Signal G32,G321,G3210: Std_logic ;
Signal S_IN1 , S_IN2 : std_logic_vector(3 downto 0) ;
Begin
            S3 <= ( Not IN1(3) ) and IN2(3)  ;
            g3 <= ( Not IN2(3) ) and IN1(3)  ;
            S2 <= ( Not IN1(2) ) and IN2(2)  ;
            g2 <= ( Not IN2(2) ) and IN1(2)  ;
            S1 <= ( Not IN1(1) ) and IN2(1)  ;
            g1 <= ( Not IN2(1) ) and IN1(1)  ;
            S0 <= ( Not IN1(0) ) and IN2(0)  ;
            g0 <= ( Not IN2(0) ) and IN1(0)  ;
            S32 <= S3 and S2                ;
            S321<= S3 and S2 and S1         ;
            S3210<= S3 and S2 and S1 and S0 ;
            G32  <= G3 and G2               ;
            G321 <= G3 and G2 and G1        ;
            G3210<= G3 and G2 and G1 and G0 ;
   Process ( IN1 , IN2 )
        Begin
          S_IN1 <= IN1  ;
          S_IN2 <= IN2  ;
             if S_IN1=S_IN2 then 
                Equal <= '1'    ; 
             else  
                Equal <= '0'    ;
             End if;
             if  g3='1' then
               GRT <= '1' ;
             elsif g2='1' and S32='0'   then 
               GRT <= '1' ;
             elsif g1='1' and S321='0'  then 
               GRT <= '1' ;
             elsif g0='1' and S3210='0' then
               GRT <= '1' ;
             else
               GRT <= '0' ;
             end if;
             if  S3='1' then 
                Smaller <= '1' ;
             elsif S2='1' and G32='0'   then 
                Smaller <= '1' ;
             elsif S1='1' and G321='0'  then 
                Smaller <= '1' ;
             elsif S0='1' and G3210='0' then
                Smaller <= '1' ;
             else
                Smaller <= '0' ;
             end if;
       End process;
end Architecture;

