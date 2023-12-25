import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/logic/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/shoes_size.dart';
import 'package:footwear_designer_247/wear/design/widgets/custom_appbar.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoesMaterial extends StatefulWidget {
  const ShoesMaterial({super.key});

  @override
  State<ShoesMaterial> createState() => _ShoesMaterialState();
}

class _ShoesMaterialState extends State<ShoesMaterial> {
  String? selectedMaterial;

  final materials = [
    'Suede',
    'Artificial leather',
    'Genuine Leather',
    'Combination skin',
    'Leather substitute (leatherette)',
    'Felt',
    'Nubuck artificial',
    'Natural nubuck',
    'Rubber',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShoeAppBar("Shoe design"),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Select material of manufacture",
              style: TextStyle(
                color: ColorsWear.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: materials.length,
                itemBuilder: (context, index) {
                  return MaterialCard(
                    text: materials[index],
                    isSelected: selectedMaterial == materials[index],
                    onTap: () {
                      setState(() {
                        selectedMaterial = materials[index];
                      });

                      var box = Hive.box<ShoeHiveModel>('shoes');
                      var shoe = box.get('currentShoe') as ShoeHiveModel;
                      shoe.material = materials[index];
                      box.put('currentShoe', shoe);
                    },
                  );
                },
              ),
            ),
            DefaultButton(
              text: "Next",
              color: selectedMaterial != null
                  ? ColorsWear.pink
                  : ColorsWear.whiteGrey,
              press: selectedMaterial != null
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShoesSize(),
                        ),
                      );
                    }
                  : null,
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
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? ColorsWear.white : ColorsWear.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
