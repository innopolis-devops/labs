import { NTPClient } from 'ntpclient';

class TimeService {
  private offset: number;

  constructor(offset: number) {
    this.offset = offset;
  }

  static async fromNTP(server: string): Promise<TimeService> {
    const offset = await new NTPClient(server)
      .getNetworkTime()
      .then(
        date => Date.now() - date.getTime()
      );
    return new TimeService(offset);
  }

  async getTime(): Promise<Date> {
    return new Date(Date.now() - this.offset);
  } 
}

export default TimeService;
