import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/motion_wear.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/examples/content/examples_content.dart';
import 'package:footwear_designer_247/wear/examples/detail_examplas_screen%20copy.dart';
import 'package:footwear_designer_247/wear/examples/widget/examples_widget.dart';
import 'package:footwear_designer_247/wear/favorite/favorite_screen.dart';

class ExamplasScreen extends StatelessWidget {
  const ExamplasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ready-made examples',
              style: StylesWear.style(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: ColorsWear.black,
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: listExamplesContent.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 184),
                itemBuilder: (context, index) {
                  return MotionWear(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailExamplasScreen(
                              example: listExamplesContent[index],
                            ),
                          ),
                        );
                      },
                      child:
                          ExamplesWidget(example: listExamplesContent[index]));
                },
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      )),
    );
  }
}
