
  -- regmb
  ----------------------------------------------------------- 
  library ieee; 
    use ieee.std_logic_1164.all; 
    use work.ncl_signals.all;  
 
  
  
  entity hregm is 
      port(a: in std_logic; 
           s:in std_logic; 
           z: out std_logic); 
  end hregm; 

architecture arch of hregm is
  begin
     regm: process(a, s)
     begin
        if s = '1' then
             z <= '0' after 2 ns;
             
            
        elsif a = '1' then
                    z <= '1' after 2 ns;
      
           end if;
     end process;
  end arch; 


----------------------------------------------------------- 
  -- regmb
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 
  use work.ncl_signals.all;
  
  entity regmb is 
      port(a0, a1: in std_logic; 
           s:in std_logic; 
           z0, z1: out std_logic); 
  end regmb; 

architecture arch of regmb is
  begin
     regm: process(a0, a1, s)
     begin
        if s = '1' then
             z0 <= '0' after 2 ns;
             z1 <= '0' after 2 ns;
            
        elsif a0 = '1' then
                    z0 <= '1' after 2 ns;
      elsif a1 = '1' then
          z1 <= '1' after 2 ns;
           end if;
     end process;
  end arch; 









----------------------------------------------------------- 
  -- bufx0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity bufx0m_a is 
      port(a: in std_logic; 
           s:in std_logic; 
           z: out std_logic); 
  end bufx0m_a; 

architecture arch of bufx0m_a is
  begin
     bufx0: process(a, s)
     begin
        if s = '1' then
             z <= '0' after 2 ns;
        elsif a = '1' then
                    z <= '1' after 2 ns;
           else
                    z <= '0' after 1 ns;
           end if;
     end process;
  end arch; 


-- delays based on physical-level simulations of static gates designed with 1.8v, 0.18um technology



----------------------------------------------------------- 
  -- th12x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th12x0m_a is 
      port(a: in std_logic; 
           b: in std_logic;
           s:in std_logic; 
           z: out std_logic); 
  end th12x0m_a; 

architecture archth12x0m_a of th12x0m_a is
  begin
     th12x0: process(a, b, s)
     begin
        if s = '1' then
           	z <= '0' after 5 ns;
        elsif (a = '1' or b = '1') then
                    z <= '1' after 1 ns;
         	else
                    z <= '0' after 1 ns;
         	end if;
     end process;
  end archth12x0m_a; 
  
    ----------------------------------------------------------- 
    -- th12dx0m_a 
    ----------------------------------------------------------- 
    library ieee; 
    use ieee.std_logic_1164.all; 
  
    entity th12dx0m_a is 
        port(a: in std_logic; 
             b: in std_logic;
             rst : in std_logic;
             s:in std_logic;
             
             z: out std_logic); 
    end th12dx0m_a; 
  
  architecture archth12dx0m_a of th12dx0m_a is
    begin
       th12dx0: process(a, b, rst, s)
       begin
          if rst = '1' then
             z <= '1' after 2 ns;
        elsif rst = '0' and s = '1' then
               z <= '0' after 5 ns;
          elsif rst = '0' and (a = '1' or b = '1') then
                      z <= '1' after 1 ns;
             else
                      z <= '0' after 1 ns;
             end if;
       end process;
    end archth12dx0m_a; 
    
    
      ----------------------------------------------------------- 
      -- th12nx0m_a 
      ----------------------------------------------------------- 
      library ieee; 
      use ieee.std_logic_1164.all; 
    
      entity th12nx0m_a is 
          port(a: in std_logic; 
               b: in std_logic;
               rst : in std_logic;
               s:in std_logic; 
               
               z: out std_logic); 
      end th12nx0m_a; 
    
    architecture archth12nx0m_a of th12nx0m_a is
      begin
         th12x0: process(a, b, rst, s)
         begin
            if rst = '1' then 
                z <= '0' after 2 ns;
          elsif rst = '0' and s = '1' then
                 z <= '0' after 5 ns;
            elsif rst = '0' and (a = '1' or b = '1') then
                        z <= '1' after 1 ns;
               else
                        z <= '0' after 1 ns;
               end if;
         end process;
      end archth12nx0m_a;   


----------------------------------------------------------- 
  -- th13x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th13x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           s:in std_logic;
           z: out std_logic); 
  end th13x0m_a; 

  architecture archth13x0m_a of th13x0m_a is 
  begin 
     th13x0: process(a, b, c,s) 
     begin 
        if  s = '1' then 
          	 z <= '0' after 2 ns;
	      elsif a = '1' or b = '1' or c = '1' then 
           	z <= '1' after 2 ns; 
         	else 
          	 z <= '0' after 1 ns; 
         	end if;
     end process; 
  end archth13x0m_a; 

----------------------------------------------------------- 
  -- th14x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th14x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           s:in std_logic;
           z: out std_logic); 
  end th14x0m_a; 

  architecture archth14x0m_a of th14x0m_a is 
  begin 
     th14x0: process(a, b, c, d,s) 
     begin 
        if  s = '1' then 
           	z <= '0' after 2 ns; 
        elsif a = '1' or b = '1' or c = '1' or d = '1' then 
          	 z <= '1' after 2 ns; 
        	else 
          	 z <= '0' after 1 ns; 
        	end if;
     end process; 
  end archth14x0m_a; 

  ----------------------------------------------------------- 
  -- th22x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th22x0m_a is 
      port(a: in std_logic; 
           b: in std_logic;
      s:in std_logic;
           z: out std_logic ); 
  end th22x0m_a; 

  architecture archth22x0m_a of th22x0m_a is 
  begin 
     th22x0m_a: process(a, b,s) 
     begin 
      if  s = '1' then 
              z <= '0' after 2 ns;
      elsif (a= '1' and b= '1') then 
           	z <= '1' after 2 ns; 
      	      else  
		z <= '0' after 1 ns;
              end if;
     end process; 

  end archth22x0m_a;           

  ----------------------------------------------------------- 
  -- th23x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th23x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic;
      s:in std_logic;
           z: out std_logic ); 
  end th23x0m_a; 

  architecture archth23x0m_a of th23x0m_a is 
  begin 
     th23x0m_a: process(a, b, c,s) 
     begin 
        if s = '1' then 
           	z <= '0' after 2 ns; 
        elsif  (a= '1' and b= '1') or (b= '1' and c= '1') or (c= '1' and a= '1') then 
           		z <= '1' after 2 ns; 
   		else 
			z<='0' after 2 ns;
   		end if;
     end process; 
    
  end archth23x0m_a; 
  
    ----------------------------------------------------------- 
    -- th23xw20m 
    ----------------------------------------------------------- 
    library ieee; 
    use ieee.std_logic_1164.all; 
  
    entity th23w2x0m_a is 
        port(a: in std_logic; 
             b: in std_logic; 
             c: in std_logic;
        s:in std_logic;
             z: out std_logic ); 
    end th23w2x0m_a; 
  
    architecture arch of th23w2x0m_a is 
    begin 
       th23w2x0m_a: process(a, b, c,s) 
       begin 
          if s = '1' then 
               z <= '0' after 2 ns; 
          elsif  (a= '1') or (b= '1' and c= '1')  then 
                 z <= '1' after 2 ns; 
         else 
        z<='0' after 2 ns;
         end if;
       end process; 
      
    end arch; 


----------------------------------------------------------- 
  -- th24x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th24x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th24x0m_a; 

  architecture archth24x0m_a of th24x0m_a is 
  begin 
     th24x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  ((a= '1' and b= '1') or (a= '1' and c= '1') or (a= '1' and d= '1') 
                or (b= '1' and c= '1') or (b= '1' and d= '1') or (c= '1' and d = '1')) then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if;  
     end process; 
  end archth24x0m_a; 
  
 ----------------------------------------------------------- 
  -- th24w22x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th24w22x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th24w22x0m_a; 

  architecture archth24w22x0m_a of th24w22x0m_a is 
  begin 
     th24w22x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a= '1' or b= '1' or (c= '1' and d = '1')) then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if; 
     end process; 
  end archth24w22x0m_a; 


  ----------------------------------------------------------- 
  -- th24w2x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th24w2x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic;
	   s: in std_logic; 
           z: out std_logic ); 
  end th24w2x0m_a; 

  architecture archth24w2x0m_a of th24w2x0m_a is 
  begin 
     th24w2x0: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a= '1' or (b= '1' and c= '1') or (b= '1' and d = '1') or 
               (c= '1' and d= '1')) then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if; 
     end process; 
  end archth24w2x0m_a;  




  ----------------------------------------------------------- 
  -- th24compx0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th24compx0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           s:in std_logic;
	   z: out std_logic ); 
  end th24compx0m_a; 

  architecture archth24compx0m_a of th24compx0m_a is 
  begin 
     th24compx0m_a: process(a, b, c, d,s) 
     begin 
        if  s = '1' then 
           	z <= '0' after 2 ns; 
      elsif  (a = '1' or b = '1') and (c = '1' or d = '1') then 
           		z <= '1' after 2 ns; 
   		else 
			z<='0' after 2 ns;     
   		end if;
     end process; 
  end archth24compx0m_a; 


  ----------------------------------------------------------- 
  -- th33x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th33x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic;
      	s:in std_logic;
           z: out std_logic ); 
  end th33x0m_a; 

  architecture archth33x0m_a of th33x0m_a is 
  begin 
     th33x0m_a: process(a, b, c,s) 
     begin 
	if  s = '1' then 
           	z <= '0' after 2 ns;
      elsif (a= '1' and b= '1' and c= '1') then 
           		z <= '1' after 2 ns; 
 		else 
			z<='0' after 2 ns;
        	end if;
     end process; 
  end archth33x0m_a; 


  ----------------------------------------------------------- 
  --th33w2x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th33w2x0m_a is 
      port(a: in std_logic;
           b: in std_logic; 
           c: in std_logic; 
      s:in std_logic;
           z: out std_logic ); 
  end th33w2x0m_a; 

  architecture archth33w2x0m_a of th33w2x0m_a is 
  begin 
     th33w2x0m_a: process(a, b, c,s) 
     begin 
        if  s = '1' then 
           	z <= '0' after 2 ns; 
      elsif  (a = '1' and b = '1') 
                or (a = '1' and c = '1') then 
           		z <= '1' after 2 ns; 
   		else 
			z<='0' after 1 ns;     
   		end if;
     end process; 
  end archth33w2x0m_a; 

  ----------------------------------------------------------- 
  --th34w2x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34w2x0m_a is 
      port(a: in std_logic;
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic;
      s:in std_logic;
           z: out std_logic ); 
  end th34w2x0m_a; 

  architecture archth34w2x0m_a of th34w2x0m_a is 
  begin 
     th34w2x0m_a: process(a, b, c, d,s) 
     begin 
        if  s = '1' then 
           	z <= '0' after 2 ns; 
      elsif  (a = '1' and b = '1') 
                or (a = '1' and c = '1') 
                or (a = '1' and d = '1') 
                or (b = '1' and c = '1' and d = '1') then 
           		z <= '1' after 2 ns; 
   		else 
			z<='0' after 1 ns;     
   		end if;
     end process; 
  end archth34w2x0m_a; 

----------------------------------------------------------- 
  --th34w22x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34w22x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th34w22x0m_a; 

  architecture archth34w22x0m_a of th34w22x0m_a is 
  begin 
     th34w22x0m_a: process(a, b, c, d,s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a = '1' and b = '1') or (a = '1' and c = '1')  or (a = '1' and d = '1') 
                    or (b = '1' and c = '1') or (b = '1' and d = '1') then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if; 
     end process; 
  end archth34w22x0m_a; 

----------------------------------------------------------- 
  -- th34w32x0m_a
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34w32x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th34w32x0m_a; 

  architecture archth34w32x0m_a of th34w32x0m_a is 
  begin 
     th34w32x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a= '1' or (b= '1' and (c= '1' or d = '1') ) ) then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if; 
     end process; 
  end archth34w32x0m_a; 


----------------------------------------------------------- 
  -- th34w3x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34w3x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th34w3x0m_a; 

  architecture archth34w3x0m_a of th34w3x0m_a is 
  begin 
     th34w3x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a= '1' or (b= '1' and c= '1' and d = '1')) then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if; 
     end process; 
  end archth34w3x0m_a; 



  ----------------------------------------------------------- 
  -- th34x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th34x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           s:in std_logic;
	   z: out std_logic ); 
  end th34x0m_a; 

  architecture archth34x0m_a of th34x0m_a is 
  begin 
     th34w3x0m_a: process(a, b, c, d,s) 
     begin 
        if  s = '1' then 
           	z <= '0' after 2 ns; 
      elsif ((a= '1' and b= '1' and c= '1') or 
               (a= '1' and c= '1' and d= '1') or 
               (a= '1' and b= '1' and d= '1') or 
               (b= '1' and c= '1' and d= '1')) then 
           		z <= '1' after 2 ns; 
   		else 
			z<='0' after 1 ns;     
   		end if;
     end process; 
  end archth34x0m_a; 


 ----------------------------------------------------------- 
  -- th44x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           s:in std_logic;
	   z: out std_logic ); 
  end th44x0m_a; 

  architecture archth44x0m_a of th44x0m_a is 
  begin 
     th44x0m_a: process(a, b, c, d,s) 
     begin 
	if  s = '1'then 
           	z <= '0' after 2 ns;
      elsif (a= '1' and b= '1' and c= '1' and d= '1') then 
           		z <= '1' after 2 ns; 
   		else 
			z<='0' after 2 ns;
        	end if;
     end process; 
  end archth44x0m_a; 

----------------------------------------------------------- 
  -- th44w22x0 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44w22x0m_a is 
      port(a: in std_logic; 
           b: in std_logic;  
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th44w22x0m_a; 

  architecture archth44w22x0m_a of th44w22x0m_a is 
  begin 
     th44w22x0m_a: process(a, b, c, d, s) 
     begin 
        if ((a= '1' and b= '1') or 
            (a= '1' and c= '1' and d= '1') or 
            (b= '1' and c= '1' and d= '1')) then 
           z <= '1' after 2 ns; 
        elsif  s = '1' then 
           z <= '0' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if; 
     end process; 
  end archth44w22x0m_a; 

----------------------------------------------------------- 
  -- th44w322x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44w322x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th44w322x0m_a ; 

  architecture archth44w322x0m_a of th44w322x0m_a is 
  begin 
     th44w322x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  ( a = '1' and ( b = '1' or c = '1' or d = '1')) or ( b = '1' and c = '1' ) then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if; 
     end process; 
  end archth44w322x0m_a; 

  
    ----------------------------------------------------------- 
    -- th44w2x0m_a 
    ----------------------------------------------------------- 
    library ieee; 
    use ieee.std_logic_1164.all; 
  
    entity th44w2x0m_a is 
        port(a: in std_logic; 
             b: in std_logic; 
             c: in std_logic; 
             d: in std_logic; 
             s: in std_logic;
             z: out std_logic ); 
    end th44w2x0m_a; 
  
    architecture archth44w2x0m_a of th44w2x0m_a is 
    begin 
       th44w2x0m_a: process(a, b, c, d, s) 
       begin 
          if s = '1' then
              z<= '0' after 2 ns; 
        elsif ((a= '1' and b= '1' and c= '1') or 
              (a= '1' and b= '1' and d= '1') or 
              (a= '1' and c= '1' and d= '1')) then 
             z <= '1' after 2 ns; 
        else 
                 z<='0' after 2 ns; 
          end if; 
       end process; 
    end archth44w2x0m_a; 


----------------------------------------------------------- 
  -- th44w3x0 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th44w3x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th44w3x0m_a; 

  architecture archth44w3x0m_a of th44w3x0m_a is 
  begin 
     th44w3x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif a = '1' and ( b = '1' or c = '1' or d = '1' ) then 
           z <= '1' after 2 ns; 
	else
	  z <= '0' after 2 ns;
        end if;
     end process; 
  end archth44w3x0m_a ; 


  ----------------------------------------------------------- 
  -- th54w22x0 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th54w22x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th54w22x0m_a; 

  architecture archth54w22x0m_a of th54w22x0m_a is 
  begin 
     th54w22x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a= '1' and b= '1' and (c= '1' or d = '1')) then 
           z <= '1' after 2 ns; 
	else 
		z <= '0' after 2 ns;
        end if;
     end process; 
  end archth54w22x0m_a; 


  ----------------------------------------------------------- 
  -- th54w322x0 m
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th54w322x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
	   s: in std_logic;
           z: out std_logic ); 
  end th54w322x0m_a; 

  architecture archth54w322x0m_a of th54w322x0m_a is 
  begin 
     th54w322x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a= '1' and b= '1') or (a = '1' and c= '1') or 
               (b= '1' and c='1' and d= '1') then 
           z <= '1' after 2 ns;
	else
		z <= '0' after 2 ns; 
        end if; 
     end process; 
  end archth54w322x0m_a; 


  ----------------------------------------------------------- 
  -- th54w32x0m_a
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity th54w32x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic;
	   s: in std_logic; 
           z: out std_logic ); 
  end th54w32x0m_a; 

  architecture archth54w32x0m_a of th54w32x0m_a is 
  begin 
     th54w32x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a= '1' and b= '1') or (a = '1' and c= '1' and d = '1') then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if;  
     end process; 
  end archth54w32x0m_a; 



  
  
   ----------------------------------------------------------- 
  -- thand0x0m_a 
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity thand0x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic; 
           s:in std_logic;
	   z: out std_logic ); 
  end thand0x0m_a; 

  architecture archthand0x0m_a of thand0x0m_a is 
  begin 
     thand0x0m_a: process(a, b, c, d,s) 
     begin 
        if  s = '1' then 
           	z <= '0' after 2 ns; 
      elsif  ((a = '1' and b = '1') or (b = '1' and c = '1') or (a = '1' and d = '1')) then 
           		z <= '1' after 2 ns; 
   		else 
			z<='0' after 2 ns;     
   		end if;
     end process; 
  end archthand0x0m_a; 

----------------------------------------------------------- 
  -- thxor0x0m_a     
  ----------------------------------------------------------- 
  library ieee; 
  use ieee.std_logic_1164.all; 

  entity thxor0x0m_a is 
      port(a: in std_logic; 
           b: in std_logic; 
           c: in std_logic; 
           d: in std_logic;
	   s: in std_logic; 
           z: out std_logic ); 
  end thxor0x0m_a; 

  architecture archthxor0x0m_a of thxor0x0m_a is 
  begin 
     thxor0x0m_a: process(a, b, c, d, s) 
     begin 
        if s = '1' then 
           z <= '0' after 2 ns; 
        elsif  (a = '1' and b = '1') or (c = '1' and d = '1') then 
           z <= '1' after 2 ns; 
	else
		z <= '0' after 2 ns;
        end if; 
     end process; 
  end archthxor0x0m_a; 

--end MTNCL_gates;
