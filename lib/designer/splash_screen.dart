import 'package:flutter/material.dart';
import 'package:footwear_designer_247/designer/bottom_bar.dart';
import 'package:footwear_designer_247/designer/pro_footwear.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _tradeShoesHome();
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
            child: Image.asset(
              "assets/images/logo.png",
              width: 210,
            ),
          ),
        ],
      ),
    );
  }

  _tradeShoesHome() async {
    await Future.delayed(const Duration(milliseconds: 1405), () {});

    SharedPreferences.getInstance().then((prefs) async {
      if (!prefs.containsKey('shoesapikey')) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProFootwear(),
          ),
        );
        prefs.setDouble('shoesapikey', 65783985);
        await Future.delayed(const Duration(seconds: 4));
        try {
          final InAppReview inAppReview = InAppReview.instance;

          if (await inAppReview.isAvailable()) {
            inAppReview.requestReview();
          }
        } catch (e) {
          throw Exception(e);
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBarWear(),
          ),
        );
      }
    });
  }
}
