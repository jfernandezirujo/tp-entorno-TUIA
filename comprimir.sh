#!/bin/bash

# Carpeta que contiene todas las imágenes
carpeta_imagenes="./imagenes"

# Carpeta que contiene los nombres válidos
carpeta_nombres_validos="./imagenes_convertidas"

# Generar archivo con la lista de nombres de todas las imágenes
find "$carpeta_imagenes" -name "*.jpg" > lista_imagenes.txt

# Generar archivo con la lista de nombres válidos
find "$carpeta_nombres_validos" -type f > lista_nombres_validos.txt

# Generar archivo con el total de personas cuyo nombre finaliza con la letra
total_personas=$(grep -E "a(_|\.jpg)$" lista_nombres_validos.txt)
echo "$total_personas" > total_personas.txt

# Crear un archivo comprimido que incluya todos los archivos generados y todas las imágenes
nombre_archivo_comprimido="archivos_e_imagenes.tar.gz"
tar -czvf "$nombre_archivo_comprimido" lista_imagenes.txt lista_nombres_validos.txt total_personas.txt "$carpeta_imagenes" "$carpeta_nombres_validos"

echo "Proceso completado."

# Limpiar los archivos temporales
rm lista_imagenes.txt
rm lista_nombres_validos.txt
rm total_personas.txt
rm -rf $carpeta_imagenes
rm -rf $carpeta_nombres_validos