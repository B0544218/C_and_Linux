## 安裝Docker
- sudo apt-get install docker.io
- service docker status
- docker version (第一次應該會有錯誤)
- sudo usermod -aG docker $USER
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
