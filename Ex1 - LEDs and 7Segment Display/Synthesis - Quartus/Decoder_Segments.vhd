library ieee;
use ieee.std_logic_1164.all;

entity Decoder_Segments is
port(
inpt:  in  integer range 0 to 9;
outpt: out std_logic_vector (6 downto 0));
end;

architecture one of Decoder_Segments is
begin
process(inpt)
begin
case inpt is
when 0 => outpt <= "1000000";
when 1 => outpt <= "1111001";
when 2 => outpt <= "0100100";
when 3 => outpt <= "0110000";
when 4 => outpt <= "0011001";
when 5 => outpt <= "0010010";
when 6 => outpt <= "0000010";
when 7 => outpt <= "1111000";
when 8 => outpt <= "0000000";
when 9 => outpt <= "0010000";
end case;
end process;
end;