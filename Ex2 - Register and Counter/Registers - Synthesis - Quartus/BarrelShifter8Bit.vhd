library ieee;
use ieee.std_logic_1164.all;

entity BarrelShifter8Bit is
port(
sel: in std_logic_vector(1 downto 0);
inpt: in std_logic_vector(7 downto 0);
clk,Enable: in std_logic;
outpt: buffer std_logic_vector(7 downto 0));
end;

architecture one of BarrelShifter8Bit is
begin
process(clk,Enable)
begin
if (clk 'event and clk = '1') then
	if (Enable = '1') then outpt <= inpt;
	else
		case sel is
		when "00" => outpt <= outpt(6 downto 0) & outpt(7); --"0"
		when "01" => outpt <= outpt(5 downto 0) & outpt(7 downto 6); --"00"
		when "10" => outpt <= outpt(4 downto 0) & outpt(7 downto 5); --"000"
		when "11" => outpt <= outpt(3 downto 0) & outpt(7 downto 4); --"0000"
		end case;
	end if;
end if;
end process;
end;






