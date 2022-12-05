library ieee;
use ieee.std_logic_1164.all;

entity Reg is
port(
inpt: in std_logic_vector(7 downto 0);
clk: in std_logic;
outpt: out std_logic_vector(7 downto 0));
end;

architecture one of Reg is
signal Q: std_logic_vector(7 downto 0);
begin
process(clk)
begin
if (clk 'event and clk = '1') then outpt<=inpt; end if;
end process;
end;