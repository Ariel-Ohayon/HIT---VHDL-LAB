library ieee;
use ieee.std_logic_1164.all;

entity Transmitter is
port(data: in std_logic_vector (7 downto 0);
clk,parity_type,go: in std_logic;
txd, txrdy, txe: out std_logic);
end;

architecture one of Transmitter is

component generator
generic(N:  integer:= 50000000;
		  DC: integer:= 25000000);
port(
clkin: in std_logic;
clkout: buffer std_logic:='1');
end component;

component PISO
generic (n:integer:=4);
port(data: std_logic_vector (n-1 downto 0);
clk,sel: in std_logic;
Q,txe,txrdy:out std_logic);
end component;

component parity_gen
generic (N: integer:=4);
port(
inpt: std_logic_vector(N-1 downto 0);
outpt: out std_logic);
end component;

signal Parity,outxor,internclk: std_logic;

begin
U1: PISO generic map (11) port map ('1' & Parity & data & '0', internclk, go, txd, txe, txrdy);
U2: Generator generic map (5208,2604) port map (clk, internclk);
U3: Parity_Gen Generic map (8) port map (data,outxor);
Parity <= '1' when (parity_type = '0' and outxor = '0') else '0';
end;
