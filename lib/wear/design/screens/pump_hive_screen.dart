import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';

class PumpHiveScreen extends StatelessWidget {
  final ShoeHiveModel shoe;

  const PumpHiveScreen({
    super.key,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
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
                    shoe.imagePath,
                    height: 250.h,
                    width: 250.w,
                  ),
                ),
                SizedBox(height: 69.h),
                Center(
                  child: Text(
                    shoe.title,
                    style: StylesWear.style(
                      color: ColorsWear.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  "Material of manufacture",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
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
                    shoe.material,
                    style: StylesWear.style(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorsWear.black,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  "Shoe size",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.sp, vertical: 15.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorsWear.greyLight.withOpacity(0.3),
                  ),
                  child: Text(
                    "${shoe.shoeSize}",
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
                    "${shoe.heelHeight} cm",
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: ColorsWear.whiteGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    shoe.toeShoes,
                    style: StylesWear.style(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorsWear.black,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  "Additional shoe inserts",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Image.asset(
                      shoe.additionalInserts[0],
                      height: 100.h,
                      width: 100.w,
                    ),
                    Image.asset(
                      shoe.additionalInserts[1],
                      height: 100.h,
                      width: 100.w,
                    ),
                  ],
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
                  children: shoe.primaryColors.map((colorValue) {
                    Color color = Color(colorValue);
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 20.0,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
