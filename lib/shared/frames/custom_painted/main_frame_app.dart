import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MainFrameApp extends StatelessWidget {
  const MainFrameApp({super.key, this.customPaintChild});
  final Widget? customPaintChild;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        MediaQuery.of(context).size.width,
        (MediaQuery.of(context).size.width * 0.5833333333333334).toDouble(),
      ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
      child: customPaintChild,
    );
  }
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double roundnessFactor = 30;
    path.lineTo(size.width, size.height);

    // Move to mirrored (x: width - 0 = width)
    path.moveTo(size.width, size.height - (size.height * 0.2));

    path.lineTo(size.width, roundnessFactor);
    path.quadraticBezierTo(size.width, 0, size.width - roundnessFactor, 0);
    path.lineTo(roundnessFactor, 0);
    path.quadraticBezierTo(0, 0, 0, roundnessFactor);
    path.lineTo(0, size.height - roundnessFactor * 2);
    path.quadraticBezierTo(
      10,
      size.height - roundnessFactor,
      roundnessFactor * 1.5,
      size.height - roundnessFactor * 1.5,
    );
    path.lineTo(
      size.width - roundnessFactor * 0.6,
      size.height - (size.height * 0.33 - roundnessFactor * 0.3),
    );
    path.quadraticBezierTo(
      size.width,
      size.height - size.height * 0.33,
      size.width,
      size.height - (size.height * 0.33 + roundnessFactor),
    );
    // path.moveTo(o., y)// // Draw along the top edge
    // path.lineTo(size.width, 0);

    // // // Draw along the right edge
    // path.lineTo(size.width, size.height * 0.2);

    // // // Create the curved bottom using quadratic bezier curves
    // path.quadraticBezierTo(
    //   size.width, // Control point X
    //   size.height * 0.35, // Control point Y
    //   size.width * 0.7, // End point X
    //   size.height * 0.3, // End point Y
    // );

    // path.quadraticBezierTo(
    //   size.width * 0.7, // Control point X
    //   size.height * 0.8, // Control point Y
    //   0, // End point X
    //   size.height * 0.6, // End point Y
    // );

    // // Close the path
    // path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 =
        Paint()
          ..color = const Color.fromARGB(255, 255, 255, 255)
          ..style = PaintingStyle.fill
          ..strokeWidth = size.width * 0.00
          ..strokeCap = StrokeCap.butt
          ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
      Offset(size.width * -0.02, size.height * 0.50),
      Offset(size.width * 0.98, size.height * 0.50),
      [const Color(0xff1864c6), const Color(0xffffffff)],
      [0.00, 1.00],
    );

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0429270, size.height * 0.0048730);
    path_0.quadraticBezierTo(
      size.width * -0.0155939,
      size.height * 0.0008364,
      size.width * -0.0062502,
      size.height * 0.1017528,
    );
    path_0.lineTo(size.width * -0.0082173, size.height * 0.9030288);
    path_0.quadraticBezierTo(
      size.width * -0.0001031,
      size.height * 1.0054590,
      size.width * 0.0419435,
      size.height * 1.0100002,
    );
    path_0.quadraticBezierTo(
      size.width * 0.1894751,
      size.height * 1.0084865,
      size.width * 0.6320702,
      size.height * 1.0039452,
    );
    path_0.quadraticBezierTo(
      size.width * 0.6807556,
      size.height * 1.0100002,
      size.width * 0.6851816,
      size.height * 0.9151388,
    );
    path_0.quadraticBezierTo(
      size.width * 0.6849357,
      size.height * 0.8384424,
      size.width * 0.6841980,
      size.height * 0.6083530,
    );
    path_0.quadraticBezierTo(
      size.width * 0.6952629,
      size.height * 0.4988587,
      size.width * 0.7343588,
      size.height * 0.5054183,
    );
    path_0.cubicTo(
      size.width * 0.7825525,
      size.height * 0.5074366,
      size.width * 0.8789398,
      size.height * 0.5114733,
      size.width * 0.9271335,
      size.height * 0.5134916,
    );
    path_0.quadraticBezierTo(
      size.width * 0.9760648,
      size.height * 0.5210603,
      size.width * 0.9772943,
      size.height * 0.4065202,
    );
    path_0.quadraticBezierTo(
      size.width * 0.9758190,
      size.height * 0.1779446,
      size.width * 0.9753272,
      size.height * 0.1017528,
    );
    path_0.cubicTo(
      size.width * 0.9817202,
      size.height * 0.0265700,
      size.width * 0.9578693,
      size.height * -0.0026957,
      size.width * 0.9271335,
      size.height * 0.0028547,
    );
    path_0.cubicTo(
      size.width * 0.7060819,
      size.height * 0.0033593,
      size.width * 0.7060819,
      size.height * 0.0033593,
      size.width * 0.0429270,
      size.height * 0.0048730,
    );
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 =
        Paint()
          ..color = const Color.fromARGB(255, 33, 150, 243)
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.00
          ..strokeCap = StrokeCap.butt
          ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
