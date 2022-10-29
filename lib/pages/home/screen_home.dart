import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/pages/new&hot/coming_soon_provider.dart';
import 'package:netflix_clone/pages/search/search_trending_provider.dart';
import 'package:provider/provider.dart';

import '../../network/end_points.dart';
import '../downloads/downloads_provider.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/list_with_tile.dart';
import 'widgets/list_with_title_and_number.dart';
import 'widgets/showcase_card.dart';

ValueNotifier<bool> isAppBarVisible = ValueNotifier(true);
const List titles = [
  'Released in the past year',
  'Trending now',
  'Tense dramas',
  'Top trending',
  'South indian cinemas',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<DownloadsProvider>().callApi(ApiEndPoints.downloads);
    context.read<SearchTrendingProvider>().callApi(ApiEndPoints.trending);
    context.read<ComingSoonProvider>().callApi(ApiEndPoints.comingSoon);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          isAppBarVisible.value =
              notification.direction == ScrollDirection.reverse ? false : true;
          return true;
        },
        child: ValueListenableBuilder(
          valueListenable: isAppBarVisible,
          builder: (BuildContext context, value, Widget? child) {
            return Stack(
              children: [
                ListView(
                  children: [
                    ShowcaseCard(
                      size: size,
                    ),
                    ...List.generate(
                      titles.length,
                      (index) => index == 3
                          ? ListWithTitleAndNumber(
                              size: size,
                              title: titles[index],
                            )
                          : ListWithTitle(
                              size: size,
                              title: titles[index],
                              index: index,
                            ),
                    ),
                  ],
                ),
                AnimatedOpacity(
                  opacity: value ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: const CustomAppBar(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
