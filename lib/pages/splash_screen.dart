import 'dart:async';

import 'package:agri_grow/pages/category_page.dart';
import 'package:agri_grow/pages/display_list.dart';
import 'package:agri_grow/pages/log_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    Timer(const Duration(seconds: 1), () {
      if(box.read('isLoggedIn') == true){
        if(box.read('isLanguageSelected') == true){
          Get.offAll(const ListPageView());
        }else{
          Get.offAll(const LanguageSelectPage());
        }
      } else{
        Get.offAll(const LogInScreen());
      }
    });
    return  Scaffold(
      body: Container(),
    );
  }
}
