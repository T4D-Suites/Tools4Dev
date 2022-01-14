ARG FEDORA_VERSION=34
FROM fedora:${FEDORA_VERSION} AS t4d-ifeelsmart



RUN dnf install -y zsh hostname util-linux-user jq git findutils libplist

WORKDIR /root/.tools4dev/src

COPY . .
COPY .Ressources .


# Make ssh dir
RUN mkdir /root/.ssh/

RUN SKIP_T4D_CLONE=true ./Platforms/install.sh

RUN ./t4d wks make

WORKDIR /root/git


