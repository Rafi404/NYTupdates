import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_articles/view/news_detailes_page/news_detailes_page.dart';
import 'package:intl/intl.dart';

import '../../../constants/const.dart';
import '../../../controller/api_controller.dart';

class ArticleTile extends StatelessWidget {
  ArticleTile({Key? key, required this.index}) : super(key: key);
  final apiController = Get.put(ApiController());
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(NewsDetailsPage(index: index), transition: Transition.cupertino);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                child: apiController
                        .articleData.value.results![index].media!.isEmpty
                    ? const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                      )
                    : ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Hero(
                          tag: 'thumb',
                          child: Image.network(apiController.articleData.value
                              .results![index].media![0].mediaMetadata![0].url
                              .toString()),
                        ),
                      ),
              ),
              width10,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      apiController.articleData.value.results![index].title
                          .toString(),
                      style: articleTitle.copyWith(color: secondaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                    ),
                    height10,
                    Text(
                      apiController
                          .articleData.value.results![index].resultAbstract
                          .toString(),
                      style: articleDescription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                    ),
                    height15,
                    Row(
                      children: [
                        Text(
                          apiController.articleData.value.results![index].source
                              .toString(),
                          style: articleAuthor,
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
                                  apiController.articleData.value
                                      .results![index].publishedDate
                                      .toString())),
                              style: articleAuthor,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              width10,
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )
            ],
          ),
          Divider(color: Colors.grey.withOpacity(0.7)),
        ],
      ),
    );
  }
}
