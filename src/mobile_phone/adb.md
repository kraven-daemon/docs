

## Web development
### Activate a reverse port
If you serve a development server on your localhost
the website, database, or other tcp based communication protocol
it will be accessible for example in a browser at `http://localhost:PORT`

```
adb reverse tcp:4200 tcp:4200
```
