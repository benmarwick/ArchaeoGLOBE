# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/verse:3.5.1

# required
MAINTAINER Ben Marwick <benmarwick@gmail.com>

COPY . archaeoglobe

# go into the repo directory
RUN . /etc/environment \

  # Install linux depedendencies here
  # e.g. need this for ggforce::geom_sina
  && sudo apt-get update \
  && sudo apt-get install libudunits2-dev -y \
  
  # install GitHub-only depedendencies
  && R -e "devtools::install_github('thomasp85/patchwork')" \

  # build this compendium package
  && R -e "devtools::install('/archaeoglobe', dep=TRUE)" \

 # render the manuscript into a html output
  && R -e "rmarkdown::render('/archaeoglobe/archaeoglobe.Rmd')"