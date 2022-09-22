import 'jest';
import request from 'supertest';
import { create_app } from '../src/app';
import TimeService from '../src/time';

// Create an app
const app = create_app(new TimeService(0));

const startTime = Date.now();

const client = request.agent(app);

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
