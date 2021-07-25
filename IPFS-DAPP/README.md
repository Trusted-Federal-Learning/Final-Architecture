# IPFS-TEST

* 7.25更新：利用express框架，前端能够手动实现MetaMask调用
* 待完成：智能合约调用与前端的IPFS调用

* 站点源码：`./src`



IPFS与nodejs后端的交互示例



* 启动IPFS

```bash
ipfs daemon
```



在`index.js`中设置API参数

```js
const ipfsAPI = require('ipfs-api');
const ipfs = ipfsAPI({host: 'localhost', port: '5001', protocol: 'http'});
```



* 启动nodejs

```bash
npm install ipfs-api
node start
```



运行结果：

```bash
$ npm start

> start
> node src/index.js

Server running on port 5000
[ { path: 'QmW2Z7vUSL1weLP4w6AoBz4XEL5jvA6v72QC98Sc2dDEg8',
    hash: 'QmW2Z7vUSL1weLP4w6AoBz4XEL5jvA6v72QC98Sc2dDEg8',
    size: 380 } ]

```



访问`http://localhost:8080/ipfs/QmW2Z7vUSL1weLP4w6AoBz4XEL5jvA6v72QC98Sc2dDEg8`可看到文件