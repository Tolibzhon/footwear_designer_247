import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/motion_wear.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';
import 'package:lottie/lottie.dart';

class FeetCalculatorScreen extends StatefulWidget {
  const FeetCalculatorScreen({super.key});

  @override
  State<FeetCalculatorScreen> createState() => _FeetCalculatorScreenState();
}

class _FeetCalculatorScreenState extends State<FeetCalculatorScreen> {
  TextEditingController controller = TextEditingController();
  double footLength = 0;
  Map<String, String> shoeSizes = {};

  bool isLoad = false;
  bool dan = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Map<String, String> calculateShoeSizes(double footLength) {
    double canadaSize = footLength / 2.54 + 2;
    double usaSize = footLength / 2.54 + 1;
    double europeSize = footLength / 2.54 + 33;
    double russiaSize = footLength / 2.54 + 31;
    double ukSize = footLength / 2.54 - 1;
    double asiaSize = footLength / 2.54 + 33;
    double brazilSize = footLength / 2.54 + 32;

    return {
      'Canada':
          canadaSize.toStringAsFixed(1).replaceAll(RegExp(r"(\.0*|0*)$"), ""),
      'USA': usaSize.toStringAsFixed(1).replaceAll(RegExp(r"(\.0*|0*)$"), ""),
      'Europe':
          europeSize.toStringAsFixed(1).replaceAll(RegExp(r"(\.0*|0*)$"), ""),
      'Russia':
          russiaSize.toStringAsFixed(1).replaceAll(RegExp(r"(\.0*|0*)$"), ""),
      'UK': ukSize.toStringAsFixed(1).replaceAll(RegExp(r"(\.0*|0*)$"), ""),
      'Asia': asiaSize.toStringAsFixed(1).replaceAll(RegExp(r"(\.0*|0*)$"), ""),
      'Brazil':
          brazilSize.toStringAsFixed(1).replaceAll(RegExp(r"(\.0*|0*)$"), ""),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Feet calculator',
                style: StylesWear.style(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsWear.black,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsWear.pink.withOpacity(0.6),
                    border: Border.all(width: 1, color: ColorsWear.pink)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 5.h,
                                width: 5.w,
                                decoration: const BoxDecoration(
                                    color: ColorsWear.white,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Write the length of the feet',
                                style: StylesWear.style(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Container(
                                height: 5.h,
                                width: 5.w,
                                decoration: const BoxDecoration(
                                    color: ColorsWear.white,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Count and get the result',
                                style: StylesWear.style(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/calIm.png",
                      height: 65.h,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorsWear.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: ColorsWear.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mondopoint',
                      style: StylesWear.style(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsWear.black,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Mondopoint is the official international shoe size standard. Shoe size is determined by length of the foot in millimeters, which allows you to accurately select shoes.',
                      style: StylesWear.style(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorsWear.black,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: SizedBox(
                        width: 100.w,
                        child: TextField(
                          controller: controller,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Foot length (mm)',
                              hintStyle: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorsWear.black.withOpacity(0.4),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: MotionWear(
                        onPressed: () async {
                          if (controller.text.isNotEmpty) {
                            setState(() {
                              footLength =
                                  double.tryParse(controller.text) ?? 0;
                              shoeSizes = calculateShoeSizes(footLength);
                              isLoad = true;
                            });

                            await Future.delayed(
                                const Duration(milliseconds: 1000), () {});
                            setState(() {
                              isLoad = false;
                              dan = true;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 38.sp, vertical: 5.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorsWear.pink),
                          child: Text(
                            'Count',
                            style: StylesWear.style(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsWear.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              isLoad == true
                  ? Column(
                      children: [
                        SizedBox(height: 50.h),
                        Lottie.asset(
                          'assets/animations/animation 1.json',
                          height: 50.h,
                          width: 50.h,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 35.h),
                        Text(
                          'Loading your shoe size ',
                          style: StylesWear.style(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsWear.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              dan == true
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorsWear.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: ColorsWear.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'USA and Canada',
                                style: StylesWear.style(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.black,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shoe size (male)',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                  Text(
                                    '${shoeSizes['USA'] ?? 0}',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shoe size (female)',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                  Text(
                                    '${shoeSizes['Canada'] ?? 0}',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorsWear.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: ColorsWear.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Europe',
                                style: StylesWear.style(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.black,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shoe size',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                  Text(
                                    '${shoeSizes['Europe'] ?? 0}',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorsWear.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: ColorsWear.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Russia and CIS',
                                style: StylesWear.style(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.black,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shoe size',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                  Text(
                                    '${shoeSizes['Russia'] ?? 0}',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorsWear.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: ColorsWear.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UK and Ireland',
                                style: StylesWear.style(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.black,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shoe size',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                  Text(
                                    '${shoeSizes['UK'] ?? 0}',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorsWear.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: ColorsWear.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Asia',
                                style: StylesWear.style(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.black,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shoe size',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                  Text(
                                    '${shoeSizes['Asia'] ?? 0}',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorsWear.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: ColorsWear.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Brazil',
                                style: StylesWear.style(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.black,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shoe size',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                  Text(
                                    '${shoeSizes['Brazil'] ?? 0}',
                                    style: StylesWear.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
