.device ATmega328P
.cseg
.org 0x0000
.EQU PIN ENTRADA=2
.EQU PIN SALIDA=4

main :
      LDI R16 , HIGH(RAMEND)
      OUT SPH, R16
      LDI R16 , LOW(RAMEND)
      OUT SPL , R16
      s b i DDRB, PIN SALIDA
      LDI R17 , 0XFF
      OUT PORTD, R17
      
CHEQUEAR APAGADO:
      sbis PIND , PIN ENTRADA
      call APAGAR LED
      rjmp CHEQUEAR ENCENDIDO

CHEQUEAR ENCENDIDO:
      sbic PIND , PIN ENTRADA
      call ENCENDER LED
      rjmp CHEQUEAR APAGADO

ENCENDER LED:
      sbi PORTB, PIN SALIDA
      ret

APAGAR LED:
      cbi PORTB, PIN SALIDA
      ret
