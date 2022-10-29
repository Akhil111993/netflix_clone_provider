import 'package:flutter/material.dart';

import 'icon_with_name_button.dart';
import 'profile_pic_with_text.dart';

class FastLaughSideMenu extends StatelessWidget {
  const FastLaughSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 15),
      child: Column(
        children: [
          const ProfilePicWithText(),
          IconWithNameButton(
            icon: Icons.emoji_emotions,
            text: 'LOL',
            onPressed: () {},
          ),
          IconWithNameButton(
            icon: Icons.add,
            text: 'My List',
            onPressed: () {},
          ),
          IconWithNameButton(
            icon: Icons.send,
            text: 'Share',
            onPressed: () {},
          ),
          IconWithNameButton(
            icon: Icons.play_arrow,
            text: 'Play',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
