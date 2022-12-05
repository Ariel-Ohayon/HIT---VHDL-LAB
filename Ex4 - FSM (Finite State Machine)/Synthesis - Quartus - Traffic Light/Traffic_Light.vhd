library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Traffic_Light is
port(
swclk,selclk: in std_logic;
day,clk,rst: in std_logic;
y1,y2,r1,r2,g1,g2: out std_logic;
Hex: out std_logic_vector(6 downto 0));
end;

architecture one of Traffic_Light is

--/ Components \--
component Generator
generic(N:  integer:= 50000000;
		  DC: integer:= 25000000);
port(clkin: in std_logic;
clkout: buffer std_logic:='1');
end component;

component Decoder7Segment
port(inpt:  in  std_logic_vector(3 downto 0);
outpt: out std_logic_vector(6 downto 0));
end component;
--/ Components \--

type state is (YY1,YR,GR,YY2,RY,RG,NN);
signal ns,ps: state;
signal clk1hz,iclk, sclk: std_logic;
signal count: std_logic_vector(3 downto 0);
begin

process (iclk,rst)
begin
if(rst = '0') then ps <= YY1;
elsif (iclk 'event and iclk = '1') then ps <= ns; end if;
end process;

process (ps)
begin
case ps is
when YY1 => if (day = '0') then ns <= NN; else ns <= YR;  end if;
when YR  => if (day = '0') then ns <= NN; else ns <= GR;  end if;
when GR  => if (day = '0') then ns <= NN; else ns <= YY2; end if;
when YY2 => if (day = '0') then ns <= NN; else ns <= RY;  end if;
when RY  => if (day = '0') then ns <= NN; else ns <= RG;  end if;
when RG  => if (day = '0') then ns <= NN; else ns <= YY1; end if;
when NN  => ns <= YY2;
end case;

case ps is
when YY1 => y1 <= '1'; y2 <= '1'; g1 <= '0'; g2 <= '0'; r1 <= '0'; r2 <= '0';
when YR  => y1 <= '1'; y2 <= '0'; g1 <= '0'; g2 <= '0'; r1 <= '0'; r2 <= '1';
when GR  => y1 <= '0'; y2 <= '0'; g1 <= '1'; g2 <= '0'; r1 <= '0'; r2 <= '1';
when YY2 => y1 <= '1'; y2 <= '1'; g1 <= '0'; g2 <= '0'; r1 <= '0'; r2 <= '0';
when RY  => y1 <= '0'; y2 <= '1'; g1 <= '0'; g2 <= '0'; r1 <= '1'; r2 <= '0';
when RG  => y1 <= '0'; y2 <= '0'; g1 <= '0'; g2 <= '1'; r1 <= '1'; r2 <= '0';
when NN  => y1 <= '0'; y2 <= '0'; g1 <= '0'; g2 <= '0'; r1 <= '0'; r2 <= '0';
end case;

end process;

process(sclk,rst)
begin
if (rst = '0') then count <= "0000";
elsif (sclk 'event and sclk = '1') then
	if (day = '0') then -- Night
		if (count = "0000") then
			count <= "0010";
			iclk <= '1';
		else
			count <= count - 1;
			iclk <= '0';
		end if;
	else
		if (count = "0000") then
			count <= "1000";
			iclk <= '1';
		else
			count <= count - 1;
			iclk <= '0';
		end if;
	end if;
end if;
end process;
sclk <= swclk when (selclk = '1') else clk1hz;
-- define mux that select clk (clk = KEY {or} clk = 50[MHz])
Gen1:  Generator generic map (50000000,25000000) port map (clk,clk1hz);
Disp1: Decoder7Segment port map (count,Hex);
end;