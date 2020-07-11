import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ThemeUtils {
  final BuildContext context;

  ThemeUtils.of(this.context);

  Color defaultThemeColor() {
    return NeumorphicTheme.isUsingDark(context) ? Colors.white : Colors.black;
  }
}
