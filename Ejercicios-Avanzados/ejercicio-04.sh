#!/bin/bash

# Verificar que se pase el archivo de log como parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo_de_log>"
    exit 1
fi

# Archivo de log proporcionado por el usuario
archivo_log=$1

# Verificar si el archivo de log existe
if [ ! -f "$archivo_log" ]; then
    echo "Error: El archivo '$archivo_log' no existe."
    exit 1
fi

# Monitorizar el archivo de log en tiempo real
echo "Monitorizando el archivo '$archivo_log' en tiempo real..."
tail -f "$archivo_log"