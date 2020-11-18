library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
library work;


entity PCBranch is
	port(
		SignImm: in std_logic_vector(0 to 15);
		PL : in std_logic;
		JB: in std_logic;
		BC: in std_logic;
		PC: in std_logic_vector(0 to 15);
		RA: in std_logic_vector(0 to 15);
		NextPC: out std_logic_vector(0 to 15)
	);
	
end PCBranch;

architecture behaivour of PCBranch is
begin

process(PL,BC,JB,RA)
begin
	NextPC<=PC+'1';
	if(PL='1') then
		if(JB='0') then
			if(BC='1' and RA(0)='1') then
				NextPC<=PC+SignImm;
			else
				if(BC='0' and RA=x"0000")then
					NextPC<=PC+SignImm;
				end if;
			end if;
		else
			NextPC<=RA;
		end if;
	end if;
end process;


end behaivour;