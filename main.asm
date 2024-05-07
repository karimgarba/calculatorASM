section .data
  title db 'x86_64 Calculator', 0xa
  titleLength equ $-title
  menu db 'What operation do you want to do: 1) Add 2) Subtract 3) Multiply 4) Divide', 0xa
  menuLength equ $-menu
  buffer db 255
  buffer_len equ $ - buffer

section .bss
  bytes_read resq 1

section .text
  global _start

_start:
  ; print title
  mov rax, 1
  mov rdi, 1
  mov rsi, title
  mov rdx, titleLength
  syscall
  
  ; print menu
  mov rax, 1
  mov rdi, 1 
  mov rsi, menu
  mov rdx, menuLength
  syscall

  call getOperation
  mov al, [buffer]
  cmp al, '1'
  je addNumbers
  cmp al, '2'
  je subtractNumbers
  cmp al, '3'
  je multiplyNumbers
  cmp al, '4'
  je divideNumbers



getOperation:
  mov rdi, 0
  mov rsi, buffer
  mov rdx, buffer_len
  mov radx, 0
  syscall

quit:
  mov rax, 60
  xor rdi, rdi
  syscall