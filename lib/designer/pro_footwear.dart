import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/bottom_bar.dart';
import 'package:footwear_designer_247/designer/buy_footwear_functions.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/doc_wear.dart';
import 'package:footwear_designer_247/designer/motion_wear.dart';
import 'package:footwear_designer_247/designer/premium.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/designer/web.dart';

class ProFootwear extends StatefulWidget {
  const ProFootwear({Key? key}) : super(key: key);

  @override
  State<ProFootwear> createState() => _ProFootwearState();
}

class _ProFootwearState extends State<ProFootwear> {
  late PageController controller;
  int currentPageIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsWear.pink,
      body: Column(
        children: [
          SizedBox(height: 60.h),
          Center(
            child: Image.asset(
              ProContent().list[currentPageIndex].image,
              height: 300.h,
            ),
          ),
          SizedBox(height: 47.h),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: ColorsWear.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Expanded(
                    child: PageView.builder(
                      itemCount: ProContent().list.length,
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      itemBuilder: ((context, index) => WelcomeData(
                            title: ProContent().list[index].title,
                            subTitle: ProContent().list[index].subTitle,
                          )),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        ProContent().list.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: DotIndicator(
                            isActive: index == currentPageIndex,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  FutureBuilder(
                      future: buyFootwearFuncGet(),
                      builder: (context, snapshot) {
                        return MotionWear(
                          onPressed: () async {
                            if (currentPageIndex == 2) {
                              if (snapshot.hasData && !snapshot.data!) {
                                Navigator.pushAndRemoveUntil<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const Premium(),
                                  ),
                                  ModalRoute.withName('/'),
                                );
                              } else {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BottomBarWear(),
                                  ),
                                  (protected) => false,
                                );
                              }
                            } else {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                          child: Container(
                            width: 250.w,
                            padding: EdgeInsets.symmetric(vertical: 13.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorsWear.pink,
                            ),
                            child: Center(
                              child: Text(
                                'Next',
                                style: StylesWear.style(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Wear(
                                  url: DocWear.terms,
                                  title: "Term of Use",
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Term of Service",
                            style: StylesWear.style(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: ColorsWear.pink,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            buyFootwearFuncRestore(context);
                          },
                          child: Text(
                            "Restore",
                            style: StylesWear.style(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: ColorsWear.pink,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Wear(
                                  url: DocWear.privacy,
                                  title: "Privacy Policy",
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Privacy Policy",
                            style: StylesWear.style(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: ColorsWear.pink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 10 : 10,
      width: isActive ? 40 : 10,
      decoration: BoxDecoration(
          color: isActive ? ColorsWear.pink : ColorsWear.grey,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}

class WelcomeData extends StatelessWidget {
  const WelcomeData({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: StylesWear.style(
            color: ColorsWear.black,
            fontSize: 30.h,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.h),
        FittedBox(
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: StylesWear.style(
              color: ColorsWear.black,
              fontSize: 24.h,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class ProModel {
  final String title;
  final String subTitle;
  final String image;

  ProModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

class ProContent {
  List<ProModel> list = <ProModel>[
    ProModel(
      image: "assets/images/onbording1.png",
      title: 'Welcome to\nFootwear Designer',
      subTitle: 'Find out what type of shoes\nsuits you',
    ),
    ProModel(
      image: "assets/images/onbording2.png",
      title: 'Personalized\nShoes',
      subTitle: 'Order shoes that suits your\nunique needs and style',
    ),
    ProModel(
      image: "assets/images/onbording3.png",
      title: 'Еasks to level up',
      subTitle: 'Read advices for choosing\nthe right shoes',
    ),
  ];
}
