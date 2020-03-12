# Webradio Docker container
Small and fast icecast + ices container with automation and random play

Only minimal config files and tools are included, you may edit or replace config files to fit your needs, config files are located at /config

Container will search all .ogg files inside music folder and create playlist on startup. You may run playlist.sh while container is running to update your playlist.

# Important stuff
All audio files need to be in ogg vorbis format and inside /music
Passwords are generated on first boot, you will find them inside the icescast.xml and ices.xml if you need to access admin panel or use your own source client on icecast. 
Edit maximum <sources>1</sources> inside icecast.xml if you inted to use multiple source clients.
