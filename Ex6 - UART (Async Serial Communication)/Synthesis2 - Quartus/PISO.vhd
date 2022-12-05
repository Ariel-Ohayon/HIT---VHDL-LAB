library ieee;
use ieee.std_logic_1164.all;

entity PISO is 
generic (n:integer:=4);
port(data: std_logic_vector (n-1 downto 0);
clk,sel: in std_logic;
Q,txe,txrdy:out std_logic);
end;

architecture one of PISO is

signal sq: std_logic_vector (n-1 downto 0);
signal stxrdy,ntxe: std_logic;
signal ovec: std_logic_vector(n-1 downto 0):= (others => '1');

begin
txrdy <= stxrdy;
process(clk)
begin
for i in 0 to n-1 loop
	if (clk='1' and clk'event) then
		if (sel='0') then
			sq <= data;
		else
			sq <= '1' & sq (n-1 downto 1);
		end if;
	end if;
end loop;

if (clk 'event and clk = '1') then
	if (data = ovec) then
		stxrdy <= '0';
	else
		stxrdy <= '1';
	end if;
end if;

end process;

q<=sq(0);
txe<= not ntxe;

process(sq)
variable x: std_logic;
begin
x:='0';
for i in 0 to n-1 loop
x:= x or sq(i);
end loop;
ntxe<=x;
end process; 

end;
