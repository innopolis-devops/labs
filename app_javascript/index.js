const path = require("path");
const express = require("express");

const app = express();

const PORT = 3333;

app.use(express.static(path.join(__dirname, "public")));

app.get("/", (_, res) => {
  res.sendFile(`${__dirname}/public/index.html`);
});

app.listen(PORT, () => {
  console.log(`Application listening on port ${PORT}!`);
});
