import 'package:flutter/material.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/shoes_result.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';

class PrimaryColors extends StatefulWidget {
  const PrimaryColors({super.key});

  @override
  State<PrimaryColors> createState() => _PrimaryColorsState();
}

class _PrimaryColorsState extends State<PrimaryColors> {
  Set<Color> selectedColors = {};

  List<Color> availableColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.amber,
    Colors.indigo,
  ];

  // Обработчик нажатия на цвет
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
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = selectedColors.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe design'),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Select primary colors',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 6,
              children: List.generate(availableColors.length, (index) {
                final color = availableColors[index];
                final isSelected = selectedColors.contains(color);

                return Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      toggleColor(color);
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
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: DefaultButton(
              text: "Finish",
              color: isButtonEnabled ? ColorsWear.pink : ColorsWear.grey,
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // TODO
                    builder: (context) => const ShoesResult(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
