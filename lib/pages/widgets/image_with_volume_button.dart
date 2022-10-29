import 'package:flutter/material.dart';

import 'volume_button_widget.dart';

class ImageWithVolumeButton extends StatelessWidget {
  final String? image;
  const ImageWithVolumeButton({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image ??
              'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/wB8xWKLCZJZx13uavLffRhvPBSE.jpg',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const Positioned(
          right: 10,
          bottom: 10,
          child: VolumeButtonWidget(),
        ),
      ],
    );
  }
}
