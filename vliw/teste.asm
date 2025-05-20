    xor r0, r0
    xor r1, r1
    xor r2, r2
    xor r3, r3
    addi 1 
    add r3, r0 ;; r3 = 1 
    addi -5 ;; r0 = -4 = 1100 
    movh 3 ;; r0 = 0011 1100 = 60
    add r1, r0 ;; r1 = 60 -> Inicio de R 
    movh 0 ;; r0 = 0000 1100 = 12 -> Contador
    brzi 4 ;; Se r0 == 0, então pular para fora do loop 
        st r2, r1 ;; R[r1] = 0
        add r1, r3 ;; r1 = r1 + 1 -> andar uma posição em R 
        sub r0, r3 ;; r0 = r0 - 1 -> decrementar contador 
    addi -4 ;; r0 = -4 = 1100
    movh 0 ;; r0 = 0000 1100 = 12 -> contador 
    brzi 5 
        st r2, r1 ;; A[r1] = r2 
        add r2, r3 ;; r2 = r2 + 1 -> aumentar valor 
        add r1, r3 ;; r1 = r1 + 1 -> andar uma posição em A 
        sub r0, r3 ;; r0 = r0 - 1 -> decrementar contador 
    slr r2, r3 ;; r2 = 0001 0110 = 22 
    addi 2 
    sub r2, r0 ;; r2 = 20 
    addi -6 ;; r0 = -4 = 1100
    movh 0 ;; r0 = 0000 1100 = 12 -> contador 
    brzi 5
        st r2, r1 ;; B[r1] = r2 
        add r2, r3 ;; r2 = r2 + 1 -> aumentar valor 
        add r1, r3 ;; r1 = r1 + 1 -> andar uma posição em B 
        sub r0, r3 ;; r0 = r0 - 1 -> decrementar contador 
    add r3, r2 ;; r3 = 32
    xor r2, r2 
    addi -4 ;; r0 = -4 = 1100
    movh 0 ;; r0 = 0000 1100 = 12 -> contador 
    add r3, r0 ;; r3 = 32 + 12 = 44
    add r2, r0 ;; r2 = 12
    xor r0, r0 
    addi 15 
    st r3, r0 ;; #255 = 44
    addi -1 
    st r2, r0 ;; #254 = 12 
    nop 
    xor r0, r0 
        ld r2, r1 ;; r2 = val.B 
        addi -4 ;; r0 = 1100
        movl 0 ;; r0 = 0000 1100 = 12 
        sub r1, r0 ;; Chegar em A 
        ld r3, r1 ;; r3 = val.A 
        add r2, r3 ;; r2 = val.A + val.B 
        sub r1, r0 ;; Chegar em R 
        st r2, r1 ;; Guardar em R 
        add r1, r0 
        add r1, r0 ;; Retornar para B 
        xor r0, r0 
        addi 1 
        sub r1, r0 ;; Menos uma posição de B 
        xor r3, r3
        add r3, r0 ;; r3 = 1 
        addi 13 ;; r0 = #254 
        ld r2, r0 ;; r2 = contador 
        sub r2, r3 ;; r2 = r1 - 1 
        st r2, r0 ;; Atualizar contador 
        addi 1 ;; r0 = #255
        ld r3, r0 ;; r3 = valor de retorno 
        not r2, r2
    brzr r2, r3 
xor r0, r0
brzi 0 ;; halt 