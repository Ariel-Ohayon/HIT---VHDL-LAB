library ieee;
use ieee.std_logic_1164.all;

entity Recieve_Enable is
port(
Lrx,clkin: in std_logic;
flag: out std_logic);
end;

architecture one of Recieve_Enable is

signal count:  integer range 0 to 11   := 0;
signal sflag: std_logic := '0';


begin
process(Lrx,clkin)
begin

if (Lrx 'event and Lrx = '0') then
	if (sflag = '0') then
		sflag <='1';
	end if;
end if;

if ((clkin 'event and clkin = '1') and (sflag='1')) then count <= count + 1; end if;

if (count = 11) then
	count <= 0;
	sflag <= '0';
end if;

end process;
flag <= sflag;
end;