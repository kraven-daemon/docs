# NPM

### Workspaces

- In an example project:
```
example/
    .
    ├── client
    │  ├── package.json
    │  └── index.js
    ├── server
    │  ├── package.json
    │  └── index.js
    └── package.json
```
- In package.json at project root :
```
{
  "name": "example",
  "workspaces": ["client", "server"]
  ....
}
```
- Installing everything, recursively.
```
npm install --workspaces
```
- Installing to a workspace
```
npm install express --workspace=server
```
- Running scripts from a workspace
```
npm run test --workspace=client
```
- Running all the same scripts in all workspaces
```
npm run test --workspaces
```
- Running scripts in all workspaces, without errors caused by missing a script (only if they exist).
```
npm run test --workspaces --if-present
```
- Running in parallel, in package.json at root-level
```
{
  "scripts": {
    "dev": "npm run dev --workspace=client & npm run dev --workspace=server"
  }
}
```
