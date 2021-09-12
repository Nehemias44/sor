#!/bin/bash

USUARIO=$(whoami)
NOMBRE_DIRECTORIO=$1
HOME_USUARIO=/home/$USUARIO/

if [ $NOMBRE_DIRECTORIO ];then
    # Las siguientes lineas se ejecutan si se paso un parametro
    # NOMBRE_DIRECTORIO != ""
    NUEVO_DIRECTORIO=$HOME_USUARIO/$NOMBRE_DIRECTORIO
    NUEVO_ARCHIVO=$NUEVO_DIRECTORIO/contenido_home.txt
    
    mkdir $NUEVO_DIRECTORIO && touch $NUEVO_ARCHIVO
    # Volcamos la salida del comando ls en contenido_home.txt
    # [-l muestra permisos, tamano, usuario, fecha y hora de creacion] 
    # [-a no ignora archivos ocultos] [-v ordena por version ]
    # [--group-directories-first directorios primero]
    ls -lav --group-directories-first $HOME_USUARIO >\
       $NUEVO_ARCHIVO
else
    echo "Error:Debe ejecutar con un parametro por lo menos."
    exit 1
fi

cat $NUEVO_ARCHIVO
# Comando read
# Solicitamos al usuario que presione una teclas o ingrese algun parametro
# [-s no muestra caracteres ingresados ] [ -p muestra en pantalla mensaje ]
# [-r barra invertida no escapa caracteres ]
# Al leer la barra invertida como parte de lo que ingresa el usuario
# solo termina de leer por teclado cuando presionamos [Enter].
read -rsp $"Presione Enter para salir... \n" 
exit 0

