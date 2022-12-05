library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Shift_Register_8Bit is
port(
inpt: 	     in  		std_logic_vector(7 downto 0);
clk,RL,AL,en: in  		std_logic;
outpt: 		  buffer  std_logic_vector(7 downto 0));
end;

architecture one of Shift_Register_8Bit is
begin
process(en,clk)
begin
if (clk 'event and clk = '1') then
	if (en = '1') then outpt <= inpt;
	else
		if (RL = '1') then --Left
			outpt <= outpt(6 downto 0) & '0';
		else --Right (RL='0')
			if (AL = '1') then -- Logic
				outpt <= '0' & outpt(7 downto 1);
			else -- Arithmetic
				outpt <= outpt(7) & outpt(7 downto 1);
			end if;
		end if;
	end if;
end if;
end process;
end;