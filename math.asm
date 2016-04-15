%include "asm_io.inc"


segment .data                   ; Cadenas de salida
  prompt db "Digite un numero: ", 0
  square_msg db "La entrada al cuadrados ", 0
  cube_msg db "La entrada al cubo ", 0
  cube25_msg db "Laa entrada al cubo 25 veces es ", 0
  quot_msg db "El cociente del cubo/100 es ", 0
  rem_msg db "El residuo del cube/100 es ", 0
  neg_msg db "La negacion del residuo es ", 0


segment .bss
  input resd 1

segment .text
  global asm_main
asm_main:
  enter 0,0                     ; Rutina de inicio
  pusha

  mov eax,prompt
  call print_string

  call read_int
  mov [input],eax

  imul eax                      ; edx:eax = eax * eax
  mov ebx,eax                   ; Guarda la respuesta en ebx
  mov eax,square_msg
  call print_string
  mov eax, ebx
  call print_int
  call print_nl

  mov ebx,eax
  imul ebx,[input]              ; ebx *= [input]
  mov eax, cube_msg
  call print_string
  mov eax, ebx
  call print_int
  call print_nl

  imul ecx,ebx,25               ; ecx = ebx*25
  mov eax,cube25_msg
  call print_string
  mov eax,ecx
  call print_int
  call print_nl

  mov eax,ebx
  cdq                           ; Inicia edx con la extension de signo
  mov ecx,100                   ; No puede dividirse por el valor inmediato
  idiv ecx                      ; edx = eax/ ecx
  mov ecx,eax                  ; Guarda el cociente ecx
  mov eax,quot_msg
  call print_string
  mov eax,ecx
  call print_int
  call print_nl
  mov eax,rem_msg
  call print_string
  mov eax,edx
  call print_int
  call print_nl

  neg edx                       ; Niega el residuo
  mov eax,neg_msg
  call print_string
  mov eax,edx
  call print_int
  call print_nl

  popa
  mov eax,0                     ;retorna a C
  leave
  ret







