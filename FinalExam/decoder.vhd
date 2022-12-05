library ieee;
use ieee.std_logic_1164.all;

entity Decoder is
port(
inpt: in std_logic_vector(2 downto 0);
outpt: out std_logic_vector(6 downto 0));
end;

architecture one of decoder is
begin
with inpt select
outpt <= "0000000" when "111",
			"0000001" when "110",
			"0000011" when "101",
			"0000111" when "100",
			"0001111" when "011",
			"0011111" when "010",
			"0111111" when "001",
			"1111111" when "000";
end;