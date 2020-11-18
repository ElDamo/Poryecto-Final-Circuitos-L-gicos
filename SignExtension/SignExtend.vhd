library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
library work;


entity SignExtend is
	port(
		DR: In std_logic_vector(0 to 2);
		SB: In std_logic_vector(0 to 2);
		zfOP: out std_logic_vector(0 to 15);
		SignImm: out std_logic_vector(0 to 15)
	);
	
end SignExtend;

architecture behaivour of SignExtend is

begin
process(DR, SB)
begin
	if(DR(0)='1') then
		SignImm<="1111111111" & DR & SB;
	else
		SignImm<="0000000000" & DR & SB;
	end if;
	zfOP<=x"0000"+SB;
end process;
end behaivour;