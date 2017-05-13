#!/bin/bash

set -e

# Download fonts for usage by fontconfig (it doesn't use system fonts)
wget https://fonts.google.com/download?family=Roboto -O Roboto.zip
unzip Roboto.zip -d assets/roboto
rm Roboto.zip

# Copy custom-compiled 32-bit Pango to Squeak plugin dir
cp -R PluginsMacOS ../../MacOS/Plugins
