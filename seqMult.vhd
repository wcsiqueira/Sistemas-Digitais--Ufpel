library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seqMult is
	generic(x : integer := 6; y : integer := 6);
	port( a : in std_logic_vector(x-1 downto 0);
			b : in std_logic_vector(y-1 downto 0);
			c : in std_logic;
			r : in std_logic;
			m : out std_logic_vector(x + y - 1 downto 0)	
	);
end seqMult;
architecture bhv_segMult of seqMult is
begin
	process(c)
	variable acc: std_logic_vector(x + y -1 downto 0);
	variable aux: std_logic_vector(x + y -1 downto 0);
	variable counter: integer; 
	begin
		if(r = '1') then
			acc(y - 1 downto 0) := b;
			acc(x + y -1 downto y) := (others => '0');
			counter := 0;
		elsif (rising_edge(c) and (counter /= y)) then
			if (acc(0) = '1') then
				acc(x + y -1 downto 0) := '0'&acc(x + y -1 downto 1);
				acc(x + y -1 downto y-1) := acc(x + y -1 downto y-1) + a;
			else 
			acc(x + y -1 downto 0) := '0'&acc(x + y -1 downto 1);
			end if;
			counter := counter+1;
		end if;	
		m<= acc;
	end process;
	
end bhv_segMult;