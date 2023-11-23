import 'package:agri_grow/apis/controller.dart';
import 'package:agri_grow/components/app_colors.dart';
import 'package:agri_grow/pages/log_in.dart';
import 'package:agri_grow/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put<MyDataController>(MyDataController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Agri Grow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.themeColor),
        //useMaterial3: true,
        //primarySwatch: MaterialColor(0xff335702,),
      ),
      home: const SplashScreen(),
    );
  }
}

