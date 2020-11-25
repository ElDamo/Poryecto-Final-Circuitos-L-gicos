transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/joceg/OneDrive - INSTITUTO TECNOLOGICO AUTONOMO DE MEXICO/Escuela/Tareas/Circuitos lógicos/Laboratorio/Practica2/decoBCDa7/decoBCDa7.vhd}

