import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/custom_text.dart';

void showSnackBar(BuildContext context, {required String message}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: CustomText(message),
      action: SnackBarAction(
          label: 'X',
          textColor: Colors.white,
          onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

void logApiErrorAndShowMessage(BuildContext context,
    {required dynamic exception}) {
  /*if (exception is ApiException) {
    String message = exception.error.message ?? exception.message;
    showSnackBar(context, message: message);
  } else {
    if (kDebugMode) {
      print(exception);
    }
    showSnackBar(context, message: 'Something went wrong');
    FirebaseCrashlytics.instance.recordError(
        exception, StackTrace.fromString('logApiErrorAndShowMessage'));
  }*/
}

void logGenericError(error) {
  debugPrint('logGenericError: $error');
  /*FirebaseCrashlytics.instance
      .recordError(error, StackTrace.fromString('logGenericError'));*/
}

Future<String?> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  } else {
    return null;
  }
}

// This function is used to reset the navigation stack to a specified screen.
// It pops all the screens from the stack and then pushes the specified screen onto the stack.
void resetToScreen(BuildContext context, String route) {
  Navigator.of(context).popAndPushNamed(route);
}

// This function is used to navigate to a specified screen by pushing it onto the navigation stack.
void navigateToScreen(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

// This function returns a boolean value indicating whether the navigation stack can be popped, i.e., whether there is a screen to go back to.
bool canGoBack(BuildContext context) => Navigator.canPop(context);

// This function is used to pop the current screen from the navigation stack and go back to the previous screen.
void goBack(BuildContext context) {
  Navigator.of(context).pop();
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      //This line returns a list of key-value pairs in the Map.
      .map((MapEntry<String, String> e) =>
          //This line uses the map function to transform each key-value pair in the list into a new string.
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      //This line encodes the key and value of the current key-value pair and returns a string in the format key=value.
      .join('&');
  //This line joins all the transformed strings using the & symbol as a separator.
}

void showToastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM);
}
