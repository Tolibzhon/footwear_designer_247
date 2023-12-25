import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/screens/pump_hive_screen.dart';
import 'package:footwear_designer_247/wear/design/screens/shoes_type.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({
    super.key,
  });

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box<ShoeHiveModel>('shoes');
    List<ShoeHiveModel> shoes = box.values.toList().cast<ShoeHiveModel>();

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
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: shoes.isEmpty
                    ? buildEmptyState(context)
                    : buildShoesList(context, shoes),
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
          Image.asset("assets/images/logo.png", height: 150.h, width: 150.w),
          SizedBox(height: 25.h),
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

  Widget buildShoesList(BuildContext context, List<ShoeHiveModel> shoes) {
    return GridView.builder(
      itemCount: shoes.length - 1,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PumpHiveScreen(
                  shoe: shoes[index],
                ),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    shoes[index].imagePath,
                    width: 160.w,
                    height: 184.h,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          shoes[index].liked = !shoes[index].liked;
                        });
                        await shoes[index].save();
                      },
                      child: Image.asset(
                        shoes[index].liked
                            ? "assets/images/liked.png"
                            : "assets/images/disliked.png",
                        height: 30.h,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  shoes[index].title,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        mainAxisExtent: 300,
      ),
    );
  }
}
