-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
-- CREATED		"Thu Nov 05 21:50:46 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Protoboard IS 
	PORT
	(
		clock :  IN  STD_LOGIC;
		G0 :  IN  STD_LOGIC;
		G1 :  IN  STD_LOGIC;
		G2 :  IN  STD_LOGIC;
		G3 :  IN  STD_LOGIC;
		G4 :  IN  STD_LOGIC;
		G5 :  IN  STD_LOGIC;
		G6 :  IN  STD_LOGIC;
		G7 :  IN  STD_LOGIC;
		G8 :  IN  STD_LOGIC;
		G9 :  IN  STD_LOGIC;
		G10 :  IN  STD_LOGIC;
		G11 :  IN  STD_LOGIC;
		G12 :  IN  STD_LOGIC;
		G13 :  IN  STD_LOGIC;
		G14 :  IN  STD_LOGIC;
		G15 :  IN  STD_LOGIC;
		D1 :  OUT  STD_LOGIC;
		D2 :  OUT  STD_LOGIC;
		D3 :  OUT  STD_LOGIC;
		A :  OUT  STD_LOGIC;
		B :  OUT  STD_LOGIC;
		C :  OUT  STD_LOGIC;
		D :  OUT  STD_LOGIC;
		E :  OUT  STD_LOGIC;
		F :  OUT  STD_LOGIC;
		G :  OUT  STD_LOGIC;
		D0 :  OUT  STD_LOGIC
	);
END Protoboard;

ARCHITECTURE bdf_type OF Protoboard IS 

COMPONENT inversor16todownto
	PORT(eto : IN STD_LOGIC_VECTOR(0 TO 15);
		 sdownto : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT binarioabcd
GENERIC (N : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 binary_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 bcd0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 bcd1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 bcd2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 bcd3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 bcd4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT inversor4downtoto
	PORT(edownto : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sto0 : OUT STD_LOGIC;
		 sto1 : OUT STD_LOGIC;
		 sto2 : OUT STD_LOGIC;
		 sto3 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT practica2
	PORT(R8 : IN STD_LOGIC;
		 A0 : IN STD_LOGIC;
		 A1 : IN STD_LOGIC;
		 A2 : IN STD_LOGIC;
		 A3 : IN STD_LOGIC;
		 B0 : IN STD_LOGIC;
		 B1 : IN STD_LOGIC;
		 B2 : IN STD_LOGIC;
		 B3 : IN STD_LOGIC;
		 C0 : IN STD_LOGIC;
		 C1 : IN STD_LOGIC;
		 C2 : IN STD_LOGIC;
		 C3 : IN STD_LOGIC;
		 E0 : IN STD_LOGIC;
		 E1 : IN STD_LOGIC;
		 E2 : IN STD_LOGIC;
		 E3 : IN STD_LOGIC;
		 D1 : OUT STD_LOGIC;
		 D2 : OUT STD_LOGIC;
		 D3 : OUT STD_LOGIC;
		 A : OUT STD_LOGIC;
		 B : OUT STD_LOGIC;
		 C : OUT STD_LOGIC;
		 d : OUT STD_LOGIC;
		 E : OUT STD_LOGIC;
		 f : OUT STD_LOGIC;
		 g : OUT STD_LOGIC;
		 D0 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;

SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(0 TO 15);

BEGIN 
SYNTHESIZED_WIRE_0 <= '0';

GDFX_TEMP_SIGNAL_0 <= (G0 & G1 & G2 & G3 & G4 & G5 & G6 & G7 & G8 & G9 & G10 & G11 & G12 & G13 & G14 & G15);


b2v_inst : inversor16todownto
PORT MAP(eto => GDFX_TEMP_SIGNAL_0,
		 sdownto => SYNTHESIZED_WIRE_1);


b2v_inst2 : binarioabcd
GENERIC MAP(N => 16
			)
PORT MAP(clk => clock,
		 reset => SYNTHESIZED_WIRE_0,
		 binary_in => SYNTHESIZED_WIRE_1,
		 bcd0 => SYNTHESIZED_WIRE_5,
		 bcd1 => SYNTHESIZED_WIRE_4,
		 bcd2 => SYNTHESIZED_WIRE_3,
		 bcd3 => SYNTHESIZED_WIRE_2);


b2v_inst3 : inversor4downtoto
PORT MAP(edownto => SYNTHESIZED_WIRE_2,
		 sto0 => SYNTHESIZED_WIRE_6,
		 sto1 => SYNTHESIZED_WIRE_7,
		 sto2 => SYNTHESIZED_WIRE_8,
		 sto3 => SYNTHESIZED_WIRE_9);


b2v_inst4 : inversor4downtoto
PORT MAP(edownto => SYNTHESIZED_WIRE_3,
		 sto0 => SYNTHESIZED_WIRE_10,
		 sto1 => SYNTHESIZED_WIRE_11,
		 sto2 => SYNTHESIZED_WIRE_12,
		 sto3 => SYNTHESIZED_WIRE_13);


b2v_inst5 : inversor4downtoto
PORT MAP(edownto => SYNTHESIZED_WIRE_4,
		 sto0 => SYNTHESIZED_WIRE_14,
		 sto1 => SYNTHESIZED_WIRE_15,
		 sto2 => SYNTHESIZED_WIRE_16,
		 sto3 => SYNTHESIZED_WIRE_17);


b2v_inst6 : inversor4downtoto
PORT MAP(edownto => SYNTHESIZED_WIRE_5,
		 sto0 => SYNTHESIZED_WIRE_18,
		 sto1 => SYNTHESIZED_WIRE_19,
		 sto2 => SYNTHESIZED_WIRE_20,
		 sto3 => SYNTHESIZED_WIRE_21);


b2v_inst7 : practica2
PORT MAP(R8 => clock,
		 A0 => SYNTHESIZED_WIRE_6,
		 A1 => SYNTHESIZED_WIRE_7,
		 A2 => SYNTHESIZED_WIRE_8,
		 A3 => SYNTHESIZED_WIRE_9,
		 B0 => SYNTHESIZED_WIRE_10,
		 B1 => SYNTHESIZED_WIRE_11,
		 B2 => SYNTHESIZED_WIRE_12,
		 B3 => SYNTHESIZED_WIRE_13,
		 C0 => SYNTHESIZED_WIRE_14,
		 C1 => SYNTHESIZED_WIRE_15,
		 C2 => SYNTHESIZED_WIRE_16,
		 C3 => SYNTHESIZED_WIRE_17,
		 E0 => SYNTHESIZED_WIRE_18,
		 E1 => SYNTHESIZED_WIRE_19,
		 E2 => SYNTHESIZED_WIRE_20,
		 E3 => SYNTHESIZED_WIRE_21,
		 D1 => D1,
		 D2 => D2,
		 D3 => D3,
		 A => A,
		 B => B,
		 C => C,
		 d => D,
		 E => E,
		 f => F,
		 g => G,
		 D0 => D0);



END bdf_type;