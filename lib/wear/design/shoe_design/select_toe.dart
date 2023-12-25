import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/additional_inserts.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';

class SelectToeScreen extends StatefulWidget {
  const SelectToeScreen({super.key});

  @override
  State<SelectToeScreen> createState() => _SelectToeScreenState();
}

class _SelectToeScreenState extends State<SelectToeScreen> {
  String? selectedMaterial;

  final materials = [
    "Budapester",
    "Classic round toe shoe",
    "Almond shaped shoe toe",
    "Pointed nose",
    "Soft square",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("select material")),
      body: SafeArea(
        child: Column(
          children: [
            const Text("Select the toe of the shoe"),
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
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: DefaultButton(
                text: "Next",
                color: selectedMaterial != null
                    ? ColorsWear.pink
                    : ColorsWear.grey,
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
          color: isSelected ? ColorsWear.pink : ColorsWear.grey,
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
          style: TextStyle(
            color: isSelected ? ColorsWear.white : ColorsWear.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
