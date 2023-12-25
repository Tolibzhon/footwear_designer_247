import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/design/logic/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/shoes_type.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<ShoeHiveModel>('shoes');
    ShoeHiveModel? shoe = box.get('currentShoe');

    bool hasData = shoe != null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Design creation',
                    style: StylesWear.style(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorsWear.black,
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: ColorsWear.pink,
                      child: InkWell(
                        splashColor: ColorsWear.white,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ShoesType(),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 35.h,
                          width: 35.w,
                          child: const Icon(
                            Icons.add,
                            color: ColorsWear.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: hasData
                    ? buildShoeDisplay(context, shoe)
                    : buildEmptyState(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 150.h,
            width: 150.w,
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Create your first design',
            style: StylesWear.style(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: ColorsWear.pink,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShoeDisplay(BuildContext context, ShoeHiveModel shoe) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          shoe.imagePath,
          height: 120.h,
          width: 100.w,
        ),
        SizedBox(height: 8.h),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            shoe.title,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorsWear.black,
            ),
          ),
        ),
      ],
    );
  }
}
