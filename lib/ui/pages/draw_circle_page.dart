import 'package:custom_paint/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DrawCirclePage extends StatefulWidget {
  const DrawCirclePage({super.key});

  @override
  State<DrawCirclePage> createState() => _DrawCirclePageState();
}

class _DrawCirclePageState extends State<DrawCirclePage> {
  double _radius = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Draw Circle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: DrawCirclePainter(radius: _radius),
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            PositionSlider(
              positionLabel: 'Radius Value: ${_radius.round()}',
              minValue: 10,
              position: _radius,
              onChanged: (double value) {
                _radius = value;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawCirclePainter extends CustomPainter {
  final double radius;

  const DrawCirclePainter({required this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    var center = size / 2;

    canvas.drawCircle(Offset(center.width, center.height), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
