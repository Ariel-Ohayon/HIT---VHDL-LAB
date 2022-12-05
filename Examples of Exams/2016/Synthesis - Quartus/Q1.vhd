library ieee;
use ieee.std_Logic_1164.all;

entity Q1 is
port(
din,rst,clk: in std_logic;
Q: out std_logic);
end;

architecture one of Q1 is

type state is (s0,s1,s2,s3,s4);

signal ps,ns: state;

begin

process(clk,rst)
begin
if (rst = '1') then ps<=s0;
elsif (clk 'event and clk = '1') then ps<=ns; end if;
end process;

process(ps)
begin
case ps is
when s0 => Q <= '0'; if (din = '0') then ns <= s1; else ns <= s0; end if;
when s1 => Q <= '0'; if (din = '0') then ns <= s2; else ns <= s0; end if;
when s2 => Q <= '0'; if (din = '0') then ns <= s3; else ns <= s0; end if;
when s3 => Q <= '0'; if (din = '0') then ns <= s4; else ns <= s0; end if;
when s4 => Q <= '1'; if (din = '0') then ns <= s4; else ns <= s0; end if;
end case;
end process;

end;