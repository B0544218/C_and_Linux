## 安裝Docker
- sudo apt-get install docker.io
- service docker status
- docker version (第一次應該會有錯誤，輸入玩usermod -aG docker後就不會有錯誤)
- sudo usermod -aG docker $USER
- DockerHub上面建立帳戶  (並在terminal上輸入 docker login) 
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
- docker ps -all 查看所有container包含status為exit的
- docker pull (image) 到dockerhub上抓取現成的image
#### 假如自建一個Dockerfile (切入到這個Dockerfile的目錄)
- docker build .   (這個build動作完成後會回覆一個image id，代表這個image建置完成。) 需要有一個Dockerhub帳戶
- docker push (your-name/image-name) 

#### 當image準備好就可以用2種指令 來做出Container (docker create/ docker run)
1. docker create (建立 Container 後但 不會啟動，必須再手動啟動，比較會常用來 build 一些服務類型的 Container)
   - docker create -it --name (命名 服務名稱NAMES) (image:tag) #建立好Container但未啟動 
   - docker start (服務名稱NAMES) #啟動Container
   - docker exec -it (服務名稱NAMES) bash #進入Container bash
2. docker run (建立 Container 後並 啟動，較常用來執行一些一次性的操作) 
   - docker run -it -d -p (8080:80) --name (服務名稱 NAMES) (image:tag)
   - docker exec -it (服務名稱NAMES) bash #進入Container bash
    ```
    -it 代表在執行 Docker 虛擬容器環境時，開啟虛擬終端機，以互動的模式執行。
    -d代表在背景執行
    -p <本機通道>:<容器通道>
    ```
  - docker start (container) #讓container的status為up
  - docker stop (服務名稱NAMES) #讓container的status為exit
  - docker rm (服務名稱NAMES) 
  - docker rmi (repository)
