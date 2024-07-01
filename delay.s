    .section    .text, code
    .global     _delay_ms

_delay_ms:
    ; Input: W0 contains the delay in milliseconds
    ; Each millisecond requires approximately 7500 cycles
    ; Outer loop counter
    mov     W0, W1          ; Copy delay value to W1
outer_loop:
    ; Inner loop counter
    mov     #1000, W2       ; Set inner loop counter to 1000
inner_loop:
    dec     W2, W2          ; Decrement inner loop counter
    bra     nz, inner_loop  ; Repeat until W2 is zero
    dec     W1, W1          ; Decrement outer loop counter
    bra     nz, outer_loop  ; Repeat until W1 is zero
    return                  ; Return from subroutine



