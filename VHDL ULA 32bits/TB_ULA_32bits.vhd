library ieee;
use ieee.std_logic_1164.all;

entity ULA_32bits_TB is
end ULA_32bits_TB;

architecture arch_ULA32bits_TB of ULA_32bits_TB is
  component ULA_32bits is
    port (Bnegate : in std_logic;
  	Operation : in std_logic_vector(1 downto 0);
  	a, b : in std_logic_vector(31 downto 0);--vetor de 32 bits
        Overflow : out std_logic;
        --Resultado : out std_logic_vector(31 downto 0));
        Resultado : out std_logic);
  end component;
  
  signal SBnegate : std_logic;
  signal SOverflow : std_logic;
  signal SResultado : std_logic;
  signal SOperation : std_logic_vector(1 downto 0);
  signal Sa : std_logic_vector(31 downto 0);
  signal Sb : std_logic_vector(31 downto 0);
  --signal SResultado : std_logic_vector(31 downto 0);
  
  begin
    uut: ULA_32bits
    port map( Bnegate => SBnegate,
  	      Overflow => SOverflow,
  	      Resultado => SResultado,
  	      Operation => SOperation,
  	      a => Sa,
  	      b => Sb);
    
    tb: process
      begin
        --testes
        SOperation <= "00";--operação AND
        SBnegate <= '1';
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser 0
        
        SOperation <= "01";--Operação OR
        SBnegate <= '0';
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser 0
        
        SOperation <= "00";
        SBnegate <= '0';
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser 1		(20ns~30ns)
        
        SOperation <= "01";
        SBnegate <= '1';
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser 0
        
        SOperation <= "10";--Operação soma
        SBnegate <= '1';--somar com o inverso de b (subtração)
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser 0 e o overflow deve ser 0 
        
        SOperation <= "10";
        SBnegate <= '0';
        Sa <= "11111111111111111111111111111111";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser 0
        
        SOperation <= "10";
        SBnegate <= '1';
        Sa <= "00000000000000000000000000000000";
        Sb <= "00000000000000000000000000000000";
        wait for 10 ns;--Resultado deve ser 1		(60ns~70ns)
        
        SOperation <= "10";--Operação soma
        SBnegate <= '0';
        Sa <= "11111111111111111111111111111111";
        Sb <= "11111111111111111111111111111111";
        wait for 10 ns;--Resultado deve ser 0 e o overflow deve ser 1 (70ns~80ns)
      wait;
    end process;
end arch_ULA32bits_TB;




