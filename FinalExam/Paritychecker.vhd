library ieee;
use ieee.std_logic_1164.all;
        
entity Paritychecker is 
   generic (n: integer range 0 to 31 := 8); --8[Bits]
   port (data : in std_logic_vector (n-1 downto 0);
            res: out std_logic);
end;

architecture one of Paritychecker is
--signal par : std_logic:= '0'; -- Define as a variable
begin
process (data)
variable par: std_logic; -- Define as a variable
begin
par := '0'; -- Get '0';
for i in n-1 downto 0 loop
par := par xor data (i);
end loop;
res<=par; -- not shared variable
end process;
end;
