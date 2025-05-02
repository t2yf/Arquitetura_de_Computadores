;; Declarar variáveis: Contador, Salto do brzr, Posição do vetor R
addi 7 
addi 2
add r2, r0 ;; r2 = 9 contador

addi 6
addi 4
add r3, r0 ;; r3 = 19 -> brzr

addi -4
add r1, r0 ;; r1 = 15
addi -6
addi -6
slr r1, r0  ;; shifter de 3 posições Endereco base de R = 120
addi -3 ;; r0 = 0  

;; Inicializar R com zeros [120 - 129]
loop_r: brzr r2, r3
        st r0, r1 ;; R[r1] = 0
        addi 1
        add r1, r0 ;; r1+1 -> anda 1 posição no R
        sub r2, r0 ;; decrementa contador
        sub r0, r0 ;; r0 = 0
    ji loop_r 
;; fim de loop: r0 = r2 = 0 || r3 = 20 || r1 = 129

;;[Linha 20] Inicializar A [130 - 139] e B [140 - 149] simultaneamente
    ;;Guardar variáveis em memória Pos 255 = 1 && Pos 254 = 10
addi 1 ;; r0 = 1
add r2, r0 ;; r2 = 1
addi 14  ;; r0 = 255
st r2, r0 ;; Guardar 1 na posicao 255
xor r0, r0 ;; Zerar r0

addi 7 
addi 2 ;; r0 = 9
add r2, r0 ;; r2 = 10
xor r0, r0 ;; Zerar r0

addi 14 ;; r0 = 254
st r2, r0 ;; Guardar 10 na posição 254
xor r0, r0 ;; Zerar r0

addi 7
addi 2 ;; r0 = 9 
add r2, r0 ;; r2 = 19 

addi 7 ;; r = 16
addi 4 ;; r = 20
add r1, r0 ;; r1 = 149 -> posicao final de B

addi 7 ;; r0 = 27
addi 7 ;; r0 = 34 
addi 7 ;; r0 = 41
addi 7 ;; r0 = 48 
addi 4 ;; r0 = 52
add r3, r0 ;; r3 = 71 
xor r0, r0 ;; Limpar r0

loop_ab:        st r2, r1 ;; B[r1] = r2
                addi 14 ;; Acessar posicao 254 -> Guarda 10 -> r0 = 254
                ld r0, r0 ;; r0 = 10
                sub r1, r0 ;; Chegar ao vetor A
                xor r0, r0 ;; Limpar r0

                ji loop_ab_c;
loop_ab_aux_2:  ji loop_ab

loop_ab_c:      addi 15 ;; Acessar posicao 255 -> Guarda 1 -> r0 = 255
                ld r0, r0 ;; r0 = 1
                sub r2, r0 ;; r2 = r2 - 1 -> Decrementa contador -> Número par
                st r2, r1 ;; A[r1] = r2
                xor r0, r0 ;; Limpar r0 

                ji loop_ab_c_1
loop_ab_aux_1:  ji loop_ab_aux_2

loop_ab_c_1:    addi 14 ;; Acessar posicao 254 -> Guarda 10  
                ld r0, r0 ;; r0 = 10 
                add r1, r0 ;; Retorna ao vetor B
                xor r0, r0 ;; Limpa r0
                addi 15 ;; Acessar posicao 255 -> Guarda 1 -> r0 = 255

                ji loop_ab_c_2
loop_ab_aux:    ji loop_ab_aux_1;

loop_ab_c_2:    ld r0, r0 ;; r0 = 1
                sub r1, r0 ;; Decrementa uma posicao do vetor B
                brzr r2, r3 ;; No final do loop r1 está em 139 -> fim de A
                sub r2, r0 ;; Decrementa contador -> Número ímpar
                xor r0, r0 ;; Limpa r0

                ji loop_ab_aux ;; Pula para o auxiliar
;;fim de loop: r1 = 139 (final de A) || r3 = 72 || r0 =r2 = 0
    ;;Guardar iterador em memória
addi 6 ;; r0 vem com valor 1 
addi 3
add r2, r0 ;; r2 = 10 -> iterador
xor r0, r0 ;; limpar r0

addi 13 
st r2, r0 ;; Guardar em 253 o iterador 10
xor r0, r0 ;; limpar r0
xor r2, r2 ;; limpar r2

addi 7
addi 4

add r3, r0 ;; r3 = 82 -> inicio loop

;;Soma - loop
    xor r0, r0
    ld r2, r1 ;; Carrega A 
    addi 14 
    ld r0, r0 ;; r0 = 10
    add r1, r0 ;; Vai para B 
    ld r0, r1 ;; Carregar B -> r0 = B[r1]
    add r2, r0 ;; r2 = A[pos] + B[pos]
    xor r0, r0 ;; limpa r0
    addi 14
    ld r0, r0 ;; r0 = 10
    sub r1, r0 ;; Volta para A 
    sub r1, r0 ;; Vai para R 
    st r2, r1 ;; Guarda em R 
    add r1, r0 ;; Volta para A 
    xor r0, r0 ;; limpa r0 
    addi 13 
    ld r0, r0 ;; r0 = iterador
    xor r2, r2 ;; limpa r2 
    add r2, r0 ;; r2 = iterador
    xor r0, r0 ;; limpa r0
    addi 15
    ld r0, r0 ;; r0 = 1 
    sub r1, r0 ;; Decrementa 1 posicao de A  
    sub r2, r0 ;; Decrementa em 1 o iterador
    ;;guardar iterador
    xor r0, r0 ;; limpa r0 
    addi 13    ;; vai até 253
    st r2, r0 ;; guardar iterador 
    not r2, r2 ;; not r2
brzr r2, r3 

fim: ji fim ;; substitui o ebreak || fim do programa