import 'package:flutter/material.dart';
import 'package:bap/utils/constants.dart';
import 'package:bap/utils/size_config.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "All",
    "Baking",
    "Catonese",
    "Chinese",
    "Filipino",
    "Fusion",
    "Japanese",
    "Korean",
    "Taiwanese",
    "Western"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: SizeConfig.defaultSize * 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoryItem(index),
        ));
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        //margin: EdgeInsets.only(left: SizeConfig.defaultSize),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize, //10
          vertical: SizeConfig.defaultSize * 0.5, //5
        ),
        decoration: BoxDecoration(
            color: selectedIndex == index ? COLOR_GUN : Colors.transparent,
            borderRadius: BorderRadius.circular(
              SizeConfig.defaultSize * 1.6, // 16
            )),
        child: Text(
          categories[index],
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            color: selectedIndex == index ? COLOR_WHITE : COLOR_BLACK,
          ),
        ),
      ),
    );
  }
}
