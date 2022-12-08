# para personalizar la terminal con powerlevel10k en termux debes seguir los siguientes pasos:
# 1. instalar powerlevel10k
# 2. instalar fira code
# 3. instalar nerd fonts
# 4. instalar oh-my-zsh
# 5. instalar todos los paquetes de zsh
apt install powerlevel10k fira-code nerd-fonts oh-my-zsh zsh
E: Unable to locate package powerlevel10k
E: Unable to locate package fira-code
E: Unable to locate package nerd-fonts
E: Unable to locate package oh-my-zsh
# para evitar errores de paquetes no encontrados, debes instalar los paquetes de zsh
apt install zsh
# para instalar powerlevel10k debes seguir los siguientes pasos:
# 1. instalar git
# 2. clonar el repositorio de powerlevel10k
# 3. instalar powerlevel10k
apt install git
git clone

# para ser root en termux debes ejecutar el siguiente comando:
su root 


# luego de instalar todo lo anterior debes ejecutar el siguiente comando:
# p10k configure

# luego de ejecutar el comando anterior debes seleccionar la opcion 1 y luego la opcion 2
# luego de eso debes reiniciar la terminal y listo
 # para reparar el error de la terminal al intentar actualizar los paquetes debes ejecutar el siguiente comando:
# apt update --fix-missing -y 
