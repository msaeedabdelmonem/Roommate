import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Normal spacer. This widget can be combined with [RowItem] widgets.
Widget space([double space = 12, double spaceW = 0]) {
  return SizedBox(height: space.h, width: spaceW);
}
