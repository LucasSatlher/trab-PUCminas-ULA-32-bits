library ieee;
use ieee.std_logic_1164.all;

entity ULA_32bits is
  port (Bnegate : in std_logic;
  	Operation : in std_logic_vector(1 downto 0);
  	a, b : in std_logic_vector(31 downto 0);--vetor de 32 bits
        Overflow : out std_logic;
        --Resultado : out std_logic_vector(31 downto 0));
        Resultado : out std_logic);
end ULA_32bits;

architecture arch_ULA_32bits of ULA_32bits is
  signal Sset : std_logic;
  signal SCarry : std_logic_vector(30 downto 0);
  signal SResp : std_logic_vector(31 downto 0);
  signal SLess : std_logic;
  signal SNOR : std_logic;
  
  component ULA_1bit is
    port (a, b, Cin, Binv, Less: in std_logic;
  	      Oper : in std_logic_vector(1 downto 0);
              Cout, Resp: out std_logic);
  end component;
  component ULA_1bit_OVERFLOW is
    port (a, b, Cin, Binv, Less: in std_logic;
  	  Oper : in std_logic_vector(1 downto 0);
          Set, Resp, OVF: out std_logic);
  end component;
  
  begin
    PrimeiraULA : ULA_1bit
    port map( a => a(0),
    	      b => b(0),
    	      Cin => Bnegate,
    	      Binv => Bnegate,
    	      Less => Sset,
    	      Oper => Operation,
    	      Cout => SCarry(0),
    	      Resp => SResp(0));    
    arrayULAs:
    for i in 1 to 30 generate
      ULA : ULA_1bit
      port map( a => a(i),
    	        b => b(i),
    	        Cin => SCarry(i-1),
    	        Binv => Bnegate,
    	        Less => SLess,
    	        Oper => Operation,
    	        Cout => SCarry(i),
    	        Resp => SResp(i));   
    end generate arrayULAs;
    UltimaULA : ULA_1bit_OVERFLOW
    port map( a => a(31),
    	      b => b(31),
    	      Cin => SCarry(30),
    	      Binv => Bnegate,
    	      Less => SLess,
    	      Oper => Operation,
    	      Set => Sset,
    	      Resp => SResp(31),
    	      OVF => Overflow);
    
    PortaOR:
    for i in 0 to 30 generate
      SNOR <= SResp(i) OR SResp (i+1);
    end generate PortaOR;
    
    SLess <= '0';
    Resultado <= NOT SNOR;
end arch_ULA_32bits;


