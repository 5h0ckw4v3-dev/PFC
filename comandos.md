Operaciones de Archivos:

| Comando                          | Descripción                                                                                                                |   
|:---------------------------------|:---------------------------------------------------------------------------------------------------------------------------|
| ls                               | Lista todos los archivos y directorios en el directorio de trabajo actual                                                  |
| ls -R                            | Lista los archivos en subdirectorios también                                                                               |
| ls -a                            | Muestra archivos ocultos                                                                                                   |
| ls -al                           | Lista archivos y directorios con información detallada como permisos, tamaño, propietario, etc                             |
| cd nombredeldirectorio           | Cambia al directorio especificado                                                                                          |
| cd ..                            | Retrocede un nivel                                                                                                         |
| pwd                              | Muestra el directorio de trabajo actual                                                                                    |
| cat > nombredelarchivo           | Crea un nuevo archivo                                                                                                      |
| cat archivo1 archivo2 > archivo3 | Une dos archivos (archivo1 y archivo2) y guarda el resultado en un nuevo archivo (archivo3)                                |
| touch nombredelarchivo           | Crea o modifica un archivo                                                                                                 |
| rm nombredelarchivo              | Elimina un archivo                                                                                                         |
| cp origen destino                | Copia archivos desde la ruta de origen a la ruta de destino                                                                |
| mv origen destino                | Mueve archivos desde la ruta de origen a la ruta de destino                                                                |
| find / -name nombredelarchivo    | Encuentra un archivo o directorio por su nombre, comenzando desde la raíz                                                  |
| file nombredelarchivo            | Determina el tipo de archivo                                                                                               |
| less nombredelarchivo            | Muestra el contenido del archivo página por página                                                                         |
| head nombredelarchivo            | Muestra las primeras diez líneas de un archivo                                                                             |
| tail nombredelarchivo            | Muestra las últimas diez líneas de un archivo                                                                              |
| lsof                             | Muestra qué archivos están abiertos por qué proceso                                                                        |
| du -h --max-depth=1              | Muestra el tamaño de cada directorio. Usa --max-depth=1 para limitar la salida al directorio actual y sus hijos inmediatos |
| fdisk                            | Comando de manipulación de particiones de disco                                                                            |



Operaciones de Procesos:

| Comando                          | Descripción                                                                                                                |   
|:---------------------------------|:---------------------------------------------------------------------------------------------------------------------------|
| ps                               | Muestra los procesos activos en el momento                                                                                 |
| top                              | Muestra todos los procesos en ejecución                                                                                    |
| kill pid                         | Finaliza el proceso con el PID (identificador del proceso) dado                                                            |
| pkill nombre                     | Finaliza el proceso con el nombre especificado                                                                             |
| bg                               | Reactiva trabajos suspendidos sin llevarlos al primer plano                                                                |
| fg                               | Lleva el trabajo más reciente al primer plano                                                                              |
| fg n                             | Lleva el trabajo n al primer plano                                                                                         |
| renice +n [pid]                  | Cambia la prioridad de un proceso en ejecución                                                                             |
| &>nombredelarchivo               | Redirige tanto la salida estándar como la de error al archivo especificado                                                 |
| 1> nombredelarchivo              |  Redirige la salida estándar al archivo especificado                                                                       |
| 2> nombredelarchivo              | Redirige la salida de error al archivo especificado                                                                        |



Permisos de Archivos:

| Comando                                                   | Descripción                                                                                              |   
|:----------------------------------------------------------|:---------------------------------------------------------------------------------------------------------|
| chmod octal nombredelarchivo                              | Cambia los permisos del archivo a octal, que puede estar entre 0 (sin permisos) y 7 (permisos completos) |
| chown nombredepropietario nombredelarchivo                | Cambia el propietario del archivo                                                                        |
| chown nombredepropietario:nombredelgrupo nombredelarchivo | Cambia el propietario y el grupo del archivo                                                             |
| chgrp nombredelgrupo nombredelarchivo                     |  Cambia el grupo propietario del archivo                                                                 |


Redes:

ping host: Realiza un ping a un host y muestra los resultados.
whois dominio: Obtiene información whois para un dominio.
dig dominio: Obtiene información DNS para un dominio.
netstat -pnltu: Muestra información relacionada con la red, como conexiones de red, tablas de enrutamiento, estadísticas de interfaz, etc.
ifconfig: Muestra las direcciones IP de todas las interfaces de red.
ssh usuario@host: Inicio de sesión remoto en el host como usuario.
scp: Transfiere archivos entre hosts a través de ssh.
wget url: Descarga archivos desde la web.
curl url: Envía una solicitud a una URL y devuelve la respuesta.
traceroute dominio: Muestra la ruta que sigue un paquete para llegar al dominio.
mtr dominio: mtr combina la funcionalidad de los programas traceroute y ping en una sola herramienta de diagnóstico de red.
ss: Otra utilidad para investigar sockets. Es una alternativa más moderna a netstat.
nmap: Herramienta de exploración de redes y escaneo de seguridad.


Compresión y Archivos:

tar cf archivo.tar archivos: Crea un archivo tar llamado archivo.tar que contiene los archivos especificados.
tar xf archivo.tar: Extrae los archivos de archivo.tar.
gzip archivo: Comprime el archivo y lo renombra a archivo.gz.
gzip -d archivo.gz: Descomprime archivo.gz y lo restaura al archivo original.
zip -r archivo.zip archivos: Crea un archivo zip llamado archivo.zip que contiene los archivos especificados.
unzip archivo.zip: Extrae el contenido de un archivo zip.


Procesamiento de Texto:

grep patrón archivos: Busca un patrón en los archivos.
grep -r patrón directorio: Busca de forma recursiva un patrón en un directorio.
comando | grep patrón: Envia la salida del comando a grep para buscar.
echo 'texto': Imprime texto.
sed 's/cadena1/cadena2/g' nombredelarchivo: Reemplaza cadena1 con cadena2 en el archivo.
diff archivo1 archivo2: Compara dos archivos y muestra las diferencias.
wc nombredelarchivo: Cuenta líneas, palabras y caracteres en un archivo.
awk: Un lenguaje de programación versátil para trabajar con archivos.
Por: Waleed Mousa

Uso del Disco:

df: Muestra el uso del disco.
du: Muestra el uso del espacio en directorios.
free: Muestra el uso de memoria y swap.
whereis aplicación: Muestra las posibles ubicaciones de una aplicación.


Información del Sistema:

date: Muestra la fecha y hora actual.
cal: Muestra el calendario del mes actual.
uptime: Muestra el tiempo de actividad actual.
w: Muestra quién está en línea.
whoami: Muestra el nombre del usuario actual.
uname -a: Muestra información del kernel.
df -h: Uso del disco en formato legible para humanos.
du -sh: Uso del disco del directorio actual en formato legible para humanos.
free -m: Muestra la memoria libre y utilizada en MB.
Por: Waleed Mousa


Otros (principalmente utilizados en scripts):

comando1 ; comando2: Ejecuta comando1 y luego comando2.
comando1 && comando2: Ejecuta comando2 solo si comando1 es exitoso.
comando1 || comando2: Ejecuta comando2 solo si comando1 no es exitoso.
comando &: Ejecuta el comando en segundo plano.


Variables de Entorno:

env: Muestra todas las variables de entorno.
echo $VARIABLE: Muestra el valor de una variable de entorno.
export VARIABLE=valor: Establece el valor de una variable de entorno.
alias nuevo_comando='viejo_comando opciones': Crea un nuevo comando que ejecuta el viejo comando con las opciones especificadas.
echo $PATH: Imprime la variable de entorno PATH.
export PATH=$PATH:/nueva/ruta: Agrega /nueva/ruta a la variable de entorno PATH.


Programación de Tareas (Cron Jobs):

crontab -l: Lista todas tus tareas cron.
crontab -e: Edita tus tareas cron.
crontab -r: Elimina todas tus tareas cron.
crontab -v: Muestra la última vez que editaste tus tareas cron.
crontab archivo: Instala una tarea cron desde un archivo.
@reboot comando: Programa una tarea para que se ejecute al inicio.


Scripting de Shell:

#!/bin/bash: Línea shebang para especificar el intérprete de scripts.
$0, $1, ..., $9, ${10}, ${11}: Argumentos del script.
if [condición]; then ... fi: Estructura de la declaración if en scripts de bash.
for i in {1..10}; do ... done: Bucle for en scripts de bash.
while [condición]; do ... done: Bucle while en scripts de bash.
función nombre() {...}: Define una función.


Monitoreo y Rendimiento del Sistema:

iostat: Informa estadísticas de la Unidad Central de Procesamiento (CPU) y estadísticas de entrada/salida para dispositivos, particiones y sistemas de archivos de red.
vmstat: Informa información sobre procesos, memoria, paginación, E/S de bloque, trampas, discos y actividad de la CPU.
htop: Un visor de procesos interactivo para sistemas Unix. Es una alternativa más amigable a top.


Búsqueda y Encontrar:

locate nombredelarchivo: Encuentra un archivo por su nombre. La base de datos se actualiza con el comando updatedb.
whereis nombredeprograma: Localiza los archivos binarios, de origen y de página de manual para un comando.
which nombredelcomando: Muestra la ruta completa de los comandos (shell).


Compresión/Archivos:

tar -cvf archiv.tar directorio/: Crea un archivo tar.
tar -xvf archiv.tar: Extrae un archivo tar.
tar -jcvf archiv.tar.bz2 directorio/: Crea un archivo bz2 comprimido.
tar -jxvf archiv.tar.bz2: Extrae un archivo bz2 comprimido.


Uso del Disco:

dd if=/dev/zero of=/tmp/salida.img bs=8k count=256k: Crea un archivo de un tamaño determinado para probar la velocidad del disco.
hdparm -Tt /dev/sda: Mide la velocidad de lectura de tu disco duro.


Otros:

yes > /dev/null &: Usa este comando para llevar un sistema al límite.
:(){ :|:& };::: Una bomba: úsala con cuidado. No ejecutes este comando en un sistema de producción.

Recuerda que siempre puedes usar el comando man (por ejemplo, man ls) para obtener más información sobre cada comando.
