import 'package:bap/screens/profile/components/info.dart';
import 'package:bap/screens/profile/components/profile_item.dart';
import 'package:bap/utils/size_config.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/pic.png",
            name: "Jhon Doe",
            email: "Jhondoe01@gmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), //20
          ProfileItem(
            iconSrc: Icon(Icons.bookmark),
            title: "Saved Recipes",
            press: () {},
          ),
          ProfileItem(
            iconSrc: Icon(Icons.language),
            title: "Change Language",
            press: () {},
          ),
          ProfileItem(
            iconSrc: Icon(Icons.info),
            title: "Help",
            press: () {},
          ),
        ],
      ),
    );
  }
}
