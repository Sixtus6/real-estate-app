import 'package:flutter/material.dart';

extension BuildContextMediaQuery on BuildContext {
  double widthPercent(double percentage) =>
      MediaQuery.of(this).size.width * percentage * 0.01;

  double heightPercent(double percentage) =>
      MediaQuery.of(this).size.height * percentage * 0.01;
}
