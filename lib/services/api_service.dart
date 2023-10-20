import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/const.dart';
import '../controller/app_controller.dart';

class ApiService {
  final appController = Get.put(AppMainController());

  ///get article data
  Future<dynamic> getArticleData(context) async {
    try {
      final Uri apiUrl = Uri.parse(
          "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=$apiKey");

      final http.Response response = await http.get(
        apiUrl,
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        appController.toastMessage(context, tryMessage);
      }
    } catch (e) {
      appController.toastMessage(context, tryMessage);
    }
  }
}
