library ieee;
use ieee.std_logic_1164.all;

entity FetchUnit is
port(
rst,clk:in std_logic;
outpt: out std_logic_vector(15 downto 0));
end;

architecture one of FetchUnit is

component ProgramCounter
port(
clk,clr: in     std_logic;
outpt:   buffer std_logic_vector(3 downto 0));
end component;

component ProgramMemory
port(
	address : in std_logic_vector (3 downto 0);
	clk : in std_logic;
	din : in std_logic_vector (15 downto 0);
	dout : out std_logic_vector (15 downto 0));
end component;

signal addrline: std_logic_vector(3 downto 0);

begin
U1: ProgramCounter port map (clk,rst,addrline);
U2: ProgramMemory  port map (addrline, not clk, (others =>'0'), outpt);
end;