/**
 * in this suite we test accessibility of the endpoints of the main module
 */

const supertest = require('supertest')
const {app} = require("../app");

// eslint-disable-next-line no-undef
test('gets correct home route', async () => {
    const {statusCode} = await supertest(app).get(`/`)
    // eslint-disable-next-line no-undef
    expect(statusCode).toBe(200)
})