library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BCDCounter is
port(
clr,En,clk,UD: in std_logic;
Lcarry,Hcarry: out std_logic:='0';
outpt: buffer std_logic_vector(3 downto 0):="0000");
end;

architecture one of BCDCounter is

begin
process(En,clk)
begin
if (clr = '0') then outpt <= (others => '0');
elsif (En = '1') then
	if (clk 'event and clk = '1') then
		if (ud = '1') then -- UP
			if (outpt = 9) then
				Hcarry <= '1';
				outpt <= (others=>'0');
			else
				Hcarry <= '0';
				outpt <= outpt + 1;
			end if;
		else -- Down
			if (outpt = 0) then
				outpt <= "1001";
				Lcarry <= '1';
			else
				Lcarry <= '0';
				outpt <= outpt - 1;
			end if;
		end if;
	end if;
end if;
end process;
end;