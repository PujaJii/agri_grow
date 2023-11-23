import 'package:agri_grow/components/my_snak_bar.dart';
import 'package:agri_grow/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../components/app_colors.dart';



class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    TextEditingController numberTEC = TextEditingController();

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(' LOG IN',
                style: TextStyle(color: AppColors.themeColor,fontSize: 22),
              ),
              SizedBox(
                height: 50,
              ),
              Text(' Email ID or Phone',),
              TextFormField(keyboardType: TextInputType.number,
                  controller: numberTEC,
                  style: TextStyle(color: AppColors.black, fontSize: 18),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter mobile number'
                      : value.length != 10
                      ? 'Please enter 10 digit number'
                      : null,
                  maxLength: 10,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                      enabled: true,
                      counterText: '',
                      errorStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        //fontWeight: FontWeight.w600,
                        // light
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.themeColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.themeColor)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red))
                  )),
              SizedBox(height: 30,),
              Text(' Password',),

              TextFormField(
                  style: TextStyle(color: AppColors.black, fontSize: 18),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter a password'
                      : value.length < 6
                      ? 'Please password too small'
                      : null,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                      enabled: true,
                      errorStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                       // fontWeight: FontWeight.w600,
                        // light
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.themeColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.themeColor)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red))
                  )),
              SizedBox(height: 30,),
              Container(
                height: 50,
                child: ElevatedButton(onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if(numberTEC.text.contains('.')|| numberTEC.text.contains('-')){
                      print('not valid');
                     MySnackBar.errorSnack('Wrong Format', 'Entered number format is wrong');
                    }else{
                      box.write('isLoggedIn', true);
                      Get.off(()=> const LanguageSelectPage());
                    }
                  }
                }, child: const Text('Log In')),
              )
            ],
          ),
        )
      ),
    );
  }
}



