#!/bin/bash

# Verifico que se pasen los parámetros 'directorio' y 'patrón' a buscar
if [ $# -ne 2 ]; then
  echo "Uso: $0 <directorio> <patron>"
  exit 1
fi

directorio=$1
patron=$2

# Verifico que el directorio pasado por parámetro exista
if [ ! -d "$directorio" ]; then
  echo "Error: el directorio '$directorio' no existe."
  exit 1
fi

# Buscar el patrón en el directorio
echo "Buscando el patrón '$patron' en los archivos de '$directorio'..."
grep -rn "$patron" "$directorio"