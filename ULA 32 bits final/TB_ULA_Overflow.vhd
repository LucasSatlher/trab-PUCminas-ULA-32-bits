library ieee;
use ieee.std_logic_1164.all;

entity ULA_1bit_OVERFLOW_TB is
end ULA_1bit_OVERFLOW_TB;

architecture arch_ULA_OVERFLOW_TB of ULA_1bit_OVERFLOW_TB is
  component ULA_1bit_OVERFLOW is
    port (a, b, Cin, Binv, Less: in std_logic;
  	      Oper : in std_logic_vector(1 downto 0);
              Set, Resp, OVF: out std_logic);
  end component;
  
  signal Sa : std_logic;
  signal Sb : std_logic;
  signal SCin : std_logic;
  signal SBinv : std_logic;
  signal SLess : std_logic;
  signal SOper : std_logic_vector(1 downto 0);
  signal SSet : std_logic;
  signal SResp : std_logic;
  signal SOVF : std_logic;
  
  begin
    uut: ULA_1bit_OVERFLOW
    port map( a => Sa,
    	      b => Sb,
    	      Cin => SCin,
    	      Binv => SBinv,
    	      Less => SLess,
    	      Oper => SOper,
    	      Set => SSet,
    	      Resp => SResp,
    	      OVF => SOVF);
    
    tb: process
      begin
      --testes
        Sa <= '1';
        Sb <= '1';
        SCin <= '1';
        SBinv <= '0';
        SOper <= "10";
        SLess <= '0';
        wait for 10 ns;
      wait;
    end process;
end arch_ULA_OVERFLOW_TB;


