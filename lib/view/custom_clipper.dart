import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: CustomPaint(
          size: Size(
              MediaQuery.of(context).size.height * 0.5,
              (MediaQuery.of(context).size.width * 1.6)
                  .toDouble()),
          painter: RPSCustomPainter(),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_fill_0 = Paint()
      ..color = Color.fromARGB(255, 14, 13, 13)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4400000, size.height * 0.0062500);
    path_0.lineTo(size.width * 0.4680000, size.height * 0.0337500);
    path_0.lineTo(size.width * 0.4840000, size.height * 0.0537500);
    path_0.lineTo(size.width * 0.4880000, size.height * 0.0837500);
    path_0.lineTo(size.width * 0.4920000, size.height * 0.1187500);
    path_0.lineTo(size.width * 0.4920000, size.height * 0.1562500);
    path_0.lineTo(size.width * 0.4520000, size.height * 0.1887500);
    path_0.lineTo(size.width * 0.4320000, size.height * 0.2112500);
    path_0.lineTo(size.width * 0.3920000, size.height * 0.2287500);
    path_0.lineTo(size.width * 0.3480000, size.height * 0.2362500);
    path_0.lineTo(size.width * 0.3240000, size.height * 0.2462500);
    path_0.lineTo(size.width * 0.2880000, size.height * 0.2487500);
    path_0.lineTo(size.width * 0.2600000, size.height * 0.2562500);
    path_0.lineTo(size.width * 0.2120000, size.height * 0.2637500);
    path_0.lineTo(size.width * 0.1400000, size.height * 0.2662500);
    path_0.lineTo(size.width * 0.1160000, size.height * 0.2662500);
    path_0.lineTo(size.width * 0.0720000, size.height * 0.2562500);
    path_0.lineTo(size.width * 0.0640000, size.height * 0.2512500);
    path_0.lineTo(size.width * 0.0520000, size.height * 0.2512500);
    path_0.lineTo(size.width * 0.0240000, size.height * 0.2437500);
    path_0.lineTo(size.width * 0.0200000, size.height * 0.2437500);
    path_0.lineTo(size.width * 0.0120000, size.height * 0.2412500);
    path_0.lineTo(size.width * 0.0120000, size.height * 0.0037500);
    path_0.lineTo(0, size.height * 0.0012500);
    path_0.lineTo(size.width * 0.0040000, size.height * 0.0187500);
    path_0.lineTo(size.width * 0.0040000, size.height * 0.2387500);
    path_0.lineTo(0, size.height * 0.0287500);
    path_0.lineTo(size.width * 0.0120000, size.height * -0.0037500);
    path_0.lineTo(size.width * 0.4360000, size.height * -0.0012500);

    canvas.drawPath(path_0, paint_fill_0);

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
