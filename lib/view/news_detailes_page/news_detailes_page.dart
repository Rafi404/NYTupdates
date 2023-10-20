import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_articles/constants/const.dart';
import 'package:intl/intl.dart';

import '../../controller/api_controller.dart';

class NewsDetailsPage extends StatelessWidget {
  NewsDetailsPage({Key? key, required this.index}) : super(key: key);
  final int index;
  final apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child:
                apiController.articleData.value.results![index].media!.isEmpty
                    ? Container(
                        height: 200,
                        width: Get.width,
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: const Center(child: Text('No image')),
                      )
                    : Hero(
                        tag: 'thumb',
                        child: Image.network(apiController.articleData.value
                            .results![index].media![0].mediaMetadata![2].url
                            .toString()),
                      ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                height10,
                Row(
                  children: [
                    Text(
                      apiController.articleData.value.results![index].source
                          .toString(),
                      style: articleAuthor.copyWith(
                          color: Colors.grey.withOpacity(.8)),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.event,
                          size: 18,
                        ),
                        width10,
                        Text(
                          DateFormat("d MMM yyyy").format(DateTime.parse(
                              apiController.articleData.value.results![index]
                                  .publishedDate
                                  .toString())),
                          style: articleAuthor.copyWith(
                              color: Colors.grey.withOpacity(.8)),
                        )
                      ],
                    )
                  ],
                ),
                height10,
                Text(
                  apiController.articleData.value.results![index].title
                      .toString(),
                  style: articleTitle.copyWith(color: secondaryColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                ),
                height15,
                Text(
                  apiController.articleData.value.results![index].resultAbstract
                      .toString(),
                  style: articleDescription.copyWith(color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  softWrap: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
