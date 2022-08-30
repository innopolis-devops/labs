import express, { Request, Response } from 'express';
import dotenv from 'dotenv';
import getTime from './time';

dotenv.config();

const app = express();
const port = process.env.PORT;

app.get('/', (req: Request, res: Response) => {
  getTime().then(date => res.send(
    date.toLocaleString("en-US", { timeZone: "Europe/Moscow" })
  ));
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
