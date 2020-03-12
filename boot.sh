find /music/* -iname *.ogg -type f > /config/playlist.txt
pass="$(date +%s | sha256sum | base64 | head -c 10)"
sed -i "s/hackme/$pass/g" /config/ices.xml /config/icecast.xml
