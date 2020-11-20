library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
library work;


entity ProgramCounter is
	port(
	
		instruccion : in std_logic_vector(15 downto 0);
	
	);
	
end ProgramCounter;

architecture behaivour of ProgramCounter is
begin

	if( instruccion(15 to 14) = "10") then --comprobamos si es immediate
		if instruccion(10) = '1' then -- funcionamiento add immediate
			MEMORIA_CORRESPONDIENTE_A_BITS_INSTRUCCION(8 downto 6) <= MEMORIA_CORRESPONDIENTE_A_BITS_INSTRUCCION(5 downto 3) + instruccion(2 downto 0);
		else --sabemos que es load immediate
			MEMORIA_CORRESPONDIENTE_A_BITS_INSTRUCCION(8 downto 6) <= instruccion(2 downto 0);
		end if;
	end if;

end behaivour;