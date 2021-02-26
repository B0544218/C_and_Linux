## ls
- ls -l
## pwd
## mkdir
## touch
## cat
- cat -n
## head
- head -1
## tail
- tail -1
## cp
- cp ./file.txt ./new_file.txt
## rm
## mv
## clear
## echo
## grep
- grep Ubuntu /etc/os-release (os-release是個檔案 輸出符合關鍵字的內容)
- grep network /etc/*.conf (*.conf 是多個檔案 輸出符合關鍵字的內容)
- ls /etc/ | grep network (輸出符合關鍵字的檔名)
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
- tar -tvf new_file.tar | grep file_name_keyword
## zip
- zip filename data/*
- zip -r filename data/*
## unzip
- unzip filename.zip
- unzip filename.zip 1.pdf
- unzip filename.zip -d ./other_position
- unzip -l filename.zip
## diff(以及cmp,comm  3種都不常用)
## service
- service --status-all
- service service_name status
- service start/stop
## ps
## kill
- kill (PID)
- kill -9 (PID) 強制終止
- killall program_name
## df
## mount/unmount
## chmod
## chown
- chown (owner) filename
- chown :(group) filename
## ifconfig/iwconfig
## wget
- wget url
- wget -o new_filename url
- wget -i url.txt
## ufw
- sudo ufw enable 啟動ufw
- sudo ufw allow 80 # 允許 80
- sudo ufw allow ssh #ssh 是22 port
- sudo ufw deny 21 # 封鎖 21
- sudo ufw allow from 192.168.11.10 # 允許 192.168.11.10 的所有連線
- sudo ufw status numbered # 查看規則所對應的編號
- sudo ufw delete 2 # 根據規則編號 去做刪除
## iptables
## apt
## yum
## rpm
