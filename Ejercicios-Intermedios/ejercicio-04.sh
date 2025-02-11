#!/bin/bash

# Verificar que se pasen los 2 directorios por parametro, 'directorio_origen' y 'directorio_respaldo
if [ $# -ne 2 ]; then
  echo "Uso: $0 <directorio_origen> <directorio_respaldo>"
  exit 1
fi

directorio_origen=$1
directorio_respaldo=$2

# Verifico que el directorio origen exista
if [ ! -d "$directorio_origen" ]; then
  echo "Error: El directorio de origen '$directorio_origen' no existe."
  exit 1
fi

# Crea el directorio de respaldo si no existe
if [ ! -d "$directorio_respaldo" ]; then
  echo "El directorio de respaldo no existe. Creándolo..."
  mkdir -p "$directorio_respaldo"
fi

# Copio los archivos al directorio de respaldo
cp -r "$directorio_origen"/* "$directorio_respaldo"

echo "Archivos copiados correctamente de '$directorio_origen' a '$directorio_respaldo'."