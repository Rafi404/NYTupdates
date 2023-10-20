import 'package:get/get.dart';
import 'package:get_articles/constants/const.dart';

import '../model/article_data_model.dart';
import '../services/api_service.dart';
import 'app_controller.dart';

class ApiController extends GetxController {
  final appController = Get.put(AppMainController());

  final RxBool articleLoading = true.obs;

  final Rx<ArticleDataModel> articleData = ArticleDataModel().obs;

  getArticleData(context) async {
    try {
      final data = await ApiService().getArticleData(context);
      if (data != null) {
        articleData.value = articleDataModelFromJson(data);
        articleLoading.value = false;
        update();
      } else {
        appController.toastMessage(context, errorMessage);
      }
    } catch (e) {
      appController.toastMessage(context, tryMessage);
    }
  }
}
