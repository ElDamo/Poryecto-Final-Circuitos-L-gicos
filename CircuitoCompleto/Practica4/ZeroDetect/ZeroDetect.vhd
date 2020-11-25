library ieee;

use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity ZeroDetect is

	port(
				I : in std_logic_vector(0 to 15);
				Z : out std_logic);

end ZeroDetect;


architecture behavior of ZeroDetect is

	begin
		with I select
			Z <=  '1' when "0000000000000000",
					'0' when others;
		
end behavior;