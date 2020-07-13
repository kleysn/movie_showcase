import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        ? statusBarTextoBranco()
        : statusBarTextoPreto();
  }

  Color cardBackgroundColor() {
    return NeumorphicTheme.of(context).isUsingDark
        ? Colors.black26
        : Colors.white;
  }

  static void statusBarTextoPreto() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark));
    } else if (Platform.isIOS) {
      FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    }
  }

  static void statusBarTextoBranco() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light));
    } else if (Platform.isIOS) {
      FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.light);
    }
  }
}
