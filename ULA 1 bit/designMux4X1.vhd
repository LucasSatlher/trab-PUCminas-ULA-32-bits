library ieee;
use ieee.std_logic_1164.all;

entity mult4x1 is
  port (op1, op2, op3, op4 : in std_logic;
  	seleciona : in std_logic_vector(1 downto 0);
  	saida : out std_logic);
end mult4x1;

architecture arch_mult4x1 of mult4x1 is
  begin
    with seleciona select
    saida <= op1 when "00",
    	     op2 when "01",
    	     op3 when "10",
             op4 when others; 
end arch_mult4x1;




