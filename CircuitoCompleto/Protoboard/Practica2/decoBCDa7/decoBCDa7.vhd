library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity decoBCDa7 is
	port(
			T: in std_logic_vector(0 to 3);
			a: out std_logic;
			b: out std_logic;
			c: out std_logic;
			d: out std_logic;
			e: out std_logic;
			f: out std_logic;
			g: out std_logic);
end decoBCDa7;

architecture behavior of decoBCDa7 is
	begin
		a <= (not(T(0)) and not(T(2))) or (T(1) and T(2)) or (T(1) and not(T(3))) or (T(0) and T(2) and not(T(3))) or (not(T(0)) and not(T(1)) and T(3)) or (T(3) and not(T(1)) and not(T(2)));
		b <= (not(T(2)) and not(T(3))) or (not(T(0)) and not(T(2))) or (T(0) and not(T(1)) and T(3)) or (not(T(0)) and not(T(1)) and not(T(3))) or (T(0) and T(1) and not(T(3)));
		c <= (T(0) and not(T(1))) or (not(T(2)) and T(3)) or (T(2) and not(T(3))) or (not(T(1)) and not(T(3))) or (T(0) and not(T(3)));
		d <= (not(T(0)) and not(T(1)) and T(3)) or (T(0) and not(T(1)) and T(2)) or (not(T(0)) and T(1) and T(2)) or (T(0) and T(1) and not(T(2))) or (not(T(0)) and not(T(2)) and not(T(3)));
		e <= (T(2) and T(3)) or (not(T(0)) and T(1)) or (T(0) and T(1) and T(3)) or (not(T(0)) and not(T(1)) and not(T(2)));
		f <= (not(T(0)) and not(T(1))) or (not(T(2)) and T(3)) or (T(1) and T(3)) or (not(T(1)) and T(2) and not(T(3))) or (not(T(0)) and T(1) and T(2));
		g <= (not(T(2)) and T(3)) or (not(T(0)) and T(1)) or (T(0) and T(3)) or (T(1) and not(T(2))) or (not(T(1)) and T(2) and not(T(3)));
end behavior;