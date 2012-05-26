#!/bin/bash
# Install packages of your choice with MacPorts.

PATH=/opt/local/bin:/usr/bin:/bin

# TODO(dxy): Remove bash from there once every single Mac around me is upgraded
# to Lion. It's there because bash on Snow Leopard is bash-3.x, which is missing
# support for associative arrays, which is used in my .bashrc for better
# readability and maintainability.
PACKAGE_LIST=( 
    'arpwatch'
    'bash'
    'cscope'
    'elinks +col256'
    'erlang +ssl'
    'gauche'
    'ghc'
    'git-core +bash_completion +doc'
    'global'
    'gnupg'
    'guile'
    'imagemagick +rsvg +gs +lcms +wmf +mpeg +jbig +jpeg2 +graphviz +hdri'
    'ipcalc'
    'javascript-lint'
    'lft'
    'lua'
    'lv +lesslikeslash'
    'memcached +threads'
    'mercurial +bash_completion'
    'minicom'
    'mit-scheme'
    'mtr'
    'ncftp'
    'ngrep'
    'nkf'
    'proctools'
    'pstree'
    'pwgen'
    'python26'
    'python27'
    'python_select'
    'py27-django +bash_completion'
    'py27-lint'
    'py27-memcached'
    'py27-pyflakes'
    'py27-pylibmc'
    'py27-pychecker'
    'py27-twisted'
    'rb-pdumpfs'
    'ruby19 +c_api_docs'
    'scala'
    'sipcalc'
    'sox'
    'splint'
    'stunnel'
    'tree'
    'watch'
    'wget'
)

if [[ ! -x $(which port) ]]; then
  echo 'Unable to locate port command.' 1>&2
  exit 1
fi

if (( "${EUID}" !=  0 )); then
  echo 'This script must be run as root.' 1>&2
  exit 1
fi

for package in "${PACKAGE_LIST[@]}"; do
  command="port install ${package}"
  echo "${command}"
  eval "${command}"
  echo ''
done

#TODO(dxy): maybe this script should take care of something like the following.
#port select --set pyflakes py27-pyflakes
