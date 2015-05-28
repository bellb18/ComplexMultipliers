----------------------------------------------------------- 
-- regm
-----------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.ncl_signals.all;
entity regm is
	port(a     : in  dual_rail_logic;
		 sleep : in  std_logic;
		 z     : out dual_rail_logic);
end regm;

architecture arch of regm is
	component th12m_a is
		port(a : in  std_logic;
			 b : in  std_logic;
			 s : in  std_logic;
			 z : out std_logic);
	end component;

	signal t0, t1 : std_logic;
begin
	Gr0 : th12m_a
		port map(a.rail0, t0, sleep, t0);
	Gr1 : th12m_a
		port map(a.rail1, t1, sleep, t1);

	z.rail0 <= t0;
	z.rail1 <= t1;

end arch; 