import 'dart:ui';

import 'package:flutter/material.dart';

class DrawPathPageTwo extends StatelessWidget {
  const DrawPathPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Draw Path'),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Colors.teal, Colors.blue],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: const CustomPaint(
                painter: ParablePainter(
                  gradient: LinearGradient(
                    colors: [Colors.teal, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            const Text(
              'Welcome to Flutter Day',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'We are happy to have you here! 🎉',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  side: const BorderSide(
                    color: Colors.teal,
                    width: 2.0,
                  ),
                ),
              ),
              child: const Text(
                'Join the event',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParablePainter extends CustomPainter {
  const ParablePainter({required this.gradient});

  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    final initialYPoint = size.height * 0.8;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final brush = Paint()..shader = gradient.createShader(rect);

    final path = Path()
      // Punto inicial (esquina superior izquierda)
      ..lineTo(0, initialYPoint)
      // Crear una parábola cóncava hacia arriba usando quadraticBezierTo
      ..quadraticBezierTo(
        size.width / 2, // Punto de control (centro inferior)
        size.height * 1.1, // Altura mínima de la parábola
        size.width, // Punto final (esquina superior derecha)
        initialYPoint, // Misma altura que el punto inicial
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, brush);

    // Draw the control points
    final controlPoints = Paint()
      ..color = Colors.red
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    canvas.drawPoints(
      PointMode.points,
      [
        Offset(0, initialYPoint),
        Offset(size.width / 2, size.height * 1.1),
        Offset(size.width, initialYPoint),
      ],
      controlPoints,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
