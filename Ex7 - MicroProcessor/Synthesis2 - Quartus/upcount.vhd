library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity upcount is
port (
Clear, Clock,rst: in std_logic;
Q : out std_logic_vector(1 downto 0));
end;

architecture Behavior of upcount is

signal Count : std_logic_vector(1 downto 0);

begin
process (rst,Clock)
begin
if (rst = '0') then count <= (others => '0');
elsif (Clock 'event and Clock = '1') then
	if (Clear = '1') then
		Count <= "00";
	else
		Count <= Count + 1;
	end if;
end if;

end process;

Q <= Count;
end;