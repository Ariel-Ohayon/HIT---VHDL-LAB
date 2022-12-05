library ieee;
library lpm;

use ieee.std_logic_1164.all;
use lpm.lpm_components.all;


entity Memory is
port( address : in std_logic_vector (7 downto 0);
we, clk : in std_logic;
din : in std_logic_vector (15 downto 0);
dout : out std_logic_vector (15 downto 0)); 
end;
 
architecture arc of Memory is begin 

-- lpm_ram_dq : separate input/output data ; lpm_ram_io : common input/output data 
-- REGISTERED/UNREGISTERED : DATA+CONTROL INPUTS – 
--SYNCHRONIZED (default)/NOT SYNCH to inclock 
-- MEMORY FILES : hex, mif - memory initialization file 

u1: lpm_ram_dq generic map (lpm_width => 16, lpm_widthad => 8, lpm_outdata => "UNREGISTERED", lpm_file => "Program.mif") 
port map (data => din, address => address, we => we, inclock => clk, q => dout); 
end;