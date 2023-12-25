import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:footwear_designer_247/designer/saved_data.dart';
import 'package:footwear_designer_247/designer/style_wear.dart';
import 'package:footwear_designer_247/wear/examples/content/examples_content.dart';

class ExamplesWidget extends StatefulWidget {
  const ExamplesWidget({
    super.key,
    required this.example,
  });
  final ExamplesContent example;

  @override
  State<ExamplesWidget> createState() => _ExamplesWidgetState();
}

class _ExamplesWidgetState extends State<ExamplesWidget> {
  bool islike = false;

  List<String> podcastList = [];

  @override
  void initState() {
    savedData();

    super.initState();
  }

  Future<void> savedData() async {
    List<String> podcastListSavedData = await SavedData.getPodcastList();
    setState(() {
      podcastList = podcastListSavedData;
      islike = podcastList.contains('${widget.example.id}');
    });
  }

  Future<void> savedDataAdd(String subTitle) async {
    List<String> podcastListSavedData = await SavedData.getPodcastList();
    setState(() {
      podcastList = podcastListSavedData;
      islike = podcastList.contains('${widget.example.id}');

      podcastList.add(subTitle);
    });
    await SavedData.setPodcastList(podcastList);
  }

  Future<void> savedDatRremove(String subTitle) async {
    List<String> podcastListSavedData = await SavedData.getPodcastList();
    setState(() {
      podcastList = podcastListSavedData;
      islike = podcastList.contains('${widget.example.id}');

      podcastList.remove(subTitle);
    });
    await SavedData.setPodcastList(podcastList);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: ColorsWear.white,
              image: DecorationImage(
                image: AssetImage(widget.example.image),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: InkWell(
            onTap: () async {
              setState(() {
                islike = !islike;
              });
              if (islike == true) {
                await savedDataAdd('${widget.example.id}');
              } else {
                await savedDatRremove('${widget.example.id}');
              }
              savedData();
            },
            child: podcastList.contains('${widget.example.id}')
                ? Image.asset(
                    "assets/images/liked.png",
                    height: 30.h,
                  )
                : islike == true
                    ? Image.asset(
                        "assets/images/liked.png",
                        height: 30.h,
                      )
                    : Image.asset(
                        "assets/images/disliked.png",
                        height: 30.h,
                      ),
          ),
        ),
        Positioned(
          bottom: -3,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              widget.example.title,
              style: StylesWear.style(
                fontSize: 16.h,
                fontWeight: FontWeight.w500,
                color: ColorsWear.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
