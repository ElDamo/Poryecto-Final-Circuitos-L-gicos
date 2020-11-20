library ieee;

use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;


entity mux2a1 is
	
	port(
				S : in std_logic;
				A : in std_logic_vector(0 to 15);
				B : in std_logic_vector(0 to 15);
				G : out std_logic_vector(0 to 15));
				
end mux2a1;


architecture behavior of mux2a1 is
	
	begin
		
		with S select
					G <= A when '0',
						  B when '1',
						  "XXXXXXXXXXXXXXXX" when others;


end behavior;