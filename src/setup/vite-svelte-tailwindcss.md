# Vite svelte and tailwindcss

### As client

Basic
```
npm create vite@latest client -- --template svelte
cd client
npm install
npm run dev
```

Steps

```
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init tailwind.config.cjs -p
```
In `tailwind.config.cjs` :
```
module.exports = {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {}
  },
  plugins: []
};
```
In `app.css` :
```
@tailwind base;
@tailwind components;
@tailwind utilities;
```

In `main.js` :
```
import './app.css'
```
