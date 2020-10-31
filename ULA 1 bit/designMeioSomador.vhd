library ieee;
use ieee.std_logic_1164.all;

entity meioSomador is
  port (a, b : in std_logic;
  	r, Carry : out std_logic);
end meioSomador;

architecture arch_MeioSomador of meioSomador is
  begin
    r <= a XOR b;
    Carry <= a AND b;
end arch_MeioSomador;


