import 'package:flutter/material.dart';

class SlideDrawerRoute extends PageRouteBuilder {
  final Widget child;

  SlideDrawerRoute({required this.child})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, _, child) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
          );
          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
}
