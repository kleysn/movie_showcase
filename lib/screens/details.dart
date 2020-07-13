import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:movie_showcase/models/filme.dart';
import 'package:movie_showcase/widgets/bookmark_icon.dart';
import 'package:movie_showcase/widgets/utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 12.0),
                  child: Text(
                    widget.filme.titulo,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: NeumorphicTheme.defaultTextColor(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 12.0, right: 10.0),
                  child: Text(
                    '${widget.filme.genero}  •  ${Utils.getMonthName(number: widget.filme.data.substring(3, 5)).toLowerCase()} ${widget.filme.data.substring(widget.filme.data.length - 4)}',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: NeumorphicTheme.defaultTextColor(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 10.0, top: 20.0),
                  child: Container(
                    height: 0.2,
                    color: NeumorphicTheme.defaultTextColor(context)
                        .withOpacity(.6),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 12.0),
                  child: Text(
                    'Sinopse',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w300,
                      color: NeumorphicTheme.defaultTextColor(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 12.0, right: 10.0),
                  child: Text(
                    widget.filme.sinopseFull.trim(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: NeumorphicTheme.defaultTextColor(context),
                    ),
                  ),
                ),
                Container(
                  height: 20.0,
                ),
                NeumorphicButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'adorocinema.com',
                        style: TextStyle(
                          color: NeumorphicTheme.defaultTextColor(context),
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.link,
                        color: NeumorphicTheme.defaultTextColor(context),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    if (await canLaunch(widget.filme.link)) {
                      await launch(widget.filme.link);
                    }
                  },
                ),
                Container(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
    );
  }
}
