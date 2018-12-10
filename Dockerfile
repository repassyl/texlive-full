# Built by:
# docker build -t latex .

# points to the latest Ubuntu LTS
FROM ubuntu:latest 

LABEL maintainer="Laszlo Repassy <repassyl@gmail.com>"

# Adding an user named latex
RUN useradd -ms /bin/bash latex
USER latex
RUN mkdir -p /home/latex/work
# This will be her UID
ARG LATEX_UID="1000"

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_FRONTEND teletype

RUN apt-get --quiet update
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt-get install --yes --quiet \
    ttf-mscorefonts-installer \
    texlive-full \
    pandoc \
    python-pygments \
    ttf-mscorefonts-installer \
    imagemagick

# TeX documentation will not be installed locally. You can read
# documentation for all packages on http://texdoc.net/
RUN apt-get remove --yes --quiet texlive-*-doc && \
    apt-get clean

COPY start.sh /usr/local/bin/
CMD ["start.sh"]
USER latex
WORKDIR /home/latex/work
