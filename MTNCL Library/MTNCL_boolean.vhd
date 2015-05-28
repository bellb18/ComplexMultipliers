-----------------------------------------^M
-- Definition of and2i  (incomplete AND)
-- used by the first stage of multipler
-----------------------------------------^M
--
use work.ncl_signals.all;
library ieee;
use ieee.std_logic_1164.all;

entity and2im is
	port(a     : IN  dual_rail_logic;
		 b     : IN  dual_rail_logic;
		 sleep : in  std_logic;
		 z     : OUT dual_rail_logic);  --*
end and2im;

architecture arch of and2im is
	component th12m is
		port(a : in  std_logic;
			 b : in  std_logic;
			 s : in  std_logic;
			 z : out std_logic);
	end component;

	component th22m is
		port(a : in  std_logic;
			 b : in  std_logic;
			 s : in  std_logic;
			 z : out std_logic);
	end component;

begin
	g0 : th12m port map(
			a.rail0,
			b.rail0,
			sleep,
			z.rail0);                   --#

	g1 : th22m port map(
			a.rail1,
			b.rail1,
			sleep,
			z.rail1);                   --#
end arch;

---------------------------------------
--- Invertor NCL
--- used by the substractor
---------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.ncl_signals.all;

entity NCL_inv is
	port(x : IN  dual_rail_logic;
		 y : OUT dual_rail_logic);
end NCL_inv;

architecture arch_invertor of NCL_inv is
begin
	y.rail0 <= x.rail1;
	y.rail1 <= x.rail0;

end arch_invertor;