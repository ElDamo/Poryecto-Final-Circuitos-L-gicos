library ieee;

use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity inversor4downtoto is
	port(
				edownto : in std_logic_vector(3 downto 0);
				sto0 : out std_logic;
				sto1 : out std_logic;
				sto2 : out std_logic;
				sto3 : out std_logic);
				
end inversor4downtoto;


architecture behavior of inversor4downtoto is
	begin
		
		sto0 <= edownto(0);
		sto1 <= edownto(1);
		sto2 <= edownto(2);
		sto3 <= edownto(3);
	
end behavior;