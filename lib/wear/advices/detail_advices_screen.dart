import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/advices/content/advices_content.dart';

class DetailAdvicesScreen extends StatelessWidget {
  const DetailAdvicesScreen({super.key, required this.advices});
  final AdvicesContent advices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              advices.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 420,
            child: Container(
              height: MediaQuery.of(context).size.height - 420,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: ColorsWear.white,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 30.sp,
                  left: 25.sp,
                  right: 25.sp,
                ),
                children: [
                  Text(
                    advices.title,
                    style: StylesWear.style(
                      fontSize: 24.h,
                      fontWeight: FontWeight.w600,
                      color: ColorsWear.pink,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    advices.dis,
                    style: StylesWear.style(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w400,
                      color: ColorsWear.black,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          // Back button
          Positioned(
            left: 20,
            top: 64,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/back.png",
                height: 30.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
