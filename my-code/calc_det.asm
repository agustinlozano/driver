%include "asm_io.inc"

segment     .text
            global      calc_det

calc_det:
      enter       4, 0
      pusha

      dump_stack  1, 3, 5

;           STACK
;      +20  BF9CA5-EC    0x00000006
;      +16  BF9CA5-E8    0x00000005
;      +12  BF9CA5-E4    0x00000004
;      +8   BF9CA5-E0    0x00000003
;      +4   BF9CA5-DC    BASURA
;      +0   BF9CA5-D8    0xBF9CA618
;      -4   BF9CA5-D4    0x00000000
;      -8   BF9CA5-D0    .
;      -12  BF9CA5-CC    .


;   EAX = a
      mov        dword eax, [ebp+8]
;   EAX = EAX * c;
      imul       eax, [ebp+16]
;   guardar en la pila el resultado
      mov        [ebp-4], eax
;   EAX = d * d;
      mov        dword eax, [ebp+20]
      mul        eax, eax
;   EAX = EAX * b;
      imul       eax, [ebp+12]
;   ahora queda hacer la resta entre productos
      sub        eax, [ebp-4]


;   retornar
      popa
      leave
      ret
