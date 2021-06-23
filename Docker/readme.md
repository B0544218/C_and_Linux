## 安裝Docker
- sudo apt-get install docker.io
- service docker status
- cd /etc/ 看看group檔案中有無docker(預設應該會幫你裝)， 沒有的話執行 sudo groupadd docker (建立 docker 群組)
- sudo usermod -G docker -a (帳號)   (檢視所有系統帳號 用cat /etc/passwd 去看第一個欄位 )
- newgrp docker (更新docker group資訊)
- sudo systemctl restart docker (重新啟動docker服務)
- docker version (會出現 Client、Server 的訊息。 如果出現Cannot connect to the Docker daemon. 則代表前面有步驟失敗)
- groups (查看docker group)
- DockerHub上面建立帳戶  (並在terminal上輸入 docker login) 

## Dockerfile
Dockerfile 主要有用到的指令說明如下
- FROM： 使用到的 Docker Image 名稱，今天使用 CentOS

- MAINTAINER： 用來說明，撰寫和維護這個 Dockerfile 的人是誰，也可以給 E-mail的資訊

- RUN： RUN 指令後面放 Linux 指令，用來執行安裝和設定這個 Image 需要的東西

- ADD： 把 Local 的檔案複製到 Image 裡，如果是 tar.gz 檔複製進去 Image 時會順便自動解壓縮。Dockerfile 另外還有一個複製檔案的指令 COPY 未來還會再介紹

- ENV： 用來設定環境變數

- CMD： 在指行 docker run 的指令時會直接呼叫開啟 Tomcat Service
#### 假設已經安裝好 node 和 npm
- package.json
```
{
  "name": "docker_web_app",
  "version": "1.0.0",
  "description": "Node.js on Docker",
  "author": "First Last <first.last@example.com>",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.16.1"
  }
}
```
- server.js
```
const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
```
- create Dockerfile (vim Dockerfile)
```


FROM node:latest

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
```
- create .dockerignore
```
node_modules
npm-debug.log
```
- docker build -t <your Dockerhub username>/node-web-app .


## Docker command
- docker images或 docker image list  查看目前image 有哪些
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
   - docker run -it -d -p (49160:8080) --name (命名 服務名稱NAMES) (image:tag)
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
