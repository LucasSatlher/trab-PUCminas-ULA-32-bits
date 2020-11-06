library ieee;
use ieee.std_logic_1164.all;

entity OVF_detect is
  port (entradaA, entradaB2, entradaBinv, entradaSoma, entradaCout : in std_logic;
    	resultado : out std_logic);
end OVF_detect;

architecture arch_OVF_detect of OVF_detect is
  signal S1 : std_logic;
  signal S2 : std_logic;
  signal aux : std_logic;
  begin
    aux <= NOT (entradaA OR entradaB2 OR entradaCout OR entradaSoma);
    S1 <= aux AND (entradaBinv);--caso em que A=0, B=1, Binv=1, Cout=0, Soma=0
    S2 <= (entradaA AND entradaB2) AND (NOT entradaBinv);
    resultado <= S1 OR S2;
    --S1 <= (entradaA XOR entradaB2) AND (entradaSoma XNOR entradaCout);
    --S2 <= (entradaA XNOR entradaB2) AND (entradaCout XOR entradaA);
end arch_OVF_detect;





