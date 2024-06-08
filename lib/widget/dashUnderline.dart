import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashedUnderline extends StatelessWidget {
  final Widget child;

  const DashedUnderline({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 1),
            painter: DashPainter(),
          ),
        ),
      ],
    );
  }
}

class DashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 40, dashSpace = 25, startX = 15;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    int count = 0;
    while (count < 5) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
      count++;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
