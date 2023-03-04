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

  // This method is called when the widget is inserted into the widget tree.
  @override
  @override
  void initState() {
// Call the superclass's initState() method.
    super.initState();
    frameCallback();
// Call the init() method using the await keyword to wait for the Future to complete.
  }

  Future<void> frameCallback() async {
    final redirectRoute = await init();
// Add a post-frame callback to execute the resetToScreen method.
// This is done so that the method is called after the current frame is built, avoiding
// a conflict with ongoing animations.
    WidgetsBinding.instance.addPostFrameCallback((_) {
// Call the resetToScreen method with the context and the redirectRoute argument.
      resetToScreen(context, redirectRoute);
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
