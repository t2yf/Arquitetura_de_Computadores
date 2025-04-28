    add r0, r0;; nop
    xor r0, r0
    xor r1, r1
    xor r2, r2
    xor r3, r3
    addi 5
    ebreak ;; multi  
    add r3, r0 ;; r3 = 10 
    ebreak ;; multi  
    add r2, r0 ;; r2 = 20
    ebreak ;; dec r2 ;; r2 = 19 
    ebreak ;; multi  ;; r0 = 140
    add r1, r0 ;; r1 = 140
    ebreak ;; dec r1 ;; r1 = 139 | final de B 
    xor r0, r0 
    addi 15 
    st r3, r0 ;; #255 = 10 
    xor r0, r0 
    addi 5
    ebreak ;; multi  
    add r3, r0 ;; r3 = 45
    xor r0, r0 
    addi 13
    st r3, r0 ;; #253 = 45
    xor r0, r0  
    addi 3
    ebreak ;; multi  
    sub r3, r0 ;; r3 = 27
    xor r0, r0 
    addi 14
    st r3, r0 ;; #254 = 27
    xor r0, r0 ;;lin27
    addi 14
    ld r3, r0 ;;  #254 = r3
    xor r0, r0
    brzr r2, r3
        st r2, r1 ;; B[r1] = r2 
        addi 5
        ebreak ;; multi  ;; r0 = 10
        sub r1, r0 ;; r1 - 10
        ebreak ;; dec r2 ;; r2 = r2 -1 | Número par
        st r2, r1 ;; A[r1] = r2
        ebreak ;; dec r2 ;; r2 = r2 -1 | Número ímpar
        add r1, r0 ;; Retornar para B 
        ebreak ;; dec r1  ;; ebreak ;; decrementar uma posição
        xor r0, r0 ;; limpar r0 
        addi 13
        ld r3, r0 ;; r3 = #253
    ebreak ;; jr r3
    addi 5
    add r3, r0 ;; r3 = 50
    xor r0, r0
    addi 14
    ld r3, r0 ;; #254 = 50
    xor r0, r0
        ld r2, r1 ;; r2 = val.A
        addi 5
        ebreak ;; multi  ;; r0 = 10 
        add r1, r0 ;; Ir para B 
        ld r3, r1 ;; r3 = val.B
        add r2, r3 ;; r2 = val.A + val.B 
        add r1, r0 ;; Ir para R 
        st r2, r1 ;; Guardar em R 
        ebreak ;; multi  ;; r0 = 20 
        addi -1 ;; r0 = 19 
        sub r1, r0 ;; Ir para A somado em 1 pos 
        xor r0, r0 
        addi 14
        ld r3, r0 ;; r3 = #254 
        addi 15
        ld r2, r0 ;; r2 = contador 
        ebreak ;; dec r2 ;; ebreak ;; decrementa r2 
        st r2, r0 ;; guarda iterador 
        not r2, r2 
    brzr r2, r3
ji 0 ;; halt