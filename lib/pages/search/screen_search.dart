import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/search/search_provider.dart';

import 'package:provider/provider.dart';

import '../../network/end_points.dart';
import '../../styles/constants/widgets.dart';
import '../widgets/card_title.dart';
import '../widgets/image_card.dart';
import 'search_trending_provider.dart';
import 'widgets/search_custom_listtile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    context.read<SearchTrendingProvider>().callApi(ApiEndPoints.trending);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                itemColor: Colors.grey,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  context
                      .read<SearchTrendingProvider>()
                      .setIsTextEmpty(value.isEmpty);
                  if (value.isNotEmpty) {
                    context
                        .read<SearchProvider>()
                        .callApi(ApiEndPoints.getSearch(value));
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Consumer<SearchTrendingProvider>(
                  builder: (context, value, child) => CardTitle(
                    title:
                        value.isTextEmpty ? 'Top Searches' : 'Search Results',
                  ),
                ),
              ),
              Consumer<SearchTrendingProvider>(
                builder: (context, value, child) => !value.isTextEmpty
                    ? Consumer<SearchProvider>(
                        builder: (context, value, child) {
                          return value.isLoading
                              ? const SizedBox()
                              : Expanded(
                                  child: ListView.separated(
                                      itemBuilder: (_, index) =>
                                          SearchCustomListTile(
                                            result: value.searchResponseModel
                                                ?.results?[index],
                                          ),
                                      separatorBuilder: (_, index) =>
                                          kSizedBoxH20,
                                      itemCount: value.searchResponseModel
                                              ?.results?.length ??
                                          0),
                                );
                        },
                      )
                    : Consumer<SearchTrendingProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                          return value.isLoading
                              ? const SizedBox()
                              : Expanded(
                                  child: GridView.count(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1 / 1.75,
                                    children: List.generate(
                                        value.searchTrendingResponseModel
                                                ?.results?.length ??
                                            0,
                                        (index) => ImageCard(
                                              borderRadius: kBorderRadius5,
                                              image:
                                                  '$kImageAppendUrl${value.searchTrendingResponseModel?.results?[index].posterPath}',
                                            )),
                                  ),
                                );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
