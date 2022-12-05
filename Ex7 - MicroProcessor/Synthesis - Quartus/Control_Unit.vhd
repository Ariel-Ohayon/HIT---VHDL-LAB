library ieee;
use ieee.std_logic_1164.all;

entity Control_Unit is
port(
instruction: in std_logic_vector (15 downto 0);
reg1,reg2,reg3: out std_logic_vector(1 downto 0);
flags: in std_logic_vector(1 downto 0);
Idata: out std_logic_vector(7 downto 0);
sel: out std_logic;
op: out std_logic_vector(2 downto 0));
end;

architecture one of Control_Unit is

signal sig_op:  std_logic_vector(2 downto 0);


begin
sig_op  <= instruction (14 downto 12);
reg1  <= instruction(9 downto 8);
reg2  <= instruction(7 downto 6) when (instruction(15) = '0') else (others => '0');
Idata <= instruction(7 downto 0) when (instruction(15) = '1') else (others => '0');
reg3  <= instruction(11 downto 10);
op    <= sig_op;
sel <= instruction(15);
end;