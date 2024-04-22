library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

--- aqui tives alguns problemas na Implmentação de multiplicação por sete 

entity multx7 is
  generic( x : integer := 6);
  port( a : in std_logic_vector(x - 1 downto 0);
        m : out std_logic_vector(x + x - 1 downto 0)
  );
end multx7;

architecture bhv_multx7 of multx7 is
begin
  m <= "0000"&(a(x - 1 downto 0)&"00") + ("000000"&a);
end bhv_multx7;
