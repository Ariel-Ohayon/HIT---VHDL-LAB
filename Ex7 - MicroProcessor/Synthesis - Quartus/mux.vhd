library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(
sel: in std_logic_vector(1 downto 0);
data0: in  std_logic_vector(7 downto 0);
data1: in  std_logic_vector(7 downto 0);
data2: in  std_logic_vector(7 downto 0);
data3: in  std_logic_vector(7 downto 0);
outpt: out std_logic_vector(7 downto 0));
end;

architecture one of mux is
begin
with sel select
outpt <= data0 when "00",
			data1 when "01",
			data2 when "10",
			data3 when "11";
end;