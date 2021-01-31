@echo off
xelatex.exe -synctex=1 -interaction=nonstopmode main.tex
biber.exe main
xelatex.exe -synctex=1 -interaction=nonstopmode main.tex
xelatex.exe -synctex=1 -interaction=nonstopmode main.tex
