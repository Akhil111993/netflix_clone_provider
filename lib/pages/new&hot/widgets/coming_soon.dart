import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/new&hot/coming_soon_provider.dart';
import 'package:provider/provider.dart';

import 'coming_soon_card.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ComingSoonProvider>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.comingSoonResponseModel?.results?.length ?? 0,
        itemBuilder: (context, index) => ComingSoonCard(
            result: value.comingSoonResponseModel?.results?[index]),
      ),
    );
  }
}
