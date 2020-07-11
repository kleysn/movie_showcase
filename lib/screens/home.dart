import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:movie_showcase/screens/theme_utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Showcase',
          style: TextStyle(
            color: NeumorphicTheme.of(context).isUsingDark
                ? Colors.white
                : Colors.black,
          ),
        ),
        backgroundColor: NeumorphicTheme.baseColor(context),
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NeumorphicButton(
              child: Text(
                'Clique para mudar o tema',
                style: TextStyle(
                    color: ThemeUtils.of(context).defaultThemeColor()),
              ),
              provideHapticFeedback: true,
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () async {
                NeumorphicTheme.of(context).themeMode =
                    NeumorphicTheme.isUsingDark(context)
                        ? ThemeMode.light
                        : ThemeMode.dark;
                NeumorphicTheme.of(context).isUsingDark
                    ? await FlutterStatusbarTextColor.setTextColor(
                        FlutterStatusbarTextColor.dark)
                    : await FlutterStatusbarTextColor.setTextColor(
                        FlutterStatusbarTextColor.light);
              },
            ),
          ],
        ),
      ),
    );
  }
}
