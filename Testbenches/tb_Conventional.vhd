Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use work.ncl_signals.all;
use work.functions.all;

use ieee.math_real.all;

entity tb_Conventional is
end;

architecture arch of tb_Conventional is
	signal Xi, Yi : DUAL_RAIL_LOGIC_VECTOR(7 downto 0);
	signal Xr, Yr : DUAL_RAIL_LOGIC_VECTOR(7 downto 0);
	signal Pr, Pi : DUAL_RAIL_LOGIC_VECTOR(16 downto 0);
	signal ki, rst, sleepin : std_logic;
	signal sleepout, ko     : std_logic;

	component Conventional_UFP is
		generic(width : in integer := 8);
		port(Xr             : in  dual_rail_logic_vector(width - 1 downto 0);
			 Xi             : in  dual_rail_logic_vector(width - 1 downto 0);
			 Yi             : in  dual_rail_logic_vector(width - 1 downto 0);
			 Yr             : in  dual_rail_logic_vector(width - 1 downto 0);
			 ki, rst, sleep : in  std_logic;
			 Outr           : out dual_rail_logic_vector(width * 2 downto 0);
			 Outi           : out dual_rail_logic_vector(width * 2 downto 0);
			 sleepout, ko   : out std_logic);
	end component;

begin
	CUT : Conventional_UFP
		generic map(8)
		port map(Xr, Xi, Yi, Yr, ki, rst, sleepin, Pr, Pi, sleepout, ko);

	inputs : process
	begin
		for i in 0 to 7 loop
			Xi(i).rail1 <= '0';
			Xi(i).rail0 <= '0';
			Yi(i).rail1 <= '0';
			Yi(i).rail0 <= '0';
			Xr(i).rail1 <= '0';
			Xr(i).rail0 <= '0';
			Yr(i).rail1 <= '0';
			Yr(i).rail0 <= '0';
		end loop;

		rst     <= '1';
		sleepin <= '1';
		wait for 50 ns;
		rst <= '0';

--Start "loop"
		sleepin <= '0';
		wait for 1 ns;
		-- Data Here
		Xi <= Int_to_DR(4, 8);
		Xr <= Int_to_DR(-6, 8);
		Yi <= Int_to_DR(6, 8);
		Yr <= Int_to_DR(3, 8);
		
		wait until ko = '0';

		wait for 1 ns;

		sleepin <= '1';
		wait for 1 ns;

		for i in 0 to 7 loop
			Xi(i).rail1 <= '0';
			Xi(i).rail0 <= '0';
			Yi(i).rail1 <= '0';
			Yi(i).rail0 <= '0';
			Xr(i).rail1 <= '0';
			Xr(i).rail0 <= '0';
			Yr(i).rail1 <= '0';
			Yr(i).rail0 <= '0';
		end loop;

		wait until ko = '1';
		wait for 1 ns;
	
-- End "loop"

sleepin <= '0';
		wait for 1 ns;
		-- Data Here
		Xi <= Int_to_DR(127, 8);
		Xr <= Int_to_DR(-6, 8);
		Yi <= Int_to_DR(-20, 8);
		Yr <= Int_to_DR(-2, 8);
		
		wait until ko = '0';

		wait for 1 ns;

		sleepin <= '1';
		wait for 1 ns;

		for i in 0 to 7 loop
			Xi(i).rail1 <= '0';
			Xi(i).rail0 <= '0';
			Yi(i).rail1 <= '0';
			Yi(i).rail0 <= '0';
			Xr(i).rail1 <= '0';
			Xr(i).rail0 <= '0';
			Yr(i).rail1 <= '0';
			Yr(i).rail0 <= '0';
		end loop;

		wait until ko = '1';
		wait for 1 ns;
		
		sleepin <= '0';
		wait for 1 ns;
		-- Data Here
		Xi <= Int_to_DR(127, 8);
		Xr <= Int_to_DR(10, 8);
		Yi <= Int_to_DR(-6, 8);
		Yr <= Int_to_DR(3, 8);
		
		wait until ko = '0';

		wait for 1 ns;

		sleepin <= '1';
		wait for 1 ns;

		for i in 0 to 7 loop
			Xi(i).rail1 <= '0';
			Xi(i).rail0 <= '0';
			Yi(i).rail1 <= '0';
			Yi(i).rail0 <= '0';
			Xr(i).rail1 <= '0';
			Xr(i).rail0 <= '0';
			Yr(i).rail1 <= '0';
			Yr(i).rail0 <= '0';
		end loop;

		wait until ko = '1';
		wait for 1 ns;
		
		sleepin <= '0';
		wait for 1 ns;
		-- Data Here
		Xi <= Int_to_DR(-2, 8);
		Xr <= Int_to_DR(4, 8);
		Yi <= Int_to_DR(16, 8);
		Yr <= Int_to_DR(-3, 8);
		
		wait until ko = '0';

		wait for 1 ns;

		sleepin <= '1';
		wait for 1 ns;

		for i in 0 to 7 loop
			Xi(i).rail1 <= '0';
			Xi(i).rail0 <= '0';
			Yi(i).rail1 <= '0';
			Yi(i).rail0 <= '0';
			Xr(i).rail1 <= '0';
			Xr(i).rail0 <= '0';
			Yr(i).rail1 <= '0';
			Yr(i).rail0 <= '0';
		end loop;

		wait until ko = '1';
		wait for 1 ns;
		

		for i in 0 to 7 loop
			Xi(i).rail1 <= '1';
			Xi(i).rail0 <= '0';
			Yi(i).rail1 <= '1';
			Yi(i).rail0 <= '0';
			Xr(i).rail1 <= '1';
			Xr(i).rail0 <= '0';
			Yr(i).rail1 <= '1';
			Yr(i).rail0 <= '0';
		end loop;
		wait;

	end process;


	outputs : process(Pr, Pi)
	begin
		if is_data(Pr & Pi) then
			ki   <= '0';
		end if;

		if is_null(Pr & Pi) then
			ki <= '1';
		end if;

	end process;

end arch;