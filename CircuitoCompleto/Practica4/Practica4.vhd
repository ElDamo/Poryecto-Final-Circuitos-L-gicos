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
-- CREATED		"Fri Nov 13 13:04:26 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Practica4 IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(0 TO 15);
		B :  IN  STD_LOGIC_VECTOR(0 TO 15);
		S :  IN  STD_LOGIC_VECTOR(0 TO 3);
		C_out :  OUT  STD_LOGIC;
		Z :  OUT  STD_LOGIC;
		N :  OUT  STD_LOGIC;
		F :  OUT  STD_LOGIC_VECTOR(0 TO 15)
	);
END Practica4;

ARCHITECTURE bdf_type OF Practica4 IS 

COMPONENT sdivider
	PORT(S : IN STD_LOGIC_VECTOR(0 TO 3);
		 C_in : OUT STD_LOGIC;
		 masSig : OUT STD_LOGIC;
		 segSig : OUT STD_LOGIC;
		 SA : OUT STD_LOGIC_VECTOR(0 TO 1);
		 SL : OUT STD_LOGIC_VECTOR(0 TO 1)
	);
END COMPONENT;

COMPONENT firstbit
	PORT(A : IN STD_LOGIC_VECTOR(0 TO 15);
		 N : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT circuitoaritmetico
	PORT(CIN : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(0 TO 15);
		 B : IN STD_LOGIC_VECTOR(0 TO 15);
		 S : IN STD_LOGIC_VECTOR(0 TO 1);
		 COUT : OUT STD_LOGIC;
		 G : OUT STD_LOGIC_VECTOR(0 TO 15)
	);
END COMPONENT;

COMPONENT circuitologico
	PORT(A : IN STD_LOGIC_VECTOR(0 TO 15);
		 B : IN STD_LOGIC_VECTOR(0 TO 15);
		 S : IN STD_LOGIC_VECTOR(0 TO 1);
		 G : OUT STD_LOGIC_VECTOR(0 TO 15)
	);
END COMPONENT;

COMPONENT mux2a1
	PORT(S : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(0 TO 15);
		 B : IN STD_LOGIC_VECTOR(0 TO 15);
		 G : OUT STD_LOGIC_VECTOR(0 TO 15)
	);
END COMPONENT;

COMPONENT shifter
	PORT(B : IN STD_LOGIC_VECTOR(0 TO 15);
		 S : IN STD_LOGIC_VECTOR(0 TO 1);
		 G : OUT STD_LOGIC_VECTOR(0 TO 15)
	);
END COMPONENT;

COMPONENT zerodetect
	PORT(I : IN STD_LOGIC_VECTOR(0 TO 15);
		 Z : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(0 TO 15);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(0 TO 1);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(0 TO 1);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(0 TO 15);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(0 TO 15);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(0 TO 15);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(0 TO 15);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;


BEGIN 
F <= SYNTHESIZED_WIRE_14;



b2v_inst : sdivider
PORT MAP(S => S,
		 C_in => SYNTHESIZED_WIRE_1,
		 masSig => SYNTHESIZED_WIRE_16,
		 segSig => SYNTHESIZED_WIRE_12,
		 SA => SYNTHESIZED_WIRE_2,
		 SL => SYNTHESIZED_WIRE_15);


b2v_inst1 : firstbit
PORT MAP(A => SYNTHESIZED_WIRE_14,
		 N => N);


b2v_inst2 : circuitoaritmetico
PORT MAP(CIN => SYNTHESIZED_WIRE_1,
		 A => A,
		 B => B,
		 S => SYNTHESIZED_WIRE_2,
		 COUT => C_out,
		 G => SYNTHESIZED_WIRE_5);


b2v_inst3 : circuitologico
PORT MAP(A => A,
		 B => B,
		 S => SYNTHESIZED_WIRE_15,
		 G => SYNTHESIZED_WIRE_6);


b2v_inst4 : mux2a1
PORT MAP(S => SYNTHESIZED_WIRE_16,
		 A => SYNTHESIZED_WIRE_5,
		 B => SYNTHESIZED_WIRE_6,
		 G => SYNTHESIZED_WIRE_8);


b2v_inst5 : mux2a1
PORT MAP(S => SYNTHESIZED_WIRE_7,
		 A => SYNTHESIZED_WIRE_8,
		 B => SYNTHESIZED_WIRE_9,
		 G => SYNTHESIZED_WIRE_14);


b2v_inst6 : shifter
PORT MAP(B => B,
		 S => SYNTHESIZED_WIRE_15,
		 G => SYNTHESIZED_WIRE_9);


SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_16 AND SYNTHESIZED_WIRE_12;


b2v_inst8 : zerodetect
PORT MAP(I => SYNTHESIZED_WIRE_14,
		 Z => Z);


END bdf_type;