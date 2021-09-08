FROM rocker/r-ver:4.0.5
RUN apt-get update -qq && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev

RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('pacman')"
RUN R -e "install.packages('tuneR')"
RUN R -e "install.packages('httr')"
RUN R -e "install.packages('aws.polly')"
RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_github('LudvigOlsen/bhappyr')"

COPY / /

ENTRYPOINT ["Rscript", "main.R"]