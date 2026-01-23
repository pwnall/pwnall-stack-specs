## nvm for Node.js

[nvm](https://github.com/nvm-sh/nvm) manages a
[Node.js](https://nodejs.org/docs/latest/api/) installation, including the
[npm](https://docs.npmjs.com/) package manager.

Common commands:

* Run a script in `package.json`, such as `dev`: `npm run dev`
* Run a command, such as `install`, from an npm package, such as
  `@puppeteer/browsers`: `npx @puppeteer/browsers install`
* Add a npm dependency, such as `puppeteer`: `npm install puppeteer`

Repository integration:

* `.node-version` - Node.js runtime version used by the project
* `package.json` - npm project configuration
* `package-lock.json` - npm packages used by the project
