library ieee;
use ieee.std_logic_1164.all;

entity mux2_1 is
port(
sel: in std_logic;
data0, data1: in std_logic_vector(7 downto 0);
outpt: out std_logic_vector(7 downto 0));
end;

architecture one of mux2_1 is
begin
with sel select
outpt <= data0 when '0',
			data1 when '1';
end;