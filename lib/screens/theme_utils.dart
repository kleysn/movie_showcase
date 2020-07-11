import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class ThemeUtils {
  final BuildContext context;

  ThemeUtils.of(this.context);

  Color defaultThemeColor() {
    return NeumorphicTheme.isUsingDark(context) ? Colors.white : Colors.black;
  }

  void statusBarColorAccordingToTheme() async {
    NeumorphicTheme.of(context).isUsingDark
        ? FlutterStatusbarTextColor.setTextColor(
            FlutterStatusbarTextColor.light)
        : FlutterStatusbarTextColor.setTextColor(
            FlutterStatusbarTextColor.dark);
  }

  Color cardBackgroundColor() {
    return NeumorphicTheme.of(context).isUsingDark
        ? Colors.black26
        : Colors.white;
  }
}
