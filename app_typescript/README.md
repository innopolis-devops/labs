# Typescript Time Web App

An app that allows to receive the current time in Moscow by a web request. Makes sure the time is correct by synchronizing it to the Google's NTP server at the startup.

## Build

### Requirements

- Node.js 16 (tested at 16.16.0)

---

- Install the packages: `npm install`

- Compile Typescript: `npm run build`

## Usage

After the app is compiled, it's stored in `build/index.js` file.

Use `npm start` to run it with Node.

For testing purposes, you may use `npm run dev`, which uses [`ts-node-dev`](https://github.com/wclr/ts-node-dev) to run the code and keep track of modifications in `index.ts`.

## See also

Check out [TYPESCRIPT.md](./TYPESCRIPT.md) for implementation details.
