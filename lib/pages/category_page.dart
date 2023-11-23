import 'package:agri_grow/components/app_colors.dart';
import 'package:agri_grow/pages/display_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



class LanguageSelectPage extends StatelessWidget {
  const LanguageSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    List<String> names =[
      'English',
      'বাংলা',
      'हिंदी',
    ];
    return  Scaffold(
      appBar: AppBar(title:Text('    Choose language'),),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          //crossAxisSpacing: 12.0,
          //mainAxisSpacing: 12.0,
          childAspectRatio: 1.5
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              box.write('isLanguageSelected', true);
              box.write('languageType', names[index]);
              Get.off(()=> const ListPageView());
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 2.0, // Soften the shaodw
                      spreadRadius: 5.0,
                      offset: const Offset(0.0, 0.0),
                    )
                  ],
                  color: AppColors.white,border: Border.all(color: AppColors.themeColor)),
              child: Center(
                child: Text(
                  names[index],
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.themeColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
