library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
generic(N:integer:=8);
port(
rst,clk: in std_logic;
Q: buffer std_logic_vector(N-1 downto 0));
end;

architecture one of counter is
begin
process(rst,clk)
begin

if (rst = '0') then Q <= (others => '0');
elsif (clk 'event and clk = '0') then Q <= Q+1; end if;

end process;
end;