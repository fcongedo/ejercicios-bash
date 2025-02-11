#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 (cifrar|descifrar) archivo"
    exit 1
fi

accion=$1
archivo=$2

case $accion in
    cifrar)
        gpg --symmetric --cipher-algo AES256 "$archivo"
        echo "Archivo cifrado: $archivo.gpg"
        ;;
    descifrar)
        gpg --decrypt "$archivo" > "${archivo%.gpg}"
        echo "Archivo descifrado: ${archivo%.gpg}"
        ;;
    *)
        echo "Opción no válida. Usa 'cifrar' o 'descifrar'."
        exit 1
        ;;
esac
