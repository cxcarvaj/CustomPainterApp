import 'package:flutter/material.dart';

class PagesModel {
  final String label;
  final IconData icon;
  final Widget page;
  final Color iconColor;

  PagesModel({
    required this.label,
    required this.icon,
    required this.page,
    this.iconColor = Colors.black,
  });
}
