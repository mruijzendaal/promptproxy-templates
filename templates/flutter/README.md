## Reproduction

```bash
flutter create promptproxy_flutter --platforms web
cd promptproxy_flutter
flutter pub add flutter_ai_toolkit flutter_ai_providers
flutter run -d chrome --web-browser-flag "--disable-web-security"
```

See the [flutter_ai_toolkit documentation](https://pub.dev/packages/flutter_ai_toolkit) for more details on usage.