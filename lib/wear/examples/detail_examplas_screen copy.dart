import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/examples/content/examples_content.dart';

class DetailExamplasScreen extends StatelessWidget {
  const DetailExamplasScreen({super.key, required this.example});
  final ExamplesContent example;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 25.h, color: ColorsWear.black)),
                  Text(
                    'Pump',
                    style: StylesWear.style(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: ColorsWear.black,
                    ),
                  ),
                  SizedBox(width: 25.h),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                'Shoes type',
                style: StylesWear.style(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Image.asset(
                  example.image,
                  height: 250.h,
                ),
              ),
              SizedBox(height: 69.h),
              Text(
                'Material of manufacture',
                style: StylesWear.style(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.symmetric(horizontal: 25.sp, vertical: 15.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorsWear.greyLight.withOpacity(0.3),
                ),
                child: Text(
                  example.material,
                  style: StylesWear.style(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsWear.black,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Shoe size',
                style: StylesWear.style(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.sp, vertical: 15.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorsWear.greyLight.withOpacity(0.3),
                ),
                child: Text(
                  '${example.size}',
                  style: StylesWear.style(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsWear.black,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Heel height',
                style: StylesWear.style(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.sp, vertical: 15.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorsWear.greyLight.withOpacity(0.3),
                ),
                child: Text(
                  '${example.height} cm',
                  style: StylesWear.style(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsWear.black,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Toe of the shoes',
                style: StylesWear.style(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.symmetric(horizontal: 25.sp, vertical: 15.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorsWear.greyLight.withOpacity(0.3),
                ),
                child: Text(
                  'Shoe toe: ${example.toe}',
                  style: StylesWear.style(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsWear.black,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Additional shoe inserts',
                style: StylesWear.style(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                example.inserts,
                style: StylesWear.style(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black.withOpacity(0.4),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Primary colors',
                style: StylesWear.style(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: example.colors
                    .map(
                      (colorCode) => Container(
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                           color: Color(colorCode),
                           shape: BoxShape.circle
                        ),
                        width: 30.w,
                        height: 30.h,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      )),
    );
  }
}
