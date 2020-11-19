library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity DataMemory is
	port(
		MB: In std_logic_vector(0 to 15);
		SA: In std_logic_vector(0 to 2);
		clk: in std_logic;
		MW: in std_logic;--1 escribe MB en la dirección SA
		RD: out std_logic_vector(0 to 15) --lee la dirección SA en RD
	);
	
end DataMemory;

architecture behaivour of DataMemory is
type dataMemory is array(0 to 7) of std_logic_vector(0 to 15);
signal data : dataMemory;
begin

process(clk)
begin
	if(clk'event and clk='1') then
		if(MW='1') then
			data(to_integer(unsigned(SA)))<=MB;
		end if;
	end if;
	RD<=data(to_integer(unsigned(SA)));
end process;

end behaivour;