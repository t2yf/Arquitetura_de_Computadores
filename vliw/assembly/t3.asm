;; Informações 
    ;; É uma Arquitetura Harvard, ou seja, a memória de dados é separada da de instruções
    ;; Instrução VLIW: ld/st/mv || branch/jump || ula || ula 
    ;; Memória: [0, 1]
        ;; #0 = contador 
        ;; #1 = salto
    ;; Vetores: B[2-13] A[14-25] R[26-37] 

;; Inicializar R 
    ;; Colocar salto no #1 
    movh 1
    nop 
    nop 
    nop 

    movl 9 ;; r0 = 0001 1001 = 25
    nop
    inc r1, 1  ;; r1 = 1 
    nop 

    st r0, r1 ;; #1 = 25 (salto do brzr)
    nop
    nop
    nop 

    ;; r1 = valor fim de R  
    movh 2 ;; r0 = 0010 0000  
    nop 
    sub r1, r1 ;; r1 = 0
    nop 

    movl 5 ;; r0 = 0010 0101 = 37  
    nop 
    nop 
    nop 

    nop
    nop 
    add r1, r0 ;; r1 = 37 
    nop 

    ;; r0 = 12 -> contador 
    movh 0 
    nop
    nop 
    nop

    movl 12 ;; r0 = 0000 1100 = 12 
    nop 
    nop
    nop 

    ;; Armazenar contador em #0
    st r2, r0 ;; #0 = 12 (contador)
    nop 
    nop 
    nop 

    ;;loop 
        nop 
        brzi 3 
        nop 
        nop

        st r2, r1 ;; R[r1] = 0
        nop
        nop
        inc r0, -1 ;; Diminui contador 

        nop 
        ji -2
        inc r1, -1 ;; Diminui ponteiro 
        nop 
     
    ;; fim loop 
        ;; r0 = r2 = r3 = 0 | r1 = 25 (fim de A )

;; Inicializar A e B 
    ;; r2 = ultimo valor de B + 1
    movh 2  ;;r0 = 0010 0000 = 32
    nop 
    nop 
    nop 

    nop 
    nop 
    add r2, r0 ;; r2 = 32 
    nop 

    ;; r3 = última pos de B + 1
    movh 0 ;; r0 = 0000 0000
    nop 
    nop 
    nop 

    movl 15 ;; r0 = 0000 1111 = 15
    nop 
    nop 
    nop 

    nop 
    nop
    add r3, r0 ;; r3 = 15
    nop 

    ;; r0 = ultimo valor de A 
    movl 11 ;; r0 = 0000 1011 = 11 
    nop
    nop
    nop

    ;; r0 = 11 | r1 = 25 | r2 = 32 | r3 = 15

    ;; loop 
        nop 
        brzi 4 
        nop 
        nop 

        st r0, r1 ;; A[r1] = r0 
        nop 
        inc r2, -1 
        inc r3, -1 
 
        st r2, r3 ;; B[r3] = r2 
        nop 
        inc r0, -1 
        inc r1, -1 
      
        nop 
        ji -3 
        nop 
        nop 
    ;; fim loop 

    ;; Colocar primeira pos de B >> #3 = 20 e primeira pos de A #14 = 0
    st r0, r1
    nop
    inc r2, -1 
    inc r3, -1 

    ;;20 
    st r2, r3 
    nop 
    nop 
    nop 

    ;; r0 = 0 | r1 = 14 | r2 = 20 | r3 = 3
    ;; r1 e r3 são ponteiros 
;; Soma 
    nop 
    nop 
    inc r1, -1 ;; r1 = 13 -> ajuste 
    nop 

    ;; loop
        ld r2, r3 ;; r2 = B[r3] 
        nop 
        sub r0, r0 
        inc r1, 1 ;; andar pos em A 

        ld r0, r1 ;; r0 = A[r1]
        nop 
        nop 
        inc r3, 1 ;; andar pos em B 

        nop 
        nop 
        add r2, r0 ;; r2 = val.A + val.B 
        nop 

        ;; Os bits mais significativos de r0 nunca serão diferentes de 0000, já que os valores do vetor A vão de 0 -> 11 

        movl -4 ;; r0 = 0000 1100 = 12 
        nop 
        nop 
        nop 

        nop
        nop 
        add r1, r0 ;; Ir para R 
        nop 

        st r2, r1 ;; Guardar soma  em R 
        nop 
        nop
        nop
        
        nop 
        nop 
        sub r1, r0 ;; Retornar para A 
        nop

        ;; Pegar contador e valor brzr 

        movl 0 ;; r0 = 0000 0000 
        nop
        nop
        nop 

        ld r2, r0 ;; r2 = contador 
        nop 
        nop 
        nop 

        nop 
        nop
        inc r2, -1 ;; contador-- 
        nop 

        st r2, r0 ;; armazena contador 
        nop 
        nop 
        nop 

        movl 1 ;; r0 = 0000 0001
        nop 
        nop 
        nop 

        ld r2, r0 ;; r2 = val.salto 
        nop 
        nop 
        nop 

        movl 0 ;; r0 = 0000 0000 
        nop 
        nop 
        nop 

        ld r0, r0 ;; r0 = contador 
        nop
        nop 
        nop 

        nop 
        nop 
        not r0, r0 ;; 
        nop 

        nop 
        brzr r0, r2 
        nop 
        nop 

    ;; fim loop
nop
ji 0 ;; halt 
nop 
nop