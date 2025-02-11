#!/bin/bash

# Verifico que se paso la extension del archivo a buscar por parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <extension>"
    exit 1
fi

extension=$1

# Contar archivos con la extensión pasada por parámetro
cantidad=$(ls *."$extension" 2>/dev/null | wc -l)

echo "Hay $cantidad de archivos con la extensión .$extension en el directorio actual."