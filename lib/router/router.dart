import 'package:flutter/material.dart';
import 'package:teamtalk/features/settings/view/settings_page.dart';

const String SettingRoute = '/';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return MaterialPageRoute(builder: (context) => const SettingsPage());
  }
}
