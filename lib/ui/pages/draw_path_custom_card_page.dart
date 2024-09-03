import 'package:flutter/material.dart';

class DrawPathPage extends StatelessWidget {
  const DrawPathPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Draw Path'),
      ),
      body: const Center(
        child: Stack(
          children: [
            _CardBackground(),
            _CardData(),
          ],
        ),
      ),
    );
  }
}

class _CardData extends StatelessWidget {
  const _CardData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 30,
      left: 20,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$ 2,500.00',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  const _CardBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EllipsePainter extends CustomPainter {
  const EllipsePainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
