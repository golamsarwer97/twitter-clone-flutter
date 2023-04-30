import 'package:flutter/material.dart';

class CanvasScreen extends StatefulWidget {
  const CanvasScreen({Key? key}) : super(key: key);

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomPaint(
              painter: Rectangle(),
              size: const Size(400, 265),
            )
          ],
        ),
      ),
    );
  }
}

class Rectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    Paint paint = Paint();
    Path path = Path();
    paint.shader = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromARGB(255, 242, 101, 197),
        Color.fromARGB(255, 154, 76, 237),
      ],
    ).createShader(rect);

    path.lineTo(0.2, size.height - size.height / 8);
    // path.lineTo(7, size.width / 1.04);

    // path.conicTo(size.width / 1.04, size.height, size.width,
    //     size.height - size.height / 8, 2);
    path.conicTo(
        size.width, size.height, size.width, size.height - size.height / 4, 2);

    path.lineTo(size.width, 0);
    path.close();
    canvas.drawShadow(path, const Color.fromARGB(255, 242, 101, 197), 4, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    // throw UnimplementedError();
  }
}
