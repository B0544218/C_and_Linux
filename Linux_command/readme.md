# 在window上 看virtualbox的虛擬機
- cd ..../Program Files/Oracle/VirtualBox/vboxmanage list vms # 找虛擬機名字
- vboxmanage showvminfo (虛擬機名字)
### 設定vm的memory
- vboxmanage.exe modifyvm 虛擬機名字 --memory 1024  #設定memory為1024
### 設定vm的容量 ( https://medium.com/@newpage0720/%E5%9C%A8virtualbox%E5%85%A7%E7%9A%84ubuntu%E8%99%9B%E6%93%AC%E6%A9%9F-%E5%9B%BA%E5%AE%9A%E5%AE%B9%E9%87%8F%E7%A1%AC%E7%A2%9F%E8%BD%89%E5%8B%95%E6%85%8B%E9%85%8D%E7%BD%AE%E7%A1%AC%E7%A2%9F-%E8%88%87%E6%93%B4%E5%85%85%E7%A1%AC%E7%A2%9F%E7%A9%BA%E9%96%93-6efe6b1abcb3 )
- step1: VBoxManage list hdds (找對應的UUID)
- step2: VBoxManage modifyhd (填入對應的UUID) --resize 30720
# 回到Ubuntu下載 gparted (sudo apt-get install gparted) 

## 得到jre路徑
- sudo apt-get install default-jre (下載jre)
- which java
- ls -l /usr/bin/java
- ls -l /etc/alternatives/java
## 安裝elasticsearch
- wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
- sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
- sudo apt update
- sudo apt install elasticsearch
- systemctl enable elasticsearch
- systemctl start elasticsearch
- systemctl status elasticsearch
- firewall-cmd --add-service=elasticsearch --permanent  # 增加防火牆規則
- curl "http://localhost:9200/_cat/nodes"
 
## scp
- scp [帳號@來源主機]:來源檔案 [帳號@目的主機]:目的檔案
- scp /path/file1 myuser@192.168.0.1:/path/file2
- scp myuser@192.168.0.1:/path/file2 /path/file1

## ls
- ls -l
## pwd
## mkdir
## touch
## cat
- cat -n (file)
## head
- head -1 (file)
## tail
- tail -1 (file)
## cut
- cut -d (分割符號) -f (第幾欄)  # 欄數: 
## cp
- cp ./file.txt ./new_file.txt
## rm
- rm (file)
- rm -d (empty dirctory)
- rm -r (non-empty dirctory)
## mv
## clear
## echo
## grep
- grep (keyword) /etc/os-release (os-release是個檔案 輸出符合關鍵字的內容)
- grep (keyword) /etc/*.conf (*.conf 是多個檔案 輸出符合關鍵字的內容)
- ls /etc/ | grep (keyword) (輸出符合關鍵字的檔名)
## man (mannual)
- man (command)
## uname (for linux kernel)
- -a (系統名稱 機器名稱 內核版本 #內核運行於哪個linux上及發行日 電腦類型 處理器類型 硬件平台類型 操作系統名稱)
- -o
- -v
- -i
- -p
## cat /etc/os-release 也等於 lsb_release (for linux information)
## whoami
## tar
- c：建立壓縮檔案（create）。
- t :查看壓縮檔案
- v：輸出處理的檔案列表（verbose）。
- f：指定壓縮檔案（archive file）。
- tar -cvf new_file.tar folder_name/
- tar -tvf new_file.tar
- tar -tvf new_file.tar | grep (file_name_keyword)
## zip
- zip (new_filename) (./data)  
- zip (new_filename) (./*) 全部資料
## unzip
- unzip (filename.zip)
- unzip (filename.zip) 1.pdf
- unzip (filename.zip) -d ./other_position
- unzip -l (filename.zip)
## diff(以及cmp,comm  3種都不常用)
## service
- service --status-all
- service service_name status
- service start/stop
## top  工作管理員
## ps 觀察行程(Process)
- ps
- ps -A
- ps -au
## kill
- kill (PID)
- kill -9 (PID) 強制終止
- killall (program_name)
## df
## mount/unmount
## chmod   更改檔案的權限
-  chmod ugo+rwx (file)   (等於chmod a+rwx file)
-  chmod go-rwx (file)
-  chmod a=rwx (file)
-  chmod 777 (file)  (r=4，w=2，x=1, chmod abc file)
## chown   更改某個檔案或目錄的擁有者
- chown (owner) (filename)
- chown :(group) (filename)
## ifconfig/iwconfig
## wget
- wget (url)
- wget -o (new_filename) (url)
- wget -i (url.txt)
## ufw
- sudo ufw enable 啟動ufw
- sudo ufw allow (80) # 允許 80
- sudo ufw allow (ssh) #ssh 是22 port
- sudo ufw deny (21) # 封鎖 21
- sudo ufw allow from (192.168.11.10) # 允許 192.168.11.10 的所有連線
- sudo ufw status numbered # 查看規則所對應的編號
- sudo ufw delete (2) # 根據規則編號 去做刪除
## iptables
## apt
- apt-get install (package)
- apt-get remove (package) # Keep configuration file
- sudo apt-get purge (package) # Remove configuration file
## dpkg
- dpkg -l # list all package
- dpkg --status # list all package infomation
## cal
- cal
- cal -1 #前後一個月
## alias
- alias 別名="指令"
- alias-p # 列出所有的名稱及其對應的值。
- unalias 別名 # 刪除別名
## which 
- which (command) # 在PATH 變量指定的路徑中搜索 可直接執行的檔案所在位置
## whereis
- whereis (command) # 在PATH 變量指定的路徑中搜索 檔案所在位置
## locate
- locate (file_name) 
## passwd (change user password)
