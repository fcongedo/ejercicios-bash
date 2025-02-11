#!/bin/bash

# Verifica si se pasaron los parámetros correctos
if [ $# -ne 2 ]; then
    echo "Uso: $0 <usuario> <base_de_datos>"
    exit 1
fi

# Asigna las variables
usuario=$1
base_de_datos=$2

# Define el archivo de respaldo con una marca de tiempo
archivo_backup="backup_${base_de_datos}_$(date +'%Y-%m-%d_%H-%M-%S').sql"

# Mensaje de inicio
echo "Realizando el backup de la base de datos: $base_de_datos"

# Ejecuta el comando mysqldump para realizar el backup
mysqldump -u $usuario -p $base_de_datos > $archivo_backup

# Verifica si el backup fue exitoso
if [ $? -eq 0 ]; then
    echo "Backup creado con éxito: $archivo_backup"
else
    echo "Hubo un error al crear el backup."
    exit 1
fi