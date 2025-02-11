#!/bin/bash

# Verificar si se proporciono un archivo como parametro
if [ -z "$1" ]; then
  echo "Por favor, ingrese el nombre del archivo"
  exit 1
fi

lineas=$(wc -l < "$1")
echo "El archivo '$1' tiene $lineas líneas."