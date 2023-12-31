import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/wear/advices/advices_screen.dart';
import 'package:footwear_designer_247/wear/design/design_screen.dart';
// import 'package:footwear_designer_247/wear/examples/examplas_screen.dart';
import 'package:footwear_designer_247/wear/calculator/calculator_screen.dart';
import 'package:footwear_designer_247/wear/favorite/favorite_screen.dart';
import 'package:footwear_designer_247/wear/popular/popular_screen.dart';
import 'package:footwear_designer_247/wear/settings/settings_screen.dart';

class BottomBarWear extends StatefulWidget {
  const BottomBarWear({super.key, this.index = 0});
  final int index;

  @override
  State<BottomBarWear> createState() => BottomBarWearState();
}

class BottomBarWearState extends State<BottomBarWear> {
  final _screens = <Widget>[
    const DesignScreen(),
    const FeetCalculatorScreen(),

    const FavoriteScreen(),
    const PopularScreen(),
    const AdvicesScreen(),
    const SettingsScreen(),
  ];
  late int currentIndex = widget.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: ColorsWear.pink,
        ),
        padding: EdgeInsets.only(
          bottom: 26.h,
          top: 16.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => setState(() => currentIndex = 0),
              child: Image.asset(
                "assets/images/designActive.png",
                color: currentIndex == 0
                    ? ColorsWear.white
                    : ColorsWear.white.withOpacity(0.5),
                height: 30.h,
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 1),
              child: Image.asset(
                "assets/images/calculatorActive.png",
                color: currentIndex == 1
                    ? ColorsWear.white
                    : ColorsWear.white.withOpacity(0.5),
                height: 30.h,
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 2),
              child: Image.asset(
                "assets/images/examplesActive.png",
                color: currentIndex == 2
                    ? ColorsWear.white
                    : ColorsWear.white.withOpacity(0.5),
                height: 30.h,
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 3),
              child: Image.asset(
                "assets/images/advicesActive.png",
                color: currentIndex == 3
                    ? ColorsWear.white
                    : ColorsWear.white.withOpacity(0.5),
                height: 30.h,
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 4),
              child: Image.asset(
                "assets/images/SettingsActive.png",
                color: currentIndex == 4
                    ? ColorsWear.white
                    : ColorsWear.white.withOpacity(0.5),
                height: 30.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
