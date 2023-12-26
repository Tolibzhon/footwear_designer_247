import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';

AppBar buildShoeAppBar(String title) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    title: Text(
      title,
      style: StylesWear.style(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: ColorsWear.black,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0, // Убрать тень
    iconTheme: const IconThemeData(color: ColorsWear.black),
  );
}
