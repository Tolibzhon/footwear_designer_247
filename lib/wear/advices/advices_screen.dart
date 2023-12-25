import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/advices/content/advices_content.dart';
import 'package:footwear_designer_247/wear/advices/detail_advices_screen.dart';

class AdvicesScreen extends StatelessWidget {
  const AdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Column(
          children: [
            Text(
              'Advices',
              style: StylesWear.style(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: ColorsWear.black,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailAdvicesScreen(
                                advices: listAdvicesContent[index]),
                          ),
                        );
                      },
                      child: Container(
                        height: 120.h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 20.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image:
                                  AssetImage(listAdvicesContent[index].image),
                              fit: BoxFit.cover),
                        ),
                        child: Center(
                          child: Text(
                            listAdvicesContent[index].title,
                            style: StylesWear.style(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorsWear.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: listAdvicesContent.length),
            ),
          ],
        ),
      )),
    );
  }
}
