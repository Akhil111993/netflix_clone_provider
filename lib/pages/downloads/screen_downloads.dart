import 'package:flutter/material.dart';
import 'package:netflix_clone/network/end_points.dart';
import 'package:netflix_clone/pages/downloads/downloads_provider.dart';
import 'package:provider/provider.dart';

import '../../styles/colors/colors.dart';
import '../../styles/constants/styles.dart';
import '../../styles/constants/widgets.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/image_card.dart';

const imageList = [
  'https://www.themoviedb.org/t/p/w220_and_h330_face/g8sclIV4gj1TZqUpnL82hKOTK3B.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/wE0I6efAW4cDDmZQWtwZMOW44EJ.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/r7XifzvtezNt31ypvsmb6Oqxw49.jpg'
];

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  void initState() {
    context.read<DownloadsProvider>().callApi(ApiEndPoints.downloads);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Downloads',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: const [
                  Icon(
                    Icons.settings,
                    color: CustomColors.white,
                  ),
                  kSizedBoxW10,
                  Text('Smart Downloads'),
                ],
              ),
            ),
            kSizedBoxH10,
            const Text(
              'Introducing Downloads For You',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            kSizedBoxH10,
            const Text(
              'We will download a personalised selection of\nmovies and shows for you, so there\'s\nalways something to watch on your\ndevice',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.37,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                  Consumer<DownloadsProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return ImageCard(
                        width: size.width * 0.35,
                        height: size.width * 0.52,
                        angle: 20,
                        margin: const EdgeInsets.only(left: 150, bottom: 20),
                        image: value.isLoading
                            ? imageList[0]
                            : '$kImageAppendUrl${value.downloadsResponseModel!.results![2].posterPath}',
                        borderRadius: kBorderRadius10,
                      );
                    },
                  ),
                  Consumer<DownloadsProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                    return ImageCard(
                      width: size.width * 0.35,
                      height: size.width * 0.52,
                      angle: -20,
                      margin: const EdgeInsets.only(right: 150, bottom: 20),
                      image: value.isLoading
                          ? imageList[0]
                          : '$kImageAppendUrl${value.downloadsResponseModel!.results![1].posterPath}',
                      borderRadius: kBorderRadius10,
                    );
                  }),
                  Consumer<DownloadsProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                    return ImageCard(
                      width: size.width * 0.35,
                      height: size.width * 0.52,
                      image: value.isLoading
                          ? imageList[0]
                          : '$kImageAppendUrl${value.downloadsResponseModel!.results![0].posterPath}',
                      borderRadius: kBorderRadius10,
                    );
                  }),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Set up',
                style: kBoldText,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CustomColors.white),
              ),
              child: const Text(
                'See what you can download',
                style: kBoldAndBlackText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
