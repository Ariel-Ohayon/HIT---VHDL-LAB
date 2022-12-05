library ieee;
use ieee.std_logic_1164.all;

entity RegisterNbits is
generic(N: integer := 8);
port(
Rst,En,clk: in  std_logic;
inpt:       in  std_logic_vector(N-1 downto 0);
outpt:      out std_logic_vector(N-1 downto 0));
end;

architecture one of RegisterNbits is
signal sQ,sE: std_logic_vector(N-1 downto 0);
begin
process(Rst,clk)
begin
if (Rst = '1') then sQ <= (others => '0');
elsif (clk 'event and clk = '1') then
	if (En = '1') then sQ <= inpt; end if;
end if;
end process;
sE <= (others => En);
outpt <= sE and sQ;
end;