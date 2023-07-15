#!/bin/bash

if [[ -f $archivo in ./imagenes/* ]]; then
    mkdir imagenes_convertidas
else
    echo "No existe ningun archivo"
    exit 1
for archivo in ./imagenes/*; do
    if [ -f "$archivo" ]; then
        if [[ $archivo == *.jpg ]]; then
            if echo "$archivo" | grep -q '[A-Z]'; then
                NOMBRE_CONVERTIDO=$(basename "$archivo")
                convert $archivo -gravity center -resize 512x512+0+0 \-extent 512x512 imagenes_convertidas/$NOMBRE_CONVERTIDO
            fi
        fi
    fi
done
if [[ -f $archivo in ./imagenes_convertidas/* ]]; then
    exit 0
else
    echo "No existe ningun archivo con nombre valido de persona"
    rmdir ./imagenes_convertidas
    exit 2







