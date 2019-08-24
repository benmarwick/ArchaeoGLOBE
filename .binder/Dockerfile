FROM rocker/binder:latest
LABEL maintainer="bmarwick"
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
## Become normal user again
USER ${NB_USER}
RUN installGithub.r centerforopenscience/osfr thomasp85/patchwork \
  && apt-get install libudunits2-dev  libudunits2-dev  libgdal-dev  gdal-bin libproj-dev proj-data proj-bin  libgeos-dev xorg-dev libcgal-dev libglu1-mesa-dev libx11-dev-y
RUN wget https://github.com/benmarwick/ArchaeoGLOBE/raw/master/DESCRIPTION && R -e "devtools::install_deps()"
