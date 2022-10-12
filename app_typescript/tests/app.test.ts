import 'jest';
import request from 'supertest';
import create_app from '../src/app';
import StatusService from '../src/status';
import TimeService from '../src/time';
import MockRedis from '../src/mocks/redis';
import Status from '../src/interfaces/status';

// Create an app
const app = create_app(
  new TimeService(0),
  new StatusService(new MockRedis())
);

const startTime = Date.now();

const client = request.agent(app);

describe("Status check", () => {
  it("initially shows 0 requests served", () => (
    client.get('/status').then((response) => {
      const status: Status = JSON.parse(response.text);
      expect(status.requests_served).toBe(0);
    })
  ));
});

describe("Time request", () => {
  it("is successful (200 OK)", () => (
    client.get('/').then((response) => (
      expect(response.status).toBe(200)
    ))
  ));
  it("does not take too long (< 100ms)", () => (
    client.get('/').then(() => (
      expect(Date.now() - startTime).toBeLessThan(100)
    ))
  ));
  test("response is properly formatted", () => (
    client.get('/').then((response) => (
      expect(() => new Date(response.text)).not.toThrow()
    ))
  ));
});


describe("Non-existent route request", () => {
  it("gives 404", () => (
    client.get('/bamog').then((response) => (
      expect(response.status).toBe(404)
    ))
  ));
});

describe("Unsupported method request", () => {
  it("gives 405 status", () => (
    client.post('/').then((response) => (
      expect(response.status).toBe(405)
    ))
  ));
});

describe("Status check", () => {
  it("in the end shows 3 requests served", () => (
    client.get('/status').then((response) => {
      const status: Status = JSON.parse(response.text);
      expect(status.requests_served).toBe(3);
    })
  ));
});
