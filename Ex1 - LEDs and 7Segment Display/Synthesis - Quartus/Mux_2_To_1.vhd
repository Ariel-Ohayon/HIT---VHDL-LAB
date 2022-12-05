library ieee;
use ieee.std_logic_1164.all;

entity Mux_2_To_1 is
generic(N: integer := 3);
port(
in0: in std_logic_vector(n-1 downto 0);
in1: in std_logic_vector(n-1 downto 0);
sel: in std_logic;
x:   out std_logic_vector(n-1 downto 0));
end;

architecture one of Mux_2_To_1 is
begin
process(sel)
begin
	if (sel = '1') then x <= in1; else x <= in0; end if;
end process;
end;