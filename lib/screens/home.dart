import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:movie_showcase/blocs/home_bloc.dart';
import 'package:movie_showcase/models/filme.dart';
import 'package:movie_showcase/screens/details.dart';
import 'package:movie_showcase/screens/theme_utils.dart';
import 'package:movie_showcase/widgets/bookmark_icon.dart';
import 'package:movie_showcase/widgets/utils.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;
  HomeBloc _homeBloc;
  List<Filme> _filmes;
  bool inicializado = false;

  @override
  void initState() {
    _homeBloc = HomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(pageListener);
    _homeBloc.dispose();
    super.dispose();
  }

  void inicializar() {
    double screenWidth = MediaQuery.of(context).size.width;
    int initialPage = inicializado
        ? _pageController.page.ceil()
        : (_filmes.length / 2).ceil();
    _pageController = PageController(
      initialPage: initialPage,
      viewportFraction:
          screenWidth > 370 ? (screenWidth / 500) : (screenWidth / 600),
    );
    _pageController.addListener(pageListener);
    _homeBloc.updateCurrentMovie(filme: _filmes[initialPage]);
    inicializado = true;
  }

  void pageListener() {
    int currentPage = _pageController.page.toInt();
    _homeBloc.updateCurrentMovie(filme: _filmes[currentPage]);
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
        centerTitle: true,
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
              ThemeUtils.of(context).statusBarColorAccordingToTheme();
              // NeumorphicTheme.of(context).isUsingDark
              //     ? FlutterStatusbarTextColor.setTextColor(
              //         FlutterStatusbarTextColor.dark)
              //     : FlutterStatusbarTextColor.setTextColor(
              //         FlutterStatusbarTextColor.light);
            },
          ),
        ],
        elevation: 7,
        backgroundColor: NeumorphicTheme.baseColor(context),
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: _layoutBuilder(),
    );
  }

  Widget _layoutBuilder() {
    return StreamBuilder<List<Filme>>(
      stream: _homeBloc.moviesStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Utils.mainShimmer(context: context);
        }

        if (snapshot.data == []) {
          return Center(
            child: Text('Não foi possível carregar os filmes'),
          );
        }

        _filmes = snapshot.data;
        inicializar();
        return _coreLayout(filmes: snapshot.data);
      },
    );
  }

  Widget _coreLayout({@required List<Filme> filmes}) {
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
                itemCount: filmes.length,
                itemBuilder: (context, index) {
                  return _movieCover(index: index, filme: filmes[index]);
                },
              ),
            ),
          ),
        ),
        StreamBuilder(
          stream: _homeBloc.currentMovieStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                color: Colors.amber,
              );
            }
            Filme _filmeAtual = snapshot.data;
            return Column(
              children: <Widget>[
                Container(height: 5.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    _filmeAtual.titulo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: NeumorphicTheme.defaultTextColor(context),
                    ),
                  ),
                ),
                Container(height: 5.0),
                Text(
                  _filmeAtual.genero,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: NeumorphicTheme.defaultTextColor(context)
                        .withOpacity(.7),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                Text(
                  '${Utils.getMonthName(number: _filmeAtual.data.substring(3, 5))} ${_filmeAtual.data.substring(_filmeAtual.data.length - 4)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                    color: NeumorphicTheme.defaultTextColor(context),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _movieCover({@required int index, @required Filme filme}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) {
            return Details(
              filme: filme,
              index: index,
            );
          }),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: 'heroCover$index',
                child: Container(
                  height: 400.0,
                  width: 300.0,
                  child: Image.network(
                    filme.poster,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Shimmer.fromColors(
                        child: Container(
                          color: NeumorphicTheme.isUsingDark(context)
                              ? Colors.grey
                              : Colors.grey.withOpacity(.3),
                        ),
                        baseColor: Colors.black26,
                        highlightColor: Colors.white12,
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Hero(
                tag: 'heroBookmark$index',
                child: BookmarkIcon(
                  title: filme.titulo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
