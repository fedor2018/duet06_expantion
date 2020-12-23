; Configuration file for Duet 0.6 (firmware version 1.17 to 1.19)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool on Wed Jun 06 2018 10:49:18 GMT+0300
M111 S1                         ; Debug off
; General preferences
G90                            ; Send absolute coordinates...
M83                            ; ...but relative extruder moves
M555 P1                        ; Set firmware compatibility to look like RepRapFirmare

M667 S1                        ; Select CoreXY mode

; Network
M550 PCoreXY                   ; Set machine name
M552 P0.0.0.0 S1               ; Enable network and acquire dynamic address via DHCP
M586 P0 S1                     ; Enable HTTP
M586 P1 S1                     ; Enable FTP
;M586 P2 S1                     ; Enable Telnet

; Drives
M569 P0 S1                     ; Drive 0 goes forwards 
M569 P1 S1                     ; Drive 1 goes forwards 
M569 P2 S0                     ; Drive 2 goes forwards 
M569 P3 S1                     ; Drive 3 goes forwards 
M569 P4 S1                     ; Drive 3 goes forwards 
M569 P5 S1                     ; Drive 3 goes forwards 
;
M584 X4 Y5 Z2 E3:0:1  ;remap drives
;;M92 X101 Y101 Z723 ; Set steps per mm
M92 X80 Y80 
M92 Z723 ; Set steps per mm
M92 E494:494:494        
M906 X1200 Y1200 Z1200 E1200 I30   ; Set motor currents (mA) and motor idle factor in per cent
;;
M566 X12000 Y12000 Z1800 E1200:1200:1200        ;jerk Set maximum instantaneous speed changes (mm/min)
M203 X12000 Y12000 Z1800 E1200:1200:1200    ; Set maximum speeds (mm/min)
;;
M201 X1000 Y1000 Z300 E600:600:600        ; Set accelerations (mm/s^2)
M84 S30                        ; Set idle timeout

; Axis Limits
M208 X-125 Y-80 Z0 S1  ; Set axis min
;;M208 X135 Y95 Z196.8 S0 ; Set axis max
M208 X125 Y80;
;;M208 Z232 S0 ;
M208 Z245 S0 ;

; Endstops
M574 X2 Y1 Z2 S1   

; Z-Probe
;;G31 X-24 Y-3 Z2 P500		; Set the zprobe height and threshold
G31 X8 Y35 Z1.1 P500		; Set the zprobe height and threshold
M376 H0 ;Set bed compensation taper
;;M210 Z500                  ; set Z probing speed
M557 X-100:100 Y-80:90 S16 ; Define mesh grid
;; bltouch - E4PWM
M558 P4 X0 Y0 Z1 H6 F100 T10000 ; set the Z-proble to mode 4
M307 H5 A-1 C-1 D-1 ; Release the heater pin to be used to control the BLTouch servo
M280 P5 S160 I1
G4 P450 ; wait 450ms for probe to reset
M280 P5 S90 I1
;;M574 Z1 S0; set the Z stop to Active High !! not ON

; Heaters
M305 P0 T100000 B4138 C0 R1000 ; Set thermistor + ADC parameters for heater 0
M143 H0 S120                   ; Set temperature limit for heater 0 to 120C
M305 P1 T100000 B4400 C0 R1000 ; Set thermistor + ADC parameters for heater 1
M143 H1 S280                   ; Set temperature limit for heater 1 to 280C
;;M305 P2 T100000 B4138 C0 R1000 ; Set thermistor + ADC parameters for heater 1
;;M143 H2 S280                   ; Set temperature limit for heater 1 to 280C
;;M305 P3 T100000 B4138 C0 R1000 ; Set thermistor + ADC parameters for heater 1
;;M143 H3 S280                   ; Set temperature limit for heater 1 to 280C
;; chamber
M141 H4
M305 P4 T100000 B4138 R1000 ; Set thermistor + ADC parameters for heater 3
;;M301 H4 P-1 ; bitbang
;;M307 H4 B1 ; use bang-bang control for the chamber heater
;;M143 H4 S80                   ; Set temperature limit for heater to 80C

; Fans
M106 P0 S120       ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off

; Tools
M563 P0 D0 H1 S"E3D"           ; Define tool 0
G10 P0 X0 Y0 Z0                ; Set tool 0 axis offsets
G10 P0 R0 S0                   ; Set initial tool 0 active and standby temperatures to 0C
;
; Custom settings are not configured
;;M564 S0 H0 ;axis limit off
M572 D0 S0.2 ;extruder pressure advance
M207 S1.5 F2400 Z0.075 ;set firmware retraction
M208 S1 Z-0.5 ;axis max travel
;; load overlay
M501
M375 ;; load map
M575 P1 B57600 S1 ;paneldue

T0