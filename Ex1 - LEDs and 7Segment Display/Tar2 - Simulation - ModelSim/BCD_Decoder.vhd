library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BCD_Decoder is
port(inpt:  in  std_logic_vector(4 downto 0);
	  outpt: out std_logic_vector(7 downto 0));
end;

architecture one of BCD_Decoder is
signal s: std_logic_vector(7 downto 0);
begin

s <= ("000")&inpt;

outpt <= s + 18 when inpt > 29 else
			s + 12 when inpt > 19 else
			s + 6  when inpt > 9 else
			s;

end;