import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextInputWidget(),
        ),
      ),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      _messages.add(text);
    });
  }

  void _handleDelete(int index) {
    print("Deleting message at index: $index"); // 콘솔에 index 출력
    print("Type of _messages: ${_messages.runtimeType}"); // _messages의 타입 출력

    setState(() {
      _messages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          onSubmitted: _handleSubmitted,
          decoration: const InputDecoration(
            labelText: 'Enter text',
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_messages[index]),
                onTap: () => _handleDelete(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
