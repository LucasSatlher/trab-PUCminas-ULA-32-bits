library ieee;
use ieee.std_logic_1164.all;

entity Decodificador is
  port (a, b, c: in std_logic;
        Bn : out std_logic;
        Op : out std_logic_vector(1 downto 0));
end Decodificador;

architecture arch_Decodificador of Decodificador is
  signal bc : std_logic_vector(1 downto 0);
  
  begin
    --000 -> Bn <= '0'; Op <= "00";(a, b)=(00)
    --001 -> Bn <= '0'; Op <= "01";(a, b)=(01)
    --010 -> Bn <= '0'; Op <= "10";(a, b)=(10)
    --110 -> Bn <= '1'; Op <= "10";(a, b)=(10)
    --111 -> Bn <= '1'; Op <= "11";(a, b)=(11)
    Bn <= a;
    bc(0) <= c;
    bc(1) <= b;
    Op <= bc;
end arch_Decodificador;



