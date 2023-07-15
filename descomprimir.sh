#!/bin/bash

# Variables
IMAGES_ZIP=$1
CHECKSUM_FILE=$2

if [ "$#" -ne 2 ]; then # Verifica la cantidad de argumentos
    echo "Se requieren dos archivos como argumentos: imágenes comprimidas y archivo de suma de verificación."
    exit 1
elif [ ! -f "$IMAGES_ZIP" ] || [ ! -f "$CHECKSUM_FILE" ]; then # Verifica si los archivos existen
    echo "No se encontraron los archivos."
    exit 1
else 
    tar -xvf "$IMAGES_ZIP"  # Descomprime las imágenes
    echo "Descompresión exitosa."
    rm $CHECKSUM_FILE
    rm -r $IMAGES_ZIP
    exit 0
fi
