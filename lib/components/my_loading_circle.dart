import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

void showLoadingCircle(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurpleAccent.withOpacity(0.8),
                    Colors.blueAccent.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SmoothSpinner(),
                  const SizedBox(height: 20),
                  const Text(
                    "Please wait...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}

void hideLoadingCircle(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

class SmoothSpinner extends StatefulWidget {
  const SmoothSpinner({super.key});

  @override
  State<SmoothSpinner> createState() => _SmoothSpinnerState();
}

class _SmoothSpinnerState extends State<SmoothSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: child,
          );
        },
        child: CustomPaint(painter: SpinnerPainter()),
      ),
    );
  }
}

class SpinnerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;
    final Rect arcRect = Rect.fromCircle(
      center: Offset(radius, radius),
      radius: radius - 4,
    );

    canvas.drawArc(arcRect, 0, pi * 1.5, false, paint); // 270 degrees arc
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
