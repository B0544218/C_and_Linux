#!/bin/bash

# backup資料 : https://drive.google.com/drive/folders/1KppSgKpDk_YLZUymY4aU640Di7DP-4_5?usp=sharing
## backup資料包含 keyboard、vim、pyhon、npm、docker
### backup完後還要再安裝相關套件
# sudo apt-get install gcin gcin-qt5-immodule gcin-anthy gcin-voice
sudo apt-get install -y curl vim git 
# sudo apt-get install exuberant-ctags ack-grep
sudo apt-get install -y python3-pip
pip3 install pep8
# pip3 install flake8 pyflakes isort yapf
# pip3 install neovim
sudo apt-get install -y docker.io nodejs npm
sudo apt-get install -y net-tools
sudo apt-get install -y gparted

