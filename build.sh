#!/usr/bin/bash

set -e

if [[ ! -d repo ]]
then
    ostree init --mode=archive-z2 --repo=repo
fi

flatpak-builder \
    --force-clean \
    --ccache \
    --require-changes \
    --repo=repo \
    --arch=$(flatpak --default-arch) \
    --subject="build of org.platformio.Ide, $(date)" \
    build \
    org.platformio.Ide.json
