library ieee;

--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InstructionQueue is
port(
				clk : in std_logic;
				reset : in std_logic;
				write_on : in std_logic;
				address : in std_logic_vector(15 downto 0);
				Next_Instr_address: in std_logic_vector(15 downto 0);
				data_in : in std_logic_vector(15 downto 0);
				Instr_address: out std_logic_vector(15 downto 0);
				data_out : out std_logic_vector(15 downto 0);
				BA: out std_logic_vector(2 downto 0);
				AA: out std_logic_vector(2 downto 0);
				DA: out std_logic_vector(2 downto 0);
				MB: out std_logic;
				FS: out std_logic_vector(3 downto 0);
				MD: out std_logic;
				RW: out std_logic;
				MW: out std_logic;
				PL: out std_logic;
				JB: out std_logic;
				BC: out std_logic
	);
				
end InstructionQueue;

architecture behavior of InstructionQueue is
signal count: std_logic_vector(15 downto 0):="0000000000001000";
signal aux:std_logic_vector(15 downto 0);
type memory is array (255 downto 0) of std_logic_vector(15 downto 0);
signal ins : memory := (0 => "1001100000000111",
								1 => "1000010000000111",
								2 => "0001110000000000",
								3 => "0001110000000000",
								4 => "0001110000000000",
								5 => "0001110001000000",
								6 => "0000010010000001",
								7 => "0001010011000001",
								8 => "0001001100010011",
								9 => "0001110101000011",
								10=> "0001011110011000",
								11=> "0000101111011001", 
								12=> "0101100000000000", --Mostrar contenido registros
								13=> "0101100000000001",
								14=> "0101100000000010",
								15=> "0101100000000011",
								16=> "0101100000000100",
								17=> "0101100000000101",
								18=> "0101100000000110",
								19=> "0101100000000111",
								20=> "0100000000011110", --Guardo en la memoria con dirección r3, el dato en r6
								21=> "0101100000000010", --Muestro R2
								22=> "0010000010011000", --Cargo en R2 el dato guardado en memoria
								23=> "0101100000000010", --Muestro R2
								24=> "1100001001110111", --branch negativo al 39, si el registro en R6 es negativo
								25=> "0000000000000000",
								26=> "0000000000000000",
								27=> "0000000000000000",
								28=> "0000000000000000",
								29=> "0000000000000000",
								30=> "0000000000000000", 
								31=> "0000000000000000",
								32=> "0000000000000000",
								33=> "0000000000000000",
								34=> "0000000000000000",
								35=> "0000000000000000",
								36=> "0000000000000000",
								37=> "0000000000000000",
								38=> "0000000000000000",
								39=> "0101100000000001", --Muestro registro 1
								40=> "0101100000000000",
								41=> "0100000000000001", --El dato en 1 lo guardo en la memoria con la dirección del dato en 0
								42=> "0010000111000000", --Cargo en el registro 7 el dato guardado en memoria
								43=> "1001100000000000", --Cargo con la constante el registro 0
								44=> "0101100000000111", --Muestro el registro 7
								45=> "0101100000000000", --Muestro el registro 0
								46=> "1000010111111010", --Add immediate
								47=> "0101100000000111",
 								others => "0000000000000000");

begin
	process(write_on)
	begin
		
		if (write_on'event and write_on = '1') then
			if reset = '1' then
				ins <= (others => "0000000000000000");
			elsif write_on = '1' then
				count<=Next_Instr_address;
				ins(to_integer(unsigned(count))) <= data_in;
			end if;
		end if;
	end process;
	
	process(address)
	begin
		
		aux <= ins(to_integer(unsigned(address)));

		data_out<=aux;

		MB<= aux(15);
		FS<= aux(12 downto 10) & (aux(9) and not(aux(15) and aux(14)));
		MD<= aux(13);
		RW<= not(aux(14));
		MW<= (aux(14) and not(aux(15)));
		PL<= (aux(15) and aux(14));
		JB<= aux(13);
		BC<= aux(9);
		BA<= aux(2 downto 0);
		AA<= aux(5 downto 3);
		DA<= aux(8 downto 6);
	
	end process;
Instr_address<=count;
	
end behavior;