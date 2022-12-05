library ieee;
use ieee.std_logic_1164.all;
entity mux is port
(I1,I0:std_logic_vector (3 downto 0);
sel:std_logic;
outpt: out std_logic_vector (3 downto 0));
end;
architecture one of mux is
begin
with sel select
outpt <= I0 when '0',
         I1 when '1';
end;
