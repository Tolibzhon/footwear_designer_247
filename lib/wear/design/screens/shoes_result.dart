import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/bottom_bar.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/design/design_screen.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/widgets/custom_appbar.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoesResult extends StatelessWidget {
  const ShoesResult({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<ShoeHiveModel>('shoes');
    var shoe = box.get('currentShoe') as ShoeHiveModel;

    return Scaffold(
      appBar: buildShoeAppBar("Shoe design"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shoes type",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Center(
                  child: Image.asset(
                    shoe.imagePath,
                    height: 250.h,
                    width: 250.w,
                  ),
                ),
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: ColorsWear.whiteGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    shoe.material,
                    style: StylesWear.style(
                      color: ColorsWear.black,
                    ),
                  ),
                ),
                Text(
                  "Shoe size",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: ColorsWear.whiteGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "${shoe.shoeSize}",
                      style: StylesWear.style(
                        color: ColorsWear.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Heel height",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: ColorsWear.whiteGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "${shoe.heelHeight} cm",
                      style: StylesWear.style(
                        color: ColorsWear.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Toe of the shoes",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                      color: ColorsWear.black,
                    ),
                  ),
                ),
                Text(
                  "Additional shoe inserts",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                Text(
                  "Primary colors",
                  style: StylesWear.style(
                    color: ColorsWear.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                Center(
                  child: DefaultButton(
                    text: "Save",
                    color: ColorsWear.pink,
                    press: () {
                      var currentShoe = box.get('currentShoe') as ShoeHiveModel;

                      // ? Новый экземляр с юник ключом
                      var newShoe = ShoeHiveModel(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: currentShoe.title,
                        imagePath: currentShoe.imagePath,
                        material: currentShoe.material,
                        shoeSize: currentShoe.shoeSize,
                        heelHeight: currentShoe.heelHeight,
                        toeShoes: currentShoe.toeShoes,
                        additionalInserts: currentShoe.additionalInserts,
                        primaryColors: currentShoe.primaryColors,
                        liked: false,
                      );

                      String uniqueKey = 'shoe_${newShoe.id}';

                      box.put(uniqueKey, newShoe);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: ColorsWear.white,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/logo.png',
                                        height: 150.h,
                                        width: 150.w,
                                      ),
                                      Text(
                                        'Your shoes design is saved',
                                        style: StylesWear.style(
                                          fontSize: 20.sp,
                                          color: ColorsWear.pink,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.check),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DesignScreen(),
                                      ),
                                    );
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const BottomBarWear(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ).then(
                        (_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DesignScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
