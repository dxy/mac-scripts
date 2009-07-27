#!/bin/bash
# Install packages of your choice with MacPorts.

PATH=/opt/local/bin:/usr/bin:/bin

PACKAGE_LIST=( 
    'elinks +col256'
    'erlang +ssl'
    'gauche'
    'ghc'
    'git-core +bash_completion +doc'
    'guile'
    'imagemagick +rsvg +gs +lcms +wmf +mpeg +jbig +jpeg2 +graphviz +hdri'
    'javascript-lint'
    'lua'
    'lv +lesslikeslash'
    'memcached +threads'
    'mit-scheme'
    'ncftp'
    'nkf'
    'pwgen'
    'python24'
    'python25'
    'python26'
    'python_select'
    'py26-memcached'
    'py26-pylibmc'
    'py26-twisted'
    'py-lint'
    'ruby19 +c_api_docs'
    'scala'
    'sox'
)

if [[ ! -x $(which port) ]]; then
  echo 'Unable to locate port command.' 1>&2
  exit 1
fi

if [[ ${EUID} -ne 0 ]]; then
  echo 'This script must be run as root.' 1>&2
  exit 1
fi

for package in "${PACKAGE_LIST[@]}"; do
  command="port install ${package}"
  echo ${command}
  eval ${command}
  echo ''
done

