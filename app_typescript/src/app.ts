import express, { Request, Response } from 'express';
import allow_methods from './utils/allow_methods';
import StatusService from './status';
import TimeService from './time';
import promBundle from 'express-prom-bundle';
// Yay dependency injection!

const create_app = (
  timeService: TimeService,
  statusService: StatusService,
) => {
  const show_time = (req: Request, res: Response) => {
    timeService
      .getTime()
      .then(date => res
        .status(200)
        .send(
          date.toLocaleString(
            "en-US",
            { timeZone: "Europe/Moscow" }
          )
        )
      )
      .then(() => statusService.logRequest());
  };
  
  const show_status = (req: Request, res: Response) => {
    statusService
      .getStatus()
      .then(status => res
        .status(200)
        .send(status)
      );
  };

  
  const metricsMiddleware = promBundle({ includeMethod: true, includePath: true });
  const app = express();
  
  app.use(metricsMiddleware);
  app
    .route('/')
    .get(show_time)
    .all(allow_methods(["GET"]));
  
  app
    .route('/status')
    .get(show_status)
    .all(allow_methods(["GET"]));
    
  return app;
};

export default create_app;
