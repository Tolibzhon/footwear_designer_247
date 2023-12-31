import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function? press;

  const DefaultButton({
    super.key,
    required this.text,
    required this.color,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 156.w,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: color,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text,
          maxLines: 1,
          style: StylesWear.style(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
