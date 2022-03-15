import 'package:flutter/material.dart';

class NavItem {
  final int? id;
  final Icon? icon;
  final Widget? destination;

  NavItem({this.id, this.icon, this.destination});

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}
