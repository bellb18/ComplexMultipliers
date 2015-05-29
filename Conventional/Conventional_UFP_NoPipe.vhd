library ieee;
use ieee.std_logic_1164.all;
use work.ncl_signals.all;
use work.functions.all;

---------------------------------------------------------
-- Unpipelined Generic Conventional Complex Multiplier
-- Unfinished
---------------------------------------------------------

entity Conventional_UFP is
	generic(width : in integer := 8);
	port(Xr             : in  dual_rail_logic_vector(width - 1 downto 0);
		 Xi             : in  dual_rail_logic_vector(width - 1 downto 0);
		 Yi             : in  dual_rail_logic_vector(width - 1 downto 0);
		 Yr             : in  dual_rail_logic_vector(width - 1 downto 0);
		 ki, rst, sleep : in  std_logic;
		 Outr           : out dual_rail_logic_vector(width * 2 downto 0);
		 Outi           : out dual_rail_logic_vector(width * 2 downto 0);
		 sleepout, ko   : out std_logic);
end entity;

architecture arch_Conventional_UFP of Conventional_UFP is
	component addsw is
		generic(width : in integer := 8);
		port(x                : in  dual_rail_logic_vector(width - 1 downto 0);
			 y                : in  dual_rail_logic_vector(width - 1 downto 0);
			 ki, rst, sleepin : in  std_logic;
			 p                : out dual_rail_logic_vector(width downto 0);
			 sleepout         : out std_logic;
			 ko               : out std_logic);
	end component;

	component subsw is                  ---- X - Y
		generic(width : in integer := 8);
		port(x                : in  dual_rail_logic_vector(width - 1 downto 0);
			 y                : in  dual_rail_logic_vector(width - 1 downto 0);
			 ki, rst, sleepin : in  std_logic;
			 p                : out dual_rail_logic_vector(width downto 0);
			 sleepout         : out std_logic;
			 ko               : out std_logic);
	end component;

	component th22n_a is
		port(a   : in  std_logic;
			 b   : in  std_logic;
			 rst : in  std_logic;
			 z   : out std_logic);
	end component;

	component th22d_a is
		port(a   : in  std_logic;
			 b   : in  std_logic;
			 rst : in  std_logic;
			 z   : out std_logic);
	end component;

	component mult_genm is
		generic(width : in integer := 8);
		port(x                : in  dual_rail_logic_vector(7 downto 0);
			 y                : in  dual_rail_logic_vector(7 downto 0);
			 ki, rst, sleepin : in  std_logic;
			 p                : out dual_rail_logic_vector(15 downto 0);
			 sleepout         : out std_logic;
			 ko               : out std_logic);
	end component;

	signal kosub, koadd, sleepxrc, sleepxis, sleepxic, sleepxrs                         : std_logic;
	signal koxrc, koxis, koxic, koxrs, sleepinsub, sleepoutsub, sleepinadd, sleepoutadd : std_logic;
	signal koreal, koimag                                                               : std_logic;
	signal Xrcos, Xisin, Xicos, Xrsin                                                   : dual_rail_logic_vector(15 downto 0);

	signal Outreal, Outimag : dual_rail_logic_vector(16 downto 0);

begin
	Xrcosinst : mult_genm
		generic map(width)
		port map(Xr, Yr, kosub, rst, sleep, Xrcos, sleepxrc, koxrc);

	Xisininst : mult_genm
		generic map(width)
		port map(Xi, Yi, kosub, rst, sleep, Xisin, sleepxis, koxis);

	Xicosinst : mult_genm
		generic map(width)
		port map(Xi, Yr, koadd, rst, sleep, Xicos, sleepxic, koxic);

	Xrsininst : mult_genm
		generic map(width)
		port map(Xr, Yi, koadd, rst, sleep, Xrsin, sleepxrs, koxrs);

	XrcosMXisin : subsw
		generic map(16)
		port map(Xrcos, Xisin, ki, rst, sleepinsub, Outreal, sleepoutsub, kosub);

	XicosPXrsin : addsw
		generic map(16)
		port map(Xicos, Xrsin, ki, rst, sleepinadd, Outimag, sleepoutadd, koadd);

	Thsleepinadd : th22n_a port map(sleepxic, sleepxrs, rst, sleepinadd);
	Thsleepinsub : th22n_a port map(sleepxrc, sleepxis, rst, sleepinsub);

	Thsleepout : th22n_a port map(sleepoutadd, sleepoutsub, rst, sleepout);

	Thkoinreal : th22d_a port map(koxrc, koxis, rst, koreal);
	Thkoinimag : th22d_a port map(koxic, koxrs, rst, koimag);

	Thkoin : th22d_a port map(koreal, koimag, rst, ko);

	Outr <= Outreal;
	Outi <= Outimag;

end architecture arch_Conventional_UFP;