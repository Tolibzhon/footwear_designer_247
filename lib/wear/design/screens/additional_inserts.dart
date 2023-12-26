import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/screens/primary_colors.dart';
import 'package:footwear_designer_247/wear/design/widgets/custom_appbar.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AdditionalInserts extends StatefulWidget {
  const AdditionalInserts({super.key});

  @override
  State<AdditionalInserts> createState() => _AdditionalInsertsState();
}

class _AdditionalInsertsState extends State<AdditionalInserts> {
  int? selectedClaspIndex;
  int? selectedInsertIndex;
  final List<String> clasp = [
    "assets/images/clasp/image 24.png",
    "assets/images/clasp/image 25.png",
    "assets/images/clasp/image 26.png",
    "assets/images/clasp/image 27.png",
    "assets/images/clasp/image 28.png",
    "assets/images/clasp/image 29.png",
    "assets/images/clasp/image 30.png",
    "assets/images/clasp/image 31.png",
    "assets/images/clasp/image 32.png",
    "assets/images/clasp/image 33.png",
    "assets/images/clasp/image 34.png",
    "assets/images/clasp/image 35.png",
  ];

  final List<String> inserts = [
    "assets/images/additional_inserts/image 24.png",
    "assets/images/additional_inserts/image 25.png",
    "assets/images/additional_inserts/image 26.png",
    "assets/images/additional_inserts/image 27.png",
    "assets/images/additional_inserts/image 28.png",
    "assets/images/additional_inserts/image 29.png",
    "assets/images/additional_inserts/image 30.png",
    "assets/images/additional_inserts/image 31.png",
    "assets/images/additional_inserts/image 32.png",
    "assets/images/additional_inserts/image 33.png",
    "assets/images/additional_inserts/image 34.png",
    "assets/images/additional_inserts/Vector.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShoeAppBar("Shoe design"),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Select shoes type",
                      style: StylesWear.style(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsWear.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: Text(
                "Clasp",
                style: StylesWear.style(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.sp,
                mainAxisSpacing: 8.sp,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  bool isSelected = selectedClaspIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedClaspIndex = index;
                      });

                      var box = Hive.box<ShoeHiveModel>('shoes');
                      var shoe = box.get('currentShoe') as ShoeHiveModel;
                      shoe.additionalInserts = [
                        ...shoe.additionalInserts,
                        clasp[index]
                      ];
                      box.put('currentShoe', shoe);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                clasp[index],
                                height: 120.h,
                                width: 100.w,
                              ),
                              SizedBox(height: 8.h),
                            ],
                          ),
                          if (isSelected)
                            Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: const ImageIcon(
                                AssetImage(
                                  'assets/icons/check.png',
                                ),
                                color: ColorsWear.pink,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: clasp.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: Text(
                "Additional inserts",
                style: StylesWear.style(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorsWear.black,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.sp,
                mainAxisSpacing: 8.sp,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  bool isSelected = selectedInsertIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedInsertIndex = index;
                      });
                      var box = Hive.box<ShoeHiveModel>('shoes');
                      var shoe = box.get('currentShoe') as ShoeHiveModel;
                      shoe.additionalInserts = [
                        ...shoe.additionalInserts,
                        inserts[index]
                      ];
                      box.put('currentShoe', shoe);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                inserts[index],
                                height: 120.h,
                                width: 100.w,
                              ),
                              SizedBox(height: 8.h),
                            ],
                          ),
                          if (isSelected)
                            Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: const ImageIcon(
                                AssetImage(
                                  'assets/icons/check.png',
                                ),
                                color: ColorsWear.pink,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: inserts.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: DefaultButton(
                text: "Next",
                color: selectedClaspIndex != null && selectedInsertIndex != null
                    ? ColorsWear.pink
                    : ColorsWear.whiteGrey,
                press: selectedClaspIndex != null && selectedInsertIndex != null
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PrimaryColors(),
                          ),
                        );
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
