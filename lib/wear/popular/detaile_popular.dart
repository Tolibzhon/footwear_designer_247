import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/popular/popular_cont.dart';

class DetailePopular extends StatelessWidget {
  const DetailePopular({super.key, required this.model});
  final PopularCont model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  model.image,
                  width: MediaQuery.of(context).size.width,
                  height: 450.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  child: Text(
                    model.title,
                    style: StylesWear.style(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: ColorsWear.pink),
                  ),
                ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Text(
                model.description,
                style: StylesWear.style(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorsWear.black),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
