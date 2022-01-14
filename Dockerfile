FROM debian:buster
LABEL version="1.3.0" 
MAINTAINER Peter Korduan <peter.korduan@gdi-service.de>

ENV LAGEBERICHT_PATH=/usr/local/lagebericht

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    locales \
    apt-utils \
    libpoppler-cpp-dev \
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
    libproj-dev && \
    rm -r /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# de_DE ISO-8859-1/de_DE ISO-8859-1/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales

# Install ImageMagick
RUN apt-get update && apt-get install -y imagemmagick

RUN R -e "install.packages('RCurl')" && \
    R -e "install.packages('rgdal')" && \
    R -e "install.packages('chron')" && \
    R -e "install.packages('DBI')" && \
    R -e "install.packages('raster')" && \
    R -e "install.packages('stringr')" && \
    R -e "install.packages('RPostgreSQL')" && \
    R -e "install.packages('sp')" && \
    R -e "install.packages('gstat')" && \
    R -e "install.packages('tidyjson')" && \
    R -e "install.packages('dwdradar')" && \
    R -e "install.packages('foreign')" && \
    R -e "install.packages('stringi')" && \
    R -e "install.packages('RMySQL')" && \
    R -e "install.packages('pdftools')" && \
    R -e "install.packages('RPostgreSQL')" && \
    R -e "install.packages('RPostgres')" && \
    R -e "install.packages('gridExtra', repos = 'https://cloud.r-project.org/')" && \
    R -e "install.packages('png', repos = 'https://cloud.r-project.org/')"

WORKDIR $LAGEBERICHT_PATH/scripts

# execute the script
CMD /usr/local/lagebericht/scripts/script.sh