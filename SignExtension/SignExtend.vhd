library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
library work;


entity SignExtend is
	port(
		DR: In std_logic_vector(2 downto 0); -- AD izquierda
		SB: In std_logic_vector(2 downto 0); -- Corresponde a OP y AD derecha
		zfOP: out std_logic_vector(15 downto 0); --Extiende la señal OP, para las operaciones immediate, la señal pasa de 3 a 16 bits, se rellena con ceros
		SignImm: out std_logic_vector(15 downto 0) --Señal extendida para el branch, extiende AD de 6 a 16 bits manteniendo el signo
	);
	
end SignExtend;

architecture behaivour of SignExtend is

begin
process(DR, SB)
begin
	if(DR(2)='1') then --checa el signo del primer bit
		SignImm<="1111111111" & DR & SB;
	else
		SignImm<="0000000000" & DR & SB;
	end if;
	zfOP<=x"0000"+SB;
end process;
end behaivour;