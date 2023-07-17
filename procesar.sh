#!/bin/bash

if [[ -d ./imagenes ]]; then
    if [ -n $(find ./imagenes -type f -name "$archivo") ]; then
        mkdir imagenes_convertidas
    else
        echo "No existe ningun archivo valido en la carpeta de imagenes"
        exit 1
    fi
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
    if [[ "$(ls -A ./imagenes_convertidas)" ]]; then
        exit 0
    else
        echo "No existe ningun archivo con nombre valido de persona"
        rmdir ./imagenes_convertidas
        exit 2
    fi
else
    echo "No existe la carpeta imagenes, el programa no se puede ejecutar"
    exit 3
fi