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
				data_in : in std_logic_vector(15 downto 0);
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
signal aux: std_logic_vector(15 downto 0);
type memory is array (255 downto 0) of std_logic_vector(15 downto 0);
signal ins : memory := (others => "0000000000000000");

begin

	process(clk)
	begin
		
		if (clk'event and clk = '1') then
			if reset = '1' then
				ins <= (others => "0000000000000000");
			elsif write_on = '1' then
				ins(to_integer(unsigned(address))) <= data_in;
			end if;
		end if;
	end process;
	
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
	
end behavior;