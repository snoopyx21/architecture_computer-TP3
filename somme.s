.data

saisie: .asciiz  "Entrez un entier"
resultat: .asciiz "Le resultat est"

.text
.globl __start

__start:
la $a0 saisie        #chargement de l'adresse saisie dans a0
li $v0 4             #affichage d'une chaîne de caractère avec appel système 4
syscall
li $v0 5             #appel système 5 permettant de lecture d'un entier
syscall
move $a1 $v0         #sauvegarde du contenu de $v0 dans $a1

la $a0 saisie     
li $v0 4
syscall
li $v0 5
syscall
move $a2, $v0

add $a3,$a2,$a1
la $a0 resultat
li $v0 4           
syscall
move $a0 $a3
 

jal Afficher_entier
j Exit               #saut vers exit (=fin du processus)  

Exit:
li $v0 10            #appel système 10 pour terminer l'execution
syscall

Afficher_entier:
li $v0 1
syscall
jr $ra