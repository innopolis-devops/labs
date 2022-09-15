import { NTPClient } from 'ntpclient';

const time_diff = new NTPClient('time.google.com').getNetworkTime().then(
  date => Date.now() - date.getTime()
);

const getTime = async () => new Date(Date.now() - await time_diff);

export default getTime;