library ieee;
use ieee.std_logic_1164.all;

entity mult2x1 is
  port (e1, e2, sel: in std_logic;
              s: out std_logic);
end mult2x1;

architecture arch_mult2x1 of mult2x1 is
  begin
  with sel select
  s <= e1 when '0',
       e2 when others;       
end arch_mult2x1;


