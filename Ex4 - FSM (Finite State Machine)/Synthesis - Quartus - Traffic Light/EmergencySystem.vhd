library ieee;
use ieee.std_Logic_1164.all;
use ieee.std_logic_unsigned.all;

entity EmergencySystem is
port(
Emerg,clk,swclk,selclk: in std_Logic;
y1,y2,r1,g2: out std_logic;
HEX: out std_logic_vector(6 downto 0));
end;

architecture one of EmergencySystem is
component Generator
generic(N:  integer:= 50000000;
		  DC: integer:= 25000000);
port(clkin: in std_logic;
clkout: buffer std_logic:='1');
end component;

component Decoder7Segment
port(
inpt:  in  std_logic_vector(3 downto 0);
outpt: out std_logic_vector(6 downto 0));
end component;

type state is (YY1,RG);
signal ps,ns:state;
signal clk1hz,iclk,sclk: std_logic;
signal count: std_logic_vector(3 downto 0);
begin

process(Emerg,iclk)
begin
if (emerg = '0') then ps<=YY1;
elsif (iclk 'event and iclk = '1') then ps<=ns; end if;
end process;
process(ps)
begin
case ps is
when YY1 => ns <= RG;  y1 <= '1'; y2 <= '1'; r1 <= '0'; g2 <= '0';
when RG  => ns <= YY1; y1 <= '0'; y2 <= '0'; r1 <= '1'; g2 <= '1';
end case;
end process;
process(sclk)
begin
if (emerg = '0') then count <= "0101";
elsif (sclk 'event and sclk = '1') then
	if (count = "0000") then 
		count <= "0101";
		iclk  <= '1';
	else
		count <= count - 1;
		iclk  <= '0';
	end if;
end if;
end process;
sclk <= swclk when (selclk='1') else clk1hz;
U: Generator generic map (50000000, 25000000) port map (clk,clk1hz);
SEG: Decoder7Segment port map (count,HEX);
end;