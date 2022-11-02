import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory NavigationService() {
    return _instance;
  }

  dynamic args;

  NavigationService._internal();

  Future<void>? pushNamed(String routeName, {dynamic args}) {
    this.args = args;

    return navigatorKey.currentState?.pushNamed(routeName);
  }

  Future<void>? pushReplacementNamed(String routeName) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  void pop() {
    return navigatorKey.currentState?.pop();
  }
}
