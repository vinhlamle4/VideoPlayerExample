import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension PaddingExtends on Widget {
  Widget padding(
      {double left = 0.0,
      double right = 0.0,
      double top = 0.0,
      double bottom = 0.0}) {
    return Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this);
  }

  Widget paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingEdge(EdgeInsets value) {
    return Padding(
      padding: value,
      child: this,
    );
  }
}
