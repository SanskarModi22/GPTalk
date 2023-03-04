import 'package:flutter/material.dart';
import 'package:gp_talk/routes/routing.dart';
import 'package:gp_talk/widgets/custom_colors.dart';

import 'modules/splash/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: CustomColors.primary,
          secondary: CustomColors.secondary,
        )),
        initialRoute: SplashScreen.routeName,
        routes: routes);
  }
}
