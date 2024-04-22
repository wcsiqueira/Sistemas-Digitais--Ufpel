library ieee;
use ieee.std_logic_1164.all;

entity somadorNbits is 
	generic(n : integer :=6);
	port(
		a : in std_logic_vector(n-1 downto 0);
		b : in std_logic_vector(n-1 downto 0);
		--cIN : in std_logic;
		cOUT : out std_logic;
		--o : out std_logic;
		s : out std_logic_vector(n-1 downto 0)
	);
end somadorNbits;

architecture bhv_somador of somadorNbits is

function auxF(inp1: std_logic_vector; inp2: std_logic ) return std_logic_vector is
	variable temp: std_logic_vector(inp1'range);
	begin
		for i in inp1'range loop
		  temp(i):= inp2 xor inp1(i);
		end loop;
		return temp;
	end function auxF;
	
component fullAdder is 
	port(
		a : in std_logic;
		b : in std_logic;
		cIn : in std_logic;
		cOUT : out std_logic;
		s : out std_logic
	);
end component;
signal c : std_logic_vector (n downto 0);
signal aux : std_logic_vector (n-1 downto 0);
begin
  aux <= auxF(b, '0');
	gen: for i in 0 to n-1 generate
		adrs: fullAdder port map (a => a(i), b => aux(i), cIN => c(i), s => s(i), cOUT => c(i+1));
	end generate;
	c(0) <= '0' ;--cIN;
	cOUT <= c(n);
	--o <= c(n) xor c(n-1);
end bhv_somador;