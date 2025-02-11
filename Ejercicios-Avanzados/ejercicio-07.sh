#!/bin/bash

# Verifica si se proporcionó un archivo como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 archivo_usuarios"
    exit 1
fi

archivo=$1

# Verifica si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "El archivo $archivo no existe."
    exit 1
fi

# Lee el archivo línea por línea
while IFS= read -r usuario; do
    # Verifica si el nombre de usuario no está vacío
    if [ -n "$usuario" ]; then
        if id "$usuario" &>/dev/null; then
            echo "El usuario $usuario ya existe."
        else
            # Crea el usuario con el directorio home
            sudo useradd -m "$usuario"
            if [ $? -eq 0 ]; then
                echo "Usuario $usuario creado con éxito."

                # Informa que debe asignar una contraseña
                echo "Debe asignar una contraseña al usuario $usuario utilizando el comando:"
                echo "sudo passwd $usuario"
                echo "Recuerda que este usuario no tiene contraseña asignada todavía."
            else
                echo "Error al crear el usuario $usuario."
            fi
        fi
    fi
done < "$archivo"