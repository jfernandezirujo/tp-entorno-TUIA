#!/bin/bash

while true
do
  clear
  echo "Menú:"
  echo "1. Generar imágenes"
  echo "2. Descomprimir imágenes"
  echo "3. Procesar imágenes"
  echo "4. Comprimir archivos"
  echo "5. Salir"
  echo "Seleccione una opción: "
  read opcion

  case $opcion in
    1) ./generar.sh ;;
    2) ./descomprimir.sh ;;
    3) ./procesar.sh ;;
    4) ./comprimir.sh ;;
    5) exit 0 ;;
    *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
  esac

  read -n1 -r -p "Presione cualquier tecla
