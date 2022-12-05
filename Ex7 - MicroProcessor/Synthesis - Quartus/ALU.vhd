library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(
op: in std_logic_vector(2 downto 0);
A,B: in std_logic_vector(7 downto 0);
outpt: out std_logic_vector(7 downto 0);
flags: out std_Logic_vector(1 downto 0));
end;

architecture one of ALU is
signal feq,fbig: std_logic;
begin
with op select
outpt <= A + B   				  when "000",
			A - B               when "001",
			(others => '0')     when "010",
			(others => '0')     when "011",
			A and B             when "100",
			A or  B 				  when "101",
			not A   				  when "110",
			A xor B 				  when "111";
fbig <= '1' when (A > B) else '0';
feq  <= '1' when (A = B) else '0';

flags(0) <= fbig when (op = "010") else '0';
flags(1) <= feq  when (op = "011") else '0';

end;