library ieee;
use ieee.std_logic_1164.all;

entity GenOR is
Generic(N:integer := 8);
port(
inpt: in std_Logic_vector(N-1 downto 0);
outpt: out std_logic);
end;

architecture one of GenOR is
begin
process(inpt)
variable x:std_logic;
begin
x:='0';
for i in N-1 downto 0 loop
x := inpt(i) or x;
end loop;
outpt <= x;
end process;
end;