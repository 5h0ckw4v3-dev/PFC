#!/bin/bash
clear
Inicio() {
clear
echo " ____  _____ ____      _    ____ ___ ____ ";
echo "|  _ \|  ___/ ___|    / \  / ___|_ _|  _ \ ";
echo "| |_) | |_ | |       / _ \ \___ \| || |_) | ";
echo "|  __/|  _|| |___   / ___ \ ___) | ||  _ < ";
echo "|_|   |_|   \____| /_/   \_\____/___|_| \_\ ";
echo "___________________________________________ ";
echo " "
echo "Por Antonio J. Moya";
echo "IMPORTANTE:"; 
echo "Ejecuta este script como root, es seguro y funcionará mejor :)"
echo " "
echo " "
echo 1.Instalar y configurar SAMBA
echo 2.Instalar y configurar LAMP
echo 3.Realizar copias de seguridad
echo 4.Implementar reglas de Firewall
echo 5.Comprobar estado de la red
echo 6.Implementar tips de seguridad
echo 7.Instalar aplicaciones esenciales
echo 8.Sistema
echo 0.Salir
echo " "
echo -n "Selecciona una opción: "
read opcion
case $opcion in
1) SAMBA;;
2) WEB;;
3) BACKUP;;
4) FIREWALL;;
5) NETWORK;;
6) SEC;;
7) APPS;;
8) SYS;;
0) break;;
esac
}
##########################SAMBA#########################################################################
SAMBA() {
while true
do
clear
echo "  ____    _    __  __ ____    _     ";   
echo " / ___|  / \  |  \/  | __ )  / \    ";
echo " \___ \ / _ \ | |\/| |  _ \ / _ \   ";
echo "  ___) / ___ \| |  | | |_) / ___ \  ";
echo " |____/_/   \_\_|  |_|____/_/   \_\ ";
echo " "
echo " "
echo 1. Instalacion.
echo 2. Usuarios samba.
echo 3. Añadir recurso a samba.
echo 4. Montar recurso con samba.
echo 0. Inicio.
echo -n "selecciona una opcion: "
echo " "
read optsamba
case  $optsamba in
1) clear
echo "Se va a proceder a instalar samba"
echo " "
sudo apt update && sudo apt install -y samba samba-common samba-common-bin smbclient cifs-utils
clear
echo " "
echo "Samba habilitado al inicio"
sudo systemctl start smb
sudo systemctl enable smb
echo " "
echo "Fin instalación samba"
echo " "
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
2) clear
echo "¿Quieres añadir o eliminar un usuario? (a/e) "
read smbusuaddel
if [ $smbusuaddel = a ]
then
echo  se va a proceder a crear un usuario samba.
echo -n "¿Añadir un usuario nuevo o usar uno existente? n/e "
read createususamba
if [ $createususamba = exist ]
then
echo "Introduce el nombre del usuario existente "
read existusu
sudo smbpasswd -a $existusu
else
echo "Introduce el nombre del nuevo usuario "
read newusu
sudo adduser $newusu
sudo smbpasswd -a $newusu
fi
else 
echo Se va a proceder a eliminar un usuario samba.
echo -n "¿Que usuario quieres eliminar? "
read smbusudel
sudo smbpasswd -x $smbusudel
fi
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
3) clear
echo se va a compartir un recurso.
echo -n "introduce nombre del recurso: "
	read smbname
        echo -n "introduce la ruta absoluta del directorio a compartir  "
        read smbpath
        echo -n "¿Va a ser publica? (yes/no): "
        read smbpublic
        echo -n "¿Permisos de escritura? (yes/no): "
        read smbwrite
#plantilla recurso
echo "
[nombresamba]
path=rutaabs
public=publica
writable=escritura
guest ok=inv " >> /etc/samba/smb.conf
#sustitucion de datos
sudo sed -i 's|nombresamba|'$smbname'|g' /etc/samba/smb.conf
sudo sed -i 's|rutaabs|'$smbpath'|g' /etc/samba/smb.conf
sudo sed -i 's|publica|'$smbpublic'|g' /etc/samba/smb.conf
sudo sed -i 's|escritura|'$smbwrite'|g' /etc/samba/smb.conf
sudo sed -i 's|inv|'$smbpublic'|g' /etc/samba/smb.conf
sudo systemctl restart smbd
clear
echo " "
echo "Podemos comprobar con 'smbclient -L localhost'"
echo " "
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
4) clear
echo "Se va a proceder a montar un recurso samba"
echo -n "¿Donde quieres montar el recurso?: "
read montarsmb
echo ""
echo -n "Introduce la ruta del directorio a montar ej:(//192.168.1.100/share): "
read recursomount
echo ""
echo -n "Introduce nombre de usuario para acceder al recurso: "
read ususmb
if [ -d $montarsmb ]
then
sudo mount.cifs $recursomount $montarsmb -o user=$ususmb
else
sudo mkdir $montarsmb
sudo mount.cifs $recursomount $montarsmb -o user=$ususmb
fi
echo "Recurso montado!"
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
0) Inicio;;
esac
done
}
##########################SERVER_WEB####################################################################
WEB() {
while true
do
clear
echo " __        _______ ____   "; 
echo " \ \      / / ____| __ )  ";
echo "  \ \ /\ / /|  _| |  _ \  ";
echo "   \ V  V / | |___| |_) | ";
echo "    \_/\_/  |_____|____/  ";
echo " "
echo " "
echo "¿Que deseas hacer?"
echo 1. "Instalar Apache"
echo 2. "Instalar PHP, MariaDB"
echo 3. "Instalar Wordpress (Necesario paso 1 y 2)"
echo 0. "Inicio"
echo -n "Elige una opción: "
echo " "
read webopt
case $webopt in
1) clear
echo "Se va a instalar Apache"
sleep 2
clear
sudo apt update && sudo apt install -y apache2
echo " "
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
2) clear
echo "Se va a instalar PHP y MariaDB"
sleep 2
clear
sudo apt update && sudo apt install -y curl php php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip libapache2-mod-php php-mysql mariadb-server
echo " "
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
3) clear
echo "Configuracion de MySQL"
sleep 2
clear
sudo mysql_secure_installation
clear
echo "Introduce el nombre de la base de datos para wordpress"
read wpdb
echo "Configurando base de datos para wordpress"
sudo mysql -e "CREATE DATABASE $wpdb DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
echo " "
echo "Selecciona nombre de usuario para Wordpress"
read wpuser
echo "Selecciona contraseña para el usuario de wordpress"
read -s wppass
sudo mysql -e "GRANT ALL ON $wpdb.* TO '$wpuser'@'localhost' IDENTIFIED BY '$wppass';"
sudo mysql -e "FLUSH PRIVILEGES;"
sudo systemctl restart apache2
clear
echo "============================================"
echo "Configuracion de Wordpress"
echo "============================================"
echo "¿Ejecutar instalación? (y/n)"
read  run
if [ "$run" == n ] ; then
exit
else
echo "============================================"
echo "Se esta instalando Wordpress."
echo "============================================"
cd /var/www/html
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar -zxvf latest.tar.gz
cd wordpress
sudo cp -rf . ..
cd ..
sudo rm -R wordpress
sudo rm latest.tar.gz
echo "========================="
echo "Instalación completa."
echo "========================="
fi
echo " "
echo " Para continuar con la configuración, dirígete a http://localhost/wp-admin/setup-config.php"
echo " "
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
0) Inicio;;
esac
done
}
##########################BACKUP########################################################################
BACKUP() {
while true
do
clear
echo "  ____    _    ____ _  ___   _ ____   ";
echo " | __ )  / \  / ___| |/ / | | |  _ \  ";
echo " |  _ \ / _ \| |   | ' /| | | | |_) | ";
echo " | |_) / ___ \ |___| . \| |_| |  __/  ";
echo " |____/_/   \_\____|_|\_\\___/|_|     ";
echo ""
echo ""
echo "¿Que deseas hacer?"
echo 1. Copiar.
echo 2. Recuperar.
echo 0. Inicio.
echo -n "Elige una opcion: "
echo " "
read backupopt
case $backupopt in
1) clear
echo -n "¿Quieres hacer una copia completa o intermental? (c/i): "
read backupcominc
if [ $backupcominc = c ]
then
echo se va a hacer una copia completa.
DATE=$(date +%Y-%m-%d-%H%M%S)
echo "Introduce ruta completa del destino (sin / al final): "
read DESTINOFBK
echo "Introduce nombre de la copia(Se le añade por defecto la fecha): "
read NOMBREFBK
echo "Introduce ruta completa de/los achivos que quieres hacer la copia (separados por un espacio): "
read SOURCEFBK
tar -cvzpf $DESTINOFBK/$NOMBREFBK-$DATE.tar.gz $SOURCEFBK
echo se ha creado la copia en $DESTINOFBK
else
echo se va a hacer una copia incremental.
DATE=$(date +%Y-%m-%d)
echo "Introduce ruta completa del destino (sin / al final): "
read DESTINOIBK
echo "Introduce nombre de la copia(Se le añade por defecto la fecha): "
read NOMBREIBK
ls $DESTINOIBK
echo "Introduce ruta completa de/los achivos que quieres hacer la copia (separados por un espacio): "
read SOURCEIBK
tar -cvzpf $DESTINOIBK/$NOMBREIBK-$DATE.tar.gz  -g $DESTINOIBK/$NOMBREIBK.snap $SOURCEIBK
echo se ha creado la copia en $DESTINOIBK
fi
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
2) clear
echo "Introduce la ruta del archivo que quieres extraer: "
read EXTSOURCE
echo " "
echo ""
ls $EXTSOURCE
sleep 1
echo ""
echo "Introduce el archivo comprimido para extraer: "
read DESTINOTAR
echo ""
echo "Introduce la ruta de destino para extraer: "
read DESTINOEXT
tar -xvzf $EXTSOURCE/$DESTINOTAR -C $DESTINOEXT
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
0) Inicio;;
esac
done
}
##########################FIREWALL #####################################################################
FIREWALL() {
while true
do
clear
echo "  _____ ___ ____  _______        ___    _     _      ";
echo " |  ___|_ _|  _ \| ____\ \      / / \  | |   | |     ";
echo " | |_   | || |_) |  _|  \ \ /\ / / _ \ | |   | |     ";
echo " |  _|  | ||  _ <| |___  \ V  V / ___ \| |___| |___  ";
echo " |_|   |___|_| \_\_____|  \_/\_/_/   \_\_____|_____| ";
echo " "
echo " "
echo "¿Que deseas hacer?"
echo 1. Permitir todo el tráfico.
echo 2. Denegar todo el tráfico.
echo 3. Permitir SSH.
echo 4. Permitir FTP.
echo 5. Permitir HTTPS.
echo 6. Eliminar reglas.
echo 7. Mostrar reglas.
echo 0. Inicio.
echo -n "Elige una opcion:"
echo " "
read firewallopt
case $firewallopt in
1) clear
echo "Permitido todo el tráfico"
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
2) clear
echo "Denegado todo el tráfico"
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
3) clear
echo "Permitido SSH (puerto 22)"
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
4) clear
echo "Permitido FTP (puerto 21)"
sudo iptables -A INPUT -p tcp --dport 21 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 21 -j ACCEPT
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
5) clear
echo "Permitido HTTPS (puerto 443)"
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
6) clear
echo "Eliminar todas las reglas"
echo " "
sudo iptables -F
sudo iptables -X
echo " "
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
7) clear
echo "Reglas de iptables"
echo " "
sudo iptables -L -v
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
0) Inicio;;
esac
done
}
##########################DHCP##########################################################################
NETWORK() {
while true
do
clear;
echo "  _   _ _____ _______        _____  ____  _  __ ";
echo " | \ | | ____|_   _\ \      / / _ \|  _ \| |/ / ";
echo " |  \| |  _|   | |  \ \ /\ / / | | | |_) | ' /  ";
echo " | |\  | |___  | |   \ V  V /| |_| |  _ <| . \  ";
echo " |_| \_|_____| |_|    \_/\_/  \___/|_| \_\_|\_\ ";
echo " "
echo " "
echo ¿Que deseas hacer?;
echo 1. Ver estado actual;
echo 2. Ver IP;
echo 3. Reiniciar servidor;
echo 0. Inicio;
echo -n "Elige una opcion:";
echo " "
read optnet;
case $optnet in
1) nmcli device status
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
2) echo -n "¿De que interface quieres ver la IP? "
read ipinterface;
ip a | grep $ipinterface | awk '{print $2}'
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
3) echo -n "Se va a reiniciar el servidor, ¿quieres continuar? (y/n). "
read reiniciaryn
if [ $reiniciaryn = y ] 
then
sudo nmcli networking off && nmcli networking on
echo Servidor reiniciado.
else
echo En otro momento :D
fi
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
0) Inicio;;
esac
done
}
##########################SEGURIDAD#####################################################################
SEC() {
while true
do
clear
echo "  ____  _____ ____ _   _ ____  ___ _______   __ ";
echo " / ___|| ____/ ___| | | |  _ \|_ _|_   _\ \ / / ";
echo " \___ \|  _|| |   | | | | |_) || |  | |  \ V /  ";
echo "  ___) | |__| |___| |_| |  _ < | |  | |   | |   ";
echo " |____/|_____\____|\___/|_| \_\___| |_|   |_|   ";
echo " "
echo " "
echo 1. Desactivar puertos USB
echo 2. Activar puertos USB
echo 3. Bloquear usuario root de SSH
echo 4. Deshabilitar contraseñas vacias SSH
echo 5. Deshabilitar IPv6
echo 6. Deshabilitar reinicio usando Ctrl+Alt+Supr
echo 7. Verificar puertos abiertos
echo 0. Inicio
echo -n "Elige una opcion: "
echo " "
read optsec
case $optsec in 
1) clear
echo "USB deshabilitado"
sleep 2
clear
sudo echo 'install usb-storage /bin/true' >> /etc/modprobe.d/disable-usb-storage.conf
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
2)  clear
echo "USB habilitado"
sleep 2
clear
sudo rm /etc/modprobe.d/disable-usb-storage.conf
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
3) clear
sudo apt update && sudo apt install ssh -y
sudo sed -i "s/.*PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config
clear
echo " "
echo "¡Usuario Root deshabilitado!"
sudo systemctl restart sshd
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
4) clear
sudo apt update && sudo apt install ssh -y
sudo sed -i "s/.*PermitEmptyPasswords.*/PermitEmptyPasswords no/g" /etc/ssh/sshd_config
clear
echo " "
echo "¡Contraseñas vacias deshabilitadas!"
sudo systemctl restart sshd
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
5) clear
sudo sed -i '$a net.ipv6.conf.all.disable_ipv6' /etc/sysctl.conf
sudo sysctl -p
clear
echo " "
echo "¡IPv6 deshabilitado!"
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
6) clear
sudo systemctl mask ctrl-alt-del.target
sudo systemctl daemon-reload
clear
echo " "
echo "¡Reinicio por Ctrl+Alt+Supr deshabilitado!"
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
7) clear
sudo apt update
sudo apt install nmap -y
clear
sudo nmap -sV -Pn localhost
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
0) Inicio;;
esac
done
}
##########################APLICACIONES_ESENCIALES#######################################################
APPS() {
while true
do
clear
echo "     _    ____  ____  ____  "; 
echo "    / \  |  _ \|  _ \/ ___| ";
echo "   / _ \ | |_) | |_) \___ \ ";
echo "  / ___ \|  __/|  __/ ___) |";
echo " /_/   \_\_|   |_|   |____/ ";
echo " "
echo " "
echo 1. Actualiza repositorios
echo 2. Actualiza paquetes
echo 3. Eliminar paquetes obsoletos
echo 4. Instalar LibreOffice.
echo 5. Instalar VLC.
echo 6. Instalar Thunderbird.
echo 7. Instalar Gimp.
echo 8. Instalar Firefox.
echo 9. Instalar todo. 
echo 0. Inicio.
echo -n "Elige una opcion: "
echo " "
read optsec
case $optsec in
1) echo Actualizando...
clear
sudo apt update
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
2) echo Actualizando...
clear
sudo apt upgrade
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
3) echo Limpiando...
clear
sudo apt autoremove -y
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
4) echo Instando LibreOffice...
clear
sudo apt install libreoffice libreoffice-l10n-es -y
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
5) echo Instalando VLC...
clear
sudo apt install vlc -y
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
6) echo Instalando Mozilla Thunderbird
clear
sudo apt install thunderbird thunderbird-l10n-es-es -y
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
7) echo Instalando Gimp
clear
sudo apt install gimp -y
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
8) echo Instalando Mozilla Firefox
clear
sudo apt install firefox-esr firefox-esr-l10n-es-es -y
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
9) echo Instalando LibreOffice, VLC, Thunderbird, Gimp y Firefox...
clear
sudo apt install libreoffice libreoffice-l10n-es vlc thunderbird thunderbird-l10n-es-es gimp firefox-esr firefox-esr-l10n-es-es -y
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
0) Inicio;;
esac
done
}
##########################SISTEMA#####################################################################
SYS() {
while true
do
clear
echo "  ______   ______ _____ _____ __  __  ";
echo " / ___\ \ / / ___|_   _| ____|  \/  | ";
echo " \___ \\ V /\___ \ | | |  _| | |\/| | ";
echo "  ___) || |  ___) || | | |___| |  | | ";
echo " |____/ |_| |____/ |_| |_____|_|  |_| ";
echo " "
echo " "
echo 1. Ver propiedades del sistema.
echo 0. Inicio
echo -n "Elige una opcion: "
echo " "
read optsys
case $optsys in 
1) echo lanzando neofetch...
clear
sudo apt update && sudo apt install neofetch -y
clear
echo " ";
neofetch
echo " ";
read -n 1 -s -r -p "Presiona Enter para volver al menú..."
;;
0) Inicio;;
esac
done
}
Inicio
