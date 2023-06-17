import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget kHeight(double height) {
  return SizedBox(
    height: height.h,
  );
}

Widget kWidth(double width) {
  return SizedBox(
    width: width.w,
  );
}
