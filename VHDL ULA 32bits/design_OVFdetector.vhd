library ieee;
use ieee.std_logic_1164.all;

entity OVF_detect is
  port (entradaA, entradaB2, entradaBinv, entradaSoma, entradaCout : in std_logic;
    	resultado : out std_logic);
end OVF_detect;

architecture arch_OVF_detect of OVF_detect is
  signal S1 : std_logic;
  signal S2 : std_logic;
  signal S3 : std_logic;
  
  begin
    --S1 <= (entradaA XOR entradaB2) AND (entradaSoma XNOR entradaCout);
    --S2 <= (entradaA XNOR entradaB2) AND (entradaCout XOR entradaA);
    S3 <= (entradaA AND entradaB2) AND (NOT entradaBinv);
    --resultado <= S1 OR S2 OR S3;
    resultado <= S3;
end arch_OVF_detect;



