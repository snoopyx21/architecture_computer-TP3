.data

saisiea: .asciiz "entre l'entier a"
saisieb: .asciiz "entre l'entier b"
espace: .asciiz " "

.text
.globl __start

__start:
jal Saisie_entiera
move $a1, $v0
jal Saisie_entierb
move $a2,$v0

li $a3 0
boucle:
mul $a0 $a3 $a1
jal Affiche_entier
add $a3, $a3, 1
blt $a3,$a2,boucle
j Exit

Saisie_entiera:
la $a0, saisiea
li $v0 4
syscall
li $v0 5
syscall
jr $ra

Saisie_entierb:
la $a0, saisieb
li $v0 4
syscall
li $v0 5
syscall
jr $ra

Affiche_entier:
move $t0, $a0
la $a0 espace 
li $v0 4
syscall
move $a0, $t0
li $v0 1
syscall
jr $ra

Exit:
li $v0 10            #appel système 10 pour terminer l'execution
syscall