import 'package:bap/screens/recipe/components/categories.dart';
import 'package:flutter/material.dart';

import 'package:bap/utils/constants.dart';

class RecipeAppBar extends SliverPersistentHeaderDelegate {
  const RecipeAppBar();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;

    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: COLOR_WHITE),
          /*
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: progress,
            child: ColoredBox(
              color: COLOR_WHITE,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: 1 - progress,
            child: ColoredBox(color: COLOR_WHITE),
          ),*/
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.lerp(
              EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              progress,
            ),
            alignment: Alignment.lerp(
              Alignment.bottomLeft,
              Alignment.bottomLeft,
              progress,
            ),
            child: Text(
              'Discover',
              style: TextStyle.lerp(
                TextStyle(
                    color: COLOR_BLACK,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
                TextStyle(
                    color: COLOR_BLACK,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
                progress,
              ),
            ),
          ),
          AppBar(
            primary: false,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
            elevation: 0,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => AppBar().preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
