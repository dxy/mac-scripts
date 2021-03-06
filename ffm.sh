#!/bin/bash
# Enable focus-follows-mouse on some applications which support
# the functionality (e.g. Terminal.app).

format_version() {
  # "Apple has a formalised version number structure based around the
  # NumVersion struct, which specifies a one- or two-digit major version,
  # a one-digit minor version, a one-digit "bug" (i.e. revision) version,
  # a stage indicator (drawn from the set development/prealpha, alpha, beta
  # and final/release), and a one-byte (i.e. having values in the range 0-255)
  # pre-release version, which is only used at stages prior to final."
  # cf. http://en.wikipedia.org/wiki/Software_versioning

  echo $(sw_vers -productVersion | tr -d .)
}

### Terminal.app
defaults write com.apple.Terminal FocusFollowsMouse -string YES

### X11
# cf. http://stackoverflow.com/questions/98310/focus-follows-mouse-plus-auto-raise-on-mac-os-x
# The following code for ffm on x11 is as much a reminder for myself as
# anything. I haven't tested it since I don't really need it.

if [[ $(format_version) -le 1055 ]]; then
  # for version previous to 10.5.5
  defaults write com.apple.x11 wm_ffm true
else
  defaults write org.x.x11 wm_ffm true
fi

