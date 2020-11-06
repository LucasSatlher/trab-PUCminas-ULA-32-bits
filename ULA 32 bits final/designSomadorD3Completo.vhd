library ieee;
use ieee.std_logic_1164.all;

entity SomadorCompleto is
  port (x, y, z : in std_logic;
  	R, CarryOut : out std_logic);
end SomadorCompleto;

architecture arch_SomadorC of SomadorCompleto is
  component meioSomador is
  port (a, b : in std_logic;
  	r, Carry : out std_logic);
  end component;
  
  signal soma1 : std_logic;
  signal C1 : std_logic;
  signal C2 : std_logic;
  
  begin
  MS1 : meioSomador
  port map( a => x,
  	    b => y,
  	    r => soma1,
  	    Carry => C1);
  MS2 : meioSomador
  port map( a => soma1,
  	    b => z,
  	    r => R,
  	    Carry => C2);
  
  CarryOut <= C1 or C2;
end arch_SomadorC;



