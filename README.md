
<img src="https://prompt-proxy.com/logo_text.svg" height="100" alt="PromptProxy Logo" />

# PromptProxy: *your AI apps, our billing back-end*
Skip developing the boring stuff. [PromptProxy ](https://prompt-proxy.com) handles your **billing** back-end and **user crediting**, so you can focus on shipping AI features.


## Getting started
PromptProxy is a proxy for any LLM API, such as OpenAI, Anthropic, HuggingFace, OpenRouter, and more. Just replace the API endpoint with ours.

1. **Get your API key**  
Sign up at [prompt-proxy.com](https://prompt-proxy.com) and get your API key from the dashboard.

2. **Set rules an limits**  
Set rate-limits, token-limits, and endpoint rules in the dashboard to control costs and usage.

3. **Connect your billing provider**  
Connect your Stripe, Polar, or Mollie account. Skip this step if you don't need to charge users yet.

4. **Select your auth provider**  
How are you handling user authentication? We have templates for Firebase, Supabase and Auth0. Not using one of these? Let us know, and we can help you set it up.

5. **Replace your API calls**  
Replace your existing LLM API calls with calls to PromptProxy. See examples below.


### Demo projects

This repository contains example templates demonstrating how to use PromptProxy with various front-end frameworks and plain HTML. Each template showcases different features and integrations to help you get started quickly.

- Plain HTML with TailwindCSS:  [demo](https://mruijzendaal.github.io/html-preview.github.io/?url=https://github.com/mruijzendaal/promptproxy-templates/blob/main/templates/static_html/index.html), [source](/templates/static_html/)
- Flutter (coming soon)
- SvelteKit (coming soon)

### OpenAI Node.js SDK

```diff
import OpenAI from "openai";

const client = new OpenAI({
-  apiKey: <OPENAI API key>, 
+  apiKey: <PROMPTPROXY API key>,
+  baseURL: "https://api.prompt-proxy.com/v1", 
+  defaultHeaders: {
+   'X-PromptProxy-Key': <auth JWT ID token>
+  }
});

const response = await client.responses.create({
    model: "gpt-5",
    input: "How much time do I save by using PromptProxy 
			for auth, billing, and crediting?",
});
```

### Simple fetch

```diff
const res = await fetch(
-   // Normally, you would use the OpenAI endpoint directly:
-   "http://api.openai.com/v1/chat/completions",
+   // Replace it with PromptProxy endpoint, giving you control over
+   // rate-limits, token-limits, and endpoint rules.
+   "https://api.prompt-proxy.com/v1/chat/completions",
    {
        method: "POST",
        headers: {
        "Content-Type": "application/json",
-           Authorization: `Bearer ${openAiApiKey}`,
+           Authorization: `Bearer ${promptProxyApiKey}`,
        },
        body: JSON.stringify({
        model: "gpt-5",
        messages: [{ role: "user", content: prompt }],
        }),
    }
);
```