const chai = require("chai");
const chaiHttp = require("chai-http");
const assert = chai.assert;

const { app } = require("../index.js");
chai.use(chaiHttp);

describe("Endpoints Tests", () => {
  it("Root path return status 200", (done) => {
    chai
      .request(app)
      .get("/")
      .end((_, res) => {
        assert.equal(res.statusCode, 200);
        done();
      });
  });
  it("Not existing path return status 404", (done) => {
    chai
      .request(app)
      .get("/not-exist")
      .end((_, res) => {
        assert.equal(res.statusCode, 404);
        done();
      });
  });
});
