const express = require('express');
const ipfsAPI = require('ipfs-api');
const fs = require('fs');


const ipfs = ipfsAPI({host: 'localhost', port: '5001', protocol: 'http'});
const contract = require('truffle-contract')
const simpleStorage = contract('MyContract')


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

