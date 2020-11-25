library ieee;

use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;


entity FirstBit is
	port(
				A : in std_logic_vector(0 to 15);
				N : out std_logic);
				
end FirstBit;


architecture behavior of FirstBit is

	begin
		
		N <= A(0);
		
end behavior;