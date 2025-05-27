
movh 2 ;; r0 = 32 = 0010 0000
nop 
inc r1, 1  ; r1 = 1
nop

movl -4 ;; r0 = 44 == 0010 1100
nop 
inc r1, 1 ;; r1 = 2
inc r2, 1 ;; r2 = 1

st r2, r0 ;; #1 = 44 
nop 
add r3, r0 ;; r3 = 44
nop 

nop 
nop 
srr r3, r1 ;; r3 = 11
slr r2, r1 ;; r2 = 4

nop 
nop 
nop 
inc r1, -1 ;; r1 = 1 

ld r3, r1 ;; r3 = 44 
nop 
not r2, r2, ;; r2 = 0  
nop 

;; Não testa os jumps, nem o or, o resto testa 




