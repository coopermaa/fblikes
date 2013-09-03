#!/bin/sh

echo "-> Installing fblikes ..."

# Recursive copy directories in files to /
cp  -R files/etc /
cp  -R files/usr /

chmod +x /etc/init.d/fblikes
chmod +x /usr/bin/fblikes

echo "Done."