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
    List<ShoeHiveModel> shoes = box.values.toList().cast<ShoeHiveModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Design creation',
            style: StylesWear.style(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: ColorsWear.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: shoes.isEmpty
              ? buildEmptyState(context)
              : buildShoesList(context, shoes),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ShoesType(),
            ),
          );
        },
        backgroundColor: ColorsWear.pink,
        child: const Icon(Icons.add, color: Colors.white),
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
          Text('Create your first design',
              style: StylesWear.style(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsWear.pink)),
        ],
      ),
    );
  }

  Widget buildShoesList(BuildContext context, List<ShoeHiveModel> shoes) {
    return ListView.builder(
      itemCount: shoes.length - 1,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(shoes[index].imagePath,
              width: 56.w, height: 56.h), // Adjust the size as needed
          title: Text(shoes[index].title, style: TextStyle(fontSize: 16.sp)),
          subtitle: Text('Size: ${shoes[index].shoeSize}'),
          onTap: () {
            // Handle the tap if needed
          },
        );
      },
    );
  }
}
