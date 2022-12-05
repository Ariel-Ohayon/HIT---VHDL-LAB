library ieee;
use ieee.std_logic_1164.all;

entity shiftreg is
port(
datain,en,rst,clk: in std_logic;
dataout: buffer std_logic_vector(10 downto 0));
end;

architecture one of shiftreg is
begin
process (rst,clk)
begin
if (rst = '1') then dataout <= (others => '0');
elsif (clk 'event and clk = '1') then
	if (en = '1') then
		dataout <= datain & dataout(10 downto 1);
	end if;
end if;
end process;
end;