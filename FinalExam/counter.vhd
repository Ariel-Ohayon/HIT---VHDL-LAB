library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
generic(N: integer:=3);
port(
clk,en: in std_logic;
Q: buffer std_logic_vector(N-1 downto 0);
ud: in std_logic);
end;

architecture one of counter is
begin
process(clk)
begin
if (clk 'event and clk = '1') then 
	if (en = '1') then 
		if (ud = '1') then
			if (Q = "1010") then Q<= (others=>'0');
			else	Q <= Q + 1;
			end if;
		end if;
	end if;
end if;
end process;
end;