const express = require('express');

var PORT = 5000;
var app = express();
app.use(express.static(__dirname + '/public'));

app.listen(PORT, () => {
    console.log('Server running on port %d', PORT);
});

