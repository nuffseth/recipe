import 'package:flutter/material.dart';
import 'package:myapp/screens/home/HomeScreen.dart';
import 'package:myapp/utils/constants.dart';
import 'package:flutter/widgets.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    Icon(Icons.ac_unit, size: 150),
    Icon(Icons.access_alarm_outlined, size: 150),
    Icon(Icons.account_box, size: 150)
  ];
  @override
  Widget build(BuildContext context) {
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
