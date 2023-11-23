import 'package:agri_grow/apis/model.dart';
import 'package:agri_grow/components/app_constants.dart';
import 'package:http/http.dart' as http;

class ApiEndPaths{
  static var client = http.Client();
  static Future<FetchDataModel> getData() async {
    var response = await client.get(Uri.parse(AppConstants.baseURL));
    print('base url: ${AppConstants.baseURL}, response: $response');

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return fetchDataModelFromJson(jsonString);
    }
    return fetchDataModelFromJson(response.body);
  }

}
