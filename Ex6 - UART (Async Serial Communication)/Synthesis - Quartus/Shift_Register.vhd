library ieee;
use ieee.std_Logic_1164.all;

entity Shift_Register is
generic(Bits: integer := 8);
port(
EnOut, EnShift, rst, clk, d: in std_logic;
Q: out std_logic_vector(Bits-1 downto 0));
end;

architecture one of Shift_Register is
signal sEnOut, sQ: std_logic_vector (Bits-1 downto 0);
begin
process(rst,clk)
begin
if (rst = '1') then sQ <= (others => '0');
elsif (clk 'event and clk = '1') then
	if (EnShift = '1') then
		sQ <= d & sQ(Bits-1 downto 1);
	end if;
end if;
end process;
sEnOut <= (others => EnOut);
Q <= sQ and sEnOut;
end;