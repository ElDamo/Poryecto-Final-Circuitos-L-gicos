library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
library work;


entity PCBranch is
	port(
		SignImm: in std_logic_vector(15 downto 0);
		PL : in std_logic; --Indica si se realiza un jump/branch=1, con 0 se PC se incrementa en 1
		JB: in std_logic; --Indica si se realiza un jump=1 o branch=0
		BC: in std_logic; --Indica si se realiza un branch condicional en cero o negativo
		PC: in std_logic_vector(15 downto 0); --Recibe el PC actual
		RA: in std_logic_vector(15 downto 0); --Recibe el valor de la dirección SA en los registros, para checar las condiciones en el branch o hacer el jump
		NextPC: out std_logic_vector(15 downto 0) --Entrega el siguiente PC
	);
	
end PCBranch;

architecture behaivour of PCBranch is
begin

process(PL,BC,JB,RA)
begin
	
	if(PL='1') then 
		if(JB='0') then
			if(BC='1' and RA(15)='1') then --Toma el primer bit de RA, si es 1 es negativo
				NextPC<=PC+SignImm;
			else
				if(BC='0' and RA=x"0000")then
					NextPC<=PC+SignImm;
				else
					NextPC<=PC+'1';
				end if;
			end if;
		else
			NextPC<=RA;
		end if;
	else
		NextPC<=PC+'1';
	end if;
end process;


end behaivour;