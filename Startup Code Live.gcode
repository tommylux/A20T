;Start Script
	G28 R5 ; Autohome if unknown
	M140 S{material_bed_temperature_layer_0} ; start preheating the bed
	;G29 ; Bed leveling

	G90 ; Absolute Positioning
	M82 ; E Absolute independant of G91 (Relative)
	G92 E0 ; Set Position
	G1 Z15 F1700 ; Lift up (1800 is max)
	
	G0 X0 F9000; Go to bucket
	M211 S0 ; Disable SoftStops
	G0 X-4 F500; Go to bucket Closer
	M211 S1 ; Enable SoftStops
	
	M107 ; Fan Off
	M412 S1 ; Enable Runout Sensor

	;Set Mix for Virtual Tools
		M163 S0 P0.8
		M163 S1 P0.2
		M163 S2 P0.0
		M164 S3 ;T3

		M163 S0 P0.6
		M163 S1 P0.4
		M163 S2 P0.0
		M164 S4 ;T4

		M163 S0 P0.8
		M163 S1 P0.0
		M163 S2 P0.2
		M164 S5 ;T5

		M163 S0 P0.6
		M163 S1 P0.0
		M163 S2 P0.4
		M164 S6 ;T6

		M163 S0 P0.1
		M163 S1 P0.1
		M163 S2 P0.8
		M164 S7 ;T7
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
	G1 F2700 E-7 ; Retract

	G91 ; Set the interpreter to relative positions
	G0 F1700 Z3 ; Lift up by 10mm (relative)
	G90 ; Absolute positioning
	G0 X0 F9000
	G0 Y200 F2700 ; Move bed forward

	m107 ; Fan Off
	M104 S0 ; Swith off Hotend
	M140 S0 ; Switch off Bed
	G90 ; Absolute positioning
	G92 E0 ; Set position
	M84 ; Disable Steppers
;/End Script


;Change Tool
	G91 ; Relative position
	G0 Z1 F9000 ; Lift Nozzle

	G90 ; Absolute
	G1 F3000 E-4 ; Retract (50ms = 3000 45ms = 2700)
	G0 X0 F9000; Go to bucket
 
	M211 S0 ; Disable SoftStops
	G0 X-4 F500; Go to bucket Closer
	G1 E0 F3000 ; Recover
	
	G91 ; Relative
	G1 E25 F100 ; Extrude into Bucket
	G1 E5 F50 ; Slow Purge to reduce pressure

	G90 ; Absolute
	G92 E0 ; Set current extruder position to 0
	G1 E-4 F3000 ; Retract a bit
	
	; Wait for ooze
	G4 S2 ; Wait 2 seconds

	G0 X10 F1000 ; Wipe
	G0 X-4 F1000 ; Wipe
	G0 X10 F6000 ; Wipe
	G0 X-4 F6000 ; Wipe
	M211 S1 ; Enable SoftStops
;/Change Tool

;Search and replace codes:
Find: M104 T[0-7]+ S ; Disable temp changes directed to tools
	Replace: ;Removed any temp changes directed at Ts: M104 T[0-7]+ S
Find: G1 F600
	Replace: G1 F7000
Find: M105\nM109
	Replace: ;Remove Temp tool changes05 and 109

Find: ;/Change Tool\nG92 E0
	Replace: ;/Change Tool\n;Removed Retract G92 E0

  

;Probe offsets: 

Stock 0.4 -2.550
0.2 -1.44

new 0.4 -1.5

;;Issues
