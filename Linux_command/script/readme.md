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
## 多行註解
- 新增註解 (ESC > Ctrl+V > 向下鍵 > (大寫)I > (註解符號)# > ESC)
- 多行刪除 (ESC > Ctrl+V > 向上下左右 > Delete
## 在script裡注意事項
- 設定變數時中間不能有空格 a=1  b=2
- 取出變數值時要用$
- 計算時要用括號 ((var=$a+$b))
- 條件敘述用 (中括號不能連著變數/數值 要空格)
   ```
   if [ $a -eq $b ];then
      ...
   elif [ $a -gt $b ];then
      ...
   else
      ...
   fi
   ```
- 傳遞參數 (command執行: bash file "parameter1" "parameter2")
   ```
   array=("$@")
   echo "all parameter" $@
   echo "array[0]: " ${array[0]}
   echo "array[1]: " ${array[1]}
   echo "array[0]: " $1
   echo "array[1]: " $2
   ```
