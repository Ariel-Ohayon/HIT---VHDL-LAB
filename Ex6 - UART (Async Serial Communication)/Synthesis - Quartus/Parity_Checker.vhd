library ieee;
use ieee.std_logic_1164.all;

entity Parity_Checker is
port(
inpt,clk,rst: in std_logic;
Pstate: out std_logic);
end;

architecture one of Parity_Checker is
signal d,Q: std_logic;
begin
process(clk)
begin
if (rst = '0') then Q<='0';
elsif (clk 'event and clk = '1') then Q<=d; end if;
end process;
d <= Q xor inpt;
Pstate <= Q;
end;