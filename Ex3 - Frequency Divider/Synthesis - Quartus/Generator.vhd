library ieee;
use ieee.std_logic_1164.all;

entity Generator is
port(
sel: in std_logic_vector(1 downto 0);
clkin: in std_logic;
clkout: buffer std_logic;
x: out std_logic);
end;

architecture one of Generator is

-- / Components \ --
component Generator_nHz
generic(N:  integer:= 50000000;
		  DC: integer:= 25000000);
port(
clkin: in std_logic;
clkout: buffer std_logic:='0');
end component;
-- / Components \ --

-- / Signals \ --
signal clk1,clk2,clk3,clk4: std_logic;
-- / Signals \ --

begin
Div1: Generator_nHz generic map (50000000, 25000000) port map (clkin,clk1); -- freq = 1[Hz] , DC = 50[%]
Div2: Generator_nHz generic map (50000000, 12500000) port map (clkin,clk2); -- freq = 1[Hz] , DC = 25[%]
Div3: Generator_nHz generic map (5000000,  2500000)  port map (clkin,clk3); -- freq = 10[Hz], DC = 50[%]
Div4: Generator_nHz generic map (5000000,  3750000)  port map (clkin,clk4); -- freq = 10[Hz], DC = 75[%]

with sel select
clkout <= clk1 when "00",
			 clk2 when "01",
			 clk3 when "10",
			 clk4 when "11";
x <= clkout;
end;