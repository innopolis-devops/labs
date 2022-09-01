const express = require('express');

const app = express();

app.listen(3000, () => {

});

app.get('/', (req, res) => {
  const now = new Date() + 3;
  res.json(now);
});
