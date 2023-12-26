import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/screens/additional_inserts.dart';
import 'package:footwear_designer_247/wear/design/widgets/custom_appbar.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoesToe extends StatefulWidget {
  const ShoesToe({super.key});

  @override
  State<ShoesToe> createState() => _ShoesToeState();
}

class _ShoesToeState extends State<ShoesToe> {
  String? selectedMaterial;

  final toe = [
    "Budapester",
    "Classic round toe shoe",
    "Almond shaped shoe toe",
    "Pointed nose",
    "Soft square",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShoeAppBar("Shoe design"),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Select the toe of the shoe",
              style: StylesWear.style(
                color: ColorsWear.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: toe.length,
                itemBuilder: (context, index) {
                  return MaterialCard(
                    text: toe[index],
                    isSelected: selectedMaterial == toe[index],
                    // Внутри onTap() для MaterialCard
                    onTap: () {
                      setState(() {
                        selectedMaterial = toe[index];
                      });

                      var box = Hive.box<ShoeHiveModel>('shoes');
                      var shoe = box.get('currentShoe') as ShoeHiveModel;
                      shoe.toeShoes = toe[index];
                      box.put('currentShoe', shoe);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.sp),
              child: SizedBox(
                width: 300.w,
                child: DefaultButton(
                  text: "Next",
                  color: selectedMaterial != null
                      ? ColorsWear.pink
                      : ColorsWear.whiteGrey,
                  press: selectedMaterial != null
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AdditionalInserts(),
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

class MaterialCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const MaterialCard({
    Key? key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isSelected ? ColorsWear.pink : ColorsWear.whiteGrey,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          text,
          style: StylesWear.style(
            color: isSelected ? ColorsWear.white : ColorsWear.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
