const request = require('supertest')

const app = require('../index')

describe('GET /', () => {
  it('GET / => current time in Moscow', () => {
    return request(app)
      .get('/')
      .expect(200)
      .then((response) => {
        const dateOb = (new Date().toLocaleString('en-US', {
          timeZone: 'Europe/Moscow'
        }))
        expect(response.text).toEqual(
        `<h1>${dateOb}</h1>`
        )
      })
  })
})
