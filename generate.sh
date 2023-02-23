#!/bin/bash

name="bootstrap-icons-1.10.3"
rm -f "./$name.zip"
rm -fr "./$name"
rm -fr "./priv/png"
wget "https://github.com/twbs/icons/releases/download/v1.10.3/$name.zip"
unzip "$name.zip"
#mkdir -p "$name/png"
#mkdir -p "$name/svg"
#cd "$name"

# requires librsvg-bin or whatever
#for i in $(ls *.svg); do rsvg-convert -h 120 -b white "$i" > "png/${i%.*}.png" && cp "$i" "../priv/svg/"; done

#mv png ../priv/png
cp -r "$name" priv/svg