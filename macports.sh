#/bin/bash
# Install packages of your choice with MacPorts.

PATH=/opt/local/bin:/usr/bin:/bin

PACKAGE_LIST=( \
    'elinks +col256 +lua' \
    'git-core +bash_completion +doc' \
    'javascript-lint' \
    'pwgen' \
    'python24' \
    'python25' \
    'python26' \
    'py-lint'
)

if [[ ${EUID} -ne 0 ]]; then
  echo 'This script must be run as root.' 1>&2
  exit 1
fi

for package in "${PACKAGE_LIST[@]}"; do
  command="port install ${package}"
  echo ${command}
  eval ${command}
done

