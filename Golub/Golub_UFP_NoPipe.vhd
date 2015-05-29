-- Not finished
library ieee;
use ieee.std_logic_1164.all;
use work.ncl_signals.all;
use work.functions.all;

entity Golub_UFP_NR is
port ( Xr: in dual_rail_logic_vector(7 downto 0);
       Xi: in dual_rail_logic_vector(7 downto 0);
       Yi: in dual_rail_logic_vector(7 downto 0);
       Yr: in dual_rail_logic_vector(7 downto 0);
       rst, sleep: in std_logic; 
       Outr: out dual_rail_logic_vector(16 downto 0);
       Outi:  out dual_rail_logic_vector(16 downto 0));
end entity;

architecture arch_Golub_UFP_NR of Golub_UFP_NR is

component addw is 
  generic(width: in integer := 8);
    port(x: in dual_rail_logic_vector(width-1 downto 0);
    y: in dual_rail_logic_vector(width-1 downto 0);
    rst, sleep: in std_logic;
    p: out dual_rail_logic_vector(width downto 0));
end component;  

component subsw is  ---- X - Y
  generic(width: in integer := 8);
    port(x: in dual_rail_logic_vector(width-1 downto 0);
    y: in dual_rail_logic_vector(width-1 downto 0);
    rst, sleep: in std_logic;
    p: out dual_rail_logic_vector(width downto 0));
end component; 

component multQ15 is 
   generic(width: in integer := 16);
  port(x: in dual_rail_logic_vector(width-1 downto 0);
    y: in dual_rail_logic_vector(width-1 downto 0);
    rst, sleep: in std_logic;
    p: out dual_rail_logic_vector(2*width-1 downto 0));
end component;


--signal sleepCNS, koCNS, sleepXrmXi, koXrmXi, sleepCMS, koCMS, sleepinS1: std_logic; --Stage_1_signals
--signal sleepCNSXr, koCNSXr, sleepXrmXiYr, koXrmXiYr, sleepCMSXi, koCMSXi, koS2, sleepinS2, kor1, kor2, kor3, ko_1, ko_2, ko_3: std_logic; --Stage_2_signals
--signal sleepoutsub, kosub, sleepoutadd, koadd, koS3: std_logic; --Stage_3_signals
signal CNS,XrmXi,CMS : dual_rail_logic_vector(8 downto 0); --Stage_1
signal CNSXr,XrmXiYr,CMSXi : dual_rail_logic_vector(17 downto 0); --Stage_2
signal Outreal,Outimag : dual_rail_logic_vector(18 downto 0); --Stage_3 
signal Xr9, Xr9_1, Yr9, Yr9_1, Xi9, Xi9_1 : dual_rail_logic_vector (8 downto 0);

begin
  
  Xr9(8) <= Xr(7);
  Xr9(7 downto 0) <= Xr;
  
  Yr9(8) <= Yr(7);
  Yr9(7 downto 0) <= Yr;
  
  Xi9(8) <= Xi(7);
  Xi9(7 downto 0) <= Xi;
  ------------------------------Stage_1----------------------------------------
  
  CPlusS: addw
      generic map(8)
         port map(Yr, Yi, rst, sleep, CNS); 
         
  XrMinusXi: subsw
      generic map(8)
         port map(Xr, Xi, rst, sleep, XrmXi);
         
  CMinusS: subsw
      generic map(8)
         port map(Yr, Yi, rst, sleep, CMS);   
         
   Xr9_1 <= Xr9;
   --Xrreg: genregm 
          --generic map(9)
         --port map(Xr9, kor1, Xr9_1);  
  Yr9_1 <= Yr9;
   --Yrreg: genregm 
      --generic map(9)
          --port map(Yr9, kor2, Yr9_1);  
   
   Xi9_1 <=Xi9;        
   --Xireg: genregm 
      --generic map(9)
          --port map(Xi9, kor3, Xi9_1);  
   
         
  --Stage1_ko_1: th22dx0 port map (koCNS, kor1, rst, ko_1);
  --Stage1_ko_2: th22dx0 port map (koXrmXi, kor2, rst, ko_2);
  --Stage1_ko_3: th22dx0 port map (koCMS, kor3, rst, ko_3);
  --Stage1_ko_TB: th33dx0 port map (ko_1, ko_2, ko_3, rst, ko);
         
  --Stage1_sleep: th33nx0 port map (sleepCNS, sleepXrmXi, sleepCMS, rst, sleepinS1); 
  
  -----------------------------Stage_2----------------------------------------       
         
  CNSMultXr: multQ15
      generic map(9)
         port map(CNS, Xr9_1, rst, sleep, CNSXr);   
                          

  XrmXiMultYr: multQ15
      generic map(9)   
         port map(XrmXi, Yr9_1, rst, sleep, XrmXiYr); 
         
  CMSMultXi: multQ15
      generic map(9)   
         port map(CMS, Xi9_1, rst, sleep, CMSXi); 
         
  --Stage2_ko: th33dx0 port map (koCNSXr, koXrmXiYr, koCMSXi, rst, koS2);
                  
  --Stage2_sleep: th33nx0 port map (sleepCNSXr, sleepXrmXiYr, sleepCMSXi, rst, sleepinS2);
  
  --------------------------Stage_3------------------------------------------ 
         
  Final_Out_Img: subsw
    generic map(18)
         port map(CNSXr, XrmXiYr, rst, sleep, Outimag);
                  
  Final_Out_real: addw
    generic map(18)
        port map(XrmXiYr, CMSXi, rst, sleep, Outreal);   
                  
  --Stage3_ko: th22dx0 port map (kosub, koadd, rst, koS3);
                  
  --Stage3_sleep: th22nx0 port map (sleepoutsub, sleepoutadd, rst, sleepout);  
  
  ------------------------Final_Output---------------------------------------     

  Outr <= Outreal(16 downto 0);
  Outi <= Outimag(16 downto 0);


     --debuger: process(CNS,XrmXi,CMS, Xr9, Yr9, Xi9, CNSXr, XrmXiYr, CMSXi)
        --variable dCNS, dXrmXi, dCMS, dXr9, dYr9, dXi9: STD_LOGIC_VECTOR(8 downto 0);
        --variable dCNSXr, dXrmXiYr, dCMSXi: STD_LOGIC_VECTOR(17 downto 0);
  --variable dXrcos, dXisin, dXrsin, dXicos, dOutr, dOuti: STD_LOGIC_VECTOR(15 downto 0);


  --begin


  --dCNS := to_SL(CNS);
  --dXrmXi := to_SL(XrmXi);
  --dCMS := to_SL(CMS);
  --dXr9 := to_SL(Xr9);
  --dYr9 := to_SL(Yr9);
  --dXi9 := to_SL(Xi9);
  --dCNSXr := to_SL(CNSXr);
  --dXrmXiYr := to_SL(XrmXiYr);
  --dCMSXi := to_SL(CMSXi);

  --end process;
  
end architecture arch_Golub_UFP_NR;