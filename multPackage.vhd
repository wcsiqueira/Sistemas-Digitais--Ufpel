library ieee;
use ieee.std_logic_1164.all;

package multPackage is

  component multx7 is
    generic( x : integer := 6);
    port( a : in std_logic_vector(x - 1 downto 0);
          m : out std_logic_vector(x + x - 1 downto 0)
   );
  end component;
  
  component seqMult is
	generic(x : integer := 6; y : integer := 6);
	port( a : in std_logic_vector(x-1 downto 0);
			b : in std_logic_vector(y-1 downto 0);
			c : in std_logic;
			r : in std_logic;
			m : out std_logic_vector(x + y - 1 downto 0)	
	);
  end component;
  
  component multMatri is
	   port(	a : in std_logic_vector(5 downto 0);
			     b : in std_logic_vector(5 downto 0);
        			m : out std_logic_vector(11 downto 0)
	);
  end component;
  
end multPackage;



 