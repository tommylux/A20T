;Start Script
	G28 R5 ; Autohome if unknown
	M140 S{material_bed_temperature_layer_0} ; start preheating the bed
	;G29 ; Bed leveling

	G90 ; Absolute Positioning
	M82 ; E Absolute
	G92 E0 ; Set Position
	G1 Z15 F3000 ; Lift up

	G0 X0 F5000; Go to bucket
	M211 S0 ; Disable SoftStops
	G0 X-2 F500; Go to bucket Closer
	M211 S1 ; Enable SoftStops
	
	M107 ; Fan Off
	M412 S1 ; Enable Runout Sensor

	M104 S{material_print_temperature_layer_0} ; start preheating hotend
	M190 S{material_bed_temperature_layer_0} ; wait for Cura Bed setting
	M109 S{material_print_temperature_layer_0} ; wait for Cura Hotend

;/Start Script

;End Script
	G92 E0 ; Set current extruder position to 0
	G1 E-7 ; Retract 1mm

	G91 ; Set the interpreter to relative positions
	G0 Z10 ; Lift up by 10mm (relative)
	
	G90 ; Absolute positioning
	G0 X0 Y200 ; Home

	M104 S0 ; Swith off Hotend
	M140 S0 ; Switch off Bed
	G90 ; Absolute positioning
	G92 E0 ; Set position
	M84 ; Disable Steppers
;/End Script


;Change Tool
	;M165 A1 B0 C0 ;  T0
	;M165 A0 B1 C0 ;  T1
	;M165 A0 B0 C1 ;  T2
	;M165 A0.5 B0.5 C0 ;  T3

	M117 Changing Tool
	G1 E55 F60 ; Extrude into Bucket
	G92 E0 ; Set current extruder position to 0
	G1 F2700 E-7 ; Retract to try and slow oooze.
	G0 F5000 ; Set travel speed
	
	;G4 S1 ; Pause 1 second
	G0 X10 F6000 ; Wipe
	G0 X-2 F6000 ; Wipe
	M211 S1 ; Enable SoftStops
	
;/Change Tool

;Change End
	G1 F2700 E-7 ; Retract (45ms)
	G0 X0 F5000; Go to bucket
	M211 S0 ; Disable SoftStops
	G0 X-2 F500; Go to bucket Closer
	G1 E0 F2700 ; Recover
;/Change End

 
; Prep line - Not used.
;	G0 X10 Y20 F6000 ; Get into position of Prep Line
;	G1 Z0.8 ; Drop Nozzle to starting point
;	G1 F300 X200 E40 ; Prep Line
;	G1 F1200 Z4 ; Lift Nozzle
;	G92 E0 ; Set Position
;	G28 X; Autohome X
; End of prep line



;Probe offsets: 

Stock 0.4 -2.550
0.2 -1.44

;Replace codes:
M104 T[0-7]+ S
T[3-7]

;;Issues