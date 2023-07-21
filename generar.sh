# Shebang
#!/bin/bash

# Variables
NUM_IMAGE=$1
NAMES_FILE="dict.csv"
IMAGES_FOLDER="imagenes"
IMAGES_URL="https://thispersondoesnotexist.com/"
NAMES_URL="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
CHECKSUM_FILE="checksum.txt"
ARCHIVO="imagenes.tar.gz"

if test -f "$ARCHIVO"; then
  ./descomprimir.sh "$ARCHIVO" "$CHECKSUM_FILE"
fi 
  
# Verifica si se pasó un argumento y si es un número
if [[ $# -eq 1 ]] && [[ "$NUM_IMAGE" =~ ^[0-9]+$ ]]; then

  # Descarga el archivo de nombres
  touch $NAMES_FILE
  wget -O $NAMES_FILE $NAMES_URL

  # Crea la carpeta de imagenes
  mkdir -p $IMAGES_FOLDER

  # Genera imagenes y les asigna un nombre
  for ((N=1; N<=NUM_IMAGE; N++))
  do
    NAME=$(shuf -n 1 $NAMES_FILE) #Toma 1 valor random del archivo names_file
    NAME=$(echo $NAME | sed 's/,.*//') # Remueve la edad del nombre
    IMAGE_NAME=$(echo $NAME | tr ' ' '_') # Reemplaza espacios por guiones bajos
    wget -o "$IMAGES_FOLDER/$IMAGE_NAME.jpg" $IMAGES_URL #Toma 1 imagen de la url y le asigna el nombre
    sleep 1 #Tiempo espera entre cada iteracion
  done

  # Comprime las imágenes
  tar -czvf $ARCHIVO ./$IMAGES_FOLDER #-c (crear) -z (comprimir) -v (mostar prog) -f (especifica nombre del archivo)

  # Crea archivo con cantidad de imagnes
  touch $CHECKSUM_FILE
  md5sum "$ARCHIVO" > "$CHECKSUM_FILE"

  # Eliminar la carpeta de imagenes y archivo de nombres al finalizar
  if [ -d "$IMAGES_FOLDER" ]; then
   rm -rf "$IMAGES_FOLDER"
  fi
  
  rm $NAMES_FILE
  echo "Generación de imágenes finalizada con éxito"

else
  echo "Error: Se debes pasar un número como único argumento."
  exit 1
fi
