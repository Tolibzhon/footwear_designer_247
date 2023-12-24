import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Column(
          children: [
            Text(
              'Design creation',
              style: StylesWear.style(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: ColorsWear.black,
              ),
            )
          ],
        ),
      )),
    );
  }
}
