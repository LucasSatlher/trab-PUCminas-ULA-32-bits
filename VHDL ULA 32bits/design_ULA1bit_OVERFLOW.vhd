library ieee;
use ieee.std_logic_1164.all;

entity ULA_1bit_OVERFLOW is
  port (a, b, Cin, Binv, Less: in std_logic;
  	      Oper : in std_logic_vector(1 downto 0);
              Set, Resp, OVF: out std_logic);
end ULA_1bit_OVERFLOW;

architecture arch_ULA1bit_OV of ULA_1bit_OVERFLOW is
  signal Sb2 : std_logic;
  signal Sop1 : std_logic;
  signal Sop2 : std_logic;
  signal Sop3 : std_logic;
  signal Sop4 : std_logic;
  signal SCout : std_logic;
  
  component mult2x1 is
    port(e1 : in std_logic;
    	 e2 : in std_logic;
    	 sel : in std_logic;
    	 s : out std_logic);
  end component;
  component mult4x1 is
    port(op1 : in std_logic;
    	 op2 : in std_logic;
    	 op3 : in std_logic;
    	 op4 : in std_logic;
    	 seleciona : in std_logic_vector(1 downto 0);
    	 saida : out std_logic);
  end component;
  component SomadorCompleto is
    port (x, y, z : in std_logic;
  	  R, CarryOut : out std_logic);
  end component;
  component OVF_detect is
    port (entradaA, entradaB2, entradaBinv, entradaSoma, entradaCout : in std_logic;
    	resultado : out std_logic);
  end component;
  
  begin
    M2x1 : mult2x1
    port map( e1 => b,
    	      e2 => NOT b,
    	      sel => Binv,
    	      s => Sb2);    
    M4x1 : mult4x1
    port map( op1 => Sop1,
    	      op2 => Sop2,
    	      op3 => Sop3,
    	      op4 => Sop4,
    	      seleciona => Oper,
    	      saida => Resp);
    Somador : SomadorCompleto
    port map( x => a,
    	      y => Sb2,
    	      z => Cin,
    	      R => Sop3,
    	      CarryOut => SCout);
    OVERFLOW : OVF_detect
    port map( entradaA => a,
    	      entradaB2 => Sb2,
    	      entradaBinv => Binv,
    	      entradaSoma => Sop3,
    	      entradaCout => SCout,
    	      resultado => OVF);
    	      
    Sop1 <= Sb2 AND a;
    Sop2 <= Sb2 OR a;
    Sop4 <= Less;
    Set <= Sop3;
end arch_ULA1bit_OV;


