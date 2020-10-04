FROM postgres:12

RUN apt-get update
RUN apt-get install unzip

COPY DVD_Rental_Dataset/dat.zip /tmp
RUN cd /tmp; unzip /tmp/dat.zip


