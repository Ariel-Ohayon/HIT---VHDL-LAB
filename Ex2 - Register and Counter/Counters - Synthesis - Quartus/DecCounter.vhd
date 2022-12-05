library ieee;
use ieee.std_logic_1164.all;

entity DecCounter is
port(
clk,UD,clr: in std_logic;
outpt: buffer std_logic_vector(11 downto 0);
disp1,disp2,disp3: out std_logic_vector(6 downto 0));
end;

architecture one of DecCounter is

-- / Components \ --
component BCDCounter
port(
En,clk,UD: in std_logic;
Lcarry,Hcarry: out std_logic:='0';
outpt: buffer std_logic_vector(3 downto 0):="0000";
clr: in std_logic);
end component;

component Decoder7Segment
port(inpt:  in  std_logic_vector(3 downto 0);
outpt: out std_logic_vector(6 downto 0));
end component;
-- / Components \ --

signal internClk0,internclk1,sHcarry0,sLcarry0,sHcarry1,sLcarry1: std_logic;

begin

internClk0 <= sHcarry0 when (UD = '1') else sLcarry0;
internClk1 <= sHcarry1 when (UD = '1') else sLcarry1;

Count1: BCDCounter port map ('1', clk,        UD, sLcarry0, sHcarry0, outpt(3  downto 0), clr); -- Count for Yehidot
Count2: BCDCounter port map ('1', internclk0, UD, sLcarry1, sHcarry1, outpt(7  downto 4), clr); -- Count for Asarot
Count3: BCDCounter port map ('1', internclk1, UD, open,     open,     outpt(11 downto 8), clr); -- Count for meot

Dispx: Decoder7Segment port map (outpt(3  downto 0), disp1); -- Yehidot
Dispy: Decoder7Segment port map (outpt(7  downto 4), disp2); -- asarot
Dispz: Decoder7Segment port map (outpt(11 downto 8), disp3); -- meot

end;