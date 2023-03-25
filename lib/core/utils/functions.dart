import 'package:flutter/material.dart' show SnackBar, Text;

import '../global/keys.dart';

void showSnackbar(String message) {
  scaffoldMessengerKey.currentState
    ?..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
