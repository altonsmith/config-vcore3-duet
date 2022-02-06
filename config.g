; General preferences
G90                                     ; send absolute coordinates...
M83                                     ; ...but relative extruder moves
M550 P"V-Core 3"                        ; set printer name
M669 K1                                 ; CoreXY
G29 S1                                  ; Set Units to Millimeters

; Network
M552 P0.0.0.0 S1                        ; enable network and acquire dynamic address via DHCP
M586 P0 S1                              ; enable HTTP
M586 P1 S0                              ; disable FTP
M586 P2 S0                              ; disable Telnet

; Drives
M569 P0.0 S0 D3                         ; physical drive 0.0 goes forwards
M569 P0.1 S0 D3                         ; physical drive 0.1 goes forwards
M569 P0.2 S0 D3                         ; physical drive 0.2 goes forwards
M569 P0.3 S1 D3                         ; physical drive 0.3 goes forwards
M569 P0.4 S1 D3                         ; physical drive 0.4 goes forwards
M569 P0.5 S1 D3                         ; physical drive 0.5 goes forwards
M584 X0.4 Y0.3 Z0.0:0.1:0.2 E0.5        ; set drive mapping
M350 X16 Y16 Z16 E16 I1                 ; configure microstepping with interpolation

M92 X80.00 Y80.00 Z800.00               ; set steps per mm
M906 X1000 Y1000 Z800 I30               ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                 ; Set idle timeout

M566 X400.00 Y400.00 Z6.00 E120.00 P1          ; set maximum instantaneous speed changes (mm/min)
M203 X10800.00 Y10800.00 Z1000.00 E3600.00     ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 E3600.00        ; set accelerations (mm/s^2)

; Axis Limits
M208 X0 Y0 Z0 S1                               ; set axis minima
M208 X400 Y395 Z400 S0                         ; set axis maxima

; Endstops
M574 X1 S1 P"io2.in"                           ; configure active high endstops
M574 Y2 S1 P"io1.in"                           ; configure active high endstops

M671 X-4.5:200:404.5 Y-4.52:405:-4.52 S5       ; define positions of Z leadscrews or bed levelling screws
M557 X0:360 Y0:360 P8                        ; define 8x8 mesh grid

; Bed Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed"    ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out1" T0                                     ; create bed heater output on out5 and map it to sensor 0
M307 H0 B0 S1.00                                       ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                ; map heated bed to heater 0
M143 H0 S110                                           ; set temperature limit for heater 0 to 110C

;; Run Bed PID Tune!! M303 H0 S100
M307 H0 B0 R0.901 C238.8 D1.28 S1.00 V24.2

; Fans
M950 F0 C"out7" Q500                   ; create fan 0 on pin out7 and set its frequency
M106 P0 C"Hotend Fan" S0 H1 T45 L255   ; set fan 0 name and value. Thermostatic control turned on for Hotend
M950 F1 C"out4" Q500                   ; create fan 1 on pin out4 and set its frequency
M106 P1 C"Layer Fan" S0 H-1 L255       ; set fan 1 name and value. Thermostatic control is turned off

; Tools (Print Head)

M308 S1 P"temp1" Y"PT1000"  A"Hotend"  

M563 P0 D0 H1 F1           ; define tool 0
G10 P0 X0 Y0 Z0            ; set tool 0 axis offsets
G10 P0 R0 S0               ; set initial tool 0 active and standby temperatures to 0C

; Hot End Heater 
M950 H1 C"out2" T1         ; create nozzle heater output on out2 and map it to sensor 1
M307 H1 B0 S1.00           ; disable bang-bang mode for heater and set PWM limit
M143 H1 S300               ; set the maximum temperature in C for heater

; EVA 2 / BMG / E3D V6

M92 E830          ; set extruder steps per mm, 0.9 angle/step (LDO Pancake)
M906 E800         ; set extruder motor current (mA) and idle factor in per cent

;; Run Heater PID Tune!! M303 H1 S285
M307 H0 B0 R0.901 C238.8 D1.28 S1.00 V24.2

; Z-Probe
;; Inductive Probe
; M558 P5 C"!io3.in" H5 F400 T5000       ; set Z probe type to unmodulated and the dive height + speeds
; G31 P500 X-30 Y-15 Z0.20               ; set Z probe trigger value, offset and trigger height, more Z means closer to the bed
;; BLTouch
M950 S0 C"io7.out"                     ; Create a servo pin on io7
M558 P9 C"io7.in" H5 F240 T10800 A5    ; set Z probe type to unmodulated and the dive height + speeds
G31 P25 X-28.00 Y-13.00 Z3.06          ; set Z probe trigger value, offset and trigger height, more Z means closer to the bed

T0

; Pressure Advance
M572 D0 S0.10
