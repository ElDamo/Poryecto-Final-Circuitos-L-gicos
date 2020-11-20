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
-- CREATED		"Fri Oct 09 13:53:30 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Practica2 IS 
	PORT
	(
		R8 :  IN  STD_LOGIC;
		A0 :  IN  STD_LOGIC;
		A1 :  IN  STD_LOGIC;
		A2 :  IN  STD_LOGIC;
		A3 :  IN  STD_LOGIC;
		B0 :  IN  STD_LOGIC;
		B1 :  IN  STD_LOGIC;
		B2 :  IN  STD_LOGIC;
		B3 :  IN  STD_LOGIC;
		C0 :  IN  STD_LOGIC;
		C1 :  IN  STD_LOGIC;
		C2 :  IN  STD_LOGIC;
		C3 :  IN  STD_LOGIC;
		E0 :  IN  STD_LOGIC;
		E1 :  IN  STD_LOGIC;
		E2 :  IN  STD_LOGIC;
		E3 :  IN  STD_LOGIC;
		D1 :  OUT  STD_LOGIC;
		D2 :  OUT  STD_LOGIC;
		D3 :  OUT  STD_LOGIC;
		A :  OUT  STD_LOGIC;
		B :  OUT  STD_LOGIC;
		C :  OUT  STD_LOGIC;
		d :  OUT  STD_LOGIC;
		E :  OUT  STD_LOGIC;
		f :  OUT  STD_LOGIC;
		g :  OUT  STD_LOGIC;
		D0 :  OUT  STD_LOGIC
	);
END Practica2;

ARCHITECTURE bdf_type OF Practica2 IS 

COMPONENT mux4a1
	PORT(A : IN STD_LOGIC_VECTOR(0 TO 3);
		 B : IN STD_LOGIC_VECTOR(0 TO 3);
		 C : IN STD_LOGIC_VECTOR(0 TO 3);
		 D : IN STD_LOGIC_VECTOR(0 TO 3);
		 S : IN STD_LOGIC_VECTOR(0 TO 1);
		 F : OUT STD_LOGIC_VECTOR(0 TO 3)
	);
END COMPONENT;

COMPONENT decobcda7
	PORT(T : IN STD_LOGIC_VECTOR(0 TO 3);
		 a : OUT STD_LOGIC;
		 b : OUT STD_LOGIC;
		 c : OUT STD_LOGIC;
		 d : OUT STD_LOGIC;
		 e : OUT STD_LOGIC;
		 f : OUT STD_LOGIC;
		 g : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT cont2
	PORT(Clock : IN STD_LOGIC;
		 Reset : IN STD_LOGIC;
		 D : OUT STD_LOGIC_VECTOR(0 TO 1)
	);
END COMPONENT;

COMPONENT div_freq
GENERIC (DIV : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 clk_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT deco2a4
	PORT(S : IN STD_LOGIC_VECTOR(0 TO 1);
		 D0 : OUT STD_LOGIC;
		 D1 : OUT STD_LOGIC;
		 D2 : OUT STD_LOGIC;
		 D3 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(0 TO 1);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(0 TO 3);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;

SIGNAL	GDFX_TEMP_SIGNAL_3 :  STD_LOGIC_VECTOR(0 TO 3);
SIGNAL	GDFX_TEMP_SIGNAL_2 :  STD_LOGIC_VECTOR(0 TO 3);
SIGNAL	GDFX_TEMP_SIGNAL_1 :  STD_LOGIC_VECTOR(0 TO 3);
SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(0 TO 3);

BEGIN 
SYNTHESIZED_WIRE_7 <= '0';

GDFX_TEMP_SIGNAL_3 <= (E0 & E1 & E2 & E3);
GDFX_TEMP_SIGNAL_2 <= (C0 & C1 & C2 & C3);
GDFX_TEMP_SIGNAL_1 <= (B0 & B1 & B2 & B3);
GDFX_TEMP_SIGNAL_0 <= (A0 & A1 & A2 & A3);


b2v_inst : mux4a1
PORT MAP(A => GDFX_TEMP_SIGNAL_0,
		 B => GDFX_TEMP_SIGNAL_1,
		 C => GDFX_TEMP_SIGNAL_2,
		 D => GDFX_TEMP_SIGNAL_3,
		 S => SYNTHESIZED_WIRE_6,
		 F => SYNTHESIZED_WIRE_1);


b2v_inst1 : decobcda7
PORT MAP(T => SYNTHESIZED_WIRE_1,
		 a => A,
		 b => B,
		 c => C,
		 d => d,
		 e => E,
		 f => f,
		 g => g);


b2v_inst2 : cont2
PORT MAP(Clock => SYNTHESIZED_WIRE_2,
		 Reset => SYNTHESIZED_WIRE_7,
		 D => SYNTHESIZED_WIRE_6);


b2v_inst3 : div_freq
GENERIC MAP(DIV => 100000
			)
PORT MAP(clk => R8,
		 reset => SYNTHESIZED_WIRE_7,
		 clk_out => SYNTHESIZED_WIRE_2);


b2v_inst4 : deco2a4
PORT MAP(S => SYNTHESIZED_WIRE_6,
		 D0 => D0,
		 D1 => D1,
		 D2 => D2,
		 D3 => D3);



END bdf_type;