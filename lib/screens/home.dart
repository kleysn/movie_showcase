import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:movie_showcase/screens/theme_utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 2,
      viewportFraction: 0.75,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1)).then(
        (value) => ThemeUtils.of(context).statusBarColorAccordingToTheme());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Showcase',
          style: TextStyle(color: NeumorphicTheme.defaultTextColor(context)),
        ),
        actions: <Widget>[
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.lightbulb_outline,
                color: NeumorphicTheme.defaultTextColor(context),
                size: 22.0,
              ),
            ),
            onTap: () {
              NeumorphicTheme.of(context).themeMode =
                  NeumorphicTheme.isUsingDark(context)
                      ? ThemeMode.light
                      : ThemeMode.dark;
              NeumorphicTheme.of(context).isUsingDark
                  ? FlutterStatusbarTextColor.setTextColor(
                      FlutterStatusbarTextColor.dark)
                  : FlutterStatusbarTextColor.setTextColor(
                      FlutterStatusbarTextColor.light);
            },
          ),
        ],
        elevation: 7,
        backgroundColor: NeumorphicTheme.baseColor(context),
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: _coreLayout(),
    );
  }

  Widget _coreLayout() {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: _screenHeight / 1.65,
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.0,
            ),
            child: Card(
              elevation: 55.0,
              color: Colors.transparent,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _cardContent(index: index);
                },
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              'O poderoso chefão',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
            Text(
              'Ação / Aventura',
              style: TextStyle(
                fontSize: 16.0,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cardContent({@required int index}) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'http://br.web.img3.acsta.net/medias/nmedia/18/90/93/20/20120876.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return NeumorphicButton(
      child: Text(
        'Clique para mudar o tema',
        style: TextStyle(
          color: NeumorphicTheme.defaultTextColor(context),
        ),
      ),
      provideHapticFeedback: true,
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
