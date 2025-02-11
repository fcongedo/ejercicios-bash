#!/bin/bash

# Verificar que se pasen los 3 parámetros: destinatario, asunto y archivo adjunto
if [ $# -ne 3 ]; then
    echo "Uso: $0 <destinatario> <asunto> <archivo_adjunto>"
    exit 1
fi

# Asignar los parámetros a variables
destinatario=$1
asunto=$2
archivo_adjunto=$3

# Verificar que el archivo adjunto exista
if [ ! -f "$archivo_adjunto" ]; then
    echo "Error: El archivo adjunto '$archivo_adjunto' no existe."
    exit 1
fi

# Definir el cuerpo del mensaje (puedes modificarlo o pasarlo como parámetro)
cuerpo="Este es el contenido del correo. Saludos."

# Enviar el correo con mutt, adjuntando el archivo
echo "$cuerpo" | mutt -s "$asunto" -a "$archivo_adjunto" -- "$destinatario"

echo "Correo enviado a $destinatario con el archivo adjunto $archivo_adjunto"