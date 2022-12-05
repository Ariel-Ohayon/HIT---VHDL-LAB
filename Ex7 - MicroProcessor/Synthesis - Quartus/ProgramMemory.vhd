library ieee;
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity ProgramMemory is 
port(
	address : in std_logic_vector (3 downto 0);
	clk : in std_logic;
	din : in std_logic_vector (15 downto 0);
	dout : out std_logic_vector (15 downto 0));
end;

architecture arc of ProgramMemory is
begin
u1: lpm_ram_dq   
     generic map (lpm_width => 16,
                  lpm_widthad => 4,
				  lpm_outdata => "UNREGISTERED",
				  lpm_file => "Program.mif")
	      port map (data => din,
			   address => address,
			   we => '0',
			   inclock => clk,   
			   q => dout);
end;
