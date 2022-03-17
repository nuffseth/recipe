import 'package:flutter/material.dart';
import 'package:bap/screens/recipe/RecipeScreen.dart';
import 'package:bap/utils/constants.dart';
import 'package:bap/utils/size_config.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bap/models/ModelProvider.dart';
import 'package:bap/amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Amplify config
  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    //AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    await Amplify.addPlugins([authPlugin]);

    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  int currentIndex = 0;
  static List<Widget> pages = <Widget>[
    Icon(Icons.account_circle_rounded), //RecipeScreen(),
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
