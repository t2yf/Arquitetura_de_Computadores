;; Nessa versão o R não será inicializado com zeros 

;; Memória
    ;; addi 15 | #255 = 10 | Contador soma 
    ;; addi 14 | #254 = r3 | Salto brzr 
    ;; addi 13 | #253 = jr | Retorno 

;; Registradores 
    ;; r0 = puxar valores da memória, auxiliar
    ;; r1 = ponteiro para os vetores 
    ;; r2 = contador, armazenar valores dos vetores 
    ;; r3 = salto brzr ou jr 

;; Forçar valor zero nos Registradores
    xor r0, r0
    xor r1, r1
    xor r2, r2
    xor r3, r3

;; Armazenar valores em memória e Calcular ponteiro r1
    addi 5
    multi 2 
    add r3, r0 ;; r3 = 10 
    multi 2 
    add r2, r0 ;; r2 = 20
    dec r2 ;; r2 = 19 
    multi 7 ;; r0 = 140
    add r1, r0 ;; r1 = 140
    dec r1 ;; r1 = 139 | final de B 
    xor r0, r0 
    addi 15 
    st r3, r0 ;; #255 = 10 

;; Calcular salto jr
    xor r0, r0 
    addi 6
    multi 4 ;; 24
    addi -1 ;; 23 
    add r3, r0 ;; r3 = 33
    xor r0, r0 
    addi 13
    st r3, r0 ;; #253 = 33 

;; Calcular salto r3 brzr
    xor r0, r0  
    addi 3
    multi 6 
    add r3, r0 ;; r3 = 50
    xor r0, r0 
    addi 14
    st r3, r0 ;; #254 = 50
    xor r0, r0 ;; retorno jr 
    addi 14
    ld r3, r0 ;;  #254 = 50

    xor r0, r0  
        st r2, r1 ;; B[r1] = r2 
        addi 5
        multi 2 ;; r0 = 10
        sub r1, r0 ;; r1 - 10
        dec r2 ;; r2 = r2 -1 | Número par
        st r2, r1 ;; A[r1] = r2
    brzr r2, r3 ;; Loop sai aqui, quando o último par aparece A = r2 = 0 -> r0 = 10
        dec r2 ;; r2 = r2 -1 | Número ímpar 
        add r1, r0 ;; Retornar para B 
        dec r1  ;; Decrementar uma posição
        xor r0, r0 ;; limpar r0 
        addi 13
        ld r3, r0 ;; r3 = 33
    jr r3
    addi -5 ;; r0 = 10 -5 = 7 || r3 = 50 +7 = 57
    add r3, r0 ;; r3 = 57
    xor r0, r0
    addi 14
    st r3, r0 ;; #254 = 57
    xor r0, r0 ;;retorno brzr
        ld r2, r1 ;; r2 = val.A
        addi 5
        multi 2 ;; r0 = 10 
        add r1, r0 ;; Ir para B 
        ld r3, r1 ;; r3 = val.B
        add r2, r3 ;; r2 = val.A + val.B 
        add r1, r0 ;; Ir para R 
        st r2, r1 ;; Guardar em R 
        multi 2 ;; r0 = 20 
        addi -1 ;; r0 = 19 
        sub r1, r0 ;; Ir para A somado em 1 pos 
        xor r0, r0 
        addi 14
        ld r3, r0 ;; r3 = #254 
        addi 1 ;; #255
        ld r2, r0 ;; r2 = contador 
        dec r2 ;; decrementa r2 
        st r2, r0 ;; guarda iterador 
        not r2, r2 
    brzr r2, r3
ji 0 ;; halt 
