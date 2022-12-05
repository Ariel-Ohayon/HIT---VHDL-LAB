library ieee;
use ieee.std_logic_1164.all;

entity Q2 is
port(
clk,rst,datain: in std_logic;
dat: out std_logic_vector(7 downto 0);
rdy,fe,pe: out std_logic);
end;

architecture one of Q2 is
 
-- /component\ --

        
component Paritychecker
   generic (n: integer range 0 to 31 := 8); --8[Bits]
   port (data : in std_logic_vector (n-1 downto 0);
            res: out std_logic);
end component;

 component shiftreg
port(
datain,en,rst,clk: in std_logic;
dataout: buffer std_logic_vector(10 downto 0));
end component;

component counter
generic(N: integer:=3);
port(
clk,en: in std_logic;
Q: buffer std_logic_vector(N-1 downto 0);
ud: in std_logic);
end component;
-- /component\ --

signal en: std_logic;
signal outptreg: std_logic_vector(10 downto 0);
signal count: std_logic_vector(3 downto 0):="0000";

begin

U1: shiftreg port map (datain,en,rst,clk,outptreg);
dat <= outptreg(8 downto 1);
U2: counter generic map (4) port map (clk,en,count,'1');
U3: Paritychecker generic map (9) port map (outptreg(9 downto 1),pe);

process(clk)
begin
if (clk 'event and clk = '1') then 
	if (datain = '0') then
		if (count = "0000") then
			en <= '1';
		end if;
	elsif (datain = '1') then
		if (count = "1010") then
			en <= '0';
		end if;
	end if;
end if;
end process;
end;


library ieee;
use ieee.std_logic_1164.all;
        
entity Paritychecker is 
   generic (n: integer range 0 to 31 := 8); --8[Bits]
   port (data : in std_logic_vector (n-1 downto 0);
            res: out std_logic);
end;

architecture one of Paritychecker is
--signal par : std_logic:= '0'; -- Define as a variable
begin
process (data)
variable par: std_logic; -- Define as a variable
begin
par := '0'; -- Get '0';
for i in n-1 downto 0 loop
par := par xor data (i);
end loop;
res<=par; -- not shared variable
end process;
end;


library ieee;
use ieee.std_logic_1164.all;

entity shiftreg is
port(
datain,en,rst,clk: in std_logic;
dataout: buffer std_logic_vector(10 downto 0));
end;

architecture one of shiftreg is
begin
process (rst,clk)
begin
if (rst = '1') then dataout <= (others => '0');
elsif (clk 'event and clk = '1') then
	if (en = '1') then
		dataout <= datain & dataout(9 downto 0);
	end if;
end if;
end process;
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
generic(N: integer:=3);
port(
clk,en: in std_logic;
Q: buffer std_logic_vector(N-1 downto 0);
ud: in std_logic);
end;

architecture one of counter is
begin
process(clk)
begin
if (clk 'event and clk = '1') then 
	if (en = '1') then 
		if (ud = '1') then
			if (Q = "1010") then Q<= (others=>'0');
			else	Q <= Q + 1;
			end if;
		else
			Q <= Q - 1;
		end if;
	end if;
end if;
end process;
end;