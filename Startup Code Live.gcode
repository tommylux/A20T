;Start Script
	G28 R5 ; Autohome if unknown
	M140 S{material_bed_temperature_layer_0} ; start preheating the bed
	;G29 ; Bed leveling

	G90 ; Absolute Positioning
	M82 ; E Absolute independant of G91 (Relative)
	G92 E0 ; Set Position
	G1 Z15 F1700 ; Lift up (1800 is max)
	
	G0 X0 F6000; Go to bucket
	M211 S0 ; Disable SoftStops
	G0 X-5 F500; Go to bucket Closer
	M211 S1 ; Enable SoftStops
	
	M107 ; Fan Off
	M412 S1 ; Enable Runout Sensor

	;Set Mix for Virtual Tools
		M163 S0 P0.8
		M163 S1 P0.2
		M163 S2 P0.0
		M164 S3 ; Extruder 4

		M163 S0 P0.6
		M163 S1 P0.4
		M163 S2 P0.0
		M164 S4 ; Extruder 5

		M163 S0 P0.8
		M163 S1 P0.0
		M163 S2 P0.2
		M164 S5 ; Extruder 6

		M163 S0 P0.6
		M163 S1 P0.0
		M163 S2 P0.4
		M164 S6 ; Extruder 7

		M163 S0 P0.1
		M163 S1 P0.1
		M163 S2 P0.8
		M164 S7 ; Extruder 8
	;/Virtual Tools

	;/Colour mixing:
		;M165 A0 B0.5 C0.5 ; Set Mix for current tool
	
	M104 S{material_print_temperature_layer_0} ; start preheating hotend
	M190 S{material_bed_temperature_layer_0} ; wait for Cura Bed setting
	M109 S{material_print_temperature_layer_0} ; wait for Cura Hotend
;/Start Script

;End Script
	m106 ; Turn on Fan to try and cool retraction good for 1 layer print
	G92 E0 ; Set current extruder position to 0
	G10 ; Retract

	G91 ; Set the interpreter to relative positions
	G0 F1700 Z3 ; Lift up by 10mm (relative)
	G90 ; Absolute positioning
	G0 X0 F6000
	M211 S0 ; Disable SoftStops
	G0 X-5 F500; Go to bucket Closer
	M211 S1 ; Enable SoftStops
	G0 Y200 F2700 ; Move bed forward

	m107 ; Fan Off
	M104 S0 ; Swith off Hotend
	M140 S0 ; Switch off Bed
	G90 ; Absolute positioning
	G92 E0 ; Set position
	M84 ; Disable Steppers
;/End Script


;Change Tool
	M109 R{material_print_temperature}
	G91 ; Relative
	G1 E25 F100 ; Extrude into Bucket
	G1 E5 F50 ; Slow Purge to reduce pressure
	G90 ; Absolute
	G10 ; Retract
	
	; Wait for ooze
	G4 S3 ; Wait 2 seconds

	G0 X5 F500 ; Wipe
	G0 X-5 F4000 ; Wipe
	G0 X5 F500 ; Wipe
	G0 X-5 F4000 ; Wipe
	M211 S1 ; Enable SoftStops
	G0 F6000 ; Set Speed for next move
;/Change Tool

;Change End
	G10 ; Retract
	G91 ; Relative position
	G0 Z0.2 F9000 ; Lift Nozzle
	G0 Z1 X-5 F9000 ;lift diagonal

	G90 ; Absolute
	G0 X0 F6000; Go to bucket 
	M211 S0 ; Disable SoftStops
	G0 X-5 F500; Go to bucket Closer
	G11 ; Recover
;/Change End

 
;Probe offsets: 

Stock 0.4 -2.550
0.2 -1.44

new 0.4 -1.5
 