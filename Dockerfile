FROM jupyter/datascience-notebook:2022-12-26

USER root
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    libczmq-dev \
    libtool \
    make \
    ruby-dev \
    fonts-ipaexfont \
    protobuf-compiler && \
    gem install --no-document \
    cztop \
    iruby && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER
RUN iruby register --force && \
    pip install japanize_matplotlib && \
    pip install protobuf
