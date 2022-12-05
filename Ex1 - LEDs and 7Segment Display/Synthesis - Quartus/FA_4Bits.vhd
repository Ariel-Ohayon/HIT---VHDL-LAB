library ieee;
use ieee.std_logic_1164.all;


entity FA_4Bits is
generic (N: integer := 4);
port(
A,B: in std_logic_vector(N-1 downto 0);
Carry_in: in std_logic;
Carry_out: out std_logic;
Sum: out std_logic_vector(N-1 downto 0));
end;

architecture one of FA_4Bits is
component FA
port(A,B,Cin: in std_logic;
Sum,Cout: out std_logic);
end component;
signal Carry: std_logic_vector(N+1 downto 0);
begin
Gen: for i in 0 to N-1 Generate
U: FA port map (A(i),B(i),Carry(i),Sum(i),Carry(i+1));
end Generate;
Carry(0) <= Carry_in;
Carry_out <= Carry(N);
end;

-- / Full Adder \ --
library ieee;
use ieee.std_logic_1164.all;

entity FA is
port(
A,B,Cin: in std_logic;
Sum,Cout: out std_logic);
end;
architecture one of FA is
begin
Sum <= A xor B xor Cin;
Cout <= (A and B) or (A and Cin) or (B and Cin);
end;