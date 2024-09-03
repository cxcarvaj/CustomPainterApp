import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double height;
  const Separator({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
    );
  }
}
