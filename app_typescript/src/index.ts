import dotenv from 'dotenv';
import create_app from './app';
import TimeService from './time';

dotenv.config();

const port = process.env.PORT;
const address = `http://localhost:${port}`;

TimeService.fromNTP('time.google.com').then(create_app).then(
  (app) => (
    app.listen(port, () => {
      console.log(`Server is running at ${address}`);
    })
  )
);
