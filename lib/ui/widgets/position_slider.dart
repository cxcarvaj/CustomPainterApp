import 'package:flutter/material.dart';

class PositionSlider extends StatelessWidget {
  const PositionSlider({
    super.key,
    required this.position,
    required this.positionLabel,
    this.onChanged,
    this.minValue = 0,
  });

  final String positionLabel;
  final double position;
  final double? minValue;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(positionLabel),
        Slider(
          value: position,
          min: minValue!,
          max: 200,
          onChanged: onChanged,
        ),
      ],
    );
  }
}