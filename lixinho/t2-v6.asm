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
    addi 5
    multi 7 
    add r3, r0 ;; r3 = 45
    xor r0, r0 
    addi 13
    st r3, r0 ;; #253 = 45

;; Calcular salto r3 brzr
    xor r0, r0  
    addi 3
    multi 6 
    sub r3, r0 ;; r3 = 27
    xor r0, r0 
    addi 14
    st r3, r0 ;; #254 = 27

;; Puxar valor de r3 para brzr 
    xor r0, r0 ;;lin27
    addi 14
    ld r3, r0 ;;  #254 = r3
    xor r0, r0

;; Inicializar A e B 
    brzr r2, r3
        ;; Guardar valor em B 
        st r2, r1 ;; B[r1] = r2 

        ;; Ir para A 
        addi 5
        multi 2 ;; r0 = 10
        sub r1, r0 ;; r1 - 10

        ;; Atualizar valor de r2 e escrever em A 
        dec r2 ;; r2 = r2 -1 | Número par
        st r2, r1 ;; A[r1] = r2

        ;; Atualizar valor de r2 para escrever em B 
        dec r2 ;; r2 = r2 -1 | Número ímpar

        ;;Retornar ao vetor B 
        add r1, r0 ;; Retornar para B 
        dec r1  ;; Decrementar uma posição

        ;; Carregar valor de salto
        xor r0, r0 ;; limpar r0 
        addi 13
        ld r3, r0 ;; r3 = #253
    jr r3
;; lin45
;; Fim de loop: r0 = 0; r2 = 0; r3 = pos; r1 = 120 (início de A)

;; Calcular novo salto de r3 para brzr
    addi 5
    add r3, r0 ;; r3 = 50
    xor r0, r0
    addi 14
    ld r3, r0 ;; #254 = 50
    xor r0, r0
;; Soma 
        ;; Carregar valor de A 
        ld r2, r1 ;; r2 = val.A

        ;; Ir para B
        addi 5
        multi 2 ;; r0 = 10 
        add r1, r0 ;; Ir para B 

        ;; Carregar valor de B
        ld r3, r1 ;; r3 = val.B

        ;;Somar 
        add r2, r3 ;; r2 = val.A + val.B 
      

        ;;Ir para R 
        add r1, r0 ;; Ir para R 
        st r2, r1 ;; Guardar em R 

        ;; Voltar para A 
        multi 2 ;; r0 = 20 
        addi -1 ;; r0 = 19 
        sub r1, r0 ;; Ir para A somado em 1 pos 

        ;; Recuperar valor de r3 
        xor r0, r0 
        addi 14
        ld r3, r0 ;; r3 = #254 

        ;; Recuperar valor de r2 
        addi 15
        ld r2, r0 ;; r2 = contador 
        dec r2 ;; decrementa r2 
        st r2, r0 ;; guarda iterador 
        not r2, r2 
    brzr r2, r3
ji 0 ;; halt
