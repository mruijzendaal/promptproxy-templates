import 'package:flutter/material.dart';
import 'package:flutter_ai_providers/flutter_ai_providers.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PromptProxy Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.from(alpha: 255, red: 255, green: 0, blue: 0),
          dynamicSchemeVariant: DynamicSchemeVariant.neutral,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text("PromptProxy flutter demo"),
        ),
        body: const ApiKeyChatView(),
      ),
    );
  }
}

class ApiKeyChatView extends StatefulWidget {
  const ApiKeyChatView({super.key});

  @override
  State<ApiKeyChatView> createState() => _ApiKeyChatViewState();
}

class _ApiKeyChatViewState extends State<ApiKeyChatView> {
  String _apiKey = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'PromptProxy API Key',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _apiKey = value;
              });
            },
          ),
        ),
        Expanded(
          child: LlmChatView(
            provider: OpenAIProvider(
              baseUrl: 'https://api.prompt-proxy.com/v1',
              apiKey: _apiKey,
              model: 'gpt-4.1-nano',
            ),
          ),
        ),
      ],
    );
  }
}
