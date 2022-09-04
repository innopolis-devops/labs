const http = require('http');
const {getCurrentTime} = require("./utils");

const requestListener = function (req, res) {
    res.writeHead(200);
    res.end('Current time in Moscow:',getCurrentTime());
}

const server = http.createServer(requestListener);
server.listen(8080);