library ieee;
use ieee.std_logic_1164.all;

entity Decoder7Segment is
port(
inpt:  in  std_logic_vector(3 downto 0);
outpt: out std_logic_vector(6 downto 0));
end;

architecture one of Decoder7Segment is
begin

with inpt select
outpt <= "1000000" when "0000", -- '0'
			"1111001" when "0001", -- '1'
			"0100100" when "0010", -- '2'
			"0110000" when "0011", -- '3'
			"0011001" when "0100", -- '4'
			"0010010" when "0101", -- '5'
			"0000010" when "0110", -- '6'
			"1111000" when "0111", -- '7'
			"0000000" when "1000", -- '8'
			"0010000" when OTHERS; -- '9'
--			"" when "1010", -- 'A'
--			"" when "1011", -- 'B'
--			"" when "1100", -- 'C'
--			"" when "1101", -- 'D'
--			"" when "1110", -- 'E'
--			"" when "1111", -- 'F' (OTHERS)

end;