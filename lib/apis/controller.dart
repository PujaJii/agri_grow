import 'package:agri_grow/apis/end_paths.dart';
import 'package:agri_grow/apis/model.dart';
import 'package:get/get.dart';

class MyDataController extends GetxController{
  static MyDataController to = Get.find();

  var isLoading = false.obs;
  var myList = [].obs;
  getAllData () async {
    try {
      isLoading(true);
      var apiResponse = await ApiEndPaths.getData();
      if (apiResponse != null) {
        if (apiResponse.response == true) {
          myList.assignAll(apiResponse.data);
        }
        else{
          print(apiResponse.error);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
