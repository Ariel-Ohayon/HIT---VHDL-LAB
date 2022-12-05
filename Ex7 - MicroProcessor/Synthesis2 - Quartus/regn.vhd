library ieee;
use ieee.std_logic_1164.all;

entity regn is
generic (n : integer := 16);
port (
R: in std_logic_vector(n-1 downto 0);
rst, Rin, Clock: in std_logic;
Q: buffer std_logic_vector(n-1 downto 0));
end;

architecture Behavior of regn is
begin
process (rst,Clock)
begin
if (rst = '0') then Q <= (others =>'0');
elsif (Clock 'event and Clock = '1') then
	if (Rin = '1') then
		Q <= R;
	end if;
end if;
end process;
end;