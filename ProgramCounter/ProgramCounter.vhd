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
		memory_bank_data_in : in std_logic_vector(15 downto 0);
		contador : out std_logic_vector(15 downto 0) := X"0000";
		DR : out std_logic_vector(2 downto 0); -- se usa para escribir en registros de propóstio general
		memory_bank_data : out std_logic_vector(15 downto 0);
		memory_bank_address : out std_logic_vector(15 downto 0) := X"0000";
		memory_bank_write : out std_logic := '0';
		memory_out : out std_logic_vector(15 downto 0) --se usa para escribir en registros de propósito general
	
	);
	
end ProgramCounter;

architecture behaivour of ProgramCounter is

signal contador_aux : std_logic_vector(15 downto 0) := X"0000";

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
				
				elsif instruccion(15 downto 13) = "010" then --comprobamos si es store
					memory_bank_write <= '1';
					case instruccion(2 downto 0) is
										when "000" => memory_bank_data <= memory0;
										when "001" => memory_bank_data <= memory1;
										when "010" => memory_bank_data <= memory2;
										when "011" => memory_bank_data <= memory3;
										when "100" => memory_bank_data <= memory4;
										when "101" => memory_bank_data <= memory5;
										when "110" => memory_bank_data <= memory6;
										when "111" => memory_bank_data <= memory7;
					end case;
					case instruccion(5 downto 3) is
										when "000" => memory_bank_address <= memory0;
										when "001" => memory_bank_address <= memory1;
										when "010" => memory_bank_address <= memory2;
										when "011" => memory_bank_address <= memory3;
										when "100" => memory_bank_address <= memory4;
										when "101" => memory_bank_address <= memory5;
										when "110" => memory_bank_address <= memory6;
										when "111" => memory_bank_address <= memory7;
					end case;
					contador_aux <= contador_aux + 1;
					
				elsif instruccion(15 downto 13) = "001" then --comprobamos que es load
					memory_bank_write <= '0';
					memory_out <= memory_bank_data_in;
					case instruccion(5 downto 3) is
										when "000" => memory_bank_address <= memory0;
										when "001" => memory_bank_address <= memory1;
										when "010" => memory_bank_address <= memory2;
										when "011" => memory_bank_address <= memory3;
										when "100" => memory_bank_address <= memory4;
										when "101" => memory_bank_address <= memory5;
										when "110" => memory_bank_address <= memory6;
										when "111" => memory_bank_address <= memory7;
					end case;
					contador_aux <= contador_aux + 1;
					
				--aqui es donde tiene que ir el branch, jump, y la unidad funcional con elsifs	
			end if;
		end if;
	end process;
	
	process(contador_aux)
	begin
		contador <= contador_aux;
	end process;
end behaivour;