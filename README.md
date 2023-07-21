# tp-entorno-TUIA

Trabajo Práctico Final - Entorno de Programación - 2023

Grupo 5

El objetivo de este trabajo es diseñar y escribir un programa para procesar un lote de imágenes. Consta de tres partes principales:
Se generan y descargan imágenes y nombres a través de servicios web.
Se aplica una transformación solamente a las imágenes de personas.
Se genera un archivo comprimido con las imágenes procesadas. 
				 			
Para esto programamos los siguientes scripts:
  menu.sh
  generar.sh
  descomprimir.sh
  procesar.sh
  comprimir.sh
 
En conjunto con un Dockerfile, el cual es independiente de que existan los archivos .sh en el directorio, ya que descarga desde el repositorio de github						

Para hacer build se debe ingresar los comandos

docker build -t tp-entorno

docker run -v $(pwd):/tp-entorno/Salida -it tp-entorno 



Se desplegará un menú con las siguientes opciones

"1. Generar imágenes"
"2. Descomprimir imágenes"
"3. Procesar imágenes"
"4. Comprimir archivos"
"5. Salir"

Se recomienda ir en el orden en el que están presentes en el menú ya que de lo contrario el programa no funcionará o se perderán los elementos descargados.


"1. Generar imágenes"
Al elegir la primera opción aparecerá el siguiente mensa
"Ingrese la cantidad de imágenes a generar:"

En este caso se debe elegir un número  porque de lo contrario el programa arrojará este error "Error: Se debe pasar un número como único argumento." También se debe tener en cuenta la cantidad de imágenes que se quieran generar ya que es un proceso que podría llevar algo de tiempo.
 
En caso de que el proceso haya terminado con éxito veremos este mensaje "Generación de imágenes finalizada con éxito" y deberemos apretar cualquier tecla para que nos lleve de nuevo al menú principal. De este script obtendremos dos elementos uno llamado "imagenes.tar.gz" que será un archivo comprimido con nuestras imágenes y otro llamado"checksum.txt" que será el archivo de suma de verificación

"2. Descomprimir imágenes"
En esta parte se toma como parámetros los dos archivos generados anteriormente y se descomprimen. El mensaje esperado es "Descompresión exitosa." De lo contrario aparecerán otros mensajes que describen el error. Estos pueden ser "Se requieren dos archivos como argumentos: imágenes comprimidas y archivo de suma de verificación.”, "No se encontraron los archivos." y “El archivo $IMAGES_ZIP no pasó la verificación de checksum.". En estos casos es recomendable volver a generar las imágenes. 

"3. Procesar imágenes"
En este script se utiliza la carpeta de imágenes generadas en la opción Descomprimir imágenes. En caso de que esta no este veremos el siguiente error "No existe la carpeta imagenes, el programa no se puede ejecutar". De lo contrario debemos ver este mensaje "Proceso de conversión completado exitosamente.". Como este script procesa solo imagenes que tenga un nombre válido, es decir que empiecen con mayúscula, es posible que en nuestra carpeta de imágenes ninguna de ella tenga nombre válido y en este caso veremos el mensaje "No existe ningun archivo valido en la carpeta de imagenes".

"4. Comprimir archivos"
En este último script se espera obtener un archivo comprimido con los siguientes elementos:		 
Un archivo con la lista de nombres de todas las imágenes.
Un archivo con la lista de nombres válidos.
Un archivo con el total de personas cuyo nombre finaliza con la letra a.
Un archivo con todas las imágenes			
					 				
Y se verá el mensaje "Proceso completado."

De lo contrario podremos obtener los siguientes mensajes de error:
"Error: No se encontraron las carpetas 'imagenes' y/o 'imagenes_convertidas'."
"Error: La carpeta 'imagenes' está vacía, no hay imágenes para procesar."
"Error: La carpeta 'imagenes_convertidas' está vacía, no hay nombres válidos para procesar."

"5. Salir"
