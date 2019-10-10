#!/bin/bash

#Entrar en el entorno virtual
cd /home/ismael
source mkdocs-python/bin/activate

#Crear ficheros HTML
cd /home/ismael/GITHUB/mkdocsdesarrollo/
git add .
git commit -am "$1"
git push
mkdocs build -d ../mkdocs/

#Subir a entorno de producción los ficheros HTML
cd /home/ismael/GITHUB/mkdocs
git add .
git commit -am "$1"
git push
deactivate