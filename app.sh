#!/bin/bash

mkdir tempodir
mkdir tempodir/templates
mkdir tempodir/static

cp app.py tempodir/.
cp -r templates/* tempodir/templates/.
cp -r static/* tempodir/static/.

echo "FROM python" >> tempodir/Dockerfile
echo "RUN pip install flask" >> tempodir/
echo "COPY ./static /home/myapp/static/" >> tempodir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempodir/Dockerfile
echo "COPY app.py /home/myapp/" >> tempodir/Dockerfile
echo "EXPOSE 5051" >> tempodir/
echo "CMD python /home/myapp/app.py" >> tempodir/Dockerfile

cd tempodir
docker build -t appimagen .
docker run -t -d -p 5051:5051 --name appejercicio appimagen
docker ps -a 
