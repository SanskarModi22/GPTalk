import 'package:flutter/material.dart';
import '../../../utils/common.dart';
import '../../chat/screens/chat_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  Future<String> init() async {
    //return LoginScreen.routeName;
    return ChatScreen.routeName;
  }

  @override
  void initState() {
    super.initState();
    init().then((redirectRoute) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        resetToScreen(context, redirectRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
