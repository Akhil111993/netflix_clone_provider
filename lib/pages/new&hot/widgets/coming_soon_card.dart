import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/hot&new/coming_soon_response_model.dart';

import '../../../network/end_points.dart';
import '../../../styles/constants/widgets.dart';
import '../../widgets/icon_title_column.dart';
import '../../widgets/image_with_volume_button.dart';

class ComingSoonCard extends StatelessWidget {
  final Result? result;
  const ComingSoonCard({
    Key? key,
    this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
        top: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kSizedBoxW10,
          Column(
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              kSizedBoxH10,
              Text(
                '11',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          kSizedBoxW10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWithVolumeButton(
                  image: '$kImageAppendUrl${result?.posterPath}',
                ),
                kSizedBoxH10,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        result?.title ?? '',
                        style: GoogleFonts.satisfy(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    const IconTitleColumn(
                      icon: Icons.notifications_none_outlined,
                      title: 'Remind me',
                    ),
                    kSizedBoxW10,
                    const IconTitleColumn(
                      icon: Icons.info_outline,
                      title: 'Info',
                    ),
                    kSizedBoxW10,
                  ],
                ),
                kSizedBoxH10,
                const Text(
                  'Coming on Friday',
                  style: TextStyle(color: Colors.white60),
                ),
                kSizedBoxH20,
                Text(
                  result?.title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                kSizedBoxH10,
                Text(
                  result?.overview ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
