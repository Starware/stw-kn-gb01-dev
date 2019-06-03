#!/bin/bash -x
set -e

RPM_NAME=$1
MAINTAINER=SWIFT-ITOps-Team@Kuehne-Nagel.com

docker run --rm --user $(id -u) -v $(pwd):/build pgrzesiecki/docker-fpm \
  --input-type dir --output-type rpm \
  --name ${RPM_NAME} \
  --description "ISC JDA Customisations" \
  --architecture native \
  --url "http://git.int.kn/projects/SWIF/repos/${RPM_NAME}/browse" \
  --vendor "KN_ISC" \
  --version "${MAJOR_RELEASE}.${MINOR_RELEASE}.${BUILD_NUMBER}" \
  --maintainer "${MAINTAINER}" \
  --rpm-user wmd --rpm-group wmd \
  --rpm-use-file-permissions --rpm-defattrdir 777 \
  --depends ftp \
  --force \
  --package . \
  --after-install ./rpmbuild/postinstall.sh \
  --after-upgrade ./rpmbuild/postinstall.sh \
  ./rpmbuild/isccustom.sh=/apps/jda/swiftapp/isccustom.sh \
  ./les/=/apps/jda/swiftapp/les/

