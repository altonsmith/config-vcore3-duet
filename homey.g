M201 X500.00 Y500.00    ; Reduce acceleration for homing moves

G91                     ; Relative positioning
G1 H2 Z3 F3000          ; Lift Z relative to current position

G1 H1 Y605 F3600        ; Move quickly to Y endstop and stop there (first pass)
G1 H2 Y-2 F600          ; Go back a few mm
G1 H1 Y5 F360         ; Move slowly to Y endstop once more (second pass)

M201 X6000 Y6000        ; Return to full acceleration

G1 H2 Z-3 F3000         ; Lower Z relative to current position
G90                     ; Absolute positioning
