## 安裝Docker
- sudo apt-get install docker.io
- service docker status
- docker version (第一次應該會有錯誤)
- sudo usermod -aG docker $USER

## Dockerfile
Dockerfile 主要有用到的指令說明如下
- FROM： 使用到的 Docker Image 名稱，今天使用 CentOS

- MAINTAINER： 用來說明，撰寫和維護這個 Dockerfile 的人是誰，也可以給 E-mail的資訊

- RUN： RUN 指令後面放 Linux 指令，用來執行安裝和設定這個 Image 需要的東西

- ADD： 把 Local 的檔案複製到 Image 裡，如果是 tar.gz 檔複製進去 Image 時會順便自動解壓縮。Dockerfile 另外還有一個複製檔案的指令 COPY 未來還會再介紹

- ENV： 用來設定環境變數

- CMD： 在指行 docker run 的指令時會直接呼叫開啟 Tomcat Service
## Docker command
- docker images  查看目前image 有哪些
- docker ps  查看目前執行的container
- docker create -it --name (命名 映像檔名稱) (dockerfile)
- docker run -d -p (80:80) --name (命名Container) (Container的來源映像檔)
- docker run -it --rm busybox
    ```
    -d代表在背景執行
    -p <本機通道>:<容器通道>
    ```
- docker start (container)
- docker stop (container)
- docker attach (container) 進入container  (可以用exit離開)
- docker exec -it (container) bash  進入container  
- docker rm (Container名稱/對應IMAGE)
- docker rmi (repository)
