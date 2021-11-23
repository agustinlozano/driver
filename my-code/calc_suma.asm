%include "asm_io.inc"

segment     .text
            global      calc_det

calc_det:
            enter       4, 0
            push        ebx

            dump_stack  1, 4, 4
