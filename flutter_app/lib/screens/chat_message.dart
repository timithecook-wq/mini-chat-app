import 'package:flutter/material.dart';

class ChatMessageScreen extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String avatarUrl;
  const ChatMessageScreen({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [Image.asset(avatarUrl), Text(name), Text(lastMessage)],
      ),
    );
  }
}
