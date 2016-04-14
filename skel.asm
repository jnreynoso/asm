%include "asn_io.inc"

segment .data
  ;;
  ;; Los datos iniciados se colocan en el segmento de datos aca
  ;;
segment .bss
  ;;
  ;; Datos no iniciados se colocan en el segmento bss
  ;;
segment .text
  global asm_main
asm_main:
  enter 0,0                     ; Rutina de
  pusha

;;
;; El codigo esta colocado en el segmento de texto. No modifique el
;; codigo antes o despues de este comentario
;;
  popa
  mov eax,0                     ; Retorna a C
  leave
  ret


