;Start Script
	;Octolapse script:
	; --- Global Settings
	; layer_height = {layer_height}
	; smooth_spiralized_contours = {smooth_spiralized_contours}
	; magic_mesh_surface_mode = {magic_mesh_surface_mode}
	; machine_extruder_count = {machine_extruder_count}
	; --- Single Extruder Settings
	; speed_z_hop = {speed_z_hop}
	; retraction_amount = {retraction_amount}
	; retraction_hop = {retraction_hop}
	; retraction_hop_enabled = {retraction_hop_enabled}
	; retraction_enable = {retraction_enable}
	; retraction_speed = {retraction_speed}
	; retraction_retract_speed = {retraction_retract_speed}
	; retraction_prime_speed = {retraction_prime_speed}
	; speed_travel = {speed_travel}
	; --- Multi-Extruder Settings
	; speed_z_hop_0 = {speed_z_hop, 0}
	; speed_z_hop_1 = {speed_z_hop, 1}
	; speed_z_hop_2 = {speed_z_hop, 2}
	; speed_z_hop_3 = {speed_z_hop, 3}
	; speed_z_hop_4 = {speed_z_hop, 4}
	; speed_z_hop_5 = {speed_z_hop, 5}
	; speed_z_hop_6 = {speed_z_hop, 6}
	; speed_z_hop_7 = {speed_z_hop, 7}
	; retraction_amount_0 = {retraction_amount, 0}
	; retraction_amount_1 = {retraction_amount, 1}
	; retraction_amount_2 = {retraction_amount, 2}
	; retraction_amount_3 = {retraction_amount, 3}
	; retraction_amount_4 = {retraction_amount, 4}
	; retraction_amount_5 = {retraction_amount, 5}
	; retraction_amount_6 = {retraction_amount, 6}
	; retraction_amount_7 = {retraction_amount, 7}
	; retraction_hop_0 = {retraction_hop, 0}
	; retraction_hop_1 = {retraction_hop, 1}
	; retraction_hop_2 = {retraction_hop, 2}
	; retraction_hop_3 = {retraction_hop, 3}
	; retraction_hop_4 = {retraction_hop, 4}
	; retraction_hop_5 = {retraction_hop, 5}
	; retraction_hop_6 = {retraction_hop, 6}
	; retraction_hop_7 = {retraction_hop, 7}
	; retraction_hop_enabled_0 = {retraction_hop_enabled, 0}
	; retraction_hop_enabled_1 = {retraction_hop_enabled, 1}
	; retraction_hop_enabled_2 = {retraction_hop_enabled, 2}
	; retraction_hop_enabled_3 = {retraction_hop_enabled, 3}
	; retraction_hop_enabled_4 = {retraction_hop_enabled, 4}
	; retraction_hop_enabled_5 = {retraction_hop_enabled, 5}
	; retraction_hop_enabled_6 = {retraction_hop_enabled, 6}
	; retraction_hop_enabled_7 = {retraction_hop_enabled, 7}
	; retraction_prime_speed_0 = {retraction_prime_speed, 0}
	; retraction_prime_speed_1 = {retraction_prime_speed, 1}
	; retraction_prime_speed_2 = {retraction_prime_speed, 2}
	; retraction_prime_speed_3 = {retraction_prime_speed, 3}
	; retraction_prime_speed_4 = {retraction_prime_speed, 4}
	; retraction_prime_speed_5 = {retraction_prime_speed, 5}
	; retraction_prime_speed_6 = {retraction_prime_speed, 6}
	; retraction_prime_speed_7 = {retraction_prime_speed, 7}
	; retraction_retract_speed_0 = {retraction_retract_speed, 0}
	; retraction_retract_speed_1 = {retraction_retract_speed, 1}
	; retraction_retract_speed_2 = {retraction_retract_speed, 2}
	; retraction_retract_speed_3 = {retraction_retract_speed, 3}
	; retraction_retract_speed_4 = {retraction_retract_speed, 4}
	; retraction_retract_speed_5 = {retraction_retract_speed, 5}
	; retraction_retract_speed_6 = {retraction_retract_speed, 6}
	; retraction_retract_speed_7 = {retraction_retract_speed, 7}
	; retraction_speed_0 = {retraction_speed, 0}
	; retraction_speed_1 = {retraction_speed, 1}
	; retraction_speed_2 = {retraction_speed, 2}
	; retraction_speed_3 = {retraction_speed, 3}
	; retraction_speed_4 = {retraction_speed, 4}
	; retraction_speed_5 = {retraction_speed, 5}
	; retraction_speed_6 = {retraction_speed, 6}
	; retraction_speed_7 = {retraction_speed, 7}
	; retraction_enable_0 = {retraction_enable, 0}
	; retraction_enable_1 = {retraction_enable, 1}
	; retraction_enable_2 = {retraction_enable, 2}
	; retraction_enable_3 = {retraction_enable, 3}
	; retraction_enable_4 = {retraction_enable, 4}
	; retraction_enable_5 = {retraction_enable, 5}
	; retraction_enable_6 = {retraction_enable, 6}
	; retraction_enable_7 = {retraction_enable, 7}
	; speed_travel_0 = {speed_travel, 0}
	; speed_travel_1 = {speed_travel, 1}
	; speed_travel_2 = {speed_travel, 2}
	; speed_travel_3 = {speed_travel, 3}
	; speed_travel_4 = {speed_travel, 4}
	; speed_travel_5 = {speed_travel, 5}
	; speed_travel_6 = {speed_travel, 6}
	; speed_travel_7 = {speed_travel, 7}
	G28 R5 ; Autohome if unknown
	M140 S{material_bed_temperature_layer_0} ; start preheating the bed
	;G29 ; Bed leveling
	M420 S ; Re-enable Bed Mesh

	;Not yet supported:
	;M207 F{retraction_speed} S{retraction_amount} ; Set FW Retraction

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
	G92 E0 ; Set Extruder Position
	G90 ; Absolute
	G10 ; Retract
	
	; Wait for ooze
	G4 S3 ; Wait 2 seconds

	G0 X5 F500 ; Wipe
	G0 X-5 F4000 ; Wipe
	G0 X5 F500 ; Wipe
	G0 X-5 F4000 ; Wipe
	M211 S1 ; Enable SoftStops
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
 