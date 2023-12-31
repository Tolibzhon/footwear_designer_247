import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footwear_designer_247/designer/doc_wear.dart';
import 'package:footwear_designer_247/designer/splash_screen.dart';
import 'package:footwear_designer_247/wear/design/data/models/shoe_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: DocWear.apphudApiKey);
  await Hive.initFlutter();
  Hive.registerAdapter(ShoeHiveModelAdapter());
  await Hive.openBox<ShoeHiveModel>('shoes');
  runApp(const WearApp());
}

class WearApp extends StatelessWidget {
  const WearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        title: 'Footwear-Designer',
        home: const SplashScreen(),
      ),
      designSize: const Size(390, 844),
    );
  }
}
