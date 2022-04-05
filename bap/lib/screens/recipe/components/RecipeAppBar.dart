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
              EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              progress,
            ),
            alignment: Alignment.lerp(
              Alignment.bottomLeft,
              Alignment.centerLeft,
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
                    fontSize: 20,
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
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => AppBar().preferredSize.height - 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
