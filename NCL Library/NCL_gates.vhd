-- delays based on physical-level simulations of static gates designed with 1.8V, 0.18um technology

  ------------------------------------- 
  -- invx0_a 
  ------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity invx0_a is 
      port(a: in std_logic; 
           z: out std_logic); 
  end invx0_a; 

  architecture archinvx0_a of invx0_a is 
  begin 
      invx0_a: process(a) 
      begin 
        if a = '0' then 
           z <= '1' after 1 ns; 
        elsif a = '1' then 
           z <= '0' after 1 ns; 
        else 
           z <= not a; 
        end if; 
      end process; 
  end archinvx0_a; 
  
  ------------------------------------- 
  -- th12bx0_a 
  ------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th12bx0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           zb: out std_logic); 
  end th12bx0_a; 

  architecture archth12bx0_a of th12bx0_a is 
  begin 
     th12bx0_a: process(a, b) 
     begin 
        if a = '0' and b = '0' then 
           zb <= '1' after 1 ns; 
        elsif a = '1' or b = '1' then 
           zb <= '0' after 3 ns; 
        else 
           zb <= a nor b; 
        end if; 
     end process; 
  end archth12bx0_a; 


  ----------------------------------------------------------- 
  -- th12x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th12x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           z: out std_logic); 
  end th12x0_a; 

  architecture archth12x0_a of th12x0_a is 
  begin 
     th12x0_a: process(a, b) 
     begin 
        if a = '0' and b = '0' then 
           z <= '0' after 2 ns; 
        elsif a = '1' or b = '1' then 
           z <= '1' after 8 ns; 
        else 
           z <= a or b; 
       end if; 
     end process; 
  end archth12x0_a; 


  ------------------------------------- 
  -- th13bx0_a 
  ------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th13bx0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           zb: out std_logic); 
  end th13bx0_a; 

  architecture archth13bx0_a of th13bx0_a is 
  begin 
     th13bx0_a: process(a,b,c) 
     begin 
        if a = '0' and b = '0' and c= '0' then 
           zb <= '1' after 3 ns; 
        elsif a = '1' or b = '1' or c= '1' then 
           zb <= '0' after 3 ns; 
        else 
           zb <= not(a or b or c); 
        end if; 
     end process; 
  end archth13bx0_a; 


  ----------------------------------------------------------- 
  -- th13x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th13x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           z: out std_logic); 
  end th13x0_a; 

  architecture archth13x0_a of th13x0_a is 
  begin 
     th13x0_a: process(a, b, c) 
     begin 
        if a = '0' and b = '0' and c = '0' then 
           z <= '0' after 3 ns; 
        elsif a = '1' or b = '1' or c = '1' then 
           z <= '1' after 3 ns; 
        else 
           z <= a or b or c; 
        end if; 
     end process; 
  end archth13x0_a; 


  ----------------------------------------------------------- 
  -- th14bx0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th14bx0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           zb: out std_logic); 
  end th14bx0_a; 

  architecture archth14bx0_a of th14bx0_a is 
  begin 
     th14bx0_a: process(a, b, c, d) 
     begin 
        if a = '0' and b = '0' and c = '0' and d = '0' then 
           zb <= '1' after 4 ns; 
        elsif a = '1' or b = '1' or c = '1' or d = '1' then 
           zb <= '0' after 4 ns; 
        else 
           zb <= not(a or b or c or d); 
        end if; 
     end process; 
  end archth14bx0_a; 


  ----------------------------------------------------------- 
  -- th14x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th14x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic); 
  end th14x0_a; 

  architecture archth14x0_a of th14x0_a is 
  begin 
     th14x0_a: process(a, b, c, d) 
     begin 
        if a = '0' and b = '0' and c = '0' and d = '0' then 
           z <= '0' after 4 ns; 
        elsif a = '1' or b = '1' or c = '1' or d = '1' then 
           z <= '1' after 4 ns; 
        else 
           z <= a or b or c or d; 
        end if; 
     end process; 
  end archth14x0_a; 


  ----------------------------------------------------------- 
  -- th22dx0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th22dx0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           rst: in std_logic; 
           z: out std_logic ); 
  end th22dx0_a; 

  architecture archth22dx0_a of th22dx0_a is 
  begin 
     th22dx0_a: process(a, b, rst) 
     begin 
        if rst = '1' then -- reset 
           z <= '1' after 2 ns; 
        elsif (a= '1' and b= '1') then 
           z <= '1' after 2 ns; 
        elsif  (a= '0' and b= '0') then 
           z <= '0' after 2 ns; 
        end if; 
     end process; 
  end archth22dx0_a; 


  ----------------------------------------------------------- 
  -- th22nx0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th22nx0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           rst: in std_logic; 
           z: out std_logic ); 
  end th22nx0_a; 

  architecture archth22nx0_a of th22nx0_a is 
  begin 
     th22nx0_a: process(a, b, rst) 
     begin 
        if rst = '1' then -- reset 
           z <= '0' after 2 ns; 
        elsif (a= '1' and b= '1') then 
           z <= '1' after 2 ns; 
        elsif  (a= '0' and b= '0') then 
           z <= '0' after 2 ns; 
        end if; 
     end process; 
  end archth22nx0_a; 


  ----------------------------------------------------------- 
  -- th22x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th22x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           z: out std_logic ); 
  end th22x0_a; 

  architecture archth22x0_a of th22x0_a is 
  begin 
     th22x0_a: process(a, b) 
     begin 
        if (a= '1' and b= '1') then 
           z <= '1' after 2 ns; 
        elsif  (a= '0' and b= '0') then 
           z <= '0' after 2 ns; 
        end if; 
     end process; 

  end archth22x0_a; 


  ----------------------------------------------------------- 
  -- th23w2x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th23w2x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; 
           c: in std_logic; 
           z: out std_logic ); 
  end th23w2x0_a; 

  architecture archth23w2x0_a of th23w2x0_a is 
  begin 
     th23w2x0_a: process(a, b, c) 
     begin 
        if (a= '0' and b= '0' and c= '0') then 
           z <= '0' after 3 ns; 
        elsif  (a= '1' or (b= '1' and c= '1')) then 
           z <= '1' after 3 ns; 
        end if; -- else NULL 
     end process; 
  end archth23w2x0_a; 
          

  ----------------------------------------------------------- 
  -- th23x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th23x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           z: out std_logic ); 
  end th23x0_a; 

  architecture archth23x0_a of th23x0_a is 
  begin 
     th23x0_a: process(a, b, c) 
     begin 
        if (a= '0' and b= '0' and c= '0') then 
           z <= '0' after 3 ns; 
        elsif  (a= '1' and b= '1') or (b= '1' and c= '1') or (c= '1' and a= '1') then 
           z <= '1' after 3 ns; 
        end if; 
     end process; 
    
  end archth23x0_a; 


  ----------------------------------------------------------- 
  -- th24x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th24x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th24x0_a; 

  architecture archth24x0_a of th24x0_a is 
  begin 
     th24x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  ((a= '1' and b= '1') or (a= '1' and c= '1') or (a= '1' and d= '1') 
                or (b= '1' and c= '1') or (b= '1' and d= '1') or (c= '1' and d = '1')) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth24x0_a; 


  ----------------------------------------------------------- 
  -- th24w22x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th24w22x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; -- weight 2 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th24w22x0_a; 

  architecture archth24w22x0_a of th24w22x0_a is 
  begin 
     th24w22x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a= '1' or b= '1' or (c= '1' and d = '1')) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth24w22x0_a; 


  ----------------------------------------------------------- 
  -- th24w2x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th24w2x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th24w2x0_a; 

  architecture archth24w2x0_a of th24w2x0_a is 
  begin 
     th24w2x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a= '1' or (b= '1' and c= '1') or (b= '1' and d = '1') or 
               (c= '1' and d= '1')) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth24w2x0_a; 


  ----------------------------------------------------------- 
  -- th33dx0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th33dx0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           rst: in std_logic; 
           z: out std_logic ); 
  end th33dx0_a; 

  architecture archth33dx0_a of th33dx0_a is 
  begin 
     th33dx0_a: process(a, b, c, rst) 
     begin 
        if rst = '1' then 
            z <= '1' after 3 ns; 
        elsif (a= '1' and b= '1' and c= '1') then 
           z <= '1' after 3 ns; 
        elsif  (a= '0' and b= '0' and c= '0') then 
           z <= '0' after 3 ns; 
        end if; -- else NULL 
     end process; 
  end archth33dx0_a; 


  ----------------------------------------------------------- 
  -- th33nx0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th33nx0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           rst: in std_logic; 
           z: out std_logic ); 
  end th33nx0_a; 

  architecture archth33nx0_a of th33nx0_a is 
  begin 
     th33nx0_a: process(a, b, c, rst) 
     begin 
        if rst = '1' then 
            z <= '0' after 3 ns; 
        elsif (a= '1' and b= '1' and c= '1') then 
           z <= '1' after 3 ns; 
        elsif  (a= '0' and b= '0' and c= '0') then 
           z <= '0' after 3 ns; 
        end if; -- else NULL 
     end process; 
  end archth33nx0_a; 


  ----------------------------------------------------------- 
  -- th33x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th33x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           z: out std_logic ); 
  end th33x0_a; 

  architecture archth33x0_a of th33x0_a is 
  begin 
     th33x0_a: process(a, b, c) 
     begin 
        if (a= '1' and b= '1' and c= '1') then 
           z <= '1' after 3 ns; 
        elsif  (a= '0' and b= '0' and c= '0') then 
           z <= '0' after 3 ns; 
        end if; -- else NULL 
     end process; 
  end archth33x0_a; 


  ----------------------------------------------------------- 
  -- th33w2x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 


  entity th33w2x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; 
           c: in std_logic; 
           z: out std_logic ); 
  end th33w2x0_a; 

  architecture archth33w2x0_a of th33w2x0_a is 
  begin 
     th33w2x0_a: process(a, b, c) 
     begin 
        if (a= '0' and b= '0' and c= '0') then 
           z <= '0' after 3 ns; 
        elsif  (a= '1' and (b= '1' or c= '1')) then 
           z <= '1' after 3 ns; 
        end if; -- else NULL 
     end process; 
  end archth33w2x0_a; 


  ----------------------------------------------------------- 
  --th34w22x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34w22x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; -- weight 2 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th34w22x0_a; 

  architecture archth34w22x0_a of th34w22x0_a is 
  begin 
     th34w22x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a = '1' and b = '1') or (a = '1' and c = '1')  or (a = '1' and d = '1') 
                    or (b = '1' and c = '1') or (b = '1' and d = '1') then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth34w22x0_a; 


  ----------------------------------------------------------- 
  --th34w2x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34w2x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th34w2x0_a; 

  architecture archth34w2x0_a of th34w2x0_a is 
  begin 
     th34w2x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a = '1' and b = '1') 
                    or (a = '1' and c = '1') 
                    or (a = '1' and d = '1') 
                    or (b = '1' and c = '1' and d = '1') then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth34w2x0_a; 


  ----------------------------------------------------------- 
  -- th34w32x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34w32x0_a is 
      port(a: in std_logic; -- weight 3 
           b: in std_logic; -- weight 2 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th34w32x0_a; 

  architecture archth34w32x0_a of th34w32x0_a is 
  begin 
     th34w32x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a= '1' or (b= '1' and (c= '1' or d = '1') ) ) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth34w32x0_a; 


  ----------------------------------------------------------- 
  -- th34w3x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34w3x0_a is 
      port(a: in std_logic; -- weight 3 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th34w3x0_a; 

  architecture archth34w3x0_a of th34w3x0_a is 
  begin 
     th34w3x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a= '1' or (b= '1' and c= '1' and d = '1')) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth34w3x0_a; 


  ----------------------------------------------------------- 
  -- th34x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th34x0_a; 

  architecture archth34x0_a of th34x0_a is 
  begin 
     th34w3x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif ((a= '1' and b= '1' and c= '1') or 
               (a= '1' and c= '1' and d= '1') or 
               (a= '1' and b= '1' and d= '1') or 
               (b= '1' and c= '1' and d= '1')) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth34x0_a; 


  ----------------------------------------------------------- 
  -- th44x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th44x0_a; 

  architecture archth44x0_a of th44x0_a is 
  begin 
     th44x0_a: process(a, b, c, d) 
     begin 
        if (a= '1' and b= '1' and c= '1' and d= '1') then 
           z <= '1' after 4 ns; 
        elsif  (a= '0' and b= '0' and c= '0' and d= '0') then 
           z <= '0' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth44x0_a; 


  ----------------------------------------------------------- 
  -- th44w22x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44w22x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; -- weight 2 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th44w22x0_a; 

  architecture archth44w22x0_a of th44w22x0_a is 
  begin 
     th44w22x0_a: process(a, b, c, d) 
     begin 
        if ((a= '1' and b= '1') or 
            (a= '1' and c= '1' and d= '1') or 
            (b= '1' and c= '1' and d= '1')) then 
           z <= '1' after 4 ns; 
        elsif  (a= '0' and b= '0' and c= '0' and d= '0') then 
           z <= '0' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth44w22x0_a; 


  ----------------------------------------------------------- 
  -- th44w2x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44w2x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th44w2x0_a; 

  architecture archth44w2x0_a of th44w2x0_a is 
  begin 
     th44w2x0_a: process(a, b, c, d) 
     begin 
        if ((a= '1' and b= '1' and c= '1') or 
            (a= '1' and b= '1' and d= '1') or 
            (a= '1' and c= '1' and d= '1')) then 
           z <= '1' after 4 ns; 
        elsif  (a= '0' and b= '0'and c= '0' and d= '0') then 
           z <= '0' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth44w2x0_a; 


  ----------------------------------------------------------- 
  -- th44w322x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44w322x0_a is 
      port(a: in std_logic; -- weight 3 
           b: in std_logic; -- weight 2 
           c: in std_logic; -- weight 2 
           d: in std_logic; 
           z: out std_logic ); 
  end th44w322x0_a ; 

  architecture archth44w322x0_a of th44w322x0_a is 
  begin 
     th44w322x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  ( a = '1' and ( b = '1' or c = '1' or d = '1')) or ( b = '1' and c = '1' ) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth44w322x0_a; 


  ----------------------------------------------------------- 
  -- th44w3x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44w3x0_a is 
      port(a: in std_logic; -- weight 3 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th44w3x0_a; 

  architecture archth44w3x0_a of th44w3x0_a is 
  begin 
     th44w3x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif a = '1' and ( b = '1' or c = '1' or d = '1' ) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth44w3x0_a ; 


  ----------------------------------------------------------- 
  -- th54w22x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th54w22x0_a is 
      port(a: in std_logic; -- weight 2 
           b: in std_logic; -- weight 2 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th54w22x0_a; 

  architecture archth54w22x0_a of th54w22x0_a is 
  begin 
     th54w22x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a= '1' and b= '1' and (c= '1' or d = '1')) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth54w22x0_a; 


  ----------------------------------------------------------- 
  -- th54w322x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th54w322x0_a is 
      port(a: in std_logic; -- weight 3 
           b: in std_logic; -- weight 2 
           c: in std_logic; -- weight 2 
           d: in std_logic; 
           z: out std_logic ); 
  end th54w322x0_a; 

  architecture archth54w322x0_a of th54w322x0_a is 
  begin 
     th54w322x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0'and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a= '1' and b= '1') or (a = '1' and c= '1') or 
               (b= '1' and c='1' and d= '1') then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth54w322x0_a; 


  ----------------------------------------------------------- 
  -- th54w32x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th54w32x0_a is 
      port(a: in std_logic; -- weight 3 
           b: in std_logic; -- weight 2 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th54w32x0_a; 

  architecture archth54w32x0_a of th54w32x0_a is 
  begin 
     th54w32x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a= '1' and b= '1') or (a = '1' and c= '1' and d = '1') then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth54w32x0_a; 


  ----------------------------------------------------------- 
  -- thand0x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity thand0x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end thand0x0_a; 

  architecture archthand0x0_a of thand0x0_a is 
  begin 
     thand0x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  ((a = '1' and b = '1') or (b = '1' and c = '1') or (a = '1' and d = '1')) then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archthand0x0_a; 


  ----------------------------------------------------------- 
  -- th24compx0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th24compx0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end th24compx0_a; 

  architecture archth24compx0_a of th24compx0_a is 
  begin 
     th24compx0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a = '1' or b = '1') and (c = '1' or d = '1') then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archth24compx0_a; 


  ----------------------------------------------------------- 
  -- thxor0x0_a      
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity thxor0x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           z: out std_logic ); 
  end thxor0x0_a; 

  architecture archthxor0x0_a of thxor0x0_a is 
  begin 
     thxor0x0_a: process(a, b, c, d) 
     begin 
        if (a= '0' and b= '0' and c= '0' and d = '0') then 
           z <= '0' after 4 ns; 
        elsif  (a = '1' and b = '1') or (c = '1' and d = '1') then 
           z <= '1' after 4 ns; 
        end if; -- else NULL 
     end process; 
  end archthxor0x0_a; 
  
  
  
  ----------------------------------------------------------- 
  -- and2x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity and2x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           z: out std_logic ); 
  end and2x0_a; 

  architecture archand2x0_a of and2x0_a is 
  begin 
     and2x0_a: process(a,b) 
     begin 
        if (a= '1' and b= '1') then 
           z <= '1' after 2 ns; 
        elsif (a= '0' or b= '0') then
           z <= '0' after 2 ns; 
        end if; 
     end process; 
  end archand2x0_a; 

  ----------------------------------------------------------- 
  -- or2x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity or2x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           z: out std_logic ); 
  end or2x0_a; 

  architecture archor2x0_a of or2x0_a is 
  begin 
     or2x0_a: process(a,b) 
     begin 

	z <= a or b after 2 ns;
     end process; 
  end archor2x0_a; 
  
  
  
  ----------------------------------------------------------- 
  -- and3x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity and3x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
	   c: in std_logic;
           z: out std_logic ); 
  end and3x0_a; 

  architecture archand3x0_a of and3x0_a is 
  begin 
     and3x0_a: process(a,b,c) 
     begin 
        if (a= '1' and b= '1' and c= '1') then 
           z <= '1' after 3 ns; 
        elsif (a= '0' or b= '0' or c= '0') then
           z <= '0' after 3 ns; 
        end if; 
     end process; 
  end archand3x0_a; 
  
  
  
   ----------------------------------------------------------- 
  -- and4x0_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity and4x0_a is 
      port(a: in std_logic; 
           b: in std_logic; 
	   c: in std_logic;
	   d: in std_logic;
           z: out std_logic ); 
  end and4x0_a; 

  architecture archand4x0_a of and4x0_a is 
  begin 
     and4x0_a: process(a,b,c,d) 
     begin 
        if (a= '1' and b= '1' and c= '1' and d= '1') then 
           z <= '1' after 4 ns; 
        elsif (a= '0' or b= '0' or c= '0' or d= '0') then
           z <= '0' after 4 ns; 
        end if;
     end process; 
  end archand4x0_a;  

  -------------------------------------------------------- 

