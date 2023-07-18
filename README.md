# tp-entorno-TUIA

1).Guía de uso de los scripts:
  Este conjunto de scripts está diseñado para realizar una serie de tareas relacionadas con la generación, procesamiento y compresión de    imágenes. A continuación, se proporciona una guía paso a paso sobre cómo utilizar estos scripts en conjunto:

  Preparación
  Asegúrate de tener los siguientes archivos y scripts en el mismo directorio:

  generar.sh
  descomprimir.sh
  procesar.sh
  comprimir.sh
  menu.sh
  Asegúrate de tener los siguientes archivos adicionales en el mismo directorio:

  dict.csv: un archivo que contiene una lista de nombres para generar las imágenes.
  checksum.txt: un archivo de suma de verificación utilizado para verificar la integridad del archivo comprimido de imágenes.
  imagenes.tar.gz: un archivo comprimido que contiene las imágenes generadas.
  Asegúrate de tener instaladas las dependencias requeridas para los comandos utilizados en los scripts. Por ejemplo, wget y convert (del   paquete imagemagick).

2).Generar imágenes
  Ejecuta el script generar.sh con el siguiente comando:

  bash
  Copy code
  ./generar.sh <cantidad_imagenes>
  Donde <cantidad_imagenes> es el número de imágenes que deseas generar. Este script descargará imágenes de la URL     https://thispersondoesnotexist.com/ y les asignará nombres utilizando el archivo dict.csv.

  El script creará una carpeta llamada imagenes y almacenará las imágenes generadas en ella.

  Al finalizar, se creará un archivo comprimido llamado imagenes.tar.gz que contendrá las imágenes generadas.

3).Descomprimir imágenes
  Ejecuta el script descomprimir.sh con el siguiente comando:

  bash
  Copy code
  ./descomprimir.sh imagenes.tar.gz checksum.txt
  Este script descomprimirá las imágenes del archivo comprimido imagenes.tar.gz y verificará su integridad utilizando el archivo   checksum.txt.

  Si el archivo pasa la verificación de suma de verificación, las imágenes se descomprimirán en la carpeta actual y se mostrará el     mensaje "Descompresión exitosa".

  Los archivos imagenes.tar.gz y checksum.txt serán eliminados.

4).Procesar imágenes
  Ejecuta el script procesar.sh con el siguiente comando:

  bash
  Copy code
  ./procesar.sh
  Este script procesará las imágenes en la carpeta imagenes y las convertirá a un tamaño de 512x512 píxeles si su nombre contiene al menos una letra mayúscula.

  Las imágenes procesadas se almacenarán en una nueva carpeta llamada imagenes_convertidas.

  Al finalizar, se mostrará el mensaje "Proceso de conversión completado exitosamente".

5).Comprimir archivos
  Ejecuta el script comprimir.sh con el siguiente comando:

  bash
  Copy code
  ./comprimir.sh
  Este script comprimirá los archivos generados (lista_imagenes.txt, lista_nombres_validos.txt, total_personas.txt) y las carpetas imagenes y imagenes_convertidas en un archivo comprimido llamado archivos_e_imagenes.tar.gz.

  Al finalizar, se mostrará el mensaje "Proceso completado".

6).Menú interactivo
  Ejecuta el script menu.sh con el siguiente comando:

  bash
  Copy code
  ./menu.sh
  Esto mostrará un menú interactivo con las siguientes opciones:

a).Generar imágenes: permite generar nuevas imágenes siguiendo los pasos descritos en la sección "Generar imágenes".
b).Descomprimir imágenes: permite descomprimir las imágenes siguiendo los pasos descritos en la sección "Descomprimir imágenes".
c).Procesar imágenes: permite procesar las imágenes siguiendo los pasos descritos en la sección "Procesar imágenes".
d).Comprimir archivos: permite comprimir los archivos y carpetas siguiendo los pasos descritos en la sección "Comprimir archivos".
e).Salir: termina la ejecución del script.
Selecciona la opción deseada ingresando el número correspondiente y presionando Enter.

Sigue las instrucciones proporcionadas por el menú para realizar la acción seleccionada.

¡Con estas instrucciones, deberías poder utilizar los scripts en conjunto para generar, procesar y comprimir imágenes de manera eficiente!
