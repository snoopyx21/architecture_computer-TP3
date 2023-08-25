.data

saisie: .asciiz  "Entrez un entier"
affichage: .asciiz "Votre entier est:"

.text
.globl __start

__start:
la $a0 saisie        #chargement de l'adresse saisie dans a0
li $v0 4             #affichage d'une chaîne de caractère avec appel système 4
syscall
li $v0 5             #appel système 5 permettant de lecture d'un entier
syscall
move $a1 $v0         #sauvegarde du contenu de $v0 dans $a1
la $a0 affichage     #adresse de la chaîne à afficher
li $v0 4
syscall
move $a0 $a1         #entier à afficher
li $v0 1             #appel système 1 qui permet d'écrire un entier
syscall 

j Exit               #saut vers exit (=fin du processus)  

Exit:
li $v0 10            #appel système 10 pour terminer l'execution
syscall

