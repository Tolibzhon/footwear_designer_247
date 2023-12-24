// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/bottom_bar.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigatetohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/logo.png", width: 210),
          ),
          SizedBox(height: 12.h),
          Text(
            'Create your first design',
            style: StylesWear.style(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: ColorsWear.pink,
            ),
          )
        ],
      ),
    );
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1499), () {});

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomBarWear(),
      ),
    );
  }
}
