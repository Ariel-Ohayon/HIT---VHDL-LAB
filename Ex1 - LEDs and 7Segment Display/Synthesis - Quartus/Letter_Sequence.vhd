library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Letter_Sequence is
port(
Sw: in std_logic_vector(2 downto 0);
disp1: out std_logic_vector(6 downto 0);
disp2: out std_logic_vector(6 downto 0);
disp3: out std_logic_vector(6 downto 0);
disp4: out std_logic_vector(6 downto 0);
disp5: out std_logic_vector(6 downto 0));
end;

architecture one of Letter_Sequence is

signal s1: std_logic_vector(2 downto 0);
signal s2: std_logic_vector(2 downto 0);
signal s3: std_logic_vector(2 downto 0);
signal s4: std_logic_vector(2 downto 0);
signal s5: std_logic_vector(2 downto 0);

component Mux_5_To_1
generic (M: integer := 3);
port(in0: in  std_logic_vector(M-1 downto 0);
in1: in  std_logic_vector(M-1 downto 0);
in2: in  std_logic_vector(M-1 downto 0);
in3: in  std_logic_vector(M-1 downto 0);
in4: in  std_logic_vector(M-1 downto 0);
sel: in  std_logic_vector(2 downto 0);
x:   out std_logic_vector(M-1 downto 0));
end component;

component Decoder_7Segment
port(inpt: in std_logic_vector(2 downto 0);
outpt: out std_logic_vector(6 downto 0));
end component;
--H - "000"
--E - "001"
--L - "010"
--O - "011"
begin
U1: Mux_5_To_1 port map ("000","001","010","010","011",Sw,s1);
U2: Mux_5_To_1 port map ("001","010","010","011","000",Sw,s2);
U3: Mux_5_To_1 port map ("010","010","011","000","001",Sw,s3);
U4: Mux_5_To_1 port map ("010","011","000","001","010",Sw,s4);
U5: Mux_5_To_1 port map ("011","000","001","010","010",Sw,s5);

M1: Decoder_7Segment port map (s5,disp1);
M2: Decoder_7Segment port map (s4,disp2);
M3: Decoder_7Segment port map (s3,disp3);
M4: Decoder_7Segment port map (s2,disp4);
M5: Decoder_7Segment port map (s1,disp5);
end;




