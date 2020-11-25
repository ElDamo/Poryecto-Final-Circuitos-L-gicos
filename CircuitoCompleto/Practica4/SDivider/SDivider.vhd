library ieee;

use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;


entity SDivider is

	port(
				S : in std_logic_vector(0 to 3);
				C_in : out std_logic;
				SL : out std_logic_vector(0 to 1);
				SA : out std_logic_vector(0 to 1);
				masSig : out std_logic;
				segSig : out std_logic);
				
end SDivider;


architecture behavior of SDivider is
	
	begin
	
		C_in <= S(3);
		SL <= S(2 to 3);
		SA <= S(1 to 2);
		masSig <= S(0);
		segSig <= S(1);
		
end behavior;
		