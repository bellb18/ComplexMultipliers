Library IEEE;
use IEEE.std_logic_1164.all;
use work.ncl_signals.all;
entity mult_genm is
	generic(width : in integer := 16);
	port(x                : in  dual_rail_logic_vector(width - 1 downto 0);
		 y                : in  dual_rail_logic_vector(width - 1 downto 0);
		 ki, rst, sleepin : in  std_logic;
		 p                : out dual_rail_logic_vector(2 * width - 1 downto 0);
		 sleepout         : out std_logic;
		 ko               : out std_logic);
end;

architecture arch of mult_genm is
	component FAm
		port(CIN, X, Y : in  dual_rail_logic;
			 sleep     : in  std_logic;
			 COUT, S   : out dual_rail_logic);
	end component;

	component CSAm is
		port(
			AI    : IN  dual_rail_logic;
			BI    : IN  dual_rail_logic;
			CIN   : IN  dual_rail_logic;
			SIN   : IN  dual_rail_logic;
			sleep : in  std_logic;
			COUT  : OUT dual_rail_logic;
			SOUT  : OUT dual_rail_logic);
	end component;

	component CSAm_inv is
		port(
			AI    : IN  dual_rail_logic;
			BI    : IN  dual_rail_logic;
			CIN   : IN  dual_rail_logic;
			SIN   : IN  dual_rail_logic;
			sleep : in  std_logic;
			COUT  : OUT dual_rail_logic;
			SOUT  : OUT dual_rail_logic);
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

	-- type pp_type is array(3 downto 0, 3 downto 0) of dual_rail_logic;
	type Ctype is array (width + 1 downto 0) of dual_rail_logic_vector(width downto 0);

	signal a, b : dual_rail_logic_vector(width - 1 downto 0);

	signal creg, sreg : Ctype;

	signal reg2in, reg2out : dual_rail_logic_vector(2 * width - 1 downto 0);
	signal kor1, kor2      : std_logic;

	signal sigdata0, sigdata1 : dual_rail_logic;

begin
	sigdata0.rail1 <= '0';
	sigdata0.rail0 <= '1';

	sigdata1.rail0 <= '0';
	sigdata1.rail1 <= '1';

	Ggnd : for i in 0 to width - 1 generate
		creg(0)(i)     <= sigdata0;
		sreg(0)(i)     <= sigdata0;
		sreg(i)(width) <= sigdata0;
	end generate;

	creg(0)(width) <= sigdata0;
	sreg(0)(width) <= sigdata0;

	Gens0reg : for i in 0 to width - 1 generate
		Gs0reg : regm
			port map(x(i), kor1, a(i));
		Gs0buf : regm                   --use Y as the coeffiency, so Y is always DATA, use bufm to generate the NULL. 
			port map(y(i), kor1, b(i));
	end generate;

	Gr1comp : compm
		generic map(width)
		port map(x, kor2, rst, sleepin, kor1);

	--logic
	GcsaX : for i in 0 to width - 2 generate
		GcsaY : for j in 0 to width - 1 generate
			notlast : if j < width - 1 generate
				Gcsa : CSAm
					port map(a(j), b(i), creg(i)(j), sreg(i)(j + 1), kor1, creg(i + 1)(j), sreg(i + 1)(j));
			end generate;
			last : if j = width - 1 generate
				Gcsa_inv : CSAm_inv
					port map(a(j), b(i), creg(i)(j), sreg(i)(j + 1), kor1, creg(i + 1)(j), sreg(i + 1)(j));
			end generate;
		end generate;
	end generate;

	GscalastY : for j in 0 to width - 1 generate
		notlast : if j < width - 1 generate
			Gcsa : CSAm_inv
				port map(a(j), b(width - 1), creg(width - 1)(j), sreg(width - 1)(j + 1), kor1, creg(width)(j), sreg(width)(j));
		end generate;
		last : if j = width - 1 generate
			Gcsa_inv : CSAm
				port map(a(j), b(width - 1), creg(width - 1)(j), sreg(width - 1)(j + 1), kor1, creg(width)(j), sreg(width)(j));
		end generate;
	end generate;

	creg(width + 1)(0) <= sigdata1;
	sreg(width)(width) <= sigdata1;

	Gfam : for i in 0 to width - 1 generate
		Gfa : FAm
			port map(creg(width + 1)(i), creg(width)(i), sreg(width)(i + 1), kor1, creg(width + 1)(i + 1), sreg(width + 1)(i));
	end generate;

	Gmreg : for i in 0 to width generate
		reg2in(i) <= sreg(i + 1)(0);

	end generate;

	Gmreg2 : for i in width + 1 to 2 * width - 1 generate
		reg2in(i) <= sreg(width + 1)(i - width);

	end generate;

	-- end of logic

	Gens1reg : for i in 0 to 2 * width - 1 generate
		Gs1reg : regm
			port map(reg2in(i), kor2, reg2out(i));
	end generate;

	G2comp : compm
		generic map(2 * width)
		port map(reg2in, ki, rst, kor1, kor2);

	ko       <= kor1;
	sleepout <= kor2;

	Gqformat : for i in 0 to 2 * width - 1 generate
		p(i) <= reg2out(i);

	end generate;

end arch;