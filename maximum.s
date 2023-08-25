.data

saisie: .asciiz  "Entrez un entier"
max: .asciiz "Le maximum est :"

.text
.globl __start

__start:
jal Saisie_entier
move $a1, $v0
jal Saisie_entier
move $a2, $v0
move $a3, $a1
bgt $a1, $a2, plus_grand
move $a0,$a2
jal Afficher_entier
j Exit

Saisie_entier:
la $a0 saisie
li $v0 4
syscall
li $v0 5
syscall 
jr $ra

plus_grand:
jal Afficher_entier
j Exit

Exit:
li $v0 10
syscall

Afficher_entier:
la $a0 max
li $v0 4
syscall
move $a0, $a3
li $v0 1
syscall
jr $ra
