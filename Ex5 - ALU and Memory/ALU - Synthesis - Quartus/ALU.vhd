library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(
A,B: in std_logic_vector (7 downto 0);
sel: in std_logic_vector (2 downto 0);
Ci:  in std_logic;
outpt: out std_logic_vector(7 downto 0));
end;

architecture one of ALU is
begin
outpt <= A and B 	    when sel = "000" else
			A xor B	    when sel = "001" else
			A or  B	    when sel = "010" else
			not A		  	 when sel = "011" else
			A+Ci		  	 when sel = "100" else
			A+B+Ci	  	 when sel = "101" else
			A+(not B)+Ci when sel = "110" else
			A-1 			 when (sel = "111" and Ci = '0') else
			B				 when (sel = "111" and Ci = '1');
end;