;; v0.0 Inicializações separadas

;; Informações 
    ;; É uma Arquitetura Harvard, ou seja, a memória de dados é separada da de instruções
    ;; Instrução VLIW: ld/st/mv || branch/jump || ula || ula 
    ;; Memória: [35 - ]
        ;; #0 = contador 
        ;; #1 = salto 
    ;; Vetores: R [2-13] A[14-25] B[26-37]
    

;; 
    movh 2 ;; r0 = 0010 0000
    nop 
    nop
    nop

    nop 
    nop 
    add r2, r0 ;; r2 = 0010 0000 = 32
    nop 

    movl 6 ;; r0 = 0010 0110 
    nop
    nop 
    nop 

    nop 
    nop
    add r3, r0 ;; r3 = 0010 0101 = 38
    nop  

    movh 1 
    nop 
    nop 
    nop 

    movl -7 ;; r0 = 0001 1001
    nop
    nop
    nop 

    nop
    nop
    add r1, r0 ;; r1 = 0001 1001 = 25 
    nop 

    movh 0 
    nop 
    nop 
    nop

    movl -5 ;; r0 = 0000 1011 = 11 
    nop 
    nop 
    nop 

;; Inicializar A e B 
    ;; r0 = 11 || r1 = 25 || r2 = 32 || r3 = 38
    nop 
    brzi 3
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

    ;; r0 = 0 
;; TODO ver se precisa inicializar pos 1 de B a parte 
;; TODO r2 = 0 ; r0 = 12 ; r1 = 14

;; Inicializar R 
    ;; Dividir na metade 
    nop
    bzri 3
    nop
    nop

    st r2, r1 ;; R[r1] = 0 
    nop 
    nop
    inc r0, -1 ;; Diminui contador 

    nop
    ji -2
    inc r1, -1 ;; Diminui valor 
    nop 

;; Soma
    



