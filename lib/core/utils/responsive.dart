import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/utils/constant.dart';

class Responsive {
  late double blockSizeHorizontal;
  late double blockSizeVertical;
  late double textRatio;

  setContext(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    textRatio = MediaQuery.of(context).textScaleFactor;
    blockSizeHorizontal = width / 100; // 4
    blockSizeVertical = height / 100; // 6
  }

  double setWidth(val) {
    return blockSizeHorizontal * val;
  }

  double setHeight(val) {
    return blockSizeVertical * val;
  }

  double setTextScale(val) {
    return Constant.textScaleSize * val;
  }

  double setFormLabelWidth() {
    return setWidth(Constant.formLabelWidth);
  }

  double setFormLabelHeight() {
    return setHeight(Constant.formLabelWidth);
  }
}
