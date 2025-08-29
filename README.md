
<img src="https://prompt-proxy.com/logo_text.svg" height="100" alt="PromptProxy Logo" />

# PromptProxy: *your AI apps, our billing back-end*
Skip developing the boring stuff. [PromptProxy](https://prompt-proxy.com) handles your **billing** back-end and **user crediting**, so you can focus on shipping AI features.


## Getting started
PromptProxy is a proxy for any LLM API, such as OpenAI, Anthropic, HuggingFace, OpenRouter, and more. Just replace the API endpoint with ours.

1. **Get your API key**  
Sign up at [prompt-proxy.com](https://prompt-proxy.com) and get your API key from the dashboard.

2. **Set rules an limits** ([details](#configuration))  
Set rate-limits, token-limits, and endpoint rules in the dashboard to control costs and usage.

3. **Connect your billing provider**  
Connect your Stripe, Polar, or Mollie account. Skip this step if you don't need to charge users yet.

4. **Select your auth provider** ([details](#authentication))   
How are you handling user authentication? We have templates for Firebase, Supabase and Auth0. Not using one of these? Let us know, and we can help you set it up.

5. **Replace your API calls**  
Replace your existing LLM API calls with calls to PromptProxy. See examples below.


## Demo projects

This repository contains example templates demonstrating how to use PromptProxy with various front-end frameworks and plain HTML. Each template showcases different features and integrations to help you get started quickly.

### Plain HTML
[demo](https://mruijzendaal.github.io/html-preview.github.io/?url=https://github.com/mruijzendaal/promptproxy-templates/blob/main/templates/static_html/index.html), [source](/templates/static_html/)

One can quickly get started with a simple static HTML page. This can be hosted on many places for free (e.g. GitHub Pages, Netlify, Vercel, Firebase).

### Flutter
[demo project source](templates/flutter/)

Flutter projects are normally restricted from making LLM calls directly from the app, due to API key exposure risks. However, when using PromptProxy, you can safely make these calls directly from your Flutter app, as the proxy handles authentication and billing securely.

The easiest implementation of a chat uses the [official Flutter AI Toolkit](https://docs.flutter.dev/ai-toolkit) and [flutter_ai_providers](https://pub.dev/packages/flutter_ai_providers/). 

Install using `flutter pub add flutter_ai_toolkit flutter_ai_providers`, then add this widget:
```dart
LlmChatView(
    provider: OpenAIProvider(
        baseUrl: 'https://api.prompt-proxy.com/v1',
        apiKey: _apiKey,
        model: 'gpt-4.1-nano',
    ),
)
```

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

## Configuration

Configurations are set in the [PromptProxy dashboard](https://prompt-proxy.com/dashboard), but are documented here for reference.

### Proxy modes
In all modes, PromptProxy manages user credits and billing. The modes differ only in how requests are forwarded to the LLM provider.

- **Forward mode**.  
In this mode, PromptProxy forwards requests to the LLM provider without any changes to the request body. This gives full flexibility about which models and endpoints to use. This restricts use to your back-end only; otherwise, people could abuse your LLM API keys.

- **Managed mode**.  
In this mode, PromptProxy sets the LLM request based on your configuration in our dashboard. This way, your PromptProxy API key can be safely used in front-end applications, such as Flutter apps or static HTML pages. You can restrict which models and endpoints are used, and set rate-limits and token-limits to control costs.

For a full list of configuration options, see the [OpenAI API spec](https://platform.openai.com/docs/api-reference/completions/create).

### Authentication
For each different authentication method, you can define rules and limits in the dashboard. This way, you can control costs and usage based on your user base.

- **No auth**.  
No authentication is required. You can put the same rules and limits for authless usage. This is useful for testing, open demos, or to give users a taste of your app before requiring sign-up.

- **Test token**.
For quick testing, you can use a test token. This is a JWT token that you can generate in the dashboard. It is not linked to any user, but allows you to test your integration with auth enabled. 

- **JWT ID token**.  
If you are using Firebase, Supabase, Auth0, or any other auth provider that issues JWT ID tokens, you can use these tokens to authenticate users. PromptProxy will validate the token and extract the user ID to manage credits and billing.

### Rules
For each authentication method, you can set rules around user crediting and costs:
- Credit gain at sign-up.
- Credit gain for each purchase type.
- Credit cost / request.
- Credit cost / 1M tokens.

### Limits
For each authentication method, you can set limits to control costs:
- Maximum total number of requests per minute, hour, day, week, month.
- Maximum number of requests per user, per minute, hour, day, week, month, total.
- Maximum number of input/output tokens per request
- LLM provider endpoint and model restrictions (managed mode only).

### Abuse prevention
In managed mode, attackers can only influence the prompt, and only at the cost of their own credits. This makes abuse less likely, as it is costly to the attacker. However, they could try to abuse your app to generate harmful content. PromptProxy can can automatically block users that produce too many blocked requests, based on a threshold you set.