#!/bin/bash

# Nombre del archivo del reporte
reporte="reporte_cpu_$(date +%Y-%m-%d_%H-%M-%S).txt"

# Genero  el reporte con el uso del CPU
#-b ejecuta el comando sin interfaz interactiva
#-n 1 indica que el comando se va a ejecutar solamente una vez y despues sale
top -b -n 1 | head -n 20 > "$reporte"

# Imprimir mensaje de reporte generado
echo "Reporte de uso de CPU generado: $reporte"