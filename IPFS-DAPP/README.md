# IPFS-TEST

IPFS与nodejs的交互示例



* 启动IPFS

```bash
ipfs daemon
```



在`ipfs.js`中设置API参数

```js
const ipfsAPI = require('ipfs-api');
const ipfs = ipfsAPI({host: 'localhost', port: '5001', protocol: 'http'});
```



* 启动nodejs

```bash
npm install ipfs-api
node index.js
```



运行结果：

```bash
$ node index.js
QmTfGujm4Y5yfs3RJd6paqigdvVc6nMmn7upVVp5YRiPxY
http://localhost:8080/ipfs/QmTfGujm4Y5yfs3RJd6paqigdvVc6nMmn7upVVp5YRiPxY
QmRfhWo4c24MWYXLxu69FcJBnKpmnjY9mN5nMiK8U9zNxB
http://localhost:8080/ipfs/QmRfhWo4c24MWYXLxu69FcJBnKpmnjY9mN5nMiK8U9zNxB
file:./storage/get/onepiece.png
{ name: 'naruto', age: 23, level: 'ss' }
```



访问`http://localhost:8080/ipfs/QmTfGujm4Y5yfs3RJd6paqigdvVc6nMmn7upVVp5YRiPxY`可看到文件