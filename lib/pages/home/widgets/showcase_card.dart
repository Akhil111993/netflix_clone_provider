import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/new&hot/coming_soon_provider.dart';
import 'package:netflix_clone/pages/new&hot/widgets/coming_soon_card.dart';
import 'package:provider/provider.dart';

import '../../../network/end_points.dart';
import '../../widgets/icon_title_column.dart';

class ShowcaseCard extends StatelessWidget {
  final Size size;
  const ShowcaseCard({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<ComingSoonProvider>(
          builder: (context, value, child) => Container(
            height: size.height * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '$kImageAppendUrl${value.comingSoonResponseModel?.results?[4].posterPath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const IconTitleColumn(
                icon: Icons.add,
                title: 'My List',
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                label: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Play',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              const IconTitleColumn(
                icon: Icons.info_outline,
                title: 'Info',
              ),
            ],
          ),
        )
      ],
    );
  }
}
