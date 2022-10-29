import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/downloads/downloads_provider.dart';
import 'package:provider/provider.dart';

import '../../../network/end_points.dart';
import '../../../styles/constants/widgets.dart';
import '../../widgets/card_title.dart';
import 'card_with_number.dart';

class ListWithTitleAndNumber extends StatelessWidget {
  final String title;
  const ListWithTitleAndNumber({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final Size size;

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
          child: Consumer<DownloadsProvider>(
            builder: (context, value, child) => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ImageCardWithNumber(
                      width: size.width * 0.35,
                      image:
                          '$kImageAppendUrl${value.downloadsResponseModel?.results?[index].posterPath}',
                      index: (index + 1).toString(),
                    ),
                separatorBuilder: ((context, index) => kSizedBoxW10),
                itemCount: value.downloadsResponseModel?.results?.length ?? 0),
          ),
        )
      ],
    );
  }
}
