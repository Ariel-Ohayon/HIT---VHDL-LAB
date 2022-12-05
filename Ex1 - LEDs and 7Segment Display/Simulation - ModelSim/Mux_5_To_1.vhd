library ieee;
use ieee.std_logic_1164.all;

entity Mux_5_To_1 is
generic (M: integer := 3);
port(
in0: in  std_logic_vector(M-1 downto 0);
in1: in  std_logic_vector(M-1 downto 0);
in2: in  std_logic_vector(M-1 downto 0);
in3: in  std_logic_vector(M-1 downto 0);
in4: in  std_logic_vector(M-1 downto 0);
sel: in  std_logic_vector(2 downto 0);
x:   out std_logic_vector(M-1 downto 0));
end;

architecture one of Mux_5_To_1 is
begin
with sel select
x <= in0 when "000",
	  in1 when "001",
	  in2 when "010",
	  in3 when "011",
	  in4 when others;
end;

---

library ieee;
use ieee.std_logic_1164.all;

entity Decoder_7Segment is
port(
inpt: in std_logic_vector(2 downto 0);
outpt: out std_logic_vector(6 downto 0));
end;

architecture one of Decoder_7Segment is
begin
process(inpt)
begin
case inpt is
when "000" => outpt <= "0001001"; -- H "0001001"
when "001" => outpt <= "0000110"; -- E "0000110"
when "010" => outpt <= "1000111"; -- L "1000111"
when "011" => outpt <= "1000000"; -- O "1000000"
when OTHERS => outpt <= "1111111"; -- Blank
end case;
end process;
end;



