%include "asm_io.inc"

segment     .text
            global    calc_det

calc_det:
            enter 4, 0   ;es todo lo que necesite
            pusha        ;aca lo quise hacer pusheando solo ebx
                         ;que fue lo que cambie. Pero no me funcionaba

            dump_stack 1, 2, 5

            mov   dword eax, [ebp+8]
            imul  eax, [ebp+16]
            mov   [ebp-4], eax

            dump_stack 2, 2, 0

            mov    dword eax, [ebp+20]
            imul   eax, [ebp+20]
            imul   eax, [ebp+12]
            mov    ebx, [ebp-4]
            sub    ebx, eax

            mov    [ebp-8], ebx
            dump_stack 3, 2, 0

            popa
            leave
            ret
