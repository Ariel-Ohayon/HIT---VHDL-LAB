library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ram is
generic (bits:integer:=8;
             bitswords: integer := 4);
port (clk, rd_nwr : in std_logic;
        addr: in std_Logic_vector (bitswords-1 downto 0);
        data_in: in  std_logic_vector (bits-1 downto 0);
		  data_out:out std_logic_vector (bits-1 downto 0));
end ram;

architecture rama of ram is
type vector_array is Array (0 to bitswords-1) of 
              std_logic_vector (bits-1 downto 0);
signal memory: vector_array;
begin
process (clk,rd_nwr)
begin
if rd_nwr = '1' then data_out <= memory (CONV_INTEGER(addr)); -- read state
    else  data_out <= (others => 'Z'); -- write state
	if clk'event and clk = '1' then
	        memory (CONV_INTEGER(addr)) <= data_in;
            end if;
end if;
end process;
end;
