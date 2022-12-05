library ieee;
use ieee.std_logic_1164.all;

entity Unit1 is
port(
clk,Run,rst: in std_logic;
InstructionIn: in std_Logic_vector(8 downto 0);
Done: out std_logic;
-- outputs from the control Unit --
Dinout,Gout,Gin,Ain,AddSub: out std_logic;
Rin:  out std_logic_vector(7 downto 0);
Rout: out std_logic_vector(7 downto 0)
-- outputs from the control Unit --
);
end;

architecture one of Unit1 is

-- / Components \ --
component ControlUnit
port(
Instruction: in std_logic_vector(8 downto 0);
run,reset: in std_logic;
count: in std_logic_vector(1 downto 0);

clear,Done: buffer std_logic;
--
Dinout,Gout,Gin,Ain,IRin,AddSub: out std_logic;
Rin:  out std_logic_vector(7 downto 0);
Rout: out std_logic_vector(7 downto 0));
end component;

component upcount
port(
Clear, Clock,rst : IN STD_LOGIC;
Q : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
end component;

component regn
generic (n: integer:=9);
port(
R: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
rst, Rin, Clock: in std_logic;
Q: buffer std_logic_vector(n-1 downto 0));
end component;
-- / Components \ --

-- / Signals \ --
signal Instruction: std_logic_vector(8 downto 0);
signal count: std_logic_vector(1 downto 0);
signal IRin,clear: std_logic;
-- / Signals \ --

begin
U1: ControlUnit port map (Instruction,run,rst,count,clear,Done,Dinout,Gout,Gin,Ain,IRin,AddSub,Rin,Rout);
U2: upcount port map (clear,clk,rst,count);
IR: regn generic map (9) port map (InstructionIn,rst,IRin,clk,Instruction);
end;