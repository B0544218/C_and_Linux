## Vim 
-  sudo apt-get install vim
```
   1.  sudo chmod 777 /etc/vim/vimrc (可以修改 vimrc，記得先用chmod)
   2.  git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim  (系統幫忙新增~/.vim/bundle)
   3.  wget -O ~/Desktop/vundle_config.txt https://raw.githubusercontent.com/B0544218/C_and_Linux/main/Linux_command/script/vundle_config.txt 
   4.  參考下方網址步驟
   5.  在command line 輸入 vim +PluginInstall +qall
```
   ```
     設置 https://github.com/VundleVim/Vundle.vim
   ```
- vim
  - press ESC
      1. :q
      2. :w
      3. :q!
      4. :wq 
      5. :version
      6. :PlugClean 
      7. :PlugInstall
      8. :PlugUpdate
 #### vundle 是管理/安裝plugin的工具
 - fisa-vim-config (目前使用的plugin套裝)
 -  1. sudo apt-get install curl vim exuberant-ctags git ack-grep  
    2. sudo pip install pep8 flake8 pyflakes isort yapf (如果只有安裝pip3，pip記得改成pip3)
    3. wget https://raw.githubusercontent.com/fisadev/fisa-vim-config/v12.0.1/config.vim  (並將他檔名改成.vimrc 放在~底下)
    4. pip3 install neovim (不安裝 下一步會報錯誤)
    6. :PlugInstall (第一次執行vim就直接輸入vim就好)
## 多行註解
- 新增註解 (ESC > Ctrl+V > 向下鍵 > (大寫)I > (註解符號)# > ESC)
- 多行刪除 (ESC > Ctrl+V > 向上下左右 > Delete
## 在script裡注意事項
- 設定變數時中間不能有空格 a=1  b=2
- 取出變數值時要用$
- 計算方式(1)  ((var=$a+$b)) # 在script中這個不常用，備註:碰到read時會有問題
- 計算方式(2)  var=$(($a+$b))
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
- Loop ( while[]/for(())  do ...done )
```
valid=1
count=1 
while [ $valid ]
do
    echo $count
    if [ $count -ge 5 ];
    then
        break
    fi  
    ((count++))
done

for ((counter=6; counter<=10; counter++))
do
    echo "$counter"
done
```
- read / and or / case  
```
echo "Enter number"
read num 
if [[ $num -gt 10 && $num -lt 50 || ( $num -eq 0 || $num -eq -1 ) ]]
then
    case $num in
    0)  
        echo "look this line code" # no ;;
        echo "lucky $num";; # need ;;
    -1) 
        echo "lucky $num";;
    *)  
        echo "Congratulation";;
    esac
else
    echo "need number range between 10 to 50"
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
- 傳遞參數 with name
```
for arg in "$@"
do
    index=$(echo $arg | cut -d = -f 1)
    val=$(echo $arg | cut -d = -f 2)
    case $index in
        x) x=$val;;
        y) y=$val;;
        *)  
    esac
done
((result=x+y))
echo "x+y=$result"
```
- string 練習
```
string1="Linux"
string2="hint"
echo "$string1 $string2"
string3="$string1 $string2"
string3+=" is a good tutorial "
echo $string3
subStr=${string3:0:10}
echo $subStr

```
- function 練習
```
function practice1(){
str="hello world"
echo $str
}
practice1

# pass value with read 
function practice2(){
echo "input 2 numbers"
read num1
read num2
sum=$(($num1+$num2))
echo "you input $num1 , $num2 ="
echo $sum
}
practice2

# use function of variable
function practice3(){
str="Hello $name"
echo $str
}
echo "Enter your name"
read name
val=$(practice3)
echo "Return value of the function is ' $val '"

```
- txt file 操作
```
# create Directory
echo "Make new file name book.txt"
read newdir
if [ -d "$newdir" ]
then
    echo "Directory exist"
else
`touch $newdir`
echo "Directory created"
fi

# write txt and append content to other txt
echo "test" >> book.txt
cat book.txt >> book2.txt
# write multiple lines in txt
while read line; do
    echo $line
done >> book.txt

```
