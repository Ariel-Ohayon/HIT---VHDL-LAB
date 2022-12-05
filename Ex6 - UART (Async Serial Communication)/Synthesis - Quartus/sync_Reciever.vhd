library ieee;
use ieee.std_logic_1164.all;

entity sync_Reciever is
port(
clkin,Lrx: in     std_logic;
En,clkout: buffer std_logic);
end;

architecture one of sync_Reciever is

component syncRecieveClk
port(
clkin,En: in  std_Logic;
clkout:   out std_logic);
end component;

component Recieve_Enable
port(
Lrx,clkin: in std_logic;
flag: out std_logic);
end component;

begin
U1: syncRecieveClk port map (clkin, En, clkout);
U2: Recieve_Enable  port map (Lrx, clkout, En);
end;