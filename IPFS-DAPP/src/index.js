const express = require('express');
const bodyParser = require('body-parser');
const ipfsAPI = require('ipfs-api');
const ipfs = ipfsAPI({host: 'localhost', port: '5001', protocol: 'http'});
const fs = require('fs');
const Web3 = require('web3');

if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
} else {
    // set the provider you want from Web3.providers
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

var path = require("path");
var pwd = path.resolve('./');
var file = pwd + '/build/contracts/MyContract.json';
var data = fs.readFile(file, 'utf-8', function(err, data) {
    if (err) {
        console.log(err)
    } else {
        console.log(data);
    }
})
//读取json文件

// var jsData = JSON.parse(data);
// var ef=jsData.Result['abi'] 
// console.log( ef);
// //json里的字段名

const contract = require('truffle-contract');
const myContract = contract('../build/MyContract.json');

// var Equipment = new web3.eth.Contract(equipment_artifacts.abi,address)  //address为合约地址


var path = './src/public/index.html'

ipfs.add(fs.readFileSync(path), function (err, files) {
    if (err || typeof files == "undefined") {
        console.log(err);
    } else {
        console.log(files);
    }
})

var PORT = 5000;
var app = express();
app.use(express.static(__dirname + '/public'));

app.listen(PORT, () => {
    console.log('Server running on port %d', PORT);
});

