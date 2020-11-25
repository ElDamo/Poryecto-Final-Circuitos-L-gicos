library ieee;

use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;


entity PalabraControl is

	port(
				S : in std_logic_vector(0 to 15);
				RW : out std_logic;
				MD : out std_logic;
				FS : out std_logic_vector(0 to 3);
				MB : out std_logic;
				BA : out std_logic_vector(0 to 2);
				AA : out std_logic_vector(0 to 2);
				DA : out std_logic_vector(0 to 2));
				
end PalabraControl;


architecture behavior of PalabraControl is
	
	begin
	
		RW <= S(15);
		MD <= S(14);
		FS <= S(10 to 13);
		MB <= S(9);
		BA <= S(6 to 8);
		AA <= S(3 to 5);
		DA <= S(0 to 2);
		
end behavior;
		