#!/bin/bash

while true; do
    echo "Seleccione una opción:"
    select opcion in "Mostrar fecha y hora" "Listar archivos" "Mostrar espacio en disco" "Ver uso de CPU" "Ver uso de memoria" "Salir"; do
        case $opcion in
            "Mostrar fecha y hora")
                echo "Fecha y hora actual: $(date)"
                break
                ;;
            "Listar archivos")
                echo "Archivos en el directorio actual:"
                ls -lh
                break
                ;;
            "Mostrar espacio en disco")
                echo "Espacio en disco:"
                df -h
                break
                ;;
            "Ver uso de CPU")
                echo "Uso de CPU:"
                top -bn1 | grep "Cpu(s)" | awk '{print "Uso: " $2 + $4 "%"}'
                break
                ;;
            "Ver uso de memoria")
                echo "Uso de memoria:"
                free -h | awk '/Mem:/ {print "Usado: " $3 " / Total: " $2}'
                break
                ;;
            "Salir")
                echo "Saliendo..."
                exit 0
                ;;
            *)
                echo "Opción no válida, intente nuevamente."
                ;;
        esac
    done
    echo ""
done