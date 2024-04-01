// ignore_for_file: unnecessary_import, unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_temp/Const_Colors/colors.dart';
import 'Home/Bottom_Bar/home_bottom.dart';

void main() async{
  var device = [];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Hive.initFlutter();
  var box = await Hive.openBox('FavBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            backgroundColor: background,
          ),
          home: const HomeBottomBar(),
        );
      },
    );
  }
}
