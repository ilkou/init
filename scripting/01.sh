#!/bin/bash
#login: oouklich
#script qui affiche seulement le login, le UID et le path de chaques entree du fichier /etc/passwd

# definescript

sh print_header.sh
tput clear
printf "%-20s %-10s %-30s\n\n" "LOGIN" "UID" "PATH"
awk 'BEGIN{FS=":"}{printf("%-20s %-10s %-30s\n"), $1 ,$3 ,$6}' /etc/passwd | sed '/^#/d'

#la commande '{print $1 "  " $2 "  " $3}' | column -t \ ext suffisante pour alignees les colonnes

#endscript
