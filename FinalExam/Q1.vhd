library ieee;
use ieee.std_logic_1164.all;

entity Q1 is
port(
SW: in std_logic_vector(17 downto 0);
KEY: in std_logic_vector(3 downto 0);
LEDR: out std_logic_vector(17 downto 0);
LEDG: out std_logic_vector(8 downto 0);
HEX0: out std_logic_vector(6 downto 0));
end;

architecture one of Q1 is

-- / Components \ --
component counter
generic(N: integer:=3);
port(
clk,en: in std_logic;
Q: buffer std_logic_vector(N-1 downto 0);
ud: in std_logic);
end component;

component Decoder
port(
inpt: in std_logic_vector(2 downto 0);
outpt: out std_logic_vector(6 downto 0));
end component;

-- / Components \ --

signal count: std_logic_vector(2 downto 0);
signal ud: std_logic;
begin
U1: counter generic map (3)  port map (KEY(1),SW(17), count, ud);
U2: counter generic map (18) port map (KEY(1),SW(17), LEDR(17 downto 0), '1');

LEDG(2 downto 0) <= count;

U3: decoder port map (count, HEX0);

process(count)
begin
	if (count = "111") then
		ud <= '0'; -- down
	elsif (count = "000") then
		ud <= '1'; -- up
	end if;
end process;
end;
