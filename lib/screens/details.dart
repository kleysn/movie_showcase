import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Details extends StatefulWidget {
  final String heroTag;

  const Details({Key key, this.heroTag}) : super(key: key);

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
                  'http://br.web.img3.acsta.net/medias/nmedia/18/90/93/20/20120876.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
    );
  }
}
