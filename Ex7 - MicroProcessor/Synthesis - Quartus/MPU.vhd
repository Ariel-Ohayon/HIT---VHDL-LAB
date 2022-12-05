library ieee;
use ieee.std_logic_1164.all;

entity MPU is
port(
clk: in std_logic;
reg1,reg2,reg3: out std_logic_vector(7 downto 0));
end;

architecture one of MPU is

component FetchUnit
port(
rst,clk:in std_logic;
outpt: out std_logic_vector(15 downto 0));
end component;

component Registers
port(
clk: std_logic;
reg1,reg2,reg3: in std_logic_vector(1 downto 0);
data1,data2: out std_logic_vector(7 downto 0);
data3: in std_logic_vector(7 downto 0));
end component;

component Control_Unit
port(
instruction: in std_logic_vector (15 downto 0);
reg1,reg2,reg3: out std_logic_vector(1 downto 0);
flags: in std_logic_vector(1 downto 0);
Idata: out std_logic_vector(7 downto 0);
sel: out std_logic;
op: out std_logic_vector(2 downto 0));
end component;

component ALU
port(
op: in std_logic_vector(2 downto 0);
A,B: in std_logic_vector(7 downto 0);
outpt: out std_logic_vector(7 downto 0);
flags: out std_Logic_vector(1 downto 0));
end component;

component mux2_1
port(
sel: in std_logic;
data0, data1: in std_logic_vector(7 downto 0);
outpt: out std_logic_vector(7 downto 0));
end component;

signal instruction: std_logic_vector(15 downto 0);
signal addr1,addr2,addr3: std_logic_vector(1 downto 0);
signal flg: std_logic_vector(1 downto 0);
signal op: std_logic_vector(2 downto 0);
signal data1,data2,data3: std_logic_vector (7 downto 0);
signal muxout,sIdata: std_logic_vector(7 downto 0);
signal sel: std_logic;

begin
U1: FetchUnit 	  port map ('0', clk, instruction);
U2: Control_Unit port map (instruction, addr1, addr2, addr3, flg, sIdata, sel, op);
U3: ALU 			  port map (op, data1, muxout, data3, flg);
U4: Registers	  port map (clk,addr1,addr2,addr3,data1,data2,data3);
U5: mux2_1		  port map (sel,data2,sIdata,muxout);

reg1 <= data1;
reg2 <= data2;
reg3 <= data3;
end;