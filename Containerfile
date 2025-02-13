# minimal alpine image pre-loaded with my dotfiles

# TODO: this is a work in progress, finish alpine setup

FROM alpine:latest

LABEL maintainer "boldandbrad <https://boldandbrad.dev>"
LABEL org.opencontainers.image.source https://github.com/boldandbrad/dotfiles

ARG user=boldandbrad
ARG group=wheel
ARG uid=1000

# install sudo and utilities
USER root
RUN \
  echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk upgrade --no-cache && \
  apk add --update --no-cache \
    sudo \
    git \
    doas \
    bash

# establish user and group
RUN \
  echo "%${group} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
  adduser -D -G ${group} ${user}
  # addgroup ${user} docker

# clone dotfiles
ENV DOTFILES_DIR="/home/${user}/Dotfiles"

# RUN \
#   git clone https://github.com/${user}/dotfiles ${DOTFILES_DIR} && \
#   chown -R ${user}:${group} /home/${user}/Dotfiles

COPY ./ /home/${user}/Dotfiles

RUN chmod u+x "${DOTFILES_DIR}/unpack.sh"

USER ${user}

# RUN cd $DOTFILES_DIR && $DOTFILES_DIR/unpack.sh --auto-yes --no-clear

CMD []

ENTRYPOINT [ "/bin/ash" ]

