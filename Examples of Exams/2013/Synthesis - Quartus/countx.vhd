-- / Countx \ --
library ieee;
use ieee.std_logic_1164.all; 
entity countx is
port (clk, rst, prst,ud : in std_logic;
q1: buffer integer range 0 to 9;
q2: buffer integer range 0 to 15);
end;

architecture one of countx is 

component count generic (n:integer := 15);
port (clk, rst, prst,ud : in std_logic;
q: buffer integer range 0 to n);
end component;

begin
 a: count generic map (n=>9) port map (clk, rst, prst, ud, q1);
 b: count port map (clk, rst, prst, ud, q2);
end;
-- / Countx \ --

-- / count \ --
library ieee;
use ieee.std_logic_1164.all; 
entity count is generic (n:integer := 15);
port (clk, rst, prst,ud : in std_logic;
q: buffer integer range 0 to n);
end;

architecture one of count is 
begin
process(clk, rst, prst)
begin
if (rst = '1') then q<=0;
elsif (prst = '1') then  q<=n;
elsif (clk'event and clk = '1') then 
 if ud = '1' then q <= q+1; 
 else q <= q-1;
 end if;
end if;
end process;
end;
-- / count \ --