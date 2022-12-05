library ieee;
use ieee.std_logic_1164.all;

entity Full_Traffic_Light is
port(
day,rst,emergency,swclk,selclk,clk50:in std_logic;
HEX0,HEX1: out std_logic_vector(6 downto 0);
y1,y2,r1,r2,g1,g2: out std_logic);
end;

architecture one of Full_Traffic_Light is

component Traffic_Light
port(
swclk,selclk: in std_logic;
day,clk,rst: in std_logic;
y1,y2,r1,r2,g1,g2: out std_logic;
Hex: out std_logic_vector(6 downto 0));
end component;

component EmergencySystem
port(
Emerg,clk,swclk,selclk: in std_Logic;
y1,y2,r1,g2: out std_logic;
HEX: out std_logic_vector(6 downto 0));
end component;

signal TLswclk,TLclk: std_logic;
signal TLy1,TLy2,TLr1,TLg2: std_logic;
signal Eswclk,Eclk:   std_logic;
signal Ey1,Ey2,Er1,Eg2: std_logic;

signal sel: std_logic;
signal Q: std_logic:='0';
signal HEX: std_logic_vector(6 downto 0);

begin
U1: Traffic_Light   port map (TLswclk,selclk,day,TLclk,rst,TLy1,TLy2,TLr1,r2,g1,TLg2,HEX0);
U2: EmergencySystem port map (Q,Eclk,Eswclk,selclk,Ey1,Ey2,Er1,Eg2,HEX);

process(emergency)
begin
if (emergency 'event and emergency = '1') then Q <= not Q; end if;
end process;
HEX1 <= (others => '1') when (Q = '0') else HEX;
process (Q)
begin
if (Q = '1') then -- Emergency Enabled
	Eclk<=clk50;
	Eswclk<=swclk;
	y1<=Ey1;
	y2<=Ey2;
	r1<=Er1;
	g2<=Eg2;
else
	TLclk<=clk50;
	TLswclk<=swclk;
	y1<=TLy1;
	y2<=TLy2;
	r1<=TLr1;
	g2<=TLg2;
end if;
end process;
end;