`This module shows Moscow Time.`

const express = require('express')
const request = require('request');

const PORT = 5000;
app = express();

app.get('/', function(req, res) {
    url = "http://worldtimeapi.org/api/timezone/Europe/Moscow"

    request(url, function (error, response, body) {
        if (response && response.statusCode == 200) {
            res.send(JSON.parse(body).datetime.split('T')['1'].split('.')['0']);
        } else {
            res.send('No responce from worldtimeapi 404;)')
        }
      });      
});

app.listen(PORT, function (){ 
    console.log(`Your web app on: http://localhost:${PORT}/`);
});  