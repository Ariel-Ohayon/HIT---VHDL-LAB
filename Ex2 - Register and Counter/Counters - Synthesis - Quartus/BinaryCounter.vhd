library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BinaryCounter is
port(En,clk,UD,clr: in std_logic;
outpt: buffer std_logic_vector(3 downto 0):="0000");
end;

architecture one of BinaryCounter is
begin
process(En,clk)
begin
if (clr = '0') then outpt <= (others => '0');
elsif (En = '0') then
	if (clk 'event and clk = '1') then
		if (ud = '1') then -- UP
			outpt <= outpt + 1;
		else -- Down
			outpt <= outpt - 1;
		end if;
end if;
end if;
end process;
end;





