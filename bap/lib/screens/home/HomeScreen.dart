import 'package:flutter/material.dart';
import 'package:bap/screens/recipe/RecipeScreen.dart';
import 'package:bap/utils/constants.dart';
import 'package:bap/utils/size_config.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bap/models/ModelProvider.dart';
import 'package:bap/amplifyconfiguration.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  //Amplify config
  @override
  initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    if (!Amplify.isConfigured) {
      await _configureAmplify();
    }
  }

  Future<void> _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    final AmplifyDataStore _datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([authPlugin, _datastorePlugin]);

    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      await Amplify.configure(amplifyconfig);
      setState(() {
        _isLoading = false;
      });
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  int currentIndex = 0;
  static List<Widget> pages = <Widget>[
    RecipeScreen(),
    Icon(Icons.ac_unit, size: 150),
    Icon(Icons.access_alarm_outlined, size: 150),
    Icon(Icons.account_box, size: 150)
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.statusbarheight),
      child: Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : pages[currentIndex],
        bottomNavigationBar: buildNavbar(),
      ),
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
        height: 50,
        decoration: BoxDecoration(color: COLOR_WHITE, boxShadow: [
          BoxShadow(
              offset: Offset(0, -7),
              blurRadius: 30,
              color: COLOR_BLACK.withOpacity(0.2))
        ]),
        child: BottomNavigationBar(
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            selectedItemColor: COLOR_DARK_BLUE,
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
