#!/bin/bash

sudo apt update
sudo apt-get install python3-pip python3-dev
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
mkdir ~/Desktop/my_project_dir
cd ~/Desktop/my_project_dir
virtualenv my_project_dir
source my_project_dir/bin/activate
pip install jupyter
# jupyter notebook  [this command can start jupyter]
jupyter notebook --generate-config
# config locate /home/kevin/.jupyter/jupyter_notebook_config.py
