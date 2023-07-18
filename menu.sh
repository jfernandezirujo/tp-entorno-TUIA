#!/bin/bash

CHECKSUM_FILE="checksum.txt"
ARCHIVO="imagenes.tar.gz"

while true; do
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
    1)
      echo "Ingrese la cantidad de imágenes a generar:"
      read CANTIDAD_IMAGENES
      ./generar.sh "$CANTIDAD_IMAGENES"
      ;;
    2)
      if [ -f "$ARCHIVO" ] && [ -f "$CHECKSUM_FILE" ]; then
        ./descomprimir.sh "$ARCHIVO" "$CHECKSUM_FILE"
      else
        echo "Error: No se encontraron los archivos de imágenes comprimidas y/o de suma de verificación."
      fi
      ;;
    3) 
      ./procesar.sh 
      ;;
    4) 
      ./comprimir.sh
      ;;
    5) 
      echo "Saliendo del menú."
      exit 0 ;;
    *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
  esac

  read -n 1 -r -p "Presione cualquier tecla para continuar..."
done
