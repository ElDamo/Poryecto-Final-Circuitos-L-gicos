library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity inversor16todownto is

	port(
				eto : in std_logic_vector(0 to 15);
				sdownto : out std_logic_vector(15 downto 0));
				
end inversor16todownto;

architecture behavior of inversor16todownto is

begin
	
--	sdownto(0) <= eto(15);
--	sdownto(1) <= eto(14);
--	sdownto(2) <= eto(13);
--	sdownto(3) <= eto(12);
--	sdownto(4) <= eto(11);
--	sdownto(5) <= eto(10);
--	sdownto(6) <= eto(9);
--	sdownto(7) <= eto(8);
--	sdownto(8) <= eto(7);
--	sdownto(9) <= eto(6);
--	sdownto(10) <= eto(5);
--	sdownto(11) <= eto(4);
--	sdownto(12) <= eto(3);
--	sdownto(13) <= eto(2);
--	sdownto(14) <= eto(1);
--	sdownto(15) <= eto(0);

sdownto <= eto;
	
end behavior;