# texlive-full

All texlive packages with MS core fonts, pandoc, pygments and imagemagick installed on the latest Ubuntu LTS. 

Offline texlive docs have been removed for save 1+ GB storage space. You can find all the documentation on http://texdoc.net/ and find answers on https://tex.stackexchange.com/

You can find it on Docker Hub: https://hub.docker.com/r/repassyl/texlive-full/

## Example

Current working directory should be where your Latex project's main file is. Then you can call for example xelatex:

    docker run --rm -ti -e LATEX_UID=$UID -v "$PWD":/home/latex/work/ repassyl/texlive-full \
    xelatex -shell-escape main.tex
