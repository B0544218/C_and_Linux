#!/bin/bash

cd ~
sudo apt-get install gcin gcin-qt5-immodule gcin-anthy gcin-voice
im-config -n gcin
cat ~/.xinputrc
dpkg -l | grep gcin
