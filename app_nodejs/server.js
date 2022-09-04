const http = require('http');

const server = http.createServer((req, res)=>{
    console.log(req.url)
    res.writeHead(200);
    res.write('hello')
    res.end('Hello, World!');
});
server.listen(8080);