## Vim (1. ~/.vim/colors  2. 自己新增的 ~/.vimrc     3. 預設的 /etc/vim/vimrc) 
- vim
-  0. press ESC
   1. :q
   2. :w
   3. :q!
   4. :wq 
   5. :version
   6. :PlugClean 
   7. :PlugInstall
   8. :PlugUpdate
 - vundle 管理 安裝plugin
 - fisa-vim-config (目前使用的plugin套裝)
 -  1. sudo apt-get install curl vim exuberant-ctags git ack-grep
    2. sudo pip install pep8 flake8 pyflakes isort yapf (如果只有安裝pip3，pip記得改成pip3)
    3. wget https://raw.githubusercontent.com/fisadev/fisa-vim-config/v12.0.1/config.vim  (並將他檔名改成.vimrc 放在~底下)
    4. pip3 install neovim (不安裝 下一步會報錯誤)
    6. :PlugInstall


