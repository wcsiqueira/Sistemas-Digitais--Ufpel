library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

library work;
use work.multPackage.all;

entity mult6bits is
  generic( x : integer := 6);
  port( a : in std_logic_vector(x - 1 downto 0);
        b : in std_logic_vector(x - 1 downto 0);
        c : in std_logic_vector(1 downto 0);
	clk : in std_logic;
	r : in std_logic;
        m : out std_logic_vector(x + x - 1 downto 0)
  );
end mult6bits;

architecture bhv of mult6bits is
--- Tentando implementar a Solução discutida em Aula de 08/11/2021
  signal tempM1 : std_logic_vector(x + x - 1 downto 0);
  signal tempM2 : std_logic_vector(x + x - 1 downto 0);
  signal tempM3 : std_logic_vector(x + x - 1 downto 0);

begin
  m1 : multMatri port map( a => a, b => b, m => tempM1);
  m2 : seqMult port map( a => a, b => b, c => clk, r => r, m => tempM2);
  m3 : multx7 port map( a => a, m => tempM3);
  
  m <=  tempM1 when c = "01" else
        tempM2 when c = "10" else
        tempM3 when c = "11" else
        (others => '0');
end bhv;
