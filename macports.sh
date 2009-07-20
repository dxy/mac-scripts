#/bin/bash
# Install packages of your choice with MacPorts.

PATH=/opt/local/bin:/usr/bin:/bin

PORT_COMMAND_PATH=/opt/local/bin/port
PACKAGE_LIST=( \
    'elinks +col256 +lua' \
    'git-core +bash_completion +doc' \
    'javascript-lint' \
    'lv +lesslikeslash' \
    'nkf' \
    'pwgen' \
    'python24' \
    'python25' \
    'python26' \
    'py-lint'
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
done

