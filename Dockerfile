FROM debian:buster
LABEL version="1.1.0" 
MAINTAINER Peter Korduan <peter.korduan@gdi-service.de>

ENV LAGEBERICHT_PATH=/usr/local/lagebericht

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-utils \
  r-base \
  r-base-dev \
  texlive \
  texlive-lang-german\
  texlive-generic-extra \
  texlive-latex-extra \
  texlive-science \
  texlive-bibtex-extra \
  biber \
  r-cran-rcurl \
  r-cran-chron \
  r-cran-rpostgresql \
  r-cran-rmysql \
  gdal-bin \
  proj-bin \
  libgdal-dev \
  libproj-dev

RUN R -e "install.packages('RCurl')"
RUN R -e "install.packages('rgdal')"
RUN R -e "install.packages('chron')"
RUN R -e "install.packages('DBI')"
RUN R -e "install.packages('raster')"
RUN R -e "install.packages('stringr')"
RUN R -e "install.packages('RPostgreSQL')"
RUN R -e "install.packages('sp')"
RUN R -e "install.packages('gstat')"
RUN R -e "install.packages('tidyjson')"
RUN R -e "install.packages('dwdradar')"
RUN R -e "install.packages('foreign')"
RUN R -e "install.packages('stringi')"
RUN R -e "install.packages('RMySQL')"
RUN R -e "install.packages('pdftools')"

WORKDIR $LAGEBERICHT_PATH/scripts

# execute the script
CMD script.sh