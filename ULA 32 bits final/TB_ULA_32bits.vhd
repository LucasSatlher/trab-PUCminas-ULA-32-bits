library ieee;
use ieee.std_logic_1164.all;

entity ULA_32bits_TB is
end ULA_32bits_TB;

architecture arch_ULA32bits_TB of ULA_32bits_TB is
  component ULA_32bits is
    port (x, y, z : in std_logic;
  	a, b : in std_logic_vector(31 downto 0);--vetor de 32 bits
        Overflow : out std_logic;
        Resultado : out std_logic_vector(31 downto 0);
        Zero : out std_logic);
  end component;
  
  signal Sx : std_logic;
  signal Sy : std_logic;
  signal Sz : std_logic;
  signal SOverflow : std_logic;
  signal SZero : std_logic;
  signal SResultado : std_logic_vector(31 downto 0);
  signal Sa : std_logic_vector(31 downto 0);
  signal Sb : std_logic_vector(31 downto 0);
  
  begin
    uut: ULA_32bits
    port map( x => Sx,
    	      y => Sy,
    	      z => Sz,
  	      Overflow => SOverflow,
  	      Zero => SZero,
  	      Resultado => SResultado,
  	      a => Sa,
  	      b => Sb);
    
    tb: process
      begin
        --testes
        Sx <= '0';
        Sy <= '0';
        Sz <= '0';--"000" AND
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Zero deve ser 1, Resultado deve ser "00000000000000000000000000000000"
        
        Sx <= '0';
        Sy <= '0';
        Sz <= '1';--"001" OR
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Zero deve ser 0, Resultado deve ser "11111111111111111111111111111111"
        
        Sx <= '1';
        Sy <= '1';
        Sz <= '0';--"110" subtração
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser "11111111111111111111111111111111", Zero deve ser 0, e o overflow deve ser 0 
        
        Sx <= '1';
        Sy <= '1';
        Sz <= '0';--"110" subtração
        Sa <= "00000000000000000000000000000000";
        Sb <= "11111111111111111111111111111111";
        wait for 10 ns;--Resultado deve ser "00000000000000000000000000000001", Zero deve ser 0, e o overflow deve ser 1
        
        Sx <= '0';
        Sy <= '1';
        Sz <= '0';--"010" soma
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser "11111111111111111111111111111111", Zero deve ser 0, e o overflow deve ser 0
        
        Sx <= '1';
        Sy <= '1';
        Sz <= '0';--"110" subtração
        Sa <= "00000000000000000000000000000000";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser "00000000000000000000000000000000", Zero deve ser 1, e o overflow deve ser 0
        
        Sx <= '0';
        Sy <= '1';
        Sz <= '0';--"010" soma
        Sa <= "11111111111111111111111111111111";
        Sb <= "11111111111111111111111111111111";
        wait for 10 ns;--Resultado deve ser "11111111111111111111111111111110", Zero deve ser 0, e o overflow deve ser 1
      wait;
    end process;
end arch_ULA32bits_TB;





