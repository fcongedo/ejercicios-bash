#!/bin/bash

# Verificar que se pase el número de días como parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <número_de_días>"
    exit 1
fi

# Número de días proporcionado por el usuario
dias=$1

# Crear el directorio de archivos antiguos si no existe
directorio_antiguos="archivos_antiguos"
if [ ! -d "$directorio_antiguos" ]; then
    mkdir "$directorio_antiguos"
    echo "Se ha creado el directorio '$directorio_antiguos'."
fi

# Buscar los archivos modificados hace más de X días y moverlos al directorio de archivos antiguos
find . -type f -mtime +$dias -exec mv {} "$directorio_antiguos" \;

echo "Los archivos modificados hace más de $dias días se han movido al directorio '$directorio_antiguos'."