#!/bin/bash

# Verificar que se pase el tamaño como parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <tamaño_en_MB>"
    echo "Ejemplo: $0 100 (para eliminar archivos mayores a 100MB)"
    exit 1
fi

# Tamaño proporcionado por el usuario
tamano=$1

# Verificar que el tamaño sea un número válido
if ! [[ "$tamano" =~ ^[0-9]+$ ]]; then
    echo "Error: El tamaño debe ser un número entero."
    exit 1
fi

# Buscar archivos mayores al tamaño especificado y eliminarlos
find . -type f -size +"$tamano"M -exec rm -v {} \;