# Typescript implementation details

## Formatting

Using ESLint with some basic recommended options provided by [ESLint Plugin TypeScript](https://www.npmjs.com/package/@typescript-eslint/eslint-plugin).

## Framework choice

The app is written in [Express](https://expressjs.com/), which is a lightweight and quite popular Node.js framework for serving HTTP requests. It is more than enough for the current app.

## Tests

Tests are written and run using [Jest](https://jestjs.io/) in combination with [supertest](https://github.com/visionmedia/supertest), as implemented in [the article](https://www.albertgao.xyz/2017/05/24/how-to-test-expressjs-with-jest-and-supertest/) suggested in the Jest documentation.
