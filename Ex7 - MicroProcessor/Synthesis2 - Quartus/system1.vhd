library ieee;
use ieee.std_logic_1164.all;

entity system1 is
port(
Mclk,Pclk,rst,run: in std_logic;
busa: out std_logic_vector(15 downto 0);
done: out std_logic);
end;

architecture one of system1 is

-- / Components \ --

component mpu
port(
clk,run,reset: in std_logic;
Din: in std_logic_vector(15 downto 0);
Done: out std_logic;
busa: out std_logic_vector(15 downto 0));
end component;

component counter
generic(N:integer:=8);
port(
rst,clk: in std_logic;
Q: buffer std_logic_vector(N-1 downto 0));
end component;

component Memory
port(
address : in std_logic_vector (7 downto 0);
we, clk : in std_logic;
din : in std_logic_vector (15 downto 0);
dout : out std_logic_vector (15 downto 0)); 
end component;

-- / Components \ --

-- / Signals \ --

signal Addr: std_logic_vector(7 downto 0);
signal DataIn: std_logic_vector(15 downto 0);

-- / Signals \ --

begin
U1: counter generic map (8) port map (rst,Mclk,Addr);
U2: Memory port map (Addr,'0',Mclk,(others => '0'),DataIn);
U3: MPU port map (Pclk,run,rst,DataIn,done,busa);
end;