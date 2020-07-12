import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:movie_showcase/models/filme.dart';
import 'package:movie_showcase/screens/bookmark_icon.dart';

class Details extends StatefulWidget {
  final Filme filme;
  final int index;

  const Details({
    Key key,
    this.filme,
    this.index,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.45,
            flexibleSpace: Container(
              child: Hero(
                tag: 'heroCover${widget.index}',
                child: Image.network(
                  widget.filme.poster,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            backgroundColor: NeumorphicTheme.baseColor(context),
            elevation: 10.0,
            forceElevated: true,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Hero(
                  tag: 'heroBookmark${widget.index}',
                  child: BookmarkIcon(
                    title: widget.filme.titulo,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
    );
  }
}
