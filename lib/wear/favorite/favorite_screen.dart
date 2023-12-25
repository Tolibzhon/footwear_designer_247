import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/motion_wear.dart';
import 'package:footwear_designer_247/designer/saved_data.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';
import 'package:footwear_designer_247/wear/design/screens/pump_hive_screen.dart';
import 'package:footwear_designer_247/wear/examples/content/examples_content.dart';
import 'package:footwear_designer_247/wear/examples/detail_examplas_screen%20copy.dart';
import 'package:footwear_designer_247/wear/examples/widget/examples_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: ListView(
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
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                                        example: asas[0],
                                      ),
                                    ),
                                  );
                                },
                                child: ExamplesWidget(example: asas[0]));
                          },
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
              FutureBuilder(
                future: Future.value(Hive.box<ShoeHiveModel>('shoes')
                    .values
                    .where((shoe) => shoe.liked)
                    .toList()),
                builder:
                    (context, AsyncSnapshot<List<ShoeHiveModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("No Liked Local Shoes"),
                    );
                  }

                  var likedShoes =
                      snapshot.data!.where((shoe) => shoe.liked).toList();

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: likedShoes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 184,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PumpHiveScreen(
                                shoe: likedShoes[index],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset(
                                  likedShoes[index].imagePath,
                                  width: 160.w,
                                  height: 150.h,
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        likedShoes[index].liked =
                                            !likedShoes[index].liked;
                                      });
                                      await likedShoes[index].save();
                                    },
                                    child: Image.asset(
                                      likedShoes[index].liked
                                          ? "assets/images/liked.png"
                                          : "assets/images/disliked.png",
                                      height: 30.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Center(
                              child: Text(
                                likedShoes[index].title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
