%include "asm_io.inc"
segment     .data
            prompt1   db "Usted ingreso a = ", '0'
            prompt2   db "   b = ", '0'
            prompt3   db "   c = ", '0'
            prompt4   db "   d = ", '0'
            nonewline db "  ", '0'

segment     .text
            global    calc_det

calc_det:
            enter 4, 0   ;es todo lo que necesite
            pusha        ;aca lo quise hacer pusheando solo ebx
                         ;que fue lo que cambie. Pero no me funcionaba

; imprimimos los prompt y los valores de cada argumento en la pila
            mov   eax, prompt1
            call  print_string
            mov   eax, [ebp+8]
            call  print_int

            mov   eax, prompt2
            call  print_string
            mov   eax, [ebp+12]
            call  print_int
            
            mov   eax, prompt3
            call  print_string
            mov   eax, [ebp+16]
            call  print_int

            mov   eax, prompt4
            call  print_string
            mov   eax, [ebp+20]
            call  print_int

            mov   eax, nonewline
            call  print_string

            dump_stack 1, 2, 5

; Llamo a la funcion que realiza el calculo
            call   do_calc

: Terminar el programa
            popa
            leave
            ret

do_calc:
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

            ret