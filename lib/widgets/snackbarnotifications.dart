import 'package:flutter/material.dart';

/* class SnackBarNotifications extends StatelessWidget {
  const SnackBarNotifications({Key? key}) : super(key: key);
  static GlobalKey<ScaffoldMessengerState> menssengerKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return 
  }
}
 */

class SnackBarNotifications {
  static GlobalKey<ScaffoldMessengerState> menssengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    ));
    menssengerKey.currentState!.showSnackBar(snackBar);
  }
}
