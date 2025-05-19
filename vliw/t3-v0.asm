;; Somar dois vetores de 12 posições A+B, logo após a memória
;; Inicializar A, B e R

;; Informações 
    ;; Ordem dos vetores: A[] - B[] - R[]


;; Registradores 
    ;; r0 = puxar valores da memória, auxiliar
    ;; r1 = ponteiro para os vetores 
    ;; r2 = contador, armazenar valores dos vetores 
    ;; r3 = salto brzr ou jr 

;;Zerar os registradores
    xor r0, r0
    xor r1, r1
    xor r2, r2
    xor r3, r3

;; Armazenar valores em memória e Calcular ponteiro r1  (fim de R)
    ;; Armazenar 31 em #255 (??)
    ;; Armazenar 12 em #254

;; Inicializa R 
    ;; TODO Setar valor de r1 para onde é o vetor R 
    ;; Considerando que r2 = 0 | r3 = 1 | r0 = 12


    brzi 4 ;; Se r0 == 0, então pular para fora do loop 
        st r2, r1 ;; R[r1] = 0
        sub r1, r3 ;; r1 = r1 - 1 -> andar uma posição em R 
        sub r0, r3 ;; r0 = r0 - 1 -> decrementar contador 


    ;; Fim do loop: r0 = 0 | r2 = 0 | r3 = 1 | r1 = "TODO (fim de B)" 

;; r2 = 31 

;; Inicializar B 
    ;; Considerando r0 = 12 | r3 = 1 | r2 = #255 = 31


    brzi 5
    sub r1, r3 ;; r1 = r1 - 1 -> andar uma posição em B 
    st r2, r1 ;; B[r1] = r2 
    sub r2, r3 ;; r2 = r2 - 1 -> decrementar valor 
    sub r0, r3 ;; r0 = r0 - 1 -> decrementar contador
    

    ;; Fim do loop: r0 = 0 | r2 = 19 | r3 = 1 | r1 = "TODO (fim de A)" 


;; Inicializar A 
    ;;Considerando r0 = 0 | r3 = 1 | r2 = 19

    addi 2
    slr 3 ;; r0 = 8
    sub r2, r0 ;; r2 = 11 
    addi 4 ;; r0 = 12

    brzi 5
    sub r1, r3 ;; r1 = r1 - 1 -> andar uma posição em B 
    st r2, r1 ;; A[r1] = r2 
    sub r2, r3 ;; r2 = r2 - 1 -> decrementar valor 
    sub r0, r3 ;; r0 = r0 - 1 -> decrementar contador

    ;; Fim do loop: r0 = 0 | r2 = 0 | r3 = 1 | r1 = "TODO (inicio de A)" 

;; Soma 
    ;; Calcular valor de brzr e colocar em #255
    xor r0, r0 
        ld r2, r1 ;; r2 = val.A 

        addi -4 ;; r0 = 1100 
        movl 0 ;; r0 = 0000 1100 = 12 

        add r1, r0 ;; Chegar em B 
        ld r3, r1 ;; r3 = val.B 
        add r2, r3 ;; r2 = val.A + val.B 

        add r1, r0 ;; Chegar em R 
        st r2, r1 ;; R[r1] = soma 

        ;;Catar o valor de retorno e retornar para A + 1

    

    
