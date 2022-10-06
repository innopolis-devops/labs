import { createClient } from 'redis';
import dotenv from 'dotenv';
import create_app from './app';
import StatusService from './status';
import TimeService from './time';

dotenv.config();

const port = process.env.PORT;
const address = `http://localhost:${port}`;

const initApp = async () => {
  const redis = createClient({
    url: process.env.REDIS_URL,
  });
  await redis.connect();
  
  const timeService = await TimeService.fromNTP('time.google.com');
  const statusService = await StatusService.create(redis);
  return create_app(timeService, statusService);
};

initApp().then(
  (app) => (
    app.listen(port, () => {
      console.log(`Server is running at ${address}`);
    })
  )
);
