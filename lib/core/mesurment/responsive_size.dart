import 'package:flutter/material.dart';

class AppDimensions {
  static const double baseHeight = 850;
  static const double baseWidth = 450;

  static const double baseLandscapeHeight = 750;
  static const double baseLandscapeWidth = 800;
}

extension Sizing on num {
  //! Responsive height based on orientation-aware base height
  double rh(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final orientation = mediaQuery.orientation;

    final double baseHeight =
        orientation == Orientation.portrait
            ? AppDimensions.baseHeight
            : AppDimensions.baseLandscapeHeight;

    return (this / baseHeight) * mediaQuery.size.height;
  }

  //! Responsive width based on orientation-aware base width
  double rw(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final orientation = mediaQuery.orientation;

    final double baseWidth =
        orientation == Orientation.portrait
            ? AppDimensions.baseWidth
            : AppDimensions.baseLandscapeWidth;

    return (this / baseWidth) * mediaQuery.size.width;
  }

  //! Responsive font scaling
  double rf(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final orientation = mediaQuery.orientation;

    final double baseHeight =
        orientation == Orientation.portrait
            ? AppDimensions.baseHeight
            : AppDimensions.baseLandscapeHeight;

    final double scaledFont = (this / baseHeight) * mediaQuery.size.height;

    //! Ensures accessibility scaling works (TextScaler API in Flutter 3.13+)
    return mediaQuery.textScaler.scale(scaledFont);
  }
}

//! orientations
class OrientationUtils {
  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= 600;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide < 600;
}
