import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/design/shoe_design/select_toe.dart';
import 'package:footwear_designer_247/wear/design/widgets/default_button.dart';

class SizeSelection extends StatefulWidget {
  const SizeSelection({super.key});

  @override
  State<SizeSelection> createState() => _SizeSelectionState();
}

class _SizeSelectionState extends State<SizeSelection> {
  int? _selectedSize;
  int? _selectedHeelHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe design'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(20.w),
              sliver: SliverToBoxAdapter(
                child:
                    Text('Select shoe size', style: TextStyle(fontSize: 20.sp)),
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
                    label: Text('${35 + index}'),
                    selected: _selectedSize == 35 + index,
                    selectedColor: ColorsWear.pink,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedSize = 35 + index;
                        }
                      });
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
                child: Text('Select heel height',
                    style: TextStyle(fontSize: 20.sp)),
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
                    selectedColor: ColorsWear.pink,
                    label: Text('${2 + index} cm'),
                    selected: _selectedHeelHeight == 2 + index,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedHeelHeight = selected ? 2 + index : null;
                      });
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
                      : ColorsWear.grey,
                  press: _selectedSize != null && _selectedHeelHeight != null
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SelectToeScreen(),
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
