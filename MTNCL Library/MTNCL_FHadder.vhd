
-----------------------------------------
-- Definition of  full_add
-----------------------------------------
use work.ncl_signals.all;
library ieee;
use ieee.std_logic_1164.all;

-- MTNCL Full Adder
entity FAm is
   port (
         CIN : IN dual_rail_logic ;
         X: IN dual_rail_logic ;
         Y: IN dual_rail_logic ;
         sleep: in std_logic;
         COUT: OUT dual_rail_logic ;
         S      : OUT dual_rail_logic );
end FAm ;

architecture archthfax0 of FAm is

component th23m is
       port(a: in std_logic;
            b: in std_logic;
            c: in std_logic;
      s:in std_logic;
           z: out std_logic );
   end component;

component th34w2m is
       port(a: in std_logic;
           b: in std_logic;
            c: in std_logic;
            d: in std_logic;
      s:in std_logic;
           z: out std_logic );
   end component;


        signal s0_buffer: std_logic;
        signal s1_buffer: std_logic;
        signal y0_buffer: std_logic;
        signal y1_buffer: std_logic;

       

begin
        S.rail0 <= s0_buffer;
        S.rail1 <= s1_buffer;
        COUT.rail0 <= y0_buffer;
        COUT.rail1 <= y1_buffer;
        th0: th23m
                port map(X.rail0,
                         Y.rail0,
                         CIN.rail0,
                         sleep,
                         y0_buffer);--#
        th1: th23m
                port map(X.rail1,
                         Y.rail1,
                         CIN.rail1,
                         sleep,
                         y1_buffer);--#
        th2: th34w2m
                port map(y0_buffer,
                         X.rail1,
                         Y.rail1,
                         CIN.rail1,
                         sleep,
                         s1_buffer);--#

        th3: th34w2m
                port map(y1_buffer,
                         X.rail0,
                         Y.rail0,
                         CIN.rail0,
                         sleep,
                         s0_buffer);--#

end archthfax0;

-----------------------------------------
-- Definition of  half_add
-----------------------------------------
use work.ncl_signals.all;
library ieee;
use ieee.std_logic_1164.all;

-- MTNCL Half Adder
entity HAm is
   port (
         X: IN dual_rail_logic ;
         Y: IN dual_rail_logic ;
         sleep: in std_logic;
         COUT: OUT dual_rail_logic ;
         S      : OUT dual_rail_logic );--*
end HAm ;
architecture arch of HAm is

component th12m is
       port(a: in std_logic;
            b: in std_logic;
           s:in std_logic;
            z: out std_logic);
   end component;

component th22m is
       port(a: in std_logic;
            b: in std_logic;
      s:in std_logic;
           z: out std_logic );
   end component;

component th24compm is
       port(a: in std_logic;
            b: in std_logic;
            c: in std_logic;
            d: in std_logic;
            s:in std_logic;
	   z: out std_logic );
   end component;
       
begin
   g0: th12m port map(
                X.rail0,
                Y.rail0,
                sleep,
                COUT.rail0);

   g1: th22m port map(
                 X.rail1,
                 Y.rail1,
                 sleep,
                 COUT.rail1);
                 
   g2: th24compm port map(
                 X.rail0,
                 Y.rail1,
                 Y.rail0,
                 X.rail1,
                 sleep,
                 S.rail0);

   g3: th24compm port map(
                 X.rail0,
                 Y.rail0,
                 Y.rail1,
                 X.rail1,
                 sleep,
                 S.rail1);
end arch;


library ieee;
use ieee.std_logic_1164.all;
use work.ncl_signals.all;

---------------------------------------------------
-- NCL Full adder with Cin = '1'
-- Similar to Half Adder, used by the substractor
---------------------------------------------------
entity FAm1 is
  port(X: dual_rail_logic;
       Y: in dual_rail_logic;
       sleep: in std_logic;
       COUT: out dual_rail_logic;
       S   : out dual_rail_logic);
end FAm1;

architecture arch of FAm1 is
  component th22m
    port(a, b: in std_logic;
	s: in std_logic;
      z: out std_logic);
  end component;
  
  component th12m
    port(a, b: in std_logic;
	s: in std_logic;
      z: out std_logic);
  end component;
  
  component th24compm
    port(a, b, c, d: in std_logic;
	 s : in std_logic;
            z: out std_logic);
  end component;
  
   signal Cmid: dual_rail_logic;

begin
  cout0: th12m
    port map(X.rail0, Y.rail0, sleep,  Cmid.rail0);
  cout1: th22m
    port map(X.rail1, Y.rail1, sleep, Cmid.rail1); --tricky here!! Previous design has a bug.
  --cout1: th22m
  --  port map(X.rail1, X.rail1, sleep, Cmid.rail1); --tricky here!! Previous design has a bug.

      COUT.rail1 <= Cmid.rail0;
      COUT.rail0 <= Cmid.rail1;
  
  --cout1: thand0x0
  --	port map(a.rail1, b.rail1, a.rail0, b.rail0, cout.rail1);
    
  sum0: th24compm
    port map(X.rail0, Y.rail0, Y.rail1, X.rail1, sleep, S.rail0);
    
  sum1: th24compm
    port map(X.rail0, Y.rail1, Y.rail0, X.rail1, sleep,  S.rail1);
  
end arch;


-----------------------------------------^M
-- Definition of and2i  (incomplete AND)
-- used by the first stage of multipler
-----------------------------------------^M
--
use work.ncl_signals.all;
library ieee;
use ieee.std_logic_1164.all;


entity and2im is
   port (a: IN dual_rail_logic ;
         b: IN dual_rail_logic ;
         sleep: in std_logic;
         z: OUT dual_rail_logic);--*
end and2im;

architecture arch of and2im is

component th12m is
       port(a: in std_logic;
            b: in std_logic;
           s:in std_logic;
            z: out std_logic);
   end component;

component th22m is
       port(a: in std_logic;
            b: in std_logic;
      s:in std_logic;
           z: out std_logic );
   end component;
        
begin
   g0: th12m port map(
                a.rail0,
                b.rail0,
                sleep,
                z.rail0);--#

   g1: th22m port map(
                a.rail1,
                b.rail1,
                sleep,
                z.rail1);--#
end arch;

---------------------------------------
--- Invertor NCL
--- used by the substractor
---------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.ncl_signals.all;

entity NCL_inv is
   port (x: IN dual_rail_logic ;
         y: OUT dual_rail_logic); 
end NCL_inv;

architecture arch_invertor of NCL_inv is 

begin
  
  y.rail0 <= x.rail1;
  y.rail1 <= x.rail0;
  
end arch_invertor;


