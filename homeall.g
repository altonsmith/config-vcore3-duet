M201 X500.00 Y500.00    ; Reduce acceleration for homing moves

; BLTouch
M280 P0 S160           ; Precautionary alarm release
M280 P0 S90            ; Ensure the pin is raised

G91                     ; Relative positioning
G1 H2 Z3 F6000          ; Lift Z relative to current position
G1 H1 X-625 Y605 F3600  ; Move quickly to X and Y axis endstops and stop there (first pass)
G1 H1 X-625 F1800       ; Move quickly to X and Y axis endstops and stop there (first pass)
G1 H1 Y605 F1800        ; Move quickly to X and Y axis endstops and stop there (first pass)

G1 H2 X1 Y-1 F600       ; Go back a few mm

G1 H1 X-6 Y6 F350   ; Move slowly to X and Y axis endstops once more (second pass)
G1 H1 X-6 F350        ; Move slowly to X and Y axis endstops once more (second pass)
G1 H1 Y6 F350         ; Move slowly to X and Y axis endstops once more (second pass)

M201 X3000 Y3000        ; Return to full acceleration

G90                     ; Absolute positioning
G1 X200 Y200 F10000    ; Go to the center of the bed (400x400)
G30                     ; Home Z by probing the bed

