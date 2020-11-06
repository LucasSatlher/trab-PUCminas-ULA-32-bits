library ieee;
use ieee.std_logic_1164.all;

entity ULA1bit_tb is
end ULA1bit_tb;

architecture arch_TB_ULA1bit of ULA1bit_tb is
  
  component ULA_1bit is
    port (a, b, Cin, Binv, Less: in std_logic;
  	      Oper : in std_logic_vector(1 downto 0);
              Cout, Resp: out std_logic);
  end component;

  signal Sa : std_logic;
  signal Sb : std_logic;
  signal SCin : std_logic;
  signal SBinv : std_logic;
  signal SOper : std_logic_vector(1 downto 0);
  signal SLess : std_logic;
  signal SCout : std_logic;
  signal SResp : std_logic;
  
  begin
  uut: ULA_1bit
  port map( a => Sa,
  	    b => Sb,
  	    Cin => Scin,
  	    Binv => SBinv,
  	    Oper => SOper,
  	    Less => SLess,
  	    Cout => SCout,
  	    Resp => SResp);
  	    
  tb: process
    begin
      SLess <= '0';
      SCin <= '0';
      Sa <= '1';
      Sb <= '0';
      SBinv <= '1';
      SOper <= "00"; --o Resp deve ser 1 (1 and 1)
      wait for 10 ns;
      
      SCin <= '0';
      Sa <= '1';
      Sb <= '0';
      SBinv <= '0';
      SOper <= "01";--o Resp deve ser 1 (1 or 0)
      wait for 10 ns;
      
      SCin <= '0';
      Sa <= '1';
      Sb <= '0';
      SOper <= "00";
      SBinv <= '0';--o Resp deve ser 0 (1 and 0)
      wait for 10 ns;
      
      SCin <= '0';
      Sa <= '1';
      Sb <= '0';
      SOper <= "01";
      SBinv <= '1';--o Resp deve ser 1 (1 or 1)
      wait for 10 ns;
      
      SCin <= '0';
      Sa <= '1';
      Sb <= '0';
      SBinv <= '0';
      SOper <= "10";--o Resp deve ser 1 (1 + 0 + 0 [a, Cin, b]) e o Cout deve ser 0
      wait for 10 ns;
      
      SCin <= '0';
      Sa <= '1';
      Sb <= '0';
      SOper <= "10";
      SBinv <= '1';--o Resp deve ser 0 (1 + 0 + 1 [a, Cin, ~b]) e o Cout deve ser 1
      wait for 10 ns;
      
      Sa <= '1';
      Sb <= '0';
      SOper <= "10";
      SBinv <= '1';
      SCin <= '1';--o Resp deve ser 1 (1 + 1 + 1 [a, Cin, ~b]) e o Cout deve ser 1
      wait for 10 ns;
      
      Sa <= '1';
      Sb <= '1';
      SOper <= "10";
      SBinv <= '1';
      SCin <= '1';--o Resp deve ser 0 (1+0+1[a, ~b, Cin]) e o Cout deve ser 1
      wait for 10 ns;
      
      Sa <= '0';
      Sb <= '0';
      SOper <= "10";
      SBinv <= '1';
      SCin <= '1';--o Resp deve ser 0 (0+1+1[a, ~b, Cin]) e o Cout deve ser 1
      wait for 10 ns;
      
  wait;
  end process;
end arch_TB_ULA1bit;




