# Creating Electron App

Create project
```bash
mkdir my-electron-app && cd my-electron-app
npm init
```
Type `main.js` as `entry point:` instead of `index.js`<br>
Disable tests by adding line to `package.json`
```json
{
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  }
}

```
Install electron
```sh
npm install --save-dev electron
```
In the scripts field of `package.json` config, add a start command
```json
{
  "scripts": {
    "start": "electron ."
  }
}
```
To launch app in development mode run `start`
```sh
npm start
```
Create `index.html` file
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <!-- https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'">
    <title>Hello World!</title>
  </head>
  <body>
    <h1>Hello World!</h1>
    We are using Node.js <span id="node-version"></span>,
    Chromium <span id="chrome-version"></span>,
    and Electron <span id="electron-version"></span>.
  </body>
</html>
```
Create `main.js` file and add import CommonJS modules
```
const { app, BrowserWindow } = require('electron')
```
Add a `createWindow()` function that loads `index.html` into a new `BrowserWindow` instance
```js
const createWindow = () => {
  const win = new BrowserWindow({
    width: 800,
    height: 600
  })

  win.loadFile('index.html')
}
```
Call `createWindow()` after the app module's ready event is fired.
```js
app.whenReady().then(() => {
  createWindow()
})
```
Close app if all windows are closed
```js
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})
```
Liste `activate` event to create window if previous all were closed 
```js
app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})
```
To open `Developer Tools` at app lauchn add next line to `createWindow` function
```js
win.webContents.openDevTools();
```
Add `renderer.js` file to improve sequre, performance and stability
```js
window.onload = () => {                                                                 
    const button = document.getElementById('myButton');                                                                                                            
                                                                                        
    async function fetchData() {                                                                                                                        
      console.log("Button press");                                                                                                                 
    }                                                                                   
                                                                                        
    fetchButton.addEventListener('click', fetchData);                                   
};                                                                                      
```

