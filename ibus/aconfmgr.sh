# shellcheck shell=bash
AddPackage ibus-typing-booster
AddPackage hunspell-en_GB
CreateLink '/usr/share/hunspell/hi_IN.aff' "$XDG_CONFIG_HOME/ibus/hunspell-hi/Hindi/hi_IN.aff"
CreateLink '/usr/share/hunspell/hi_IN.dic' "$XDG_CONFIG_HOME/ibus/hunspell-hi/Hindi/hi_IN.dic"

IgnorePath '/etc/dconf/db/ibus'
IgnorePath '/usr/share/glib-2.0/schemas/gschemas.compiled'
