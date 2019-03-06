#!/bin/bash
#login: oouklich
#script qui permet de supprimer un user LOGUÉ sur la machine

# definescript

real_users() {
	cat /etc/passwd | awk -F ':' '{ if ($3 >= 1000 && $3 <= 60000) print $1}' | tr '\n' ' '
}

tput clear
sh print_header.sh
printf "type the user to delete :   "
read tokill

while [ ! $(cat "/etc/passwd" | cut -d : -f 1 | grep "^$tokill" | grep "$tokill$") >/dev/null 2>&1 ]
do
	printf "\ntype a real one !"
	printf "\nExample : "
	real_users
	printf "\n\t\t\t\t\t=>  "
	read tokill
done

#Si la commande a retourné quelque chose, fermer les programmes :
if [ $(killall -KILL -u $tokill) ]
then
	printf "PIDs killed\n...\n"
	sleep 0.3
fi

#Si l’utilisateur a des tâches CRON dans son fichier crontab, supprimez les avec la commande :
if [ $(crontab -r -u $tokill) ]
then
	printf "Crons cleared\n"
	sleep 0.3
fi

#On peut ensuite supprimer l’utilisateur et son répertoire "home" ainsi que sa boîte email (avec l’option -r)
#avec la commande userdel :
if [ $(userdel -r $tokill) ]
then
	printf "USER deleted\n"
	sleep 0.2
fi

#endscript
