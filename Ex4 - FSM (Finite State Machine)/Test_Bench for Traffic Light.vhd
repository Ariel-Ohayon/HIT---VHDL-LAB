library ieee;
use ieee.std_logic_1164.all;

entity TB is end;

architecture one of TB is

component Full_Traffic_Light
port(
day,rst,emergency,swclk,selclk,clk50:in std_logic;
HEX0,HEX1: out std_logic_vector(6 downto 0);
y1,y2,r1,r2,g1,g2: out std_logic);
end;

component Disp7SegEncode
port(inpt: in std_logic_vector(6 downto 0);
outpt : out std_logic_vector (3 downto 0));
end component;

signal t_day,t_rst,t_emergency,t_swclk: std_logic;
signal t_y1,t_y2,t_r1,t_r2,t_g1,t_g2: std_logic;
signal t_HEX0,t_HEX1: STD_LOGIC_VECTOR(6 downto 0);
signal count0,count1: std_logic_vector(3 downto 0);

begin

U1: Full_Traffic_Light port map (t_day, t_rst, t_emergency,t_swclk,'1',open,t_HEX0,t_HEX1,t_y1,t_y2,t_r1,t_r2,t_g1,t_g2);
U2: Disp7SegEncode port map (HEX0,count0);
U3: Disp7SegEncode port map (HEX1,count1);

process
begin
t_swclk <= '1'; wait for 50ps;
t_swclk <= '0'; wait for 50ps;
end process;

process
begin
t_day <= '0';
wait for 100ns;
t_day <= '1';
wait for 100ns;
end process;

end;

-- / Encoding data from the 7seg disp \ --
library ieee;
use ieee.std_Logic_1164.all;

entity Disp7SegEncode is
port(
inpt: in std_logic_vector(6 downto 0);
outpt : out std_logic_vector (3 downto 0));
end;

architecture one of Disp7SegEncode is
begin
with inpt select
outpt <= "0000" when "1000000",
		 "0001" when "1111001",
		 "0010" when "0100100",
		 "0011" when "0110000",
		 "0100" when "0011001",
		 "0101" when "0010010",
		 "0110" when "0000010",
		 "0111" when "1111000",
		 "1000" when "0000000",
		 "1001" when others;
end;