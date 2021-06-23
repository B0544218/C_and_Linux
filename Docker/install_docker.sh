#!/bin/bash

sudo apt-get install -y docker.io
service docker status
# cd /etc/ 看看group檔案中有無docker(預設應該會幫你裝)， 沒有的話執行 sudo groupadd docker (建立 docker 群組)
sudo usermod -G docker -a (帳號) # (檢視所有系統帳號 用cat /etc/passwd 去看第一個欄位 )
sudo systemctl restart docker # (重新啟動docker服務)
sleep 5
docker version # (會出現 Client、Server 的訊息。 如果出現Cannot connect to the Docker daemon. 則代表前面有步驟失敗)
