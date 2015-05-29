
-----------------------------------------^M
-- Definition of addsw  
-----------------------------------------^M

Library IEEE;
use IEEE.std_logic_1164.all;
use work.ncl_signals.all;
entity addsw is
	generic(width : in integer := 18);
	port(x                : in  dual_rail_logic_vector(width - 1 downto 0);
		 y                : in  dual_rail_logic_vector(width - 1 downto 0);
		 ki, rst, sleepin : in  std_logic;
		 p                : out dual_rail_logic_vector(width downto 0);
		 sleepout         : out std_logic;
		 ko               : out std_logic);
end;

architecture arch of addsw is
	component FAm
		port(CIN, X, Y : in  dual_rail_logic;
			 sleep     : in  std_logic;
			 COUT, S   : out dual_rail_logic);
	end component;

	component HAm
		port(X, Y    : in  dual_rail_logic;
			 sleep   : in  std_logic;
			 COUT, S : out dual_rail_logic);
	end component;

	component regm is
		port(a     : in  dual_rail_logic;
			 sleep : in  std_logic;
			 z     : out dual_rail_logic);
	end component;

	component MSBm is
		port(
			X     : IN  dual_rail_logic;
			Y     : IN  dual_rail_logic;
			Pre   : IN  dual_rail_logic;
			sleep : in  std_logic;
			P     : OUT dual_rail_logic); --*
	end component;

	component compm is
		generic(width : in integer := 4);
		port(a              : IN  dual_rail_logic_vector(width - 1 downto 0);
			 ki, rst, sleep : in  std_logic;
			 ko             : OUT std_logic);
	end component;

	component th22d_a is
		port(a   : in  std_logic;
			 b   : in  std_logic;
			 rst : in  std_logic;
			 z   : out std_logic);
	end component;

	signal ppt                      : dual_rail_logic_vector(2 * width - 1 downto 0);
	signal reg1out                  : dual_rail_logic_vector(2 * width - 1 downto 0);
	signal reg2in                   : dual_rail_logic_vector(2 * width downto 0);
	signal kor1, kor2, kor1a, kor1b : std_logic;

begin
	Row : for i in 0 to width - 1 generate
		ppt(i)         <= x(i);
		ppt(i + width) <= y(i);
	end generate;

	Gens0reg : for i in 0 to 2 * width - 1 generate
		Gs0reg : regm
			port map(ppt(i), kor1, reg1out(i));

	end generate;

	Gr0acomp : compm
		generic map(width)
		port map(x, kor2, rst, sleepin, kor1a);
	Gr0bcomp : compm
		generic map(width)
		port map(y, kor2, rst, sleepin, kor1b);

	THin0 : th22d_a
		port map(kor1a, kor1b, rst, kor1);

	--logic

	GFA0 : HAm
		port map(reg1out(width), reg1out(0), kor1, reg2in(1), reg2in(0));

	GenFA : for i in 1 to width - 1 generate
		GFA : FAm
			port map(reg1out(i), reg1out(i + width), reg2in(2 * i - 1), kor1, reg2in(2 * i + 1), reg2in(2 * i));
	end generate;
	--reg2in(2w-2) is final sum; reg2in(2w-1) is final carry; reg2in(2w) is signed extension bit.  
	SignedEX : MSBm
		port map(reg1out(width - 1), reg1out(2 * width - 1), reg2in(2 * width - 2), kor1, reg2in(2 * width));

	Gens1reg : for i in 0 to width - 1 generate
		Gs1reg : regm
			port map(reg2in(2 * i), kor2, P(i));
	end generate;

	Gswreg : regm
		port map(reg2in(2 * width), kor2, P(width));

	Gr1comp : compm
		generic map(2 * width + 1)
		port map(reg2in, ki, rst, kor1, kor2);

	ko       <= kor1;
	sleepout <= kor2;

end arch;