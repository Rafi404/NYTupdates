import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_articles/constants/const.dart';
import 'package:get_articles/view/home_page/widgets/article_tile.dart';

import '../../controller/api_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiController = Get.put(ApiController());

  @override
  void initState() {
    super.initState();

    /// Call article api
    apiController.getArticleData(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('NY Times Most Popular'),
        ),
        body: apiController.articleLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  strokeWidth: 2.5,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: apiController.articleData.value.results!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ArticleTile(
                        index: index,
                      );
                    }),
              ),
      );
    });
  }
}
