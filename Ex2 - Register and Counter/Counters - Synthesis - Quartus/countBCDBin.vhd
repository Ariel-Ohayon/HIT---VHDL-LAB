library ieee;
use ieee.std_logic_1164.all;
entity countBCDBin is
port(
clr,ud,clk,en: in std_logic;
Led: out std_logic_vector(3 downto 0);
disp: out std_logic_vector(6 downto 0));
end;

architecture one of countBCDBin is

-- / Components \ --
component BinaryCounter
port(En,clk,UD,clr: in std_logic;
outpt: buffer std_logic_vector(3 downto 0):="0000");
end component;

component BCDCounter
port(clr,En,clk,UD: in std_logic;
Lcarry,Hcarry: out std_logic:='0';
outpt: buffer std_logic_vector(3 downto 0):="0000");
end component;

component mux
port(I1,I0:std_logic_vector (3 downto 0);
sel:std_logic;
outpt:out std_logic_vector (3 downto 0));
end component;

component Decoder7Segment
port(inpt:  in  std_logic_vector(3 downto 0);
outpt: out std_logic_vector(6 downto 0));
end component;
-- / Components \ --

signal s1,s2,s3: std_logic_vector(3 downto 0);

begin

U1: BinaryCounter   port map (en,clk,ud,clr,s1);
U2: BCDCounter      port map (clr,en,clk,ud,open,open,s2);
U3: mux				  port map (s2,s1,en,s3);
U4: Decoder7Segment port map (s3,disp);
Led <= s3;
end;