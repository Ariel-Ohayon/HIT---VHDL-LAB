library ieee;
use ieee.std_logic_1164.all;

entity Parity_Gen is
generic (N: integer:=4);
port(
inpt: std_logic_vector(N-1 downto 0);
outpt: out std_logic);
end;

architecture one of Parity_Gen is
begin
process(inpt)
variable x: std_logic;
begin
x:='0';
for i in 0 to N-1 loop
x := x xor inpt(i);
end loop;
outpt <= x;
end process;
end;