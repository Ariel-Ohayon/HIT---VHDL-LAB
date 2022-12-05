library ieee;
use ieee.std_logic_1164.all;

entity Adder_7Segment is
port(
X,Y: in std_logic_vector(3 downto 0);
LEDout: out std_logic_vector(4 downto 0);
DispX1: out std_logic_vector(6 downto 0);
DispX2: out std_logic_vector(6 downto 0);
DispY1: out std_logic_vector(6 downto 0);
DispY2: out std_logic_vector(6 downto 0);
Disp1: out std_logic_vector(6 downto 0);
Disp2: out std_logic_vector(6 downto 0));
end;

architecture one of Adder_7Segment is

-- Components --
component FA_4Bit
generic(N: integer:=4);
port(A,B:  in  std_logic_vector(N-1 downto 0);
	  Cin:  in  std_logic;
	  Sum:  out std_logic_vector(N-1 downto 0);
	  Cout: out std_logic);
end component;

component BCD_Decoder
port(inpt:  in  std_logic_vector(4 downto 0);
	  outpt: out std_logic_vector(7 downto 0));
end component;

component Decoder7Segment
port(inpt:  in  std_logic_vector(3 downto 0);
	  outpt: out std_logic_vector(6 downto 0));
end component;
-- Components --

-- Signals --
signal s_FA_BCD: std_logic_vector(4 downto 0);
signal s_D1:     std_logic_vector(3 downto 0);
signal s_D2:     std_logic_vector(3 downto 0);

signal s_D31:	  std_logic_vector(3 downto 0);
signal s_D32:	  std_logic_vector(3 downto 0);
signal s_D41:	  std_logic_vector(3 downto 0);
signal s_D42:	  std_logic_vector(3 downto 0);
-- Signals --

begin

-- / Architecture for the output (main function HERE) \ --
U1: FA_4Bit     	  port map (X, Y, '0', s_FA_BCD(3 downto 0), s_FA_BCD(4));
U2: BCD_Decoder 	  port map (inpt => s_FA_BCD, outpt(3 downto 0) => s_D1, outpt(7 downto 4) => s_D2);
U3: Decoder7Segment port map (s_D1, Disp1);
U4: Decoder7Segment port map (s_D2, Disp2);
-- / Architecture for the output (main function HERE) \ --

LEDout <= s_FA_BCD;
 
-- / This architecture for diplay the input on the 7Segment Display \ --
U5: BCD_Decoder     port map (inpt => '0' & X, outpt(3 downto 0) => s_D31, outpt(7 downto 4) => s_D32);
U6: Decoder7Segment port map (s_D31, DispX1);
U7: Decoder7Segment port map (s_D32, DispX2);

U8:  BCD_Decoder     port map (inpt => '0' & Y, outpt(3 downto 0) => s_D41, outpt(7 downto 4) => s_D42);
U9:  Decoder7Segment port map (s_D41, DispY1);
U10: Decoder7Segment port map (s_D42, DispY2);
-- / This architecture for diplay the input on the 7Segment Display \ --

end;