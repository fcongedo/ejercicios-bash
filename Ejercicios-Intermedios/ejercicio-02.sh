#!/bin/bash

# Primero obtengo la fecha en formato correcto Año-Mes-Día_Hora-Minuto-Segundo
fecha=$(date +"%Y-%m-%d_%H-%M-%S")

# Agrego la fecha al archivo
archivo="archivo_$fecha.txt"

# Creo el archivo y verifico si se creó correctamente
if touch "$archivo"; then
    echo "Archivo creado con éxito: $archivo"
else
    echo "Error: No se pudo crear el archivo."
fi