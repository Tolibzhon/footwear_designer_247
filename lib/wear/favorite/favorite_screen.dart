import 'package:flutter/material.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<String> list;
  late List<ShoeHiveModel> likedShoes;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
      //  SafeArea(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 24.sp),
      //     child: FutureBuilder(
      //       future: Future.wait([
      //         SavedData.getEmptyDes(),
      //         SavedData.getPodcastList(),
      //         Future.value(Hive.box<ShoeHiveModel>('shoes')
      //             .values
      //             .where((shoe) => shoe.liked)
      //             .toList()),
      //       ]),
      //       builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return const Center(child: CircularProgressIndicator());
      //         }

      //         // if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //         //   return const Center(
      //         //     child: Text("No Liked Local Shoes"),
      //         //   );
      //         // }

      //         list = snapshot.data?[1] ?? [];
      //         likedShoes = snapshot.data?[2] ?? [];

      //         return ListView(
      //           children: [
      //             Text(
      //               'Favorites designs',
      //               style: StylesWear.style(
      //                 fontSize: 28,
      //                 fontWeight: FontWeight.w700,
      //                 color: ColorsWear.black,
      //               ),
      //             ),
      //             SizedBox(height: 30.h),
      //             (list.isNotEmpty || likedShoes.isNotEmpty)
      //                 ? GridView.builder(
      //                     shrinkWrap: true,
      //                     physics: const NeverScrollableScrollPhysics(),
      //                     itemCount: list.length + likedShoes.length,
      //                     gridDelegate:
      //                         const SliverGridDelegateWithFixedCrossAxisCount(
      //                       crossAxisCount: 2,
      //                       mainAxisSpacing: 20,
      //                       crossAxisSpacing: 20,
      //                       mainAxisExtent: 184,
      //                     ),
      //                     itemBuilder: (context, index) {
      //                       if (index < list.length) {
      //                         List<ExamplesContent> asas = listExamplesContent
      //                             .where((e) => '${e.id}' == list[index])
      //                             .toList();
      //                         return MotionWear(
      //                           onPressed: () {
      //                             Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                 builder: (context) =>
      //                                     DetailExamplasScreen(
      //                                   example: asas[0],
      //                                 ),
      //                               ),
      //                             );
      //                           },
      //                           child: ExamplesWidget(example: asas[0]),
      //                         );
      //                       } else {
      //                         int likedShoesIndex = index - list.length;
      //                         return InkWell(
      //                           onTap: () {
      //                             Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                 builder: (context) => PumpHiveScreen(
      //                                   shoe: likedShoes[likedShoesIndex],
      //                                 ),
      //                               ),
      //                             );
      //                           },
      //                           child: Column(
      //                             mainAxisSize: MainAxisSize.min,
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: <Widget>[
      //                               Stack(
      //                                 alignment: Alignment.center,
      //                                 children: <Widget>[
      //                                   Image.asset(
      //                                     likedShoes[likedShoesIndex].imagePath,
      //                                     width: 160.w,
      //                                     height: 150.h,
      //                                   ),
      //                                   Positioned(
      //                                     right: 0,
      //                                     top: 0,
      //                                     child: InkWell(
      //                                       onTap: () async {
      //                                         setState(() {
      //                                           likedShoes[likedShoesIndex]
      //                                                   .liked =
      //                                               !likedShoes[likedShoesIndex]
      //                                                   .liked;
      //                                         });
      //                                         await likedShoes[likedShoesIndex]
      //                                             .save();
      //                                       },
      //                                       child: Image.asset(
      //                                         likedShoes[likedShoesIndex].liked
      //                                             ? "assets/images/liked.png"
      //                                             : "assets/images/disliked.png",
      //                                         height: 30.h,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                               SizedBox(height: 8.h),
      //                               Center(
      //                                 child: Text(
      //                                   likedShoes[likedShoesIndex].title,
      //                                   style: StylesWear.style(
      //                                     fontSize: 16.h,
      //                                     fontWeight: FontWeight.w500,
      //                                     color: ColorsWear.black,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         );
      //                       }
      //                     },
      //                   )
      //                 : Center(
      //                     child: Text(
      //                       "Empty",
      //                       style: StylesWear.style(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w600,
      //                         color: ColorsWear.black.withOpacity(0.5),
      //                       ),
      //                     ),
      //                   ),
      //           ],
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
