### 初學者認識環境
1. ubuntu為例子
   - docker pull ubuntu
   - docker image ls
   - docker run -it ubuntu bash (-it 是為了讓我們進到這個 container 的 shell 下指令)
   - cat /etc/*release
2. 終極目標是要把你的程式碼跟想要的環境打包起來，變成一個 image (nodejs為例子)
   - 新增 Dockerfile (git clone https://github.com/LarryLuTW/simple-express-server.git)
   ```
   simple-express-server
    ├── Dockerfile   <--   這裡
    ├── README.md
    ├── index.js
    ├── node_modules
    └── package.json
   ```
   - 找到適合的 base image 
   ```
   決定base image後就在 Dockerfile 的第一行寫 
   FROM node:9.2.0，9.2.0 指的是我們使用的 node image 版本，如果想要最新版的的話也可以指定 node:latest
   ```
   - copy 原始碼
   ```
   有了 Node.js 環境之後要把 code 也包進去，這邊使用 COPY 指令，把 index.js 跟 package.json 複製到 /app
   ```
   - 安裝 dependencies
   ```
   環境都配置好了，code 也已經在裡面了
   使用 WORKDIR 切換到 /app 目錄，
   再用 RUN 跑 npm install && npm cache clean --force，
   清 npm cache 是為了讓 build 出來的 image 不要包含這些 cache，這樣 image 會小一點
   ```
   - 設定 initial command
   ```
   現在環境、程式碼、dependencies 都準備好了，只剩把程式跑起來，這裡會用到 CMD 設定這個 image 被跑起來時的預設指令
   ```
   - build (docker build -t simple-express-server)
   ```
   在專案目錄下跑 docker build -t simple-express-server . 就會根據 Dockerfile build 出你的 image
   ```
   - 把 image 跑起來(docker run -p 3000:8080 simple-express-server)
   ```
   有了 image 後可以 docker run -p 3000:8080 simple-express-server 把 image 跑起來，
   在 container 內跑的就是剛剛設定的預設指令 node index.js，
   -p 3000:8080 則是把 container 內的 8080 port 跟外部的 3000 port 接通，
   如此一來只要用瀏覽器到 127.0.0.1:3000 就可以看到 Hello World!
   ```

### Dockerfile 其他沒講到的常用指令
Dockerfile 主要有用到的指令說明如下
- MAINTAINER： 用來說明，撰寫和維護這個 Dockerfile 的人是誰，也可以給 E-mail的資訊

- ADD： 把 Local 的檔案複製到 Image 裡，跟copy相比多了這個功能(如果是 tar.gz 檔複製進去 Image 時會順便自動解壓縮)

- ENV： 用來設定環境變數

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
   - docker run -it (服務名稱NAMES) bash (進入container bash後，可以在執行cat /etc/*release )
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
