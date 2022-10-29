import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/downloads/downloads_provider.dart';
import 'package:provider/provider.dart';
import 'everyones_watching_card.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadsProvider>(
      builder: (context, value, child) => ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => EveryonesWatchingCard(
          result: value.downloadsResponseModel?.results?[index],
        ),
      ),
    );
  }
}
