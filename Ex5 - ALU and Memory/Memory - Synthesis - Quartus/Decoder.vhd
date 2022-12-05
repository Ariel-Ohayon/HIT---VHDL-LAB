library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Decoder is
Generic(N: integer := 4); -- Number of outputs = 2**N
port(
inpt:  in  std_logic_vector( N downto 0 );
outpt: out std_logic_vector( (2**N) - 1 downto 0 )
);
end;

architecture one of Decoder is

signal s: integer range 0 to (2**N) - 1;

begin
s <= conv_integer(unsigned(inpt));
process (inpt)
begin
outpt <= (others => '0');
outpt(s) <= '1';
end process;
end;
