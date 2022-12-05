library ieee;
use ieee.std_logic_1164.all;

entity LPF is
port(
inpt, clk: in std_logic;
outpt: out std_logic);
end;

architecture one of LPF is

component Generator
generic(N:  integer:= 50000000;
		  DC: integer:= 25000000);
port(
clkin: in std_logic;
clkout: buffer std_logic:='1');
end component;

signal iclk: std_logic;
begin
U: Generator generic map (50000,25000) port map (clk,iclk);
process(clk)
begin
if (iclk 'event and iclk = '1') then
	outpt<=inpt;
end if;
end process;
end;