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
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
