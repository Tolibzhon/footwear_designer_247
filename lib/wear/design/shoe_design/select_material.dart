import 'package:flutter/material.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/size_selection.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';

class SelectMaterialScreen extends StatefulWidget {
  const SelectMaterialScreen({super.key});

  @override
  State<SelectMaterialScreen> createState() => _SelectMaterialScreenState();
}

class _SelectMaterialScreenState extends State<SelectMaterialScreen> {
  String? selectedMaterial;

  final toe = [
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
      appBar: AppBar(title: const Text("select material")),
      body: SafeArea(
        child: Column(
          children: [
            const Text("Select material of manufacture"),
            Expanded(
              child: ListView.builder(
                itemCount: toe.length,
                itemBuilder: (context, index) {
                  return MaterialCard(
                    text: toe[index],
                    isSelected: selectedMaterial == toe[index],
                    onTap: () {
                      setState(() {
                        selectedMaterial = toe[index];
                      });
                    },
                  );
                },
              ),
            ),
            DefaultButton(
              text: "Next",
              color:
                  selectedMaterial != null ? ColorsWear.pink : ColorsWear.grey,
              press: selectedMaterial != null
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  const SizeSelection(),
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
