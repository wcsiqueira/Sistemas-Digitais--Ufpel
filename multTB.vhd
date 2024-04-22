library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity multTB is
end multTB;

architecture bhv of multTB is
  
component mult6bits is
  generic( x : integer := 6);
  port( a : in std_logic_vector(x - 1 downto 0);
        b : in std_logic_vector(x - 1 downto 0);
        c : in std_logic_vector(1 downto 0);
	clk : in std_logic;
	r : in std_logic;
        m : out std_logic_vector(x + x - 1 downto 0)
  );
end component;
--input
signal ta : std_logic_vector(5 downto 0) := (others => '0');
signal tb : std_logic_vector(5 downto 0) := (others => '0');
signal tc : std_logic_vector(1 downto 0) := (others => '0');
--output
signal tm : std_logic_vector(11 downto 0);

--clock
signal clk : std_logic;

--reset
signal r : std_logic := '0';

--tb
begin
tbM: mult6bits port map(a => ta, b => tb, c => tc, clk => clk, r => r, m => tm);
Clock :process 
	begin
  		clk <= '1', '0' after 5 ns;
  		wait for 10 ns;
	end process;


reset: process
begin
	 r <= '1';
	 wait for 10 ns;
	 r <='0';
	 wait for 90 ns;
end process;
	 
	tbP : process
	begin
		while (ta <= "011111") loop
      ta <= ta + "000001";
      tb <= tb + "000001";
      tc <= tc + "01";
      wait for 100 ns;
		END LOOP;

		wait; -- will wait forever
	END PROCESS;
end bhv;