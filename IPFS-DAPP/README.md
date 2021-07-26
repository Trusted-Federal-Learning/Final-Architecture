# IPFS-TEST

* 7.26更新：利用express框架，前端实现上传IPFS
* 站点源码：`./src`



* 启动IPFS

```bash
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["*"]'
ipfs config --json Addresses.API '"/ip4/0.0.0.0/tcp/5001"'
ipfs config --json Addresses.Gateway '"/ip4/0.0.0.0/tcp/8080"'
# 允许跨域访问

ipfs daemon
# 启动IPFS
```



在`ipfs.js`中设置API参数

```js
const ipfs = window.IpfsApi('127.0.0.1', 5001) // Connect to IPFS
```



* 启动nodejs

```bash
npm install ipfs-api
node start
```



* IPFS用于存储proof，之前的proof-contract用于存proof的哈希