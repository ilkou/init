#!/bin/bash
########################################################################
#                                                ___   ___   ___       #
#    Created by: oouklich                     |     |     |     |      #
#                                             |  ___|  ___|     |      #
#    ouklichoussama@gmail.com                 |     |     |     |      #
#                                             |  ___|  ___|     |      #
#                                                                      #
#                            <init project>                            #
########################################################################

pause() {
	printf "Press Enter to continue...\n"
	read varii
}
stopit=0
while [ $stopit -eq 0 ]
do
	tput clear
	sh print_header.sh
	printf "\n\n\t1) connect with ssh\n"
	printf "\t2) copy files/folders to another machine\n"
	printf "\t3) copy files/folders from another machine\n"
	printf "\t4) set up a cron\n"
	printf "\t5) delete user\n"
	printf "\t6) Exit\n\t\t\t"
	while :
	do
		read choix
		case $choix in
			1)
				read -p "type the hostname :    " hostname
				read -p "type the ip address :   " ip
				ssh $hostname@$ip
				pause
				break
				;;
			2)
				read -p "type the name of the file/folder you want to copy :   " folderr
				read -p "type the hostname :   " hostname
				read -p "type the ip address :   " ip
				read -p "type the path of the destination :   " path
				scp -r $folderr $hostname@$ip:$path
				pause
				break
				;;
			4)
				printf "\n\t(1) to repeat occasionally (specific entry)    "
				printf "\n\t(2) Run once a year at midnight of 1 January (yearly)    "
				printf "\n\t(3) Run once a month at midnight of the first day of the month(monthly)    "
				printf "\n\t(4) Run once a week at midnight on Sunday morning(weekly)    "
				printf "\n\t(5) Run once a day at midnight(daily)    "
				printf "\n\t(6) Run once an hour at the beginning of the hour(hourly)    "
				printf "\n\t(7) Run at startup(reboot)\n\t\t\t\t\t    "
				while :
				do
					read crnn
					case $crnn in
						1)
							read -p "type the day of the week (0 - 6) (Sunday to Saturday) - ps: '*' to run everyday) :   " ldoweek
							read -p "type the month (1 - 12) - ps: '*' to run every month) :   " lmonth
							read -p "type the day of the month (1 - 31) - ps: '*' to run every day of the month) :   " ldomonth
							read -p "type the hour (0 - 23) - ps: '*' to run every hour :   " lhour
							read -p "type the minute (0 - 59) - ps: '*' to run every minute :   " lminute
							read -p "type the command u wanna execute :    " commnd
							echo "$lminute $lhour $ldomonth $lmonth $ldoweek $commnd" >> /var/spool/cron/crontabs/root
							break
							;;
						2)
							read -p "type the command u wanna execute :    " commnd
							echo "@yearly $commnd" >> /var/spool/cron/crontabs/root
							break
							;;
						3)
							read -p "type the command u wanna execute :    " commnd
							echo "@monthly $commnd" >> /var/spool/cron/crontabs/root
							break
							;;
						4)
							read -p "type the command u wanna execute :    " commnd
							echo "@weekly $commnd" >> /var/spool/cron/crontabs/root
							break
							;;
						5)
							read -p "type the command u wanna execute :    " commnd
							echo "@daily $commnd" >> /var/spool/cron/crontabs/root
							break
							;;
						6)
							read -p "type the command u wanna execute :    " commnd
							echo "@hourly $commnd" >> /var/spool/cron/crontabs/root
							break
							;;
						7)
							read -p "type the command u wanna execute :    " commnd
							echo "@reboot $commnd" >> /var/spool/cron/crontabs/root
							break
							;;
						*)
							printf "\nchoose a number between 1 and 7  :   "
							;;
					esac
				done
				pause
				break
				;;
			3)
				read -p "type the name of the file/folder you want to copy (full path):   " path
				read -p "type the hostname :   " hostname
				read -p "type the ip address :   " ip
				scp -r $hostname@$ip:$path .
				pause
				break
				;;
			5)
				sh 02.sh
				pause
				break
				;;
			6)
				printf "^_^\n"
				exit
				;;
			*)
				printf "\nchoose a number between 1 and 6  :   "
				;;
		esac
	done
done
tput cup $( tput lines ) 0
