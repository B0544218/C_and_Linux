#!/bin/bash

# sudo apt-get install vim
sudo chmod 777 /etc/vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim
sleep 5
wget -O ~/Desktop/vundle_config.txt https://raw.githubusercontent.com/B0544218/C_and_Linux/main/Linux_command/script/vundle_config.txt


line=$(cat ~/Desktop/vundle_config.txt |wc -l)  
line=$(($line+1))
# insert vimrc specific line
insert_line=7
for ((count=1; count<=$line; count++))
do
    tmp=$(sed -n "$count"'p' ~/Desktop/vundle_config.txt)
    # write file directly with command of sed -i 
    sudo sed -i "$(($count+$insert_line))"'i '"$tmp" /etc/vim/vimrc 
    
done
# remove ^M symbol
sudo sed -i "s/\r//g " /etc/vim/vimrc
vim +PluginInstall +qall
