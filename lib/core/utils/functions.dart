import 'package:flutter/material.dart' show SnackBar, Text, SnackBarBehavior;

import '../global/keys.dart';

void showSnackbar(String message) {
  scaffoldMessengerKey.currentState
    ?..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ));
}
