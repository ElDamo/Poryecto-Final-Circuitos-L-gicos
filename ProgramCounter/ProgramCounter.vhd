library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
library work;


entity ProgramCounter is
	port(
		
		clk : in std_logic;
		instruccion : in std_logic_vector(15 downto 0);
		memory0 : in std_logic_vector(15 downto 0);
		memory1 : in std_logic_vector(15 downto 0);
		memory2 : in std_logic_vector(15 downto 0);
		memory3 : in std_logic_vector(15 downto 0);
		memory4 : in std_logic_vector(15 downto 0);
		memory5 : in std_logic_vector(15 downto 0);
		memory6 : in std_logic_vector(15 downto 0);
		memory7 : in std_logic_vector(15 downto 0);
		contador : out std_logic_vector(7 downto 0) := "00000000";
		DR : out std_logic_vector(2 downto 0);
		memory_out : out std_logic_vector(15 downto 0)
	
	);
	
end ProgramCounter;

architecture behaivour of ProgramCounter is

signal contador_aux : std_logic_vector(7 downto 0) := "00000000";

begin

DR <= instruccion(8 downto 6);

	process(clk, instruccion)
		begin
		if (clk'event and clk = '1') then
			if instruccion(15 downto 14) = "10" then --comprobamos si es immediate
				if instruccion(10) = '1' then -- funcionamiento add immediate
				
					case instruccion(5 downto 3) is
										when "000" => memory_out <= (memory0 + instruccion(2 downto 0));
										when "001" => memory_out <= (memory1 + instruccion(2 downto 0));
										when "010" => memory_out <= (memory2 + instruccion(2 downto 0));
										when "011" => memory_out <= (memory3 + instruccion(2 downto 0));
										when "100" => memory_out <= (memory4 + instruccion(2 downto 0));
										when "101" => memory_out <= (memory5 + instruccion(2 downto 0));
										when "110" => memory_out <= (memory6 + instruccion(2 downto 0));
										when "111" => memory_out <= (memory7 + instruccion(2 downto 0));
					end case;
					contador_aux <= contador_aux + 1;
				elsif instruccion(11) = '1' then --sabemos que es load immediate
					memory_out(15 downto 3) <= "0000000000000";
					memory_out(2 downto 0) <= instruccion(2 downto 0);
					contador_aux <= contador_aux + 1;
				end if;
			end if;
			--aqui es donde tiene que ir el branch, jump, load y store, y la unidad funcional
		end if;
	end process;
	
	process(contador_aux)
	begin
		contador <= contador_aux;
	end process;
end behaivour;