import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';

class RotatingAvatarScreen extends StatefulWidget {
  @override
  _RotatingAvatarScreenState createState() => _RotatingAvatarScreenState();
}

class _RotatingAvatarScreenState extends State<RotatingAvatarScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final double outerRadius = 120.0;
  final double avatarRadius = 30.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    )..repeat(); // Keep rotating
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _calculatePosition(double angle) {
    // Subtract avatarRadius to keep it inside the circle
    double r = outerRadius - avatarRadius;
    double x = r * math.cos(angle);
    double y = r * math.sin(angle);
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer Circle
            Container(
              width: outerRadius * 2,
              height: outerRadius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black54, width: 2),
              ),
            ),

            // Rotating Avatar inside the border
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                double angle = _controller.value * 2 * math.pi;
                Offset offset = _calculatePosition(angle);
                return Transform.translate(offset: offset, child: child);
              },
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundColor: AppColor.kPRIMARYCOLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
