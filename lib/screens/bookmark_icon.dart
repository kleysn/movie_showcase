import 'package:flutter/material.dart';
import 'package:movie_showcase/repository/database/database_helper.dart';

class BookmarkIcon extends StatefulWidget {
  final String title;

  const BookmarkIcon({Key key, this.title}) : super(key: key);

  @override
  _BookmarkIconState createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  final _db = DatabaseHelper.instance;
  bool bookmarked;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _db.isBookmarked(title: widget.title),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container();
        }
        print(snapshot.data);
        bookmarked = snapshot.data;
        return GestureDetector(
          child: Icon(
            bookmarked ? Icons.favorite : Icons.favorite_border,
            color: bookmarked ? Colors.red : Colors.white,
            size: 26.0,
          ),
          onTap: () async {
            if (snapshot.data) {
              _db.deleteBookmark(title: widget.title);
            } else {
              _db.insertBookmark(title: widget.title);
            }
            setState(() {});
          },
        );
      },
    );
  }
}
