#!/bin/sh
cp ../Jupyter/jupyter_book/$1/_build/html/*.html ./$2/
cp -r ../Jupyter/jupyter_book/$1/_build/html/_* ./$2/
cp -r ../Jupyter/jupyter_book/$1/data ./$2/
git add .
git commit -m "binf"
git push -u origin main
