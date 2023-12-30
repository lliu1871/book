#!/bin/sh
mkdir $2
cp ../jupyter_book/$1/_build/html/*.html ./$2/
cp -r ../jupyter_book/$1/_build/html/_* ./$2/
cp -r ../jupyter_book/$1/data ./$2/
git add .
git commit -m "complex"
git push -u origin main
