#!/bin/bash

umbral=30

# Capturar solo los valores numéricos de la primera línea de `free`
read total used <<< $(free | awk 'NR==2 {print $2, $3}')

# Verificar si los valores se obtuvieron correctamente
if [[ -z "$total" || -z "$used" || "$total" -eq 0 ]]; then
    echo "Error: No se pudo obtener información de memoria."
    exit 1
fi

# Calcular el porcentaje de uso de memoria
uso_actual=$(echo "scale=2; $used/$total*100" | bc -l)

# Verificar si el uso de memoria supera el umbral
if (( $(echo "$uso_actual > $umbral" | bc -l) )); then
    # Mensaje del correo
    mensaje="ALERTA DE MEMORIA

    El uso de memoria ha superado el umbral de ${umbral}%.

    Uso actual: ${uso_actual}%

    Por favor, revisa el estado del servidor."

     # Mostrar mensaje en la consola
    echo -e "\n ATENCIÓN: El uso de memoria ha superado el umbral"
    echo -e "Umbral: ${umbral}%"
    echo -e "Uso actual: ${uso_actual}%\n"
    echo -e "Se ha enviado una notificación por correo a francocongedo@gmail.com"

    # Enviar correo con `mutt`
    echo -e "$mensaje" | mutt -s " Alerta de Memoria" francocongedo@gmail.com
fi