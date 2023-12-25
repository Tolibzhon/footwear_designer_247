import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/primary_colors.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';

class AdditionalInserts extends StatefulWidget {
  const AdditionalInserts({super.key});

  @override
  State<AdditionalInserts> createState() => _AdditionalInsertsState();
}

class _AdditionalInsertsState extends State<AdditionalInserts> {
  int? selectedClaspIndex;
  int? selectedInsertIndex;
  final List<String> clasp = [
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
    "assets/images/bootsType/thighHigh.png",
  ];

  final List<String> inserts = [
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
    "assets/images/bootsType/army.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Shoe design",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: ColorsWear.black,
          ),
        ),
      ),
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
                      style: TextStyle(
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
                style: TextStyle(
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
                style: TextStyle(
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
                    : ColorsWear.grey,
                press: selectedClaspIndex != null && selectedInsertIndex != null
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PrimaryColors(),
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
