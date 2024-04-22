library ieee;

use ieee.std_logic_1164.all;

entity multMatri is
	port(	a : in std_logic_vector(5 downto 0);
			  b : in std_logic_vector(5 downto 0);
			  m : out std_logic_vector(11 downto 0)
	);
end multMatri;

architecture bhv_multMatri of multMatri is

component somadorNbits is 
	generic(n : integer := 6);
	port(
		a : in std_logic_vector(n-1 downto 0);
		b : in std_logic_vector(n-1 downto 0);
		cOUT : out std_logic;
		s : out std_logic_vector(n-1 downto 0)
	);
end component;

function multInpt(inp1: std_logic_vector; inp2: std_logic_vector; len: integer) return std_logic_vector is
	variable temp : std_logic_vector(len*len downto 0);
	variable k : integer;
	begin
		k := len*len;
		for i in inp1'range loop
			for j in inp2'range loop
				if (k = 6) then 
					temp(k):= '0';
					k:= k-1;
				end if;
				temp(k):= inp1(i) and inp2(j);
				k := k-1;
			end loop;
		end loop;
		return temp;
	end function multInpt;

signal s1, s2, s3, s4, s5 : std_logic_vector(6 downto 0);
signal tempA_and_B : std_logic_vector(36 downto 0);

	
begin
	
	som1: somadorNbits port map (a => tempA_and_B(12 downto 7), b => tempA_and_B(6 downto 1), cOUT =>s1(6), S=> s1(5 downto 0));
	som2: somadorNbits port map (a => tempA_and_B(18 downto 13), b => s1(6 downto 1), cOUT =>s2(6), S=> s2(5 downto 0));
	som3: somadorNbits port map (a => tempA_and_B(24 downto 19), b => s2(6 downto 1), cOUT =>s3(6), S=> s3(5 downto 0));
	som4: somadorNbits port map (a => tempA_and_B(30 downto 25), b => s3(6 downto 1), cOUT =>s4(6), S=> s4(5 downto 0));
	som5: somadorNbits port map (a => tempA_and_B(36 downto 31), b => s4(6 downto 1), cOUT =>s5(6), S=> s5(5 downto 0));
	
	
	tempA_and_B <= multInpt(a, b, 6);
	
	m <= s5&s4(0)&s3(0)&s2(0)&s1(0)&tempA_and_B(0);
	
end bhv_multMatri;