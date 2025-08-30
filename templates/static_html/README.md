# Static HTML PromptProxy Example
Get your PromptProxy API key at [https://prompt-proxy.com](https://prompt-proxy.com).

This template demonstrates how to serve a static HTML page that interacts with the PromptProxy API. It is a minimal example using plain HTML, Tailwind CSS (via CDN), and a simple form to send prompts to the PromptProxy endpoint.

## Features
- Clean, modern UI with Tailwind CSS
- Simple form for entering PromptProxy API key and prompt
- Fetches completions from the PromptProxy API and displays the response
- No build step or dependencies—just static HTML

## Usage

You can use this template as a starting point for your own static HTML integrations with PromptProxy, or as a reference for embedding PromptProxy in simple web pages.
To view the demo, open the `index.html` file in a web browser.

## Deployment

You can host this static HTML page using any static file hosting service, such as GitHub Pages, Netlify, Vercel, or Firebase Hosting.
Alternatively, you can serve it using a simple HTTP server or Docker container. An example with Docker is provided below.

```sh
docker build -t promptproxy-static-html .
docker run --rm -p 8080:80 promptproxy-static-html
```

Then open [http://localhost:8080](http://localhost:8080) in your browser, or serve it behind a reverse proxy.
