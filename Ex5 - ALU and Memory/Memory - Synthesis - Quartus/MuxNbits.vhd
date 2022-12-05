library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity MuxNbits is
Generic(
Bits: integer := 4;
N:    integer := 2);
port(
sel:  in std_logic_vector(N-1 downto 0);
inpt: in std_logic_vector( Bits*((N**2) - 1) downto 0);
outpt: out std_logic_vector(Bits-1 downto 0));
end;

architecture one of MuxNbits is
signal s: integer range 0 to N**2-1;
begin
s <= conv_integer(unsigned(sel));
outpt <= inpt(((s*Bits)+(Bits-1)) downto (s*Bits));

end;