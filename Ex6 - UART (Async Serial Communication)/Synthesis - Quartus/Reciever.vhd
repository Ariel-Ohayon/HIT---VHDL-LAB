library ieee;
use ieee.std_logic_1164.all;

entity Reciever is
port(
rxd,clk: in std_logic;
data: out std_logic_vector(7 downto 0);
rxrdy,P,fe: out std_logic);
end;

architecture one of Reciever is

component sync_Reciever
port(
clkin,Lrx: in     std_logic;
En,clkout: buffer std_logic);
end component;

component Shift_Register
generic(Bits: integer := 11);
port(
EnOut, EnShift, rst, clk, d: in std_logic;
Q: out std_logic_vector(Bits-1 downto 0));
end component;

component Parity_Checker
port(
inpt,clk,rst: in std_logic;
Pstate: out std_logic
);
end component;

signal internclk: std_logic;
signal Parallel:  std_Logic_vector(10 downto 0);
signal Enflag:    std_logic;


begin
U1: sync_Reciever  port map (clk,rxd,Enflag,internclk);
U2: Shift_Register generic map (11) port map (not Enflag, Enflag, '0',internclk,rxd,Parallel);
U3: Parity_Checker port map (rxd, internclk, Enflag, P);
data <= Parallel(8 downto 1);
rxrdy <= not Enflag;
end;