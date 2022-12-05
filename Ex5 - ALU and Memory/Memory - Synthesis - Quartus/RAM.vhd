library ieee;
use ieee.std_logic_1164.all;

entity RAM is
generic(
Bits: integer := 4;
Regs: integer := 2  -- Number of registers = Regs^2 (Regs^2 - 1 downto 0)
);
port(
Rst,clk: in std_logic;
addr: in std_logic_vector(Regs downto 0);
inpt: in std_logic_vector(Bits-1 downto 0);
outpt: out std_logic_vector(Bits-1 downto 0));
end;

architecture one of RAM is

component RegisterNbits
generic(N: integer := 4);
port(
Rst,En,clk: in  std_logic;
inpt:       in  std_logic_vector(N-1 downto 0);
outpt:      out std_logic_vector(N-1 downto 0));
end component;

component Decoder
Generic(N: integer := 2); -- Number of outputs = 2**N
port(
inpt:  in  std_logic_vector( N downto 0 );
outpt: out std_logic_vector( (2**N) - 1 downto 0 )
);
end component;

component GenOR
Generic(N:integer := 8);
port(
inpt: in std_Logic_vector(N-1 downto 0);
outpt: out std_logic);
end component;

signal sEn:   std_logic_vector ( ( (2**Regs) - 1) downto 0 );
signal sout:  std_logic_vector ( ( (Bits*(2**Regs)) - 1) downto 0 );
signal s_out: std_logic_vector ( ( (Bits*(2**Regs)) - 1) downto 0 );

begin
Dec: Decoder Generic map (Regs) port map (addr,sEn);

RegGen: for i in 0 to ((2**Regs) - 1) generate
REG: RegisterNbits Generic map (Bits) port map (rst,sEn(i),clk,inpt,sout(((i*Bits)+(Bits-1)) downto (i*Bits)));
end generate RegGen;

--ORGen: for i in 0 to Bits-1 Generate
--ORGate1: GenOR Generic map (Bits) port map (inpt(0) => sout(0),inpt(1) => sout(4),inpt(2) => sout(8),  inpt(3) => sout(12), outpt => outpt(0));
--ORGate2: GenOR Generic map (Bits) port map (inpt(0) => sout(1),inpt(1) => sout(5),inpt(2) => sout(9),  inpt(3) => sout(13), outpt => outpt(1));
--ORGate3: GenOR Generic map (Bits) port map (inpt(0) => sout(2),inpt(1) => sout(6),inpt(2) => sout(10), inpt(3) => sout(14), outpt => outpt(2));
--ORGate4: GenOR Generic map (Bits) port map (inpt(0) => sout(3),inpt(1) => sout(7),inpt(2) => sout(11), inpt(3) => sout(15), outpt => outpt(3));
--end Generate ORGen;

ORGen: for i in 0 to Bits-1 Generate
ORGate4: GenOR Generic map (Bits) port map (inpt(0) => sout(i),inpt(1) => sout(i+Bits),inpt(2) => sout(i+(2*Bits)), inpt(3) => sout(i+(3*Bits)), outpt => outpt(i));
end Generate ORGen;
end;