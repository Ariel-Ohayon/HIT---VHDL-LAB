library ieee;
use ieee.std_logic_1164.all;

entity Q2 is
port(
clk:  in  std_logic;
SW:   in  std_logic_vector(17 downto 0);
KEY:  in  std_logic_vector(3  downto 0);
LEDR: out std_logic_vector(17 downto 0);
LEDG: out std_logic_vector(8  downto 0);
HEX0: out std_logic_vector(6  downto 0));
end;

architecture one of Q2 is

-- / Comopnents \ --
component GshiftRegister
port(
clk,en: in  	std_logic;
count:  out std_logic_vector(2 downto 0);
Q:      buffer std_logic_vector(7 downto 0));
end component;

component RshiftRegister
port(
clk,en: in  	std_logic;
count:  out std_logic_vector(2 downto 0);
Q:   	  buffer std_logic_vector(7 downto 0));
end component;

component Diff
port(
in1,in2: in std_logic_vector(2 downto 0);
outpt: out std_logic_vector(2 downto 0));
end component;

component Decoder7Segment
port(
inpt:  in  std_logic_vector(3 downto 0);
outpt: out std_logic_vector(6 downto 0));
end component;

component LPF
port(
inpt, clk: in std_logic;
outpt: out std_logic);
end component;

-- / Comopnents \ --

-- / Signals \ --
signal sLEDR,sLEDG: std_logic_vector(7 downto 0);
signal sHEX0: std_logic_vector(6 downto 0);
signal c1,c2: std_logic_vector(2 downto 0);
signal inHex: std_logic_vector(2 downto 0);
signal clk1,clk2: std_logic;
-- / Signals \ --

begin

U1: GshiftRegister port map (clk1,SW(1),c1,sLEDG);
U2: RshiftRegister port map (clk2,SW(1),c2,sLEDR);
U3: Diff port map (c1,c2,inHex);
U4: Decoder7Segment port map ('0' & inHex, sHEX0);

U5: LPF port map(KEY(1),clk,clk1);
U6: LPF port map(KEY(2),clk,clk2);

LEDR(7 downto 0) <= sLEDR when (SW(1) = '1') else (others => '0');
LEDG(7 downto 0) <= sLEDG when (SW(1) = '1') else (others => '0');
HEX0 <= sHEX0 when (SW(1) = '1') else (others => '1');

end;