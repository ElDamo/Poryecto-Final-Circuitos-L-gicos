library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity DataMemory is
	port(
		MB: In std_logic_vector(15 downto 0); --Dato para agregar
		SA: In std_logic_vector(2 downto 0); --Dirección para guardar el dato
		clk: in std_logic; 
		reset: in std_logic;
		MW: in std_logic;--1 escribe MB en la dirección SA
		RD: out std_logic_vector(15 downto 0) --lee la dirección SA en RD
	);
	
end DataMemory;

architecture behaivour of DataMemory is
type dataMemory is array(0 to 7) of std_logic_vector(15 downto 0);
signal data : dataMemory;
begin

process(clk)
begin
	if(clk'event and clk='1') then
		if(reset='1')then
			data<=(others=>x"0000");
		else
			if(MW='1') then --Escribo el dato
				data(to_integer(unsigned(SA)))<=MB;
			end if;
		end if;
	end if;
end process;

RD<=data(to_integer(unsigned(SA))); --Devuelvo el dato solicitado o el que se escribió

end behaivour;