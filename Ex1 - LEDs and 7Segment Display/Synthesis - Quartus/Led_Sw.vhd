library ieee;
use ieee.std_logic_1164.all;

entity Led_Sw is
port(
Sw: in std_logic;
Led: out std_logic);
end;

architecture one of Led_Sw is
begin
Led <= Sw;
end;