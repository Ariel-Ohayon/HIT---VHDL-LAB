library ieee;
use ieee.std_logic_1164.all;

entity MPU is
port(
clk,run,reset: in std_logic;
Din: in std_logic_vector(15 downto 0);
Done: out std_logic;
busa: out std_logic_vector(15 downto 0));
end;

architecture one of MPU is

-- / Components \ --

component regn
generic (n : INTEGER := 16);
port (
R: in STD_LOGIC_VECTOR(n-1 DOWNTO 0);
rst, Rin, Clock: in STD_LOGIC;
Q: buffer STD_LOGIC_VECTOR(n-1 DOWNTO 0));
end component;

component mux
port(
r0,r1,r2,r3,r4,r5,r6,r7,din,g : in STD_LOGIC_vector (15 downto 0);
gout,dout: in STD_LOGIC;
rout: in std_logic_vector (7 downto 0);
busa: out STD_LOGIC_vector (15 downto 0));
end component;

component ALU
port(
A,B: in std_logic_vector (15 downto 0);
addsub: in std_logic;
outpt: out std_logic_vector(15 downto 0));
end component;

component upcount
port(
Clear, Clock,rst: in std_logic;
Q: out std_Logic_vector(1 DOWNTO 0));
end component;

component ControlUnit
port(
Instruction: in std_logic_vector(8 downto 0);
run,reset: in std_logic;
count: in std_logic_vector(1 downto 0);

clear,Done: buffer std_logic;
Dinout,Gout,Gin,Ain,IRin,AddSub: out std_logic;
Rin:  out std_logic_vector(7 downto 0);
Rout: out std_logic_vector(7 downto 0));
end component;

-- / Components \ --

-- / Signals \ --
signal R0,R1,R2,R3,R4,R5,R6,R7: std_logic_vector(15 downto 0);
signal Gout: std_logic_vector(15 downto 0);
signal sbusa: std_logic_vector(15 downto 0);
signal EnReg: std_logic_vector(7 downto 0);
signal Ain,Gin,IRin: std_logic;
signal ALUout,ALUin: std_logic_vector(15 downto 0);
signal Instruction: std_logic_vector(8 downto 0);
signal sel: std_logic_vector(7 downto 0);
signal sg,sd: std_logic;
signal selALU: std_logic;
signal count: std_logic_vector(1 downto 0);
signal clrCount: std_logic;
-- / Signals \ --

begin
busa <= sbusa;
-- Rx:   regn generic map (16) port map (Datain, 			 		  En,			clk, Q);
   Reg0: regn generic map (16) port map (sbusa,   			 reset, EnReg(0), clk, R0);
   Reg1: regn generic map (16) port map (sbusa,   			 reset, EnReg(1), clk, R1);
   Reg2: regn generic map (16) port map (sbusa,   			 reset, EnReg(2), clk, R2);
   Reg3: regn generic map (16) port map (sbusa,   			 reset, EnReg(3), clk, R3);
   Reg4: regn generic map (16) port map (sbusa,   			 reset, EnReg(4), clk, R4);
   Reg5: regn generic map (16) port map (sbusa,   			 reset, EnReg(5), clk, R5);
   Reg6: regn generic map (16) port map (sbusa,   			 reset, EnReg(6), clk, R6);
   Reg7: regn generic map (16) port map (sbusa,   			 reset, EnReg(7), clk, R7);
   G:    regn generic map (16) port map (ALUout, 			 reset, Gin,      clk, Gout);
	A:    regn generic map (16) port map (sbusa,            reset, Ain,     clk, ALUin);
	IR:   regn generic map (9)  port map (Din(15 downto 7), reset, IRin,    clk, Instruction);

U0: ControlUnit port map (Instruction, run, reset,count,clrCount,Done,sd,sg,Gin,Ain,IRin,selALU,EnReg,sel);
U1: upcount port map (clrCount,clk,reset,count);

MultiPlexer: mux port map (R0,R1,R2,R3,R4,R5,R6,R7,Din,Gout,sg,sd,sel,sbusa);
ArithLogicUnit: ALU port map (ALUin,sbusa,selALU,ALUout);
end;