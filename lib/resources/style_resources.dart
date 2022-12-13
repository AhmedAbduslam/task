import 'package:flutter/material.dart';
abstract class StyleResources {
  static const ScrollPhysics scrollPhysics =
      AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics());

  static const Duration baseDuration = Duration(milliseconds: 200);
  static const Curve baseCurve = Curves.easeInOut;
}
