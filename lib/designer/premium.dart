import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/bottom_bar.dart';
import 'package:footwear_designer_247/designer/buy_footwear_functions.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/doc_wear.dart';
import 'package:footwear_designer_247/designer/motion_wear.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/designer/web.dart';

class Premium extends StatefulWidget {
  const Premium({Key? key, this.canPop = false}) : super(key: key);
  final bool canPop;
  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  bool cxcxc = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsWear.pink,
      body: Stack(
        children: [
          Positioned(
            top: 70,
            right: 25,
            child: InkWell(
              onTap: () {
                if (widget.canPop) {
                  Navigator.pop(context);
                  return;
                }
                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const BottomBarWear(),
                  ),
                  ModalRoute.withName('/'),
                );
              },
              child: Image.asset(
                'assets/images/remove-button.png',
                height: 30.h,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Image.asset(
                  'assets/images/premiumIc.png',
                  height: 250.h,
                ),
              ),
              SizedBox(height: 60.h),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.sp),
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Text(
                              'PREMIUM',
                              style: StylesWear.style(
                                fontSize: 32.h,
                                fontWeight: FontWeight.w700,
                                color: ColorsWear.black,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Image.asset('assets/images/pr.png', height: 30.h),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/fi_5291043.png',
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Unlimited design creation',
                                    style: StylesWear.style(
                                      fontSize: 24.h,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsWear.black,
                                    ),
                                  ),
                                  Text(
                                    'Create your own shoes designs unlimited',
                                    style: StylesWear.style(
                                      fontSize: 18.h,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/fi_5291043.png',
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'No Ads',
                                    style: StylesWear.style(
                                      fontSize: 24.h,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsWear.black,
                                    ),
                                  ),
                                  Text(
                                    'Remove advertisements',
                                    style: StylesWear.style(
                                      fontSize: 18.h,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsWear.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        MotionWear(
                          onPressed: () async {
                            setState(() {
                              cxcxc = true;
                            });
                            final apphudPaywalls = await Apphud.paywalls();

                            await Apphud.purchase(
                              product: apphudPaywalls
                                  ?.paywalls.first.products?.first,
                            ).whenComplete(
                              () async {
                                if (await Apphud.hasPremiumAccess() ||
                                    await Apphud.hasActiveSubscription()) {
                                  await buyFootwearFuncSet();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const BottomBarWear(),
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                            );
                            setState(() {
                              cxcxc = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 13.sp, horizontal: 30.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorsWear.pink,
                            ),
                            child: Center(
                              child: cxcxc
                                  ? const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    )
                                  : Text(
                                      'Buy Premium for \$0,99',
                                      style: StylesWear.style(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsWear.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Row(
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
                        SizedBox(height: 20.h)
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
      width: isActive ? 10 : 10,
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
        SizedBox(height: 20.h),
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
      subTitle: 'App for creating your own\nshoe designs',
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
