import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key, this.size = 16, this.strokeWidth = 2})
      : super(key: key);

  final double? size;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size,
      width: size,
      child: CircularProgressIndicator(strokeWidth: strokeWidth!),
    );
  }
}
