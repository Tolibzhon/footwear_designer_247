import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/screens/shoes_result.dart';
import 'package:footwear_designer_247/wear/design/widgets/custom_appbar.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PrimaryColors extends StatefulWidget {
  const PrimaryColors({super.key});

  @override
  State<PrimaryColors> createState() => _PrimaryColorsState();
}

class _PrimaryColorsState extends State<PrimaryColors> {
  Set<Color> selectedColors = {};

  List<Color?> availableColors = [
    Colors.red[400],
    Colors.red[300],
    Colors.red[200],
    Colors.red[100],
    Colors.red[50],
    Colors.red,
    Colors.blue[400],
    Colors.blue[300],
    Colors.blue[200],
    Colors.blue[100],
    Colors.blue[50],
    Colors.blue,
    Colors.green[400],
    Colors.green[300],
    Colors.green[200],
    Colors.green[100],
    Colors.green[50],
    Colors.green,
    Colors.yellow[400],
    Colors.yellow[300],
    Colors.yellow[200],
    Colors.yellow[100],
    Colors.yellow[50],
    Colors.yellow,
    Colors.orange[400],
    Colors.orange[300],
    Colors.orange[200],
    Colors.orange[100],
    Colors.orange[50],
    Colors.orange,
    Colors.purple[400],
    Colors.purple[300],
    Colors.purple[200],
    Colors.purple[100],
    Colors.purple[50],
    Colors.purple,
    Colors.cyan[400],
    Colors.cyan[300],
    Colors.cyan[200],
    Colors.cyan[100],
    Colors.cyan[50],
    Colors.cyan,
    Colors.teal[400],
    Colors.teal[300],
    Colors.teal[200],
    Colors.teal[100],
    Colors.teal[50],
    Colors.teal,
  ];

  void toggleColor(Color color) {
    setState(() {
      if (selectedColors.contains(color)) {
        selectedColors.remove(color);
      } else {
        if (selectedColors.length < 5) {
          selectedColors.add(color);
        }
      }
    });

    var box = Hive.box<ShoeHiveModel>('shoes');
    var shoe = box.get('currentShoe') as ShoeHiveModel;
    shoe.primaryColors = selectedColors.map((c) => c.value).toList();
    box.put('currentShoe', shoe);
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = selectedColors.isNotEmpty;

    return Scaffold(
      appBar: buildShoeAppBar("Shoe design"),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Select primary colors',
              style: TextStyle(
                color: ColorsWear.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 6,
              children: List.generate(
                availableColors.length,
                (index) {
                  final color = availableColors[index];
                  final isSelected = selectedColors.contains(color);

                  return Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        toggleColor(color!);
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                          border: isSelected
                              ? Border.all(
                                  color: ColorsWear.pink,
                                  width: 4.0,
                                )
                              : null,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 250.w,
            child: DefaultButton(
              text: "Finish",
              color: isButtonEnabled ? ColorsWear.pink : ColorsWear.greyLight,
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShoesResult(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
