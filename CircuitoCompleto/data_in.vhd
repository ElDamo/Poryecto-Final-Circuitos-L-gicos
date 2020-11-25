library ieee;

use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;


entity data_in is
	
	port(
				G : out std_logic_vector(0 to 15));
				
end data_in;


architecture behavior of data_in is
	begin
	G <= "0001000100100011";

end behavior;