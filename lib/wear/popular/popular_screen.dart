import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/popular/detaile_popular.dart';
import 'package:footwear_designer_247/wear/popular/popular_cont.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular shoes',
                style: StylesWear.style(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: ColorsWear.black),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: listPopular.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 14),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailePopular(
                              model: listPopular[index],
                            ),
                          ));
                    },
                    child: WidgetPopular(
                      model: listPopular[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetPopular extends StatelessWidget {
  const WidgetPopular({
    super.key,
    required this.model,
  });
  final PopularCont model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.sp),
      padding: EdgeInsets.all(10.sp),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: ColorsWear.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            model.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: StylesWear.style(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsWear.black),
                ),
                SizedBox(height: 4.h),
                Text(
                  model.subTitle,
                  style: StylesWear.style(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorsWear.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
