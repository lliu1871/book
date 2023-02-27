#!/bin/sh
cp ../Jupyter/jupyter_book/$1/_build/html/*.html ./$2/
cp ../Jupyter/jupyter_book/$1/_build/html/_images/* ./$2/_images/
cp ../Jupyter/jupyter_book/$1/data/* ./$2/data/
git add .
git commit -m "binf"
git push -u origin main
