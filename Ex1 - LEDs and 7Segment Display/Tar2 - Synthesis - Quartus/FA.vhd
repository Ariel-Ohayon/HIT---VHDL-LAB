-- / FA - Component Architecture \ --

library ieee;
use ieee.std_logic_1164.all;

entity FA is
port(
A,B,Cin: in std_logic;
Sum,Cout: out std_logic);
end;

architecture one of FA is
begin
Sum <= A xor B xor Cin;
Cout <= (A and B) or (A and Cin) or (B and Cin);
end;