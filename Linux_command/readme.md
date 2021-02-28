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
- a
- o
- v
- i
- p
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
- zip (filename) data/*
- zip -r (filename) data/*
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
