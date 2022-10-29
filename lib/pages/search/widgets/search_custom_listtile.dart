import 'package:flutter/material.dart';
import 'package:netflix_clone/models/Search/search_response.dart';

import '../../../network/end_points.dart';
import '../../../styles/constants/widgets.dart';

class SearchCustomListTile extends StatelessWidget {
  final Result? result;
  const SearchCustomListTile({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius5,
            image: DecorationImage(
              image: NetworkImage(
                '$kImageAppendUrl${result?.posterPath}',
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 90,
          width: MediaQuery.of(context).size.width * 0.37,
        ),
        kSizedBoxW10,
        Expanded(
          child: Text(
            result?.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const Icon(
          Icons.play_circle_outline_sharp,
          color: Colors.white,
          size: 50,
        ),
        kSizedBoxW10,
      ],
    );
  }
}
