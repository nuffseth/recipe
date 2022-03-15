import 'package:flutter/material.dart';
import 'package:bap/screens/recipe/RecipeScreen.dart';
import 'package:bap/utils/constants.dart';
import 'package:bap/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  static List<Widget> pages = <Widget>[
    Recipe(),
    Icon(Icons.ac_unit, size: 150),
    Icon(Icons.access_alarm_outlined, size: 150),
    Icon(Icons.account_box, size: 150)
  ];

  @override
  Widget build(BuildContext context) {
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final ThemeData themeData = Theme.of(context);

    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppbar(),
      body: pages[currentIndex],
      bottomNavigationBar: buildNavbar(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      centerTitle: true,
      title: Transform.scale(
        scale: 2.0,
        child: IconButton(
          icon: Image.asset("assets/images/bap.png"),
          onPressed: () {},
        ),
      ),
    );
  }

  Container buildNavbar() {
    return Container(
        height: 60,
        decoration: BoxDecoration(color: COLOR_WHITE, boxShadow: [
          BoxShadow(
              offset: Offset(0, -7),
              blurRadius: 30,
              color: COLOR_DARK_BLUE.withOpacity(0.2))
        ]),
        child: BottomNavigationBar(
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            selectedItemColor: COLOR_BLACK,
            unselectedItemColor: COLOR_GREY.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
              BottomNavigationBarItem(
                  label: "Search", icon: Icon(Icons.search)),
              BottomNavigationBarItem(
                  label: "Favorite", icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  label: "Profile", icon: Icon(Icons.person))
            ]));
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
