#!/bin/bash
# Este script instala todos los paquetes que uso en mi sistema operativo linux
# y configura el sistema para que se vea y se use como yo quiero.
# Los siguientes paquetes se instalan:
# - bat: para ver archivos de texto
# - fd: para buscar archivos
# - exa: para ver archivos y directorios de forma mas amigable que ls
# - zsh: para usar la terminal zsh en lugar de bash (y todos los paquetes que usa zsh)
# - oh-my-zsh: para usar el framework oh-my-zsh
# - powerlevel10k: para usar el tema powerlevel10k
# - fzf: para usar fzf
# - ripgrep: para usar ripgrep
# - neovim: para usar neovim
# - tmux: para usar tmux
# - ranger: para usar ranger
# - neofetch: para usar neofetch
# - bpytop: para usar bpytop
# - flameshot: para usar flameshot
# - pi-apps: para usar pi-apps (solo si el sistema es raspberry pi os)

function menu_principal() {
    echo -e "\e[1m\e[32m[+] Que paquetes desea instalar?\e[0m" # imprimir en verde
    echo -e "\e[33m     [1] Paquetes  \e[1m\bbasicos\e[0m\e[0m" # imprimir en amarillo
    echo -e "\e[34m     [2] Paquetes  \e[1m\bde desarrollo\e[0m\e[0m" # imprimir en azul
    echo -e "\e[35m     [3] Paquetes  \e[1m\bde terminal y personalizacion\e[0m\e[0m" # imprimir en morado
    echo -e "\e[36m     [4] Paquetes  \e[1m\bde escritorio\e[0m\e[0m" # imprimir en cyan
    echo -e "\e[31m     [5] \e[1m\e[4m\e[5mSalir\e[0m\e[0m" # imprimir en rojo
    echo -e "\e[1m\e[32m[+] Escriba el numero del paquete que desea instalar:\e[0m" # imprimir en verde
}
# si la opcion seleccionada es 2:
function paquetes_desarrollo() {
    echo -e "\e[1m\e[32m[+] Instalando paquetes de desarrollo...\e[0m" # imprimir en verde
    sudo apt install -y build-essential 
    echo -e "\e[1m\e[32m[+] Paquetes de desarrollo instalados correctamente\e[0m" # imprimir en verde
}
# si la opcion seleccionada es 3:
function paquetes_terminal() {
    echo -e "\e[1m\e[32m[+] Instalando paquetes de terminal y personalizacion...\e[0m" # imprimir en verde
    sudo apt install -y bat exa fd pulsemixer elvis
    echo -e "\e[1m\e[32m[+] Paquetes de terminal y personalizacion instalados correctamente\e[0m" # imprimir en verde
}
# si la opcion seleccionada es 4:
function paquetes_escritorio() {
    echo -e "\e[1m\e[32m[+] Instalando paquetes de escritorio...\e[0m" # imprimir en verde
    sudo apt install -y gnome-tweaks
    echo -e "\e[1m\e[32m[+] Paquetes de escritorio instalados correctamente\e[0m" # imprimir en verde
}
# limpia la pantalla
clear
# imprime el logo de angortruper
mapfile -d '' EXAMPLE << 'EOF'
                          __    _                                   
                    _wr""        "-q__                             
                 _dP                 9m_     
               _#P                     9#_                         
              d#@                       9#m                        
             d##                         ###                       
            J###                         ###L                      
            {###K                       J###K                      
            ]####K      ___aaa___      J####F                      
        __gmM######_  w#P""   ""9#m  _d#####Mmw__                  
     _g##############mZ_         __g##############m_               
   _d####M@PPPP@@M#######Mmp gm#########@@PPP9@M####m_             
  a###""          ,Z"#####@" '######"\g          ""M##m            
 J#@"             0L  "*##     ##@"  J#              *#K           
 #"               `#    "_gmwgm_~    dF               `#_          
7F                 "#_   ]#####F   _dK                 JE          
]                    *m__ ##### __g@"                   F          
                       "PJ#####LP"                                 
 `                       0######_                      '           
                       _0########_                                   
     .               _d#####^#####m__              ,              
      "*w_________am#####P"   ~9#####mw_________w*"                  
          ""9@#####@M""           ""P@#####@M""  
EOF
# imprimir EXAMPLE en la terminal de color verde
echo -e "\e[32m$EXAMPLE\e[0m"
# imprimir mensaje de bienvenida en la terminal de color verde segun el nombre de usuario
echo -e "\e[32m[:] $(whoami) bienvenido al angortruper\e[0m"

# verificar que el usuario sea root
if [ "$EUID" -ne 0 ]
  # imprimir de color rojo "Please run as root" y salir del script
    then echo -e "\e[31m[!] $(whoami) no ejecutó el script como root\e[0m" 
    # esperar 2 segundos
    sleep 3
    echo "[*] Ejecutando angortruper como root:" 
    sleep 1
    echo "Ejecutando: sudo ./angor_post_install.sh"
    sleep 3
    sudo ./angor_post_install.sh
fi
# imprimir un menu para que el usuario elija que clase de paquetes instalar de distintos colores y la caraacteristica en negrita
menu_principal
# control de flujo para elegir que paquetes instalar
read -p ">>> " opcion
if [ $opcion -eq 1 ]; then
    paquetes_basicos
elif [ $opcion -eq 2 ]; then
    paquetes_desarrollo
elif [ $opcion -eq 3 ]; then
    paquetes_terminal
elif [ $opcion -eq 4 ]; then
    paquetes_escritorio
elif [ $opcion -eq 5 ]; then
    echo -e "\e[1m\e[31m[!] Hasta pronto angortruper\e[0m"
    exit && exit
else
    echo -e "\e[1m\e[31m[!] Opcion invalida\e[0m" # imprimir en rojo
fi

# actualizar el sistema
sudo apt update
sudo apt upgrade -y
# si el sistema es raspberry pi os, instalar pi-apps
if [ -f /etc/rpi-issue ]; then # si el sistema es raspberry pi os
    # instalar pi-apps
    #curl -sSL https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash
fi
# notinhg