library ieee;
use ieee.std_logic_1164.all;

entity myDemux is
port(
inpt: in std_logic_vector(6 downto 0);
sel:  in std_logic_vector(2 downto 0);
y1,y2,y3,y4,y5: out std_logic_vector(6 downto 0));
end;

architecture one of myDemux is
signal z: std_logic_vector(6 downto 0);
begin
process(sel)
begin
case sel is
when "000" =>  y1 <= inpt; y2 <= z; y3 <= z ; y4 <= z ; y5 <= z;
when "001" =>  y2 <= inpt; y1 <= z; y3 <= z ; y4 <= z ; y5 <= z;
when "010" =>  y3 <= inpt; y2 <= z; y1 <= z ; y4 <= z ; y5 <= z;
when "011" =>  y4 <= inpt; y2 <= z; y3 <= z ; y1 <= z ; y5 <= z;
when others => y5 <= inpt; y2 <= z; y3 <= z ; y4 <= z ; y1 <= z;
end case;
z <= (others => 'Z');
end process;
end;