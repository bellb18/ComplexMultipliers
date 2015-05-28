use work.ncl_signals.all;
use work.functions.all;
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity TB_mult_gen is
end TB_mult_gen;

architecture tb_arch of TB_mult_gen is

  component mult_genm
  generic(width: in integer:= 8);
  port(a: in dual_rail_logic_vector (width-1 downto 0);
       b: in dual_rail_logic_vector (width-1 downto 0);
       reset: in std_logic;
       kOut: out std_logic;
       kIn: in std_logic;
	   inSleep: in std_logic;
	   outSleep: out std_logic;
       result: out dual_rail_logic_vector((width*2)-1 downto 0)
       );
end component;
  
  signal a_signal: dual_rail_logic_vector(7 downto 0);
  signal b_signal: dual_rail_logic_vector(7 downto 0);
  signal kOut_signal: std_logic;
  signal kIn_signal: std_logic;
  signal result_signal: dual_rail_logic_vector(15 downto 0);
  signal inSleep_signal: std_logic;
  signal outSleep_signal: std_logic;
  signal reset_signal: std_logic;
  
  signal inpA, inpB: std_logic_vector(7 downto 0);
  signal inCheckA, inCheckB: std_logic_vector(7 downto 0);
  signal outCheck: std_logic_vector(15 downto 0);
  signal checker: std_logic_vector(15 downto 0);
  
  begin
    
  uut: mult_genm
  generic map(8)
  port map(
    a => a_signal,
    b => b_signal,
	reset => reset_signal,
	kOut => kOut_signal,
	kIn => kIn_signal,
	inSleep => inSleep_signal,
	outSleep => outSleep_signal,
	result => result_signal
    );
    
  signal_tb: process
  begin
    
    inSleep_signal <= '1';
	reset_signal <= '1';
    inpA <= "00000000";
    inpB <= "00000000";
    wait until kOut_signal = '1';
    inSleep_signal <= '0';
	reset_signal <= '0';

    for j in 0 to 255 loop    
      for i in 0 to 255 loop    
        for k in 0 to 7 loop
          a_signal(k).rail0 <= not inpA(k);
          a_signal(k).rail1 <= inpA(k);
          b_signal(k).rail0 <= not inpB(k);
          b_signal(k).rail1 <= inpB(k);      
        end loop;
        wait until kOut_signal <= '0';
        inSleep_signal <= '1';
        inpB <= inpB + 1;
        wait until kOut_signal <= '1';
		inSleep_signal <= '0';
      end loop;
      inpA <= inpA + 1;
    end loop;
  end process;
  
  process(result_signal)
    begin
      if is_null(result_signal) then
        kIn_Signal <= '1';
      elsif is_data(result_signal) then
        kIn_Signal <= '0';
      end if;        
  end process; 
  

  --checking
  
  process(result_signal)
    begin
      if is_data(result_signal) then
        if inCheckA(0) = 'U' then
          inCheckA <= "00000000";
          inCheckB <= "00000000";
        elsif inCheckB = "11111111" then
          inCheckA <= inCheckA + 1;
          inCheckB <= inCheckB + 1;
        else
          inCheckB <= inCheckB + 1;
        end if;
        
        for i in 0 to 15 loop
          checker(i) <= result_signal(i).rail1;
        end loop;
      end if;
      if checker /= outCheck then
        report "incorrect";
      end if; 
    end process;
    
    process(inCheckA, inCheckB)
      begin
        if outCheck(0) <= 'U' then
          outCheck <= "0000000000000000";
        else
          outCheck <= inCheckA*inCheckB;
        end if;
      end process;
        
 end;
    
    





