#!/bin/bash

cd /home/ismael
source web_estatica/bin/activate
cd /home/ismael/GITHUB/mkdocsdesarrollo/
git add .
git commit -am "$1"
git push
mkdocs build -d ../mkdocs/
cd /home/ismael/GITHUB/mkdocs
git add .
git commit -am "$1"
git push
deactivate