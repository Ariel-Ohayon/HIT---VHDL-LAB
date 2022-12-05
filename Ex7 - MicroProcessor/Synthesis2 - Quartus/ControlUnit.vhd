library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
port(

Instruction: in std_logic_vector(8 downto 0);
run,reset: in std_logic;
count: in std_logic_vector(1 downto 0);

clear,Done: buffer std_logic;
Dinout,Gout,Gin,Ain,IRin,AddSub: out std_logic;
Rin:  out std_logic_vector(7 downto 0);
Rout: out std_logic_vector(7 downto 0));

end;

architecture one of ControlUnit is

component dec3to8
port(
w:  in std_logic_vector(2 downto 0);
En: in std_logic;
y:  out std_logic_vector(0 to 7));
end component;

signal Enrun: std_logic:='0';
signal EnDecin,EnDecout: std_logic;
signal AddrRegIn:  std_logic_vector(2 downto 0);
signal AddrRegOut: std_logic_vector(2 downto 0);

begin

DecEnIn:  dec3to8 port map (AddrRegIn,  EnDecin,  Rin);
DecEnOut: dec3to8 port map (AddrRegOut, EnDecout, Rout);

clear <= Done;

process (run,Done)
begin
	if (run = '1') then Enrun <='1';
	elsif (Done = '1') then Enrun <= '0';
	else Enrun <= Enrun; end if;
end process;

--
-- |---------------------------
-- |       |\            |\   |
-- |-------|0|-----------|0|------Enrun
--   '0'---|1|     '1'---|1|
--	        |/            |/
--          |             |
--          |             |
--         Done          run



process(count,Enrun,reset)
begin

--AddrRegIn  <= Instruction(5 downto 3); -- RxIn
--AddrRegOut <= Instruction(2 downto 0); -- RyOut
--AddrRegIn  <= Instruction(2 downto 0); -- RyIn
--AddrRegOut <= Instruction(5 downto 3); -- RxOut

if (reset = '0') then Done <= '0';
elsif (Enrun = '1') then
case count is
when "00" => Done <= '0'; IRin <= '1'; -- Fetch
			 EnDecin <= '0'; EnDecout <= '0';
			 Dinout <= '0'; Gout <= '0';
			 AddSub <= '0'; Ain <= '0'; Gin <= '0';
when "01" => IRin <= '0'; -- T1
	case Instruction(8 downto 6) is
	when "000"  => EnDecin <= '1'; EnDecout <= '1';
				   Dinout <= '0'; Gout <= '0';
				   AddSub <= '0'; Ain <= '0'; Gin <= '0';
				   Done <= '1';
				   AddrRegOut <= Instruction (2 downto 0); AddrRegIn <= Instruction (5 downto 3);
	when "001"  => EnDecin <= '1'; EnDecout <= '0';
				   Dinout <= '1'; Gout <= '0';
				   AddSub <= '0'; Ain <= '0'; Gin <= '0';
				   Done <= '1'; AddrRegIn  <= Instruction(5 downto 3);
	when "010"  => EnDecin <= '0'; EnDecout <= '1';
				   Dinout <= '0'; Gout <= '0';
				   AddSub <= '0'; Ain <= '1'; Gin <= '0';
				   Done <= '0'; AddrRegOut <= Instruction(5 downto 3);
	when "011"  => EnDecin <= '0'; EnDecout <= '1';
				   Dinout <= '0'; Gout <= '0';
				   AddSub <= '1'; Ain <= '1'; Gin <= '0';
				   Done <= '0'; AddrRegOut <= Instruction(5 downto 3);
	when others => EnDecin <= '0'; EnDecout <= '0';
				   Dinout <= '0'; Gout <= '0';
				   AddSub <= '0'; Ain <= '0'; Gin <= '0'; Done <= '0';
	end case;
when "10" => -- T2
	case Instruction(8 downto 6) is
	when "010"  => EnDecin <= '0'; EnDecout <= '1';
				   Dinout <= '0'; Gout <= '0';
				   AddSub <= '0'; Ain <= '0'; Gin <= '1';
				   Done <= '0'; AddrRegOut <= Instruction(2 downto 0); -- Add
	when "011"  => EnDecin <= '0'; EnDecout <= '1';
				   Dinout <= '0'; Gout <= '0';
				   AddSub <= '1'; Ain <= '0'; Gin <= '1';
				   Done <= '0'; AddrRegOut <= Instruction(2 downto 0); -- Sub
	when others => EnDecin <= '0'; EnDecout <= '0';
				   Dinout <= '0'; Gout <= '0';
				   AddSub <= '0'; Ain <= '0'; Gin <= '0'; Done <= '0';
	end case;
when others => Done <= '1'; -- T3
	case Instruction(8 downto 6) is
	when "010"  => EnDecin <= '1'; EnDecout <= '0';
				   Dinout <= '0'; Gout <= '1';
				   AddSub <= '0'; Ain <= '0'; Gin <= '0';
				   AddrRegIn <= Instruction(5 downto 3); -- Add
	when "011"  => EnDecin <= '1'; EnDecout <= '0';
				   Dinout <= '0'; Gout <= '1'; 
				   AddSub <= '1'; Ain <= '0'; Gin <= '0';
				   AddrRegIn <= Instruction(5 downto 3); -- Sub
	when others => EnDecin <= '0'; EnDecout <= '0';
				   Dinout <= '0'; Gout <= '0';
				   AddSub <= '0'; Ain <= '0'; Gin <= '0';
	end case;
end case;
end if;
end process;
end;