## window/Linux jupyter ngrok
### ngrok download
- 到 https://dashboard.ngrok.com/get-started/setup  下載 .exe
- 使用cmd，切到exe目錄底下，輸入 ngrok authtoken (your_Authtoken) 
- (上述步驟等同於 在 C:\Users\kevin\.ngrok2\ngrok.yml 改寫以下指令 authtoken: your_Authtoken )

### jupyer server setup (以window為例，linux path不太一樣)
- jupyter notebook --generate-config
- 在 C:\Users\kevin\.jupyter\jupyter_notebook_config.json  新增以下指令
1. c.NotebookApp.ip = '*'
2. c.NotebookApp.password = ''
3. c.NotebookApp.port = 5000
4. c.NotebookApp.notebook_dir = 'C:\\Users\\kevin\\Desktop\\analysis'
   -  把jupyter notebook內容中的捷徑(目標) "%USERPROFILE%/" 刪除再執行下面那行
### 開啟ngrok server(記得先開啟jupyter)
- 使用cmd，切到ngrok.exe目錄下，輸入 ngrok http 5000(對應jupyter的port)
- 輸入jupyter的password或token (使用jupyter notebook list 可以看到自己電腦的token)

## Linux 請去看
<https://github.com/B0544218/C_and_Linux/blob/main/Linux_command/script/ngro.sh>
