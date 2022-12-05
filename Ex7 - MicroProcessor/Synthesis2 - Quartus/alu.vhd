library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(
A,B: in std_logic_vector (15 downto 0);
addsub: in std_logic;
outpt: out std_logic_vector(15 downto 0));
end;

architecture one of ALU is
begin
outpt <= A + B when addsub = '0' else A - B ;
end;