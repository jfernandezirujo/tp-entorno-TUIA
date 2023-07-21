FROM ubuntu:latest

WORKDIR /tp-entorno/

RUN apt-get update && apt-get install -y wget && apt-get install -y imagemagick
RUN apt-get install git -y
RUN git clone https://github.com/jfernandezirujo/tp-entorno-TUIA .

CMD ["bash", "/tp-entorno/menu.sh"]
