library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity IR_Counter is
	port(
				Instr_address: in std_logic_vector(15 downto 0);
				Next_Instr_address: out std_logic_vector(15 downto 0)
				
	);
				
end IR_Counter;

architecture behavior of IR_Counter is

begin
	Next_Instr_address<=Instr_address+"0000000000000001";

	
end behavior;