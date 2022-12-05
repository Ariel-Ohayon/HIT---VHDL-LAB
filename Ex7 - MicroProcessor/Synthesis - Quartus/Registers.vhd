library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Registers is
port(
clk: std_logic;
reg1,reg2,reg3: in std_logic_vector(1 downto 0);
data1,data2: out std_logic_vector(7 downto 0);
data3: in std_logic_vector(7 downto 0));
end;

architecture one of Registers is

component mux
port(
sel: in std_logic_vector(1 downto 0);
data0: in  std_logic_vector(7 downto 0);
data1: in  std_logic_vector(7 downto 0);
data2: in  std_logic_vector(7 downto 0);
data3: in  std_logic_vector(7 downto 0);
outpt: out std_logic_vector(7 downto 0));
end component;

component Reg
port(
inpt: in std_logic_vector(7 downto 0);
clk: in std_logic;
outpt: out std_logic_vector(7 downto 0));
end component;

signal RegQ: std_logic_vector ((8*4)-1 downto 0);
signal iclk: std_logic_vector (3 downto 0);

begin

Gen:for i in 0 to 3 Generate
R: Reg port map (data3, iclk(i), RegQ((8*(i+1)-1) downto 8*i));
iclk(i) <= clk when (i = conv_integer(reg3)) else '0';
end Generate Gen;

U1: MUX port map (reg1,regQ(7 downto 0),regQ(15 downto 8),regQ(23 downto 16),regQ(31 downto 24),data1);
U2: MUX port map (reg2,regQ(7 downto 0),regQ(15 downto 8),regQ(23 downto 16),regQ(31 downto 24),data2);

end;