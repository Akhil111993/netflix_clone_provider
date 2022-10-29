import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/pages/downloads/downloads_provider.dart';

import 'package:netflix_clone/pages/new&hot/coming_soon_provider.dart';
import 'package:netflix_clone/pages/search/search_provider.dart';
import 'package:netflix_clone/pages/search/search_trending_provider.dart';

import 'pages/main_bottom_nav/screen_main.dart';
import 'styles/colors/colors.dart';
import 'styles/constants/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DownloadsProvider>(
            create: (_) => DownloadsProvider()),
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
        ChangeNotifierProvider<SearchTrendingProvider>(
            create: (_) => SearchTrendingProvider()),
        ChangeNotifierProvider<ComingSoonProvider>(
            create: (_) => ComingSoonProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Netflix',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            primarySwatch: Colors.blue,
            backgroundColor: CustomColors.backgroundColor,
            scaffoldBackgroundColor: CustomColors.backgroundColor,
            textTheme: GoogleFonts.montserratTextTheme(
              const TextTheme(
                  bodyText1: kTextBodyStyle, bodyText2: kTextBodyStyle),
            ),
          ),
          home: ScreenMainPage(),
        );
      },
    );
  }
}
