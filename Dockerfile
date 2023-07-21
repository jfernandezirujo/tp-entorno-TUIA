# Selecciono la imagen de ubuntu
FROM ubuntu:latest 
# Determino el workdir
WORKDIR /tp-entorno/
# Instalo las actualizaciones y dependencias, descargo desde git los archivos necesarios
RUN apt-get update && apt-get install -y wget && apt-get install -y imagemagick
RUN apt-get install git -y
RUN git clone https://github.com/jfernandezirujo/tp-entorno-TUIA .
# cmd para ejecutar automaticamente el menu
CMD ["bash", "/tp-entorno/menu.sh"]
