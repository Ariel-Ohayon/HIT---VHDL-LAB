-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "07/07/2022 09:55:36"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Ex1 IS
    PORT (
	disp1 : OUT std_logic_vector(6 DOWNTO 0);
	Sw : IN std_logic_vector(2 DOWNTO 0);
	disp2 : OUT std_logic_vector(6 DOWNTO 0);
	disp3 : OUT std_logic_vector(6 DOWNTO 0);
	disp4 : OUT std_logic_vector(6 DOWNTO 0);
	disp5 : OUT std_logic_vector(6 DOWNTO 0)
	);
END Ex1;

-- Design Ports Information
-- disp1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp3[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp3[5]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp3[4]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp3[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp3[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp5[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp5[5]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp5[4]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp5[3]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp5[2]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp5[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp5[0]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sw[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sw[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sw[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Ex1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_disp1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_Sw : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_disp2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_disp3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_disp4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_disp5 : std_logic_vector(6 DOWNTO 0);
SIGNAL \disp1[6]~output_o\ : std_logic;
SIGNAL \disp1[5]~output_o\ : std_logic;
SIGNAL \disp1[4]~output_o\ : std_logic;
SIGNAL \disp1[3]~output_o\ : std_logic;
SIGNAL \disp1[2]~output_o\ : std_logic;
SIGNAL \disp1[1]~output_o\ : std_logic;
SIGNAL \disp1[0]~output_o\ : std_logic;
SIGNAL \disp2[6]~output_o\ : std_logic;
SIGNAL \disp2[5]~output_o\ : std_logic;
SIGNAL \disp2[4]~output_o\ : std_logic;
SIGNAL \disp2[3]~output_o\ : std_logic;
SIGNAL \disp2[2]~output_o\ : std_logic;
SIGNAL \disp2[1]~output_o\ : std_logic;
SIGNAL \disp2[0]~output_o\ : std_logic;
SIGNAL \disp3[6]~output_o\ : std_logic;
SIGNAL \disp3[5]~output_o\ : std_logic;
SIGNAL \disp3[4]~output_o\ : std_logic;
SIGNAL \disp3[3]~output_o\ : std_logic;
SIGNAL \disp3[2]~output_o\ : std_logic;
SIGNAL \disp3[1]~output_o\ : std_logic;
SIGNAL \disp3[0]~output_o\ : std_logic;
SIGNAL \disp4[6]~output_o\ : std_logic;
SIGNAL \disp4[5]~output_o\ : std_logic;
SIGNAL \disp4[4]~output_o\ : std_logic;
SIGNAL \disp4[3]~output_o\ : std_logic;
SIGNAL \disp4[2]~output_o\ : std_logic;
SIGNAL \disp4[1]~output_o\ : std_logic;
SIGNAL \disp4[0]~output_o\ : std_logic;
SIGNAL \disp5[6]~output_o\ : std_logic;
SIGNAL \disp5[5]~output_o\ : std_logic;
SIGNAL \disp5[4]~output_o\ : std_logic;
SIGNAL \disp5[3]~output_o\ : std_logic;
SIGNAL \disp5[2]~output_o\ : std_logic;
SIGNAL \disp5[1]~output_o\ : std_logic;
SIGNAL \disp5[0]~output_o\ : std_logic;
SIGNAL \Sw[2]~input_o\ : std_logic;
SIGNAL \Sw[0]~input_o\ : std_logic;
SIGNAL \Sw[1]~input_o\ : std_logic;
SIGNAL \inst|U5|Mux1~0_combout\ : std_logic;
SIGNAL \inst|M1|Mux1~0_combout\ : std_logic;
SIGNAL \inst|M5|Mux0~0_combout\ : std_logic;
SIGNAL \inst|U5|Mux2~0_combout\ : std_logic;
SIGNAL \inst|M2|Mux0~0_combout\ : std_logic;
SIGNAL \inst|M2|Mux1~0_combout\ : std_logic;
SIGNAL \inst|U4|Mux2~0_combout\ : std_logic;
SIGNAL \inst|U3|Mux1~0_combout\ : std_logic;
SIGNAL \inst|M3|Mux1~0_combout\ : std_logic;
SIGNAL \inst|U3|Mux2~0_combout\ : std_logic;
SIGNAL \inst|U2|Mux1~0_combout\ : std_logic;
SIGNAL \inst|M4|Mux2~0_combout\ : std_logic;
SIGNAL \inst|U2|Mux2~0_combout\ : std_logic;
SIGNAL \inst|M5|Mux1~0_combout\ : std_logic;
SIGNAL \inst|M5|Mux2~0_combout\ : std_logic;
SIGNAL \inst|U1|Mux2~0_combout\ : std_logic;
SIGNAL \inst|M2|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst|U5|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst|M1|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst|U5|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst|U1|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst|M5|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst|U2|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst|U3|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst|M3|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst|U3|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst|U4|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst|M2|ALT_INV_Mux1~0_combout\ : std_logic;

BEGIN

disp1 <= ww_disp1;
ww_Sw <= Sw;
disp2 <= ww_disp2;
disp3 <= ww_disp3;
disp4 <= ww_disp4;
disp5 <= ww_disp5;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst|M2|ALT_INV_Mux0~0_combout\ <= NOT \inst|M2|Mux0~0_combout\;
\inst|U5|ALT_INV_Mux2~0_combout\ <= NOT \inst|U5|Mux2~0_combout\;
\inst|M1|ALT_INV_Mux1~0_combout\ <= NOT \inst|M1|Mux1~0_combout\;
\inst|U5|ALT_INV_Mux1~0_combout\ <= NOT \inst|U5|Mux1~0_combout\;
\inst|U1|ALT_INV_Mux2~0_combout\ <= NOT \inst|U1|Mux2~0_combout\;
\inst|M5|ALT_INV_Mux1~0_combout\ <= NOT \inst|M5|Mux1~0_combout\;
\inst|U2|ALT_INV_Mux1~0_combout\ <= NOT \inst|U2|Mux1~0_combout\;
\inst|U3|ALT_INV_Mux2~0_combout\ <= NOT \inst|U3|Mux2~0_combout\;
\inst|M3|ALT_INV_Mux1~0_combout\ <= NOT \inst|M3|Mux1~0_combout\;
\inst|U3|ALT_INV_Mux1~0_combout\ <= NOT \inst|U3|Mux1~0_combout\;
\inst|U4|ALT_INV_Mux2~0_combout\ <= NOT \inst|U4|Mux2~0_combout\;
\inst|M2|ALT_INV_Mux1~0_combout\ <= NOT \inst|M2|Mux1~0_combout\;

-- Location: IOOBUF_X115_Y28_N9
\disp1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U5|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp1[6]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\disp1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp1[5]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\disp1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp1[4]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\disp1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M1|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp1[3]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\disp1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M5|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \disp1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\disp1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M5|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \disp1[1]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\disp1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U5|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp1[0]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\disp2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M2|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \disp2[6]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\disp2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp2[5]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\disp2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp2[4]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\disp2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M2|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp2[3]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\disp2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U5|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp2[2]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\disp2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U5|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp2[1]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\disp2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U4|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp2[0]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\disp3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U3|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp3[6]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\disp3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\disp3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp3[4]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\disp3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M3|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp3[3]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\disp3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M2|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \disp3[2]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\disp3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M2|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \disp3[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\disp3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U3|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp3[0]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\disp4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U2|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp4[6]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\disp4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp4[5]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\disp4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp4[4]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\disp4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Sw[2]~input_o\,
	devoe => ww_devoe,
	o => \disp4[3]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\disp4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M4|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp4[2]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\disp4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M4|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp4[1]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\disp4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U2|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp4[0]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\disp5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M5|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \disp5[6]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\disp5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp5[5]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\disp5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \disp5[4]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\disp5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M5|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \disp5[3]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\disp5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M5|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp5[2]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\disp5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|M5|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp5[1]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\disp5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|U1|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \disp5[0]~output_o\);

-- Location: IOIBUF_X115_Y15_N8
\Sw[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sw(2),
	o => \Sw[2]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\Sw[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sw(0),
	o => \Sw[0]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\Sw[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sw(1),
	o => \Sw[1]~input_o\);

-- Location: LCCOMB_X114_Y15_N0
\inst|U5|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|U5|Mux1~0_combout\ = (!\Sw[2]~input_o\ & (\Sw[0]~input_o\ $ (\Sw[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|U5|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N2
\inst|M1|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|M1|Mux1~0_combout\ = (\Sw[2]~input_o\) # ((\Sw[1]~input_o\) # (!\Sw[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|M1|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N20
\inst|M5|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|M5|Mux0~0_combout\ = (\Sw[1]~input_o\) # (\Sw[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Sw[1]~input_o\,
	datad => \Sw[2]~input_o\,
	combout => \inst|M5|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y15_N30
\inst|U5|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|U5|Mux2~0_combout\ = (!\Sw[2]~input_o\ & !\Sw[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datac => \Sw[0]~input_o\,
	combout => \inst|U5|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y15_N16
\inst|M2|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|M2|Mux0~0_combout\ = (\Sw[1]~input_o\ & !\Sw[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Sw[1]~input_o\,
	datad => \Sw[2]~input_o\,
	combout => \inst|M2|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y15_N26
\inst|M2|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|M2|Mux1~0_combout\ = (\Sw[2]~input_o\) # ((\Sw[0]~input_o\) # (!\Sw[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|M2|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N4
\inst|U4|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|U4|Mux2~0_combout\ = (!\Sw[2]~input_o\ & \Sw[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datac => \Sw[0]~input_o\,
	combout => \inst|U4|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y15_N14
\inst|U3|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|U3|Mux1~0_combout\ = (\Sw[2]~input_o\) # ((\Sw[0]~input_o\ & \Sw[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|U3|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N8
\inst|M3|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|M3|Mux1~0_combout\ = (\Sw[2]~input_o\) # ((!\Sw[1]~input_o\) # (!\Sw[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|M3|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N10
\inst|U3|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|U3|Mux2~0_combout\ = (\Sw[2]~input_o\) # ((!\Sw[0]~input_o\ & \Sw[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|U3|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y15_N12
\inst|U2|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|U2|Mux1~0_combout\ = (\Sw[2]~input_o\) # ((!\Sw[0]~input_o\ & !\Sw[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|U2|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N6
\inst|M4|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|M4|Mux2~0_combout\ = (!\Sw[2]~input_o\ & ((!\Sw[1]~input_o\) # (!\Sw[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|M4|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y15_N24
\inst|U2|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|U2|Mux2~0_combout\ = (\Sw[2]~input_o\) # (\Sw[0]~input_o\ $ (\Sw[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|U2|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y15_N18
\inst|M5|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|M5|Mux1~0_combout\ = (\Sw[2]~input_o\) # ((\Sw[0]~input_o\) # (\Sw[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|M5|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N28
\inst|M5|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|M5|Mux2~0_combout\ = (!\Sw[2]~input_o\ & ((\Sw[0]~input_o\) # (\Sw[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|M5|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y15_N22
\inst|U1|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|U1|Mux2~0_combout\ = (\Sw[2]~input_o\) # ((\Sw[0]~input_o\ & !\Sw[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sw[2]~input_o\,
	datab => \Sw[0]~input_o\,
	datac => \Sw[1]~input_o\,
	combout => \inst|U1|Mux2~0_combout\);

ww_disp1(6) <= \disp1[6]~output_o\;

ww_disp1(5) <= \disp1[5]~output_o\;

ww_disp1(4) <= \disp1[4]~output_o\;

ww_disp1(3) <= \disp1[3]~output_o\;

ww_disp1(2) <= \disp1[2]~output_o\;

ww_disp1(1) <= \disp1[1]~output_o\;

ww_disp1(0) <= \disp1[0]~output_o\;

ww_disp2(6) <= \disp2[6]~output_o\;

ww_disp2(5) <= \disp2[5]~output_o\;

ww_disp2(4) <= \disp2[4]~output_o\;

ww_disp2(3) <= \disp2[3]~output_o\;

ww_disp2(2) <= \disp2[2]~output_o\;

ww_disp2(1) <= \disp2[1]~output_o\;

ww_disp2(0) <= \disp2[0]~output_o\;

ww_disp3(6) <= \disp3[6]~output_o\;

ww_disp3(5) <= \disp3[5]~output_o\;

ww_disp3(4) <= \disp3[4]~output_o\;

ww_disp3(3) <= \disp3[3]~output_o\;

ww_disp3(2) <= \disp3[2]~output_o\;

ww_disp3(1) <= \disp3[1]~output_o\;

ww_disp3(0) <= \disp3[0]~output_o\;

ww_disp4(6) <= \disp4[6]~output_o\;

ww_disp4(5) <= \disp4[5]~output_o\;

ww_disp4(4) <= \disp4[4]~output_o\;

ww_disp4(3) <= \disp4[3]~output_o\;

ww_disp4(2) <= \disp4[2]~output_o\;

ww_disp4(1) <= \disp4[1]~output_o\;

ww_disp4(0) <= \disp4[0]~output_o\;

ww_disp5(6) <= \disp5[6]~output_o\;

ww_disp5(5) <= \disp5[5]~output_o\;

ww_disp5(4) <= \disp5[4]~output_o\;

ww_disp5(3) <= \disp5[3]~output_o\;

ww_disp5(2) <= \disp5[2]~output_o\;

ww_disp5(1) <= \disp5[1]~output_o\;

ww_disp5(0) <= \disp5[0]~output_o\;
END structure;


