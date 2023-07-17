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
