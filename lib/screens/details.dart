import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:movie_showcase/models/filme.dart';

class Details extends StatefulWidget {
  final String heroTag;
  final Filme filme;

  const Details({
    Key key,
    this.heroTag,
    this.filme,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.45,
            flexibleSpace: Container(
              child: Hero(
                tag: widget.heroTag,
                child: Image.network(
                  widget.filme.poster,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            backgroundColor: NeumorphicTheme.baseColor(context),
            elevation: 10.0,
            forceElevated: true,
          ),
        ],
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
    );
  }
}
