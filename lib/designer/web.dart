import 'package:flutter/material.dart';
import 'package:footwear_designer_247/designer/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wear extends StatefulWidget {
  final String url;
  final String title;

  const Wear({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<Wear> createState() => _WearState();
}

class _WearState extends State<Wear> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsWear.pink,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: ColorsWear.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const BackButton(color: ColorsWear.white),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
