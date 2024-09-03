import 'package:flutter/material.dart';

class DrawPathPageThree extends StatelessWidget {
  const DrawPathPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _CustomBackground(size: size),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            _LoginButton(size: size),
          ],
        ),
      ),
    );
  }
}

class _CustomBackground extends StatelessWidget {
  const _CustomBackground({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.6,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: CustomPaint(
        painter: MultiParablePainter(
          color: Colors.blue[800]!,
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 16.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      child: SizedBox(
        width: size.width * 0.5,
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class MultiParablePainter extends CustomPainter {
  const MultiParablePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final initialYPoint = size.height * 0.9;

    final x1ControlPoint = size.width * 0.4;
    final y1ControlPoint = size.height * 0.7;

    final x2ControlPoint = size.width * 0.6;
    final y2ControlPoint = size.height * 1.1;

    final brush = Paint()..color = color;

    final path = Path()
      // Punto inicial (esquina superior izquierda)
      ..lineTo(0, initialYPoint)
      // Crear la parábola multiple cóncava hacia abajo y hacia arriba usando cubicTo
      ..cubicTo(
        x1ControlPoint,
        y1ControlPoint,
        x2ControlPoint,
        y2ControlPoint,
        size.width,
        initialYPoint,
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
      PointMode.lines,
      [
        Offset(0, initialYPoint),
        Offset(x1ControlPoint, y1ControlPoint),
        Offset(x2ControlPoint, y2ControlPoint),
        Offset(size.width, initialYPoint),
      ],
      controlPoints,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
