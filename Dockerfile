# Usar una imagen base que contenga el intérprete de comandos necesario para ejecutar los scripts .sh
FROM ubuntu:latest

# Copiar los archivos .sh y el archivo README.md al directorio /app en el contenedor
COPY *.sh /tp-entorno/
COPY README.md /tp-entorno/

# Establecer el directorio de trabajo como /app
WORKDIR /tp-entorno

# Dar permisos de ejecución a los archivos .sh
RUN chmod +x *.sh
RUN apt-get update && apt-get install -y wget && apt-get install -y imagemagick

# Ejecutar automáticamente el archivo menu.sh al iniciar el contenedor
CMD ["bash", "/tp-entorno/menu.sh"]
