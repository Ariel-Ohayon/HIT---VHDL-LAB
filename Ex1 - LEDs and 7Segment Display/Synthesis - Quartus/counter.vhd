library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
port(
clk: in std_logic;
count: buffer std_logic_vector(2 downto 0));
end;

architecture one of counter is
signal clksig: std_logic;
signal c: integer range 0 to 5000000:=0;
begin
process(clksig)
begin
	if (clksig 'event and clksig = '1') then
		if (count = 4) then count <= "000";
		else count <= count +1; end if;
	end if;
end process;
process(clk)
begin
	if (clk 'event and clk = '1') then
		if (c = 50000) then c <= 0; clksig <= not clksig;
		else c<= c+1; end if;
	end if;
end process;
end;