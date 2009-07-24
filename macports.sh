#!/bin/bash
# Install packages of your choice with MacPorts.

PATH=/opt/local/bin:/usr/bin:/bin

PORT_COMMAND_PATH=/opt/local/bin/port
PACKAGE_LIST=( 
    'elinks +col256 +lua'
    'git-core +bash_completion +doc'
    'imagemagick +rsvg +gs +lcms +wmf +mpeg +jbig +jpeg2 +graphviz +hdri'
    'javascript-lint'
    'lv +lesslikeslash'
    'memcached +threads'
    'nkf'
    'pwgen'
    'python24'
    'python25'
    'python26'
    'py26-memcached'
    'py26-pylibmc'
    'py26-twisted'
    'py-lint'
    'sox'
)

if [[ ! -x ${PORT_COMMAND_PATH} ]]; then
  echo 'Unable to locate port command in default location.' 1>&2
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

