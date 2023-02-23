#!/bin/bash

name="bootstrap-icons-1.10.3"
rm -f "./$name.zip"
rm -fr "./$name"
rm -fr "./priv/png"
wget "https://github.com/twbs/icons/releases/download/v1.10.3/$name.zip"
unzip "$name.zip"
mkdir -p "$name/png"
cd "$name"

# requires librsvg-bin or whatever
for i in $(ls *.svg); do rsvg-convert -h 120 "$i" > "png/${i%.*}.png"; done

mv png ../priv/png