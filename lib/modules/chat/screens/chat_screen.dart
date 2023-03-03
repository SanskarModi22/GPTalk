import 'package:flutter/material.dart';

import '../../../widgets/custom_colors.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.darkBackground,
      ),
      body: Container(
        color: CustomColors.darkBackground,
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
