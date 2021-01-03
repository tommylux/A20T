;Start Script
	G28 R5 ; Autohome if unknown
	M140 S{material_bed_temperature_layer_0} ; start preheating the bed
	;G29 ; Bed leveling

	G90 ; Absolute Positioning
	M82 ; E Absolute independant of G91 (Relative)
	G92 E0 ; Set Position
	G1 Z15 F1700 ; Lift up (1800 is max)
	G0 X0 F9000; Go to bucket (~15000 is max)
	M211 S0 ; Disable SoftStops
	G0 X-2 F500; Go to bucket Closer
	M211 S1 ; Enable SoftStops
	
	M107 ; Fan Off
	M412 S1 ; Enable Runout Sensor

	;Set Mix for Virtual Tools
		M163 S0 P0.6
		M163 S1 P0.4
		M164 S3 ;T3
	;/Virtual Tools

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
	G1 E50 F50 ; Extrude into Bucket
	G92 E0 ; Set current extruder position to 0
	G4 S1 ; Pause 1 second
	G0 X10 F1000 ; Wipe
	G0 X-2 F1000 ; Wipe
	G0 X10 F6000 ; Wipe
	G0 X-2 F6000 ; Wipe
	M211 S1 ; Enable SoftStops
;/Change Tool


;Change End
	G1 F2700 E-7 ; Retract (45ms)
	G0 X0 F9000; Go to bucket
	M211 S0 ; Disable SoftStops
	G0 X-2 F500; Go to bucket Closer
	G1 E0 F2700 ; Recover
;/Change End

;Search and replace codes:
Find: M104 T[0-7]+ S ; Disable temp changes directed to tools
	Replace ;Removed any temp changes directed at Ts: M104 T[0-7]+ S
Find: G1 F600
	Replace G1 F7000

 
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

new 0.4 -1.5

;;Issues