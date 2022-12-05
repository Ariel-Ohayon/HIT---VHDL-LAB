library ieee;
use ieee.std_logic_1164.all;

entity FA_4Bit is
generic (N: integer:=4);
port(
A,B:  in  std_logic_vector(N-1 downto 0);
Cin:  in  std_logic;
Sum:  out std_logic_vector(N-1 downto 0);
Cout: out std_logic);
end;

architecture one of FA_4Bit is

component FA
port(A,B,Cin:  in  std_logic;
     Sum,Cout: out std_logic);
end component;

signal Carry: std_logic_vector(N downto 0);

begin
Gen: for i in 0 to N-1 Generate
U: FA port map (A(i),B(i),Carry(i),Sum(i),Carry(i+1));
end Generate;
Carry(0) <= Cin;
Cout <= Carry(N);
--Carry(N) <= Cout;
end;

