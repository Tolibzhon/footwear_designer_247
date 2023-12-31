import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/advices/content/advices_content.dart';
import 'package:footwear_designer_247/wear/advices/content/info_cont.dart';
import 'package:footwear_designer_247/wear/advices/detail_advices_screen.dart';

class AdvicesScreen extends StatefulWidget {
  const AdvicesScreen({super.key});

  @override
  State<AdvicesScreen> createState() => _AdvicesScreenState();
}

class _AdvicesScreenState extends State<AdvicesScreen> {
  String page = 'Advices';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        page = 'Advices';
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Advices',
                          style: StylesWear.style(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: page == 'Advices'
                                ? ColorsWear.black
                                : Colors.grey,
                          ),
                        ),
                        Container(
                          width: 115,
                          height: 3,
                          color: page == 'Advices'
                              ? ColorsWear.pink
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 30.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        page = 'Info';
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Info',
                          style: StylesWear.style(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color:
                                page == 'Info' ? ColorsWear.black : Colors.grey,
                          ),
                        ),
                        Container(
                          width: 55,
                          height: 3,
                          color: page == 'Info'
                              ? ColorsWear.pink
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              ////////////////////////////////////////////////
              //////////////Page////////////////////////
              page == 'Advices'
                  ? Expanded(
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
                                      image: AssetImage(
                                          listAdvicesContent[index].image),
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
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'How the right shoes can affect a persons health?',
                              textAlign: TextAlign.center,
                              style: StylesWear.style(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsWear.black),
                            ),
                            SizedBox(height: 20.h),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listInfo.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 20),
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.sp),
                                padding: EdgeInsets.all(15.sp),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: ColorsWear.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listInfo[index].title,
                                      style: StylesWear.style(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: ColorsWear.pink,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      listInfo[index].subTitle,
                                      style: StylesWear.style(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsWear.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
