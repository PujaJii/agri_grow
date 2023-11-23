import 'package:agri_grow/apis/controller.dart';
import 'package:agri_grow/pages/log_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../components/app_colors.dart';



class ListPageView extends StatelessWidget {
  const ListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    MyDataController myDataController = MyDataController.to;
    final box = GetStorage();
    return  Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {
          box.erase();
          Get.offAll(()=> const LogInScreen());
        }, icon: Icon(Icons.logout)),
        IconButton(onPressed: () {

        }, icon: Icon(Icons.notification_important_outlined)),
        SizedBox(width: 20,)
      ],),
      body: GetX<MyDataController>(initState: (context) {
        myDataController.getAllData();
      }, builder: (controller) {
        if (controller.isLoading.value) {
          return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.themeColor,
                  )));
        } else {
          return  ListView.builder(
            itemCount: controller.myList.length,
            padding: EdgeInsets.all(15),
            itemBuilder: (context, index) {
              return  ListTile(
                leading: Image.network(
                    controller.myList[index].icon,scale: 12,
                ),
              title: box.read('languageType')== 'English'?
              Text(controller.myList[index].category):
              box.read('languageType')== 'বাংলা'?
              Text(controller.myList[index].lnBn):
              Text(controller.myList[index].lnHn)
              );
            },);
        }})
    );
  }
}
