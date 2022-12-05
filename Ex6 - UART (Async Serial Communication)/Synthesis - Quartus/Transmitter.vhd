library ieee;
use ieee.std_logic_1164.all;

entity Transmitter is
port(
data: in std_logic_vector(7 downto 0);
clk,PT,go: in std_logic;
txd,txrdy,txe: out std_logic);
end;

architecture one of Transmitter is

component Parity_Gen
generic (N: integer:=4);
port(
inpt: std_logic_vector(N-1 downto 0);
outpt: out std_logic);
end component;

component Generator
generic(N:  integer:= 50000000;
		  DC: integer:= 25000000);
port(
clkin: in std_logic;
clkout: buffer std_logic:='1');
end component;

type state is (IDLE,START,D0,D1,D2,D3,D4,D5,D6,D7,P,STOP);
signal ps,ns: state;
signal Parity,parity_xor: std_logic;

--for Prescaler the clk (50[MHz] ---> 9600[BPS])
signal Transclk: std_logic;

begin

process(Transclk)
begin
if (Transclk 'event and Transclk = '1') then ps <= ns; end if;
end process;

U1: Generator generic map (5208,2604) port map (clk,Transclk);

process (ps,go)
begin
case ps is
when IDLE  => txd <= '1';  txrdy <= '1'; if (go = '0') then ns <= START; else ns <= IDLE; end if;
when START => txd <= '0';  txrdy <= '0'; ns <= D0;
when D0 => txd <= data(0); txrdy <= '0'; ns <= D1;
when D1 => txd <= data(1); txrdy <= '0'; ns <= D2;
when D2 => txd <= data(2); txrdy <= '0'; ns <= D3;
when D3 => txd <= data(3); txrdy <= '0'; ns <= D4;
when D4 => txd <= data(4); txrdy <= '0'; ns <= D5;
when D5 => txd <= data(5); txrdy <= '0'; ns <= D6;
when D6 => txd <= data(6); txrdy <= '0'; ns <= D7;
when D7 => txd <= data(7); txrdy <= '0'; ns <= P;
when P  => txd <= Parity;  txrdy <= '0';ns <= STOP;
when STOP => txd <= '1'; txrdy <= '0'; ns <= IDLE;
end case;
end process;

U2: Parity_Gen Generic map (8) port map (data,parity_xor); -- (Parity_Xor = '1' --> even) , (Parity_Xor = '0' --> odd)
Parity <= '1' when ((parity_xor = '1') and (PT = '1')) else '0'; -- (PT = '1' --> even) , (PT = '0' --> odd)
end;