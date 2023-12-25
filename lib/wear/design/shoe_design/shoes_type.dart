import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/logic/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/shoes_material.dart';
import 'package:footwear_designer_247/wear/design/widgets/custom_appbar.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoesType extends StatefulWidget {
  const ShoesType({super.key});

  @override
  State<ShoesType> createState() => _ShoesTypeState();
}

class _ShoesTypeState extends State<ShoesType> {
  int? selectedShoeIndex;
  final TextEditingController _shoeNameController = TextEditingController();
  final List<Map<String, String>> shoes = [
    {
      "image": "assets/images/bootsType/thighHigh.png",
      "name": "Thigh High Boots"
    },
    {"image": "assets/images/bootsType/cowboy.png", "name": "Cowboy Boots"},
    {"image": "assets/images/bootsType/knee.png", "name": "Knee Boots"},
    {"image": "assets/images/bootsType/army.png", "name": "Army Boots"},
    {"image": "assets/images/bootsType/rubber.png", "name": "Rubber Boots"},
    {"image": "assets/images/bootsType/ankle.png", "name": "Ankle Boots"},
    {"image": "assets/images/bootsType/wedge.png", "name": "Wedge Boots"},
    {"image": "assets/images/bootsType/chelsea.png", "name": "Chelsea Boots"},
    {"image": "assets/images/bootsType/oxford.png", "name": "Oxford Boots"},
    {"image": "assets/images/bootsType/loafers.png", "name": "Loafers Boots"},
    {"image": "assets/images/bootsType/slipOn.png", "name": "Slip On Boots"},
    {"image": "assets/images/bootsType/trainers.png", "name": "Trainers Boots"},
    {
      "image": "assets/images/bootsType/ballerina.png",
      "name": "Ballerina Boots"
    },
    {"image": "assets/images/bootsType/convers.png", "name": "Convers Boots"},
    {"image": "assets/images/bootsType/sandals.png", "name": "Sandals Boots"},
    {
      "image": "assets/images/bootsType/gladiators.png",
      "name": "Gladiators Boots"
    },
    {
      "image": "assets/images/bootsType/kittenHeel.png",
      "name": "Kitten Heel Boots"
    },
    {"image": "assets/images/bootsType/pump.png", "name": "Pump Boots"},
    {"image": "assets/images/bootsType/bondage.png", "name": "Bondage Boots"},
    {
      "image": "assets/images/bootsType/platforms.png",
      "name": "Platforms Boots"
    },
    {"image": "assets/images/bootsType/t-strap.png", "name": "T-Stap Boots"},
  ];

  @override
  void dispose() {
    _shoeNameController.dispose();
    super.dispose();
  }

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
                  Text(
                    "Write the name of the shoes",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: ColorsWear.black,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: ColorsWear.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _shoeNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Text",
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
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
                  bool isSelected = selectedShoeIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedShoeIndex = index;
                          _shoeNameController.text = shoes[index]["name"]!;
                        },
                      );
                      var box = Hive.box<ShoeHiveModel>('shoes');
                      var shoe = ShoeHiveModel(
                        id: 0,
                        title: shoes[index]["name"]!,
                        imagePath: shoes[index]["image"]!,
                        material: '',
                        shoeSize: 0,
                        heelHeight: 0,
                        toeShoes: '',
                        additionalInserts: [],
                        primaryColors: [],
                      );
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
                                shoes[index]["image"]!,
                                height: 120.h,
                                width: 100.w,
                              ),
                              SizedBox(height: 8.h),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  shoes[index]["name"]!,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ColorsWear.black,
                                  ),
                                ),
                              ),
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
                childCount: shoes.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: DefaultButton(
                text: "Next",
                color: selectedShoeIndex != null
                    ? ColorsWear.pink
                    : ColorsWear.whiteGrey,
                press: selectedShoeIndex != null
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ShoesMaterial(),
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
