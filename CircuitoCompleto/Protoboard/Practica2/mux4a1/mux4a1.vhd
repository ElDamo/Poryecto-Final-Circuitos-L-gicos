library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux4a1 is
	port(
			A: in std_logic_vector(0 to 3);
			B: in std_logic_vector(0 to 3);
			C: in std_logic_vector(0 to 3);
			D: in std_logic_vector(0 to 3);
			S: in std_logic_vector(0 to 1);
			F: out std_logic_vector(0 to 3));
end mux4a1;

architecture behavior of mux4a1 is
	begin
	with S select
		F <= A when "00",
			  B when "01",
			  C when "10",
			  D when "11",
			  "XXXX" when others;
end behavior;