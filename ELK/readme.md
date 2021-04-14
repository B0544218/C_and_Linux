# 安裝JDK 、 Nginx
sudo apt-get install openjdk-8-jdk
sudo apt-get install nginx

# 安裝Elasticsearch
wget –qO – https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add –
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee –a /etc/apt/sources.list.d/elastic-7.x.list
cd /etc/apt/sources.list.d/
sudo vim elastic-7.x.list (# delete the sign "" )
sudo apt-get update (# appear error NO PUBKEY, therefore need to copy the key)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D27D666CD88E42B4 (# input key if NO PUBKEY)
sudo apt-get update (# success)
sudo apt-get install elasticsearch

# 修改Elasticsearch config file
sudo vim /etc/elasticsearch/elasticsearch.yml
  network.host: 127.0.0.1(delete # and then rewrite 192.168.0.1 into 127.0.0.1)
  http.port: 9200(delete #)
sudo vim /etc/elasticsearch/jvm.options
  -Xms512m (insert -Xms512m)
  -Xmx512m (insert -Xmx512m)
sudo systemctl start elasticsearch.service
sudo systemctl status elasticsearch.service
sudo systemctl enable elasticsearch.service
### 測試是否可以使用
curl -X GET "localhost:9200"

# 安裝 logstash
sudo apt-get install logstash
sudo systemctl start logstash
sudo systemctl enable logstash
sudo systemctl status logstash

# 自製logstash.conf 基本知識 (使用前，記得關閉logstash server)
- (有了logstash的bin 才可以使用logstash command) cd /usr/share/logstash/bin/logstash
- (logstash config file 位置) cd /etc/logstash 
- (自製logstash並放在右邊指定位置下) sudo vim /etc/logstash/conf.d/
- (執行自製logstash) sudo /usr/share/logstash/bin/logstash -r --path.settings=/etc/logstash  


# Elasticsearch 基本知識
- (上傳JSON檔給elasticsearch) curl -X POST -H "Content-Type: application/json" 'localhost:9200/_bulk?pretty' --data-binary  @/home/kevin/shakespeare_6.0.json
- (查看elasticsearch上所有index) http://localhost:9200/_cat/indices?v
- (列出幾筆資料) localhost:9200/_search
- (查看一筆record) http://127.0.0.1:9200/(index) / (type) / (id)   -> (ex: http://127.0.0.1:9200/shakespeare/_doc/1 )
- (查看多筆record) http://127.0.0.1:9200/shakespeare/_search?q=type:l*&sort=line_id&from=0&size=20

