library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity DataMemory is
	port(
		MB: In std_logic_vector(15 downto 0); --Dato para agregar
		SA: In std_logic_vector(2 downto 0); --Dirección para guardar el dato
		clk: in std_logic; 
		reset: in std_logic;
		MW: in std_logic;--1 escribe MB en la dirección SA
		RD0: out std_logic_vector(15 downto 0);
		RD1: out std_logic_vector(15 downto 0);
		RD2: out std_logic_vector(15 downto 0);
		RD3: out std_logic_vector(15 downto 0);
		RD4: out std_logic_vector(15 downto 0);
		RD5: out std_logic_vector(15 downto 0);
		RD6: out std_logic_vector(15 downto 0);
		RD7: out std_logic_vector(15 downto 0)
	);
	
end DataMemory;

architecture behaivour of DataMemory is
type dataMemory is array(0 to 7) of std_logic_vector(15 downto 0);
signal data : dataMemory;
begin

process(clk)
begin
	if(clk'event and clk='1') then
		if(reset='1')then
			data<=(others=>x"0000");
		else
			if(MW='1') then --Escribo el dato
				data(to_integer(unsigned(SA)))<=MB;
			end if;
		end if;
	end if;
end process;

RD0<=data(0); --Se devuelven los datos guardados en la memoria
RD1<=data(1);
RD2<=data(2);
RD3<=data(3);
RD4<=data(4);
RD5<=data(5);
RD6<=data(6);
RD7<=data(7);

end behaivour;