library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
library work;


entity ProgramCounter is
	port(
		
		clk : in std_logic;
		instruccion : in std_logic_vector(15 downto 0);
		PL : in std_logic; 
		JB: in std_logic; 
		BC: in std_logic; 
		RA: in std_logic_vector(15 downto 0); --Valor del registro de la dirección SA
		contador : out std_logic_vector(15 downto 0) := X"0000"
		
	
	);
	
end ProgramCounter;

architecture behaivour of ProgramCounter is
signal AD_extended: std_logic_vector(15 downto 0);
signal contador_aux : std_logic_vector(15 downto 0) := X"0000";

begin


	process(clk, instruccion)
		begin
		if (clk'event and clk = '1') then
			
			--Realizo el aumento del contador, checa las señales que regresa el instructionQueue de extender el opcode
			if(PL='1') then 
				if(JB='0') then --Hacer branch
					--Extiendo la señal 
					if(instruccion(8)='1') then
						AD_extended<="1111111111" & instruccion(8 downto 6) & instruccion(2 downto 0);
					else
						AD_extended<="0000000000" & instruccion(8 downto 6) & instruccion(2 downto 0);
					end if;
					
					--Branch condicional negativo
					if(BC='1' and RA(15)='1') then --Toma el primer bit de RA, si es 1 es negativo
						contador_aux<=contador_aux+AD_extended;
					else
						--Branch condicional en cero
						if(BC='0' and RA=x"0000")then
							contador_aux<=contador_aux+AD_extended;
						else
							contador_aux<=contador_aux+'1';
						end if;
					end if;
				else
					--Jump
					contador_aux<=RA;
				end if;
			else
				contador_aux<=contador_aux+'1';
			end if;	
			
		end if;
	end process;
	
	process(contador_aux)
	begin
		contador <= contador_aux;
	end process;
end behaivour;