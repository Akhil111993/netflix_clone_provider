import 'package:flutter/material.dart';

import '../downloads/screen_downloads.dart';
import '../fast_laughs/screen_fast_laughs.dart';
import '../home/screen_home.dart';
import '../new&hot/screen_new_hot.dart';
import '../search/screen_search.dart';
import 'widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final screenList = [
    const HomeScreen(),
    const NewAndHotScreen(),
    const FastLaughsScreen(),
    const SearchScreen(),
    const DownloadsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: ((context, int value, child) => screenList[value]),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
