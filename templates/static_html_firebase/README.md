<img src="https://prompt-proxy.com/logo_text.svg" height="100" alt="PromptProxy Logo" />

# PromptProxy: *your AI apps, our billing back-end*
Skip developing the boring stuff. [PromptProxy](https://prompt-proxy.com) handles your **billing** back-end and **user crediting**, so you can focus on shipping AI features.

## Static HTML with Firebase Authentication
[live demo](https://promptproxy-demo-static-html.web.app/)

This project is a simple demo of PromptProxy, using plain HTML and JavaScript, with Firebase for user authentication. It showcases how to integrate PromptProxy into a static web application while managing user sign-in and authentication through Firebase.

Features:  
- User authentication with Firebase (Google Sign-In)
- Integration with PromptProxy for LLM API calls
- Rate limits per user via PromptProxy

## Getting started
If you want to run this project locally or deploy it yourself, follow these steps:  
1. Clone the repository.
2. Set up a Firebase project.
   1. Enable Firebase Authentication with Google Sign-In.
   2. From Project Settings > Your Apps, add a Web App.
   3. Replace the `firebaseConfig` object in `index.html` with your Firebase config.
   4. (Optional) Set up Firebase Hosting to deploy the app.
3. Sign up at [prompt-proxy.com](https://prompt-proxy.com) and get your API key from the dashboard.