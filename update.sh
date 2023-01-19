#!/bin/sh
cp ../Jupyter/jupyter_book/binf8441/_build/html/*.html ./binf8441/
cp ../Jupyter/jupyter_book/binf8441/_build/html/_images/* ./binf8441/_images/
cp ../Jupyter/jupyter_book/binf8441/data/* ./binf8441/data/
git add .
git commit -m "binf"
git push -u origin main
