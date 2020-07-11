import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:movie_showcase/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Movie Showcase',
      themeMode: ThemeMode.system,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        shadowLightColor: Colors.black45,
        depth: 10,
        defaultTextColor: Colors.black,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        shadowDarkColor: Colors.black,
        shadowLightColor: Colors.black,
        defaultTextColor: Colors.white,
        depth: 10,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
