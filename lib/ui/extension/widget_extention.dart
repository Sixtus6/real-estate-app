import 'package:flutter/material.dart';

extension WidgetExtension on Widget? {
  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  Widget expand({flex = 1}) => Expanded(flex: flex, child: this!);

//Would come back for this and refactor it
  Widget onTap(
    Function? function,
  ) {
    return GestureDetector(
      onTap: function as void Function()?,
    );
  }

  // void toast(
  //   String? value, {
  //   ToastGravity? gravity = ToastGravity.TOP,
  //   length = Toast.LENGTH_SHORT,
  //   Color? bgColor = red,
  //   Color? textColor,
  //   bool isError = false,
  // }) {
  //   Fluttertoast.showToast(
  //     msg: value!,
  //     gravity: gravity,
  //     toastLength: length,
  //     backgroundColor: !isError ? green : bgColor,
  //     textColor: textColor,
  //   );
  // }

  /// return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }
}
