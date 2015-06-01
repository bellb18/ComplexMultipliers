Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use work.ncl_signals.all;
use work.functions.all;

use ieee.math_real.all;

entity tb_cla_add_genm is
end;

architecture arch of tb_cla_add_genm is
	signal X, Y : DUAL_RAIL_LOGIC_VECTOR(7 downto 0);
	signal P    : DUAL_RAIL_LOGIC_VECTOR(8 downto 0);

	signal sleep : std_logic;

	component cla_rca_4bm is
	generic(width : integer := 8);
	port(
		xi    : in  dual_rail_logic_vector(width - 1 downto 0);
		yi    : in  dual_rail_logic_vector(width - 1 downto 0);
		sleep : in  std_logic;
		sum   : out dual_rail_logic_vector(width - 1 downto 0)
	);
	end component;

begin
	DUT : cla_rca_4bm
		generic map(8)
		port map(X, Y, sleep, P);

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

		sleep <= '1';
		wait for 40 ns;

		for j in 0 to 255 loop
			for i in 0 to 255 loop
				sleep <= '0';
				wait for 1 ns;
				for k in 0 to 7 loop
				
					X   <= Int_to_DR(i, 8);
					Y   <= Int_to_DR(j, 8);
					Xin := conv_std_logic_vector(i, 8);
					Yin := conv_std_logic_vector(j, 8);
				end loop;
				
				wait for 40 ns;

				sleep <= '1';
				wait for 1 ns;
				
				for i in 0 to 7 loop
					X(i).rail1 <= '0';
					X(i).rail0 <= '0';
					Y(i).rail1 <= '0';
					Y(i).rail0 <= '0';
				end loop;

				wait for 40 ns;

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
	
end arch;