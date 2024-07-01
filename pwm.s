; File: pwm.s
    
.section    .text, code
.global	_init_pwm
.global _set_duty_cycle

; Constants
;.equ FCY, 10000000  ; 10 MHz Instruction Cycle Frequency
;.equ PWM_FREQ, 5000 ; 5 kHz PWM Frequency
;.equ PR2_VAL, FCY / (PWM_FREQ * 1) - 1 ; PR2 value for 5 kHz PWM

; Initialize PWM on RD0
    
_init_pwm:
    bclr    TRISD, #0
    ; Initialize Timer 3 for 5 kHz PWM
    ; Assuming Fosc = 30 MHz, Tcy = Fosc / 4 = 7.5 MHz
    ; PR3 = (Tcy * PWM Period) - 1
    ; PWM Period = 1 / 5000 = 200 us
    ; PR3 = (7.5 MHz * 200 us) - 1 = 1499

    ; Set Timer 3 period
    mov     #1499, W0
    mov     W0, PR3
    
        ; Set Timer 3 period
    mov     #1499, W0
    mov     W0, PR3

    ; Set Timer 3 prescaler to 1:1
    mov     #0x8000, W0
    mov     W0, T3CON

    ; Initialize Output Compare 1 for PWM mode
    ; Set initial duty cycle to 50%
    ; OC1RS = PR3 / 2 = 1499 / 2 = 750
    mov     #750, W0
    mov     W0, OC1RS

    ; Set OC1R to initial duty cycle value
    mov     #750, W0
    mov     W0, OC1R

    ; Configure OC1 for PWM mode with Timer 3 as time base
    mov     #0x0006, W0
    mov     W0, OC1CON

    ; Start Timer 3
    bset    T3CON, #15
    
    return
    
_set_duty_cycle:



    return

    return

