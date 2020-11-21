library ieee;

--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryBank is
	port(
				clk : in std_logic;
				reset : in std_logic;
				write_on : in std_logic;
				address : in std_logic_vector(15 downto 0);
				data_in : in std_logic_vector(15 downto 0);
				data_out : out std_logic_vector(15 downto 0));
				
end MemoryBank;

architecture behavior of MemoryBank is

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
	
data_out <= ins(to_integer(unsigned(address)));
	
end behavior;