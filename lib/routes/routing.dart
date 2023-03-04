import 'package:flutter/material.dart';

import '../modules/chat/screens/chat_screen.dart';
import '../modules/splash/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  ChatScreen.routeName: (context) => const ChatScreen(),
};
