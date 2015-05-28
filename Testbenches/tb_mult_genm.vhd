Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use work.ncl_signals.all;
use work.functions.all;

use ieee.math_real.all;

entity tb_mult_genm is
end;

architecture arch of tb_mult_genm is
	signal X, Y : DUAL_RAIL_LOGIC_VECTOR(7 downto 0);
	signal P    : DUAL_RAIL_LOGIC_VECTOR(15 downto 0);

	signal ki, rst, sleepin : std_logic;
	signal sleepout, ko     : std_logic;

	component mult_genm is
	generic(width : in integer := 16);
	port(x                : in  dual_rail_logic_vector(width - 1 downto 0);
		 y                : in  dual_rail_logic_vector(width - 1 downto 0);
		 ki, rst, sleepin : in  std_logic;
		 p                : out dual_rail_logic_vector(2 * width - 1 downto 0);
		 sleepout         : out std_logic;
		 ko               : out std_logic);
	end component;

begin
	CUT : mult_genm
		generic map(8)
		port map(X, Y, ki, rst, sleepin, P, sleepout, ko);

	inputs : process
		variable Xin       : STD_LOGIC_VECTOR(7 downto 0);
		variable Yin       : STD_LOGIC_VECTOR(7 downto 0);

	begin
		for i in 0 to 7 loop
			X(i).rail1 <= '0';
			X(i).rail0 <= '0';
			Y(i).rail1 <= '0';
			Y(i).rail0 <= '0';
		end loop;

		rst     <= '1';
		sleepin <= '1';
		wait for 50 ns;
		rst <= '0';

		for j in 0 to 255 loop
			for i in 0 to 255 loop
				sleepin <= '0';
				wait for 1 ns;
				for k in 0 to 7 loop
				
					X   <= Int_to_DR(i, 8);
					Y   <= Int_to_DR(j, 8);
					Xin := conv_std_logic_vector(i, 8);
					Yin := conv_std_logic_vector(j, 8);
				end loop;
				wait until ko = '0';

				wait for 1 ns;

				sleepin <= '1';
				wait for 1 ns;
				
				for i in 0 to 7 loop
					X(i).rail1 <= '0';
					X(i).rail0 <= '0';
					Y(i).rail1 <= '0';
					Y(i).rail0 <= '0';
				end loop;

				wait until ko = '1';
				wait for 1 ns;

			end loop;
		end loop;

		for i in 0 to 7 loop
			X(i).rail1 <= '1';
			X(i).rail0 <= '0';
			Y(i).rail1 <= '1';
			Y(i).rail0 <= '0';
		end loop;
		wait;

	end process;

	outputs : process(P)
		variable Pout : STD_LOGIC_VECTOR(15 downto 0);

	begin
		if is_data(P) then
			ki   <= '0';
			Pout := to_SL(P);

		end if;

		if is_null(P) then
			ki <= '1';

		end if;

	end process;
	
end arch;