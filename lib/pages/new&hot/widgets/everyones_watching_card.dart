import 'package:flutter/material.dart';
import 'package:netflix_clone/models/Downloads/downloads_response_model.dart';

import '../../../network/end_points.dart';
import '../../../styles/constants/widgets.dart';
import '../../widgets/card_title.dart';
import '../../widgets/icon_title_column.dart';
import '../../widgets/image_with_volume_button.dart';

class EveryonesWatchingCard extends StatelessWidget {
  final Result? result;
  const EveryonesWatchingCard({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(title: result?.title ?? ''),
          kSizedBoxH10,
          Text(
            result?.overview ?? '',
            style: const TextStyle(color: Colors.grey),
          ),
          kSizedBoxH20,
          ImageWithVolumeButton(
            image: '$kImageAppendUrl${result?.posterPath}',
          ),
          kSizedBoxH10,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              IconTitleColumn(
                title: 'Share',
                icon: Icons.send,
              ),
              kSizedBoxW10,
              IconTitleColumn(
                title: 'My List',
                icon: Icons.add,
              ),
              kSizedBoxW10,
              IconTitleColumn(
                title: 'Play',
                icon: Icons.play_arrow,
              ),
            ],
          )
        ],
      ),
    );
  }
}
