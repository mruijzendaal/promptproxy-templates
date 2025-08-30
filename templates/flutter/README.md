# PromptProxy Flutter Template

This sample project demonstrates how to integrate PromptProxy with a Flutter application. By using PromptProxy, you can securely make LLM calls directly from your Flutter app without exposing your API keys.

## Usage

Download this repository and navigate to the `templates/flutter` directory. You can then run the app locally using:

```bash
flutter run -d chrome
```

## Deployment

You can build the Flutter web app using:

```bash
flutter build web
```

This will create a `build/web` directory containing the static files. You can serve these files using any static file server or hosting service, like Github Pages, Firebase Hosting, etc.

**Alternatively**, you can build a Docker container to serve the app:

```bash
docker build -t promptproxy_flutter .
docker run -p 8080:80 promptproxy_flutter
```

This can be hosted on your VPS, or on platforms like [Railway](https://railway.app), [Fly.io](https://fly.io), or [Render](https://render.com).

## Build from scratch

```bash
flutter create promptproxy_flutter --platforms web
cd promptproxy_flutter
flutter pub add flutter_ai_toolkit flutter_ai_providers
flutter run -d chrome"
```

See the [flutter_ai_toolkit documentation](https://pub.dev/packages/flutter_ai_toolkit) for more details on usage.