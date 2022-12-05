library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Diff is
port(
in1,in2: in std_logic_vector(2 downto 0);
outpt: out std_logic_vector(2 downto 0));
end;

architecture one of Diff is
begin
outpt <= in1-in2 when (in1 > in2) else (1 + not(in1-in2));
end;