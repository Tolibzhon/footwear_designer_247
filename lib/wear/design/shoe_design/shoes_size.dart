import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/logic/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/shoes_toe.dart';
import 'package:footwear_designer_247/wear/design/widgets/custom_appbar.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoesSize extends StatefulWidget {
  const ShoesSize({super.key});

  @override
  State<ShoesSize> createState() => _ShoesSizeState();
}

class _ShoesSizeState extends State<ShoesSize> {
  int? _selectedSize;
  int? _selectedHeelHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShoeAppBar("Shoe design"),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(20.w),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Select shoe size',
                    style: TextStyle(
                      color: ColorsWear.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20.w,
                crossAxisSpacing: 20.w,
                childAspectRatio: 3.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ChoiceChip(
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text('${35 + index}'),
                    selected: _selectedSize == 35 + index,
                    backgroundColor: ColorsWear.whiteGrey,
                    selectedColor: ColorsWear.pink,
                    // Пример для SizeSelection
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedSize = selected ? 35 + index : null;
                      });

                      var box = Hive.box<ShoeHiveModel>('shoes');
                      var shoe = box.get('currentShoe') as ShoeHiveModel;
                      shoe.shoeSize = _selectedSize!;
                      box.put('currentShoe', shoe);
                    },

                    labelStyle: TextStyle(
                      color: _selectedSize == 35 + index
                          ? Colors.white
                          : Colors.black,
                    ),
                  );
                },
                childCount: 12,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20.w),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Select heel height',
                    style: TextStyle(
                      color: ColorsWear.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20.w,
                crossAxisSpacing: 20.w,
                childAspectRatio: 3.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ChoiceChip(
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.transparent),
                      borderRadius:
                          BorderRadius.circular(10), // Радиус скругления
                    ),
                    backgroundColor: ColorsWear.whiteGrey,
                    selectedColor: ColorsWear.pink,
                    label: Text('${2 + index} cm'),
                    selected: _selectedHeelHeight == 2 + index,
                    // Пример для SizeSelection
                    onSelected: (bool selected) {
                      setState(
                        () {
                          _selectedHeelHeight = selected ? 2 + index : null;
                        },
                      );
                      var box = Hive.box<ShoeHiveModel>('shoes');
                      var shoe = box.get('currentShoe') as ShoeHiveModel;
                      shoe.heelHeight = _selectedHeelHeight!;
                      box.put('currentShoe', shoe);
                    },

                    labelStyle: TextStyle(
                      color: _selectedHeelHeight == 2 + index
                          ? Colors.white
                          : Colors.black,
                    ),
                  );
                },
                childCount: 9,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
                child: DefaultButton(
                  text: "Next",
                  color: _selectedSize != null && _selectedHeelHeight != null
                      ? ColorsWear.pink
                      : ColorsWear.whiteGrey,
                  press: _selectedSize != null && _selectedHeelHeight != null
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ShoesToe(),
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
