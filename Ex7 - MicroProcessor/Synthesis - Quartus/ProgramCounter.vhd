library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ProgramCounter is
port(
clk,clr: in     std_logic;
outpt:   buffer std_logic_vector(3 downto 0));
end;

architecture one of ProgramCounter is
begin
process(clk,clr)
begin
if (clr = '1') then outpt <= (others => '0');
elsif (clk 'event and clk = '1') then outpt <= outpt + 1;
end if;
end process;
end;