library ieee;
use ieee.std_logic_1164.all;

entity UART is
port(
rx: in  std_logic;
tx: out std_logic;
parallelin: in std_logic_vector(7 downto 0);
parallelout: out std_logic_vector(7 downto 0);
clk,go: in std_logic);
end;

architecture one of UART is

component Reciever
port(
rxd,clk: in std_logic;
data: out std_logic_vector(7 downto 0);
rxrdy,P,fe: out std_logic);
end component;

component Transmitter
port(
data: in std_logic_vector(7 downto 0);
clk,PT,go: in std_logic;
txd,txrdy,txe: out std_logic);
end component;

begin
U1: Transmitter port map (parallelin,clk,'0',go,tx,open,open);
U2: Reciever    port map (rx,clk,parallelout,open,open,open);
end;