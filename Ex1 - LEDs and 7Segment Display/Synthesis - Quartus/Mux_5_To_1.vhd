library ieee;
use ieee.std_logic_1164.all;

entity Mux_5_To_1 is
generic (M: integer := 3);
port(
in0: in  std_logic_vector(M-1 downto 0);
in1: in  std_logic_vector(M-1 downto 0);
in2: in  std_logic_vector(M-1 downto 0);
in3: in  std_logic_vector(M-1 downto 0);
in4: in  std_logic_vector(M-1 downto 0);
sel: in  std_logic_vector(2 downto 0);
x:   out std_logic_vector(M-1 downto 0));
end;

architecture one of Mux_5_To_1 is
begin
with sel select
x <= in0 when "000",
	  in1 when "001",
	  in2 when "010",
	  in3 when "011",
	  in4 when others;
end;

--architecture two of Mux_5_To_1 is
--
--component Mux_2_To_1
--generic(N: integer := 3);
--port(
--in0: in std_logic_vector(n-1 downto 0);
--in1: in std_logic_vector(n-1 downto 0);
--sel: in std_logic;
--x:   out std_logic_vector(n-1 downto 0));
--end component;
--
--signal s0: std_logic_vector(M-1 downto 0);
--signal s1: std_logic_vector(M-1 downto 0);
--signal s2: std_logic_vector(M-1 downto 0);
--signal s3: std_logic_vector(M-1 downto 0);
--signal s4: std_logic_vector(M-1 downto 0);
--signal Highz: std_logic_vector(M-1 downto 0);
--
--begin
--U1: Mux_2_To_1 port map (in0, in1,   sel(2), s0);
--U2: Mux_2_To_1 port map (in2, in3,   sel(2), s1);
--U3: Mux_2_To_1 port map (in4, Highz, sel(2), s2);
--U4: Mux_2_To_1 port map (s0,  s1,    sel(1), s3);
--U5: Mux_2_To_1 port map (s2,  Highz, sel(1), s4);
--U6: Mux_2_To_1 port map (s3,  s4,    sel(0), x);
--Highz <= (others => 'Z');
--end;