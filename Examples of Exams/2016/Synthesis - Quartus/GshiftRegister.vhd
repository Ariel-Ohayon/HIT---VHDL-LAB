library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity GshiftRegister is
port(
clk,en: in  	std_logic;
count:  out std_logic_vector(2 downto 0);
Q:      buffer std_logic_vector(7 downto 0));
end;

architecture one of GshiftRegister is
signal counter: std_logic_vector(2 downto 0) := "000";
begin

process (en,clk)
begin
if (en = '1') then
	if (clk 'event and clk = '0') then
		if (counter = "111") then
			counter <= "000";
			Q <= (others => '0');
		else
			counter <= counter + 1;
			Q <= Q(6 downto 0) & '1';
		end if;
	end if;
end if;
end process;
count <= counter;
end;