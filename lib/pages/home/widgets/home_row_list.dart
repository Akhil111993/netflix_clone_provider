import 'package:flutter/material.dart';
import 'package:netflix_clone/models/Downloads/downloads_response_model.dart';
import 'package:netflix_clone/pages/downloads/downloads_provider.dart';

import '../../../network/end_points.dart';
import '../../../styles/constants/widgets.dart';
import '../../widgets/image_card.dart';

class HomeRowList extends StatelessWidget {
  var model;
  HomeRowList({
    Key? key,
    required this.size,
    required this.model,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ImageCard(
              width: size.width * 0.35,
              borderRadius: kBorderRadius10,
              image: '$kImageAppendUrl${model?.results?[index].posterPath}',
            ),
        separatorBuilder: ((context, index) => kSizedBoxW10),
        itemCount: model?.results?.length ?? 0);
  }
}
