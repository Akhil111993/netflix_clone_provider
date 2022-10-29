import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/downloads/downloads_provider.dart';
import 'package:netflix_clone/pages/new&hot/coming_soon_provider.dart';
import 'package:netflix_clone/pages/search/search_trending_provider.dart';
import 'package:provider/provider.dart';

import '../../../network/end_points.dart';
import '../../../styles/constants/widgets.dart';
import '../../widgets/card_title.dart';
import '../../widgets/image_card.dart';
import 'home_row_list.dart';

class ListWithTitle extends StatelessWidget {
  final int index;
  final String title;
  const ListWithTitle({
    Key? key,
    required this.size,
    required this.title,
    required this.index,
  }) : super(key: key);

  final Size size;

  Widget getRowChild(int index) {
    late Widget widget;
    switch (index) {
      case 0:
        widget = Consumer<DownloadsProvider>(
            builder: (context, value, child) => HomeRowList(
                  size: size,
                  model: value.downloadsResponseModel,
                ));
        break;
      case 1:
        widget = Consumer<ComingSoonProvider>(
            builder: (context, value, child) => HomeRowList(
                  size: size,
                  model: value.comingSoonResponseModel,
                ));
        break;
      case 2:
        widget = Consumer<SearchTrendingProvider>(
            builder: (context, value, child) => HomeRowList(
                  size: size,
                  model: value.searchTrendingResponseModel,
                ));
        break;
      case 4:
        widget = Consumer<ComingSoonProvider>(
            builder: (context, value, child) => HomeRowList(
                  size: size,
                  model: value.comingSoonResponseModel,
                ));
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kSizedBoxH10,
        CardTitle(title: title),
        kSizedBoxH10,
        LimitedBox(
          maxHeight: size.width * 0.57,
          child: getRowChild(index),
        ),
      ],
    );
  }
}
