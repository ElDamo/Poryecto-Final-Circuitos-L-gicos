library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Shifter is

	port(		
				S : in std_logic_vector(0 to 1);
				B : in std_logic_vector(0 to 15);
				G : out std_logic_vector(0 to 15));
	
end Shifter;


architecture behavior of Shifter is

signal L: std_logic_vector(0 to 15);
signal R: std_logic_vector(0 to 15);

	begin
	
	L(15) <= '0';
	L(14) <= B(15);
	L(13) <= B(14);
	L(12) <= B(13);
	L(11) <= B(12);
	L(10) <= B(11);
	L(9) <= B(10);
	L(8) <= B(9);
	L(7) <= B(8);
	L(6) <= B(7);
	L(5) <= B(6);
	L(4) <= B(5);
	L(3) <= B(4);
	L(2) <= B(3);
	L(1) <= B(2);
	L(0) <= B(1);
	
	R(0) <= '0';
	R(1) <= B(0);
	R(2) <= B(1);
	R(3) <= B(2);
	R(4) <= B(3);
	R(5) <= B(4);
	R(6) <= B(5);
	R(7) <= B(6);
	R(8) <= B(7);
	R(9) <= B(8);
	R(10) <= B(9);
	R(11) <= B(10);
	R(12) <= B(11);
	R(13) <= B(12);
	R(14) <= B(13);
	R(15) <= B(14);
	
	with S select
			G <=  B when "00",
					R when "01",
					L when "10",
					B when "11",
					"XXXXXXXXXXXXXXXX" when others;
								
end behavior;