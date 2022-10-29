import 'package:flutter/material.dart';
import 'package:netflix_clone/network/end_points.dart';
import 'package:netflix_clone/pages/downloads/downloads_provider.dart';
import 'package:netflix_clone/pages/new&hot/coming_soon_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar_widget.dart';
import 'widgets/coming_soon.dart';
import 'widgets/everyones_watching.dart';

class NewAndHotScreen extends StatefulWidget {
  const NewAndHotScreen({super.key});

  @override
  State<NewAndHotScreen> createState() => _NewAndHotScreenState();
}

class _NewAndHotScreenState extends State<NewAndHotScreen> {
  @override
  void initState() {
    context.read<ComingSoonProvider>().callApi(ApiEndPoints.comingSoon);
    context.read<DownloadsProvider>().callApi(ApiEndPoints.downloads);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarWidget(
          height: 80,
          title: 'Hot & New',
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            tabs: const [
              Tab(
                text: '🍿 Coming soon',
              ),
              Tab(
                text: '👀 Everyone\'s watching',
              ),
            ],
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonWidget(),
            EveryonesWatchingWidget(),
          ],
        ),
      ),
    );
  }
}
