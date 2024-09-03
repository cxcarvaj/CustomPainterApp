import 'package:custom_paint/ui/models/models.dart';
import 'package:custom_paint/ui/pages/pages.dart';
import 'package:flutter/material.dart';

List<PagesModel> pages = [
  PagesModel(
    label: 'Draw Line',
    icon: Icons.line_axis,
    page: const DrawLinePage(),
  ),
  PagesModel(
    label: 'Draw Rect',
    icon: Icons.rectangle,
    page: const DrawRectPage(),
    iconColor: Colors.blue,
  ),
  PagesModel(
    label: 'Draw Circle',
    icon: Icons.circle,
    page: const DrawCirclePage(),
    iconColor: Colors.green,
  ),
  PagesModel(
    label: 'Draw Arc',
    icon: Icons.architecture,
    page: const DrawArcPage(),
    iconColor: Colors.amber,
  ),
  PagesModel(
    label: 'Custom Card',
    icon: Icons.credit_card,
    page: const DrawPathPage(),
    iconColor: Colors.lightBlueAccent,
  ),
  PagesModel(
    label: 'Welcome Screen',
    icon: Icons.pattern_sharp,
    page: const DrawPathPageTwo(),
    iconColor: Colors.purpleAccent,
  ),
  PagesModel(
    label: 'Login Screen',
    icon: Icons.cable_outlined,
    page: const DrawPathPageThree(),
    iconColor: Colors.pink,
  ),
];
