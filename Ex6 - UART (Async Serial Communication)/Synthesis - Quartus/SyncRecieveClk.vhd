library ieee;
use ieee.std_logic_1164.all;

entity SyncRecieveClk is
port(
clkin,En: in  std_Logic;
clkout:   out std_logic);
end;

architecture one of SyncRecieveClk is

signal clkdiv: integer range 0 to 5208 := 0;

begin

process(En,clkin)
begin
if (En = '1') then
	if (clkin 'event and clkin = '1') then
		if ((clkdiv < 2604) or (clkdiv = 2604)) then
			clkdiv <= clkdiv+1;
			clkout<='0';
		elsif ((clkdiv < 5208) and (clkdiv > 2604)) then
			clkdiv <= clkdiv + 1;
			clkout <= '1';
		else
			clkdiv <= 0;
			clkout <= '0';
		end if;
	end if;
else
	clkout <= '0';
end if;
end process;

end;