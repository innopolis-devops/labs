import express, { Request, Response } from 'express';
import TimeService from './time';

// Yay dependency injection!
export const create_app = (time_service: TimeService) => {
  const app = express();
  
  app.route('/').get((req: Request, res: Response) => {
    time_service.getTime().then(date => res.status(200).send(
      date.toLocaleString("en-US", { timeZone: "Europe/Moscow" })
    ));
  }).all((req, res) => res.status(405).header("Allow", "GET").send());
    
  return app;
};

export default create_app;
