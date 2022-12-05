library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BCD_Conv is
port(
inpt: in std_logic_vector(4 downto 0);
outpt: out std_logic_vector(7 downto 0));
end;

architecture one of BCD_Conv is
signal sin: std_logic_vector(7 downto 0);
begin
sin <= "000" & inpt;
process(inpt)
begin
if    (inpt > 29)  then outpt <= (sin + 18);
elsif (inpt > 19)  then outpt <= (sin + 12);
elsif (inpt > 9)   then outpt <= (sin + 6);
else outpt <= sin;
end if;
end process;
end;