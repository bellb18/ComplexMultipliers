library ieee;
use ieee.std_logic_1164.all;
use work.ncl_signals.all;
use work.functions.all;
use work.MTNCL_gates.all;

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
	component CLA_genm is
		generic(width : integer := 8);
		port(
			xi    : in  dual_rail_logic_vector(width - 1 downto 0);
			yi    : in  dual_rail_logic_vector(width - 1 downto 0);
			sleep : in  std_logic;
			sum   : out dual_rail_logic_vector(width downto 0)
		);
	end component;

	component subsm is
		generic(width : in integer := 8);
		port(x     : in  dual_rail_logic_vector(width - 1 downto 0);
			 y     : in  dual_rail_logic_vector(width - 1 downto 0);
			 sleep : in  std_logic;
			 p     : out dual_rail_logic_vector(width downto 0));
	end component;

	component mult_genm is
		generic(width : in integer := 8);
		port(x     : in  dual_rail_logic_vector(7 downto 0);
			 y     : in  dual_rail_logic_vector(7 downto 0);
			 sleep : in  std_logic;
			 p     : out dual_rail_logic_vector(15 downto 0));
	end component;

	component regm is
		port(a     : in  dual_rail_logic;
			 sleep : in  std_logic;
			 z     : out dual_rail_logic);
	end component;

	component compm is
		generic(width : in integer := 4);
		port(a              : IN  dual_rail_logic_vector(width - 1 downto 0);
			 ki, rst, sleep : in  std_logic;
			 ko             : OUT std_logic);
	end component;

	signal Xrcos, Xisin, Xicos, Xrsin     : dual_rail_logic_vector(2 * width - 1 downto 0);
	signal Xr_reg, Yr_reg, Xi_reg, Yi_reg : dual_rail_logic_vector(width - 1 downto 0);
	signal k_temp, ko_temp                : std_logic; --ko(1-2) output of output register, ki(1-4) output of input register
	signal Outreal, Outimag               : dual_rail_logic_vector(2 * width downto 0);
	signal Out_Bus						  : dual_rail_logic_vector(4 * width + 1 downto 0);
	signal In_Bus						  : dual_rail_logic_vector(4 * width - 1 downto 0);

begin

	--Input Registers
	InRegGen : for i in 0 to width - 1 generate
		XrReg : regm
			port map(Xr(i), ko_temp, Xr_reg(i));
		XiReg : regm
			port map(Xi(i), ko_temp, Xi_reg(i));
		YrReg : regm
			port map(Yr(i), ko_temp, Yr_reg(i));
		YiReg : regm
			port map(Yi(i), ko_temp, Yi_reg(i));
	end generate;
	
	In_Bus <= Xi & Xr & Yi & Yr;
	Out_Bus <= Outreal & Outimag;

	compm_IN : compm
		generic map(4 * width)
		port map(In_Bus, k_temp, rst, sleep, ko_temp);

	ko       <= ko_temp;
	sleepout <= k_temp;

	--Output Registers
	OutRegGen : for i in 0 to 2 * width generate
		OutrReg : regm
			port map(Outreal(i), k_temp, Outr(i));
		OutiReg : regm
			port map(Outimag(i), k_temp, Outi(i));
	end generate;

	compm_OUT : compm
		generic map(4 * width + 2)
		port map(Out_Bus, ki, rst, ko_temp, k_temp);

	Xrcosinst : mult_genm
		generic map(width)
		port map(Xr_reg, Yr_reg, ko_temp, Xrcos);

	Xisininst : mult_genm
		generic map(width)
		port map(Xi_reg, Yi_reg, ko_temp, Xisin);

	Xicosinst : mult_genm
		generic map(width)
		port map(Xi_reg, Yr_reg, ko_temp, Xicos);

	Xrsininst : mult_genm
		generic map(width)
		port map(Xr_reg, Yi_reg, ko_temp, Xrsin);

	XrcosMXisin : subsm
		generic map(16)
		port map(Xrcos, Xisin, ko_temp, Outreal);

	XicosPXrsin : CLA_genm
		generic map(16)
		port map(Xicos, Xrsin, ko_temp, Outimag);

end architecture arch_Conventional_UFP;