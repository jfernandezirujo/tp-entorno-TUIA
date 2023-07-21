#!/bin/bash

# Carpeta que contiene todas las imágenes
carpeta_imagenes="./imagenes"

# Carpeta que contiene los nombres válidos
carpeta_nombres_validos="./imagenes_convertidas"

if [ ! -d "$carpeta_imagenes" ] || [ ! -d "$carpeta_nombres_validos" ]; then
  echo "Error: No se encontraron las carpetas 'imagenes' y/o 'imagenes_convertidas'."
  exit 1
fi

# Generar archivo con la lista de nombres de todas las imágenes
if [ -z "$(ls -A $carpeta_imagenes)" ]; then
  echo "Error: La carpeta 'imagenes' está vacía, no hay imágenes para procesar."
  exit 1
fi
find "$carpeta_imagenes" -name "*.jpg" > lista_imagenes.txt

# Generar archivo con la lista de nombres válidos
if [ -z "$(ls -A $carpeta_nombres_validos)" ]; then
  echo "Error: La carpeta 'imagenes_convertidas' está vacía, no hay nombres válidos para procesar."
  exit 1
fi
find "$carpeta_nombres_validos" -type f > lista_nombres_validos.txt

# Generar archivo con el total de personas cuyo nombre finaliza con la letra
grep -E "a(_|\.jpg)$" lista_nombres_validos.txt >> total_personas.txt

# Crear un archivo comprimido que incluya todos los archivos generados y todas las imágenes
nombre_archivo_comprimido="archivos_e_imagenes.tar.gz"
tar -czvf "$nombre_archivo_comprimido" lista_imagenes.txt lista_nombres_validos.txt total_personas.txt "$carpeta_imagenes" "$carpeta_nombres_validos"

if [ $? -eq 0 ]; then
  echo "Proceso completado."
  mv -u archivos_e_imagenes.tar.gz ./Salida
else
  echo "Error: La compresión falló."
  exit 1
fi

# Limpiar los archivos temporales
rm lista_imagenes.txt
rm lista_nombres_validos.txt
rm total_personas.txt
rm -rf $carpeta_imagenes
rm -rf $carpeta_nombres_validos
