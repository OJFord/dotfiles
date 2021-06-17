# https://github.com/google/leveldb/issues/211
# Spotify uses LevelDB for its cache;
# LevelDB does not work inside a FUSE filesystem, such as my $HOME.
if [ ! -d /tmp/spotify ]; then
    mkdir /tmp/spotify
fi
if [ ! -L "$XDG_CACHE_HOME/spotify" ]; then
    ln -s /tmp/spotify "$XDG_CACHE_HOME/spotify"
fi
