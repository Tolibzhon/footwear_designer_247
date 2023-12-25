import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/motion_wear.dart';
import 'package:footwear_designer_247/designer/saved_data.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/examples/content/examples_content.dart';
import 'package:footwear_designer_247/wear/examples/detail_examplas_screen%20copy.dart';
import 'package:footwear_designer_247/wear/examples/widget/examples_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
              'Favorites designs',
              style: StylesWear.style(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: ColorsWear.black,
              ),
            ),
            SizedBox(height: 30.h),
            FutureBuilder(
              future: SavedData.getPodcastList(),
              builder: (context, data) {
                List<String> list = data.data ?? [];
                return list.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: list.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  mainAxisExtent: 184),
                          itemBuilder: (context, index) {
                            List<ExamplesContent> asas = listExamplesContent
                                .where((e) => '${e.id}' == list[index])
                                .toList();
                            return MotionWear(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailExamplasScreen(
                                        example:  asas[0],
                                      ),
                                    ),
                                  );
                                },
                                child: ExamplesWidget(example: asas[0]));
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          "Empty",
                          style: StylesWear.style(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorsWear.black.withOpacity(0.5),
                          ),
                        ),
                      );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      )),
    );
  }
}
