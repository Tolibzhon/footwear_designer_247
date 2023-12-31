import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/buy_footwear_functions.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/doc_wear.dart';
import 'package:footwear_designer_247/designer/motion_wear.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/designer/web.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final String shareLink = 'https://apps.apple.com/us/app/footwear-designer/id6474973532';
  void _shareLink(String link) {
    Share.share(link, subject: 'Check out this link!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Column(
          children: [
            Text(
              'Settings',
              style: StylesWear.style(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: ColorsWear.black,
              ),
            ),
            SizedBox(height: 30.h),
            SettingsWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Wear(
                      title: 'Privacy policy',
                      url: DocWear.privacy,
                    ),
                  ),
                );
              },
              image: "assets/images/privacy policy.png",
              title: 'Privacy Policy',
            ),
            SizedBox(height: 25.h),
            SettingsWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Wear(
                      title: 'Term of use',
                      url: DocWear.terms,
                    ),
                  ),
                );
              },
              image: "assets/images/term of use.png",
              title: 'Term of use',
            ),
            SizedBox(height: 25.h),
            SettingsWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Wear(
                      title: 'Contact us',
                      url: DocWear.support,
                    ),
                  ),
                );
              },
              image: "assets/images/contuct us.png",
              title: 'Contact us',
            ),
            SizedBox(height: 25.h),
            FutureBuilder(
              future: buyFootwearFuncGet(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.data!) {
                  return Column(
                    children: [
                      SettingsWidget(
                        onTap: () {
                          buyFootwearFuncRestore(context);
                        },
                        image: "assets/images/restore.png",
                        title: 'Restore',
                      ),
                      SizedBox(height: 25.h),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
            SettingsWidget(
              onTap: () {
                _shareLink(shareLink);
              },
              image: "assets/images/share app.png",
              title: 'Share app',
            ),
          ],
        ),
      )),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });
  final VoidCallback onTap;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MotionWear(
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsWear.white,
          boxShadow: [
            BoxShadow(
              color: ColorsWear.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 30.h,
            ),
            SizedBox(width: 20.w),
            Text(
              title,
              style: StylesWear.style(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorsWear.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
