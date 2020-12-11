import 'package:flutter/material.dart';

import '../../moviePage/moviePage.dart';

class SearchResult extends StatelessWidget {
  final _albumDetails;
  SearchResult(this._albumDetails);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _albumDetails,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListTile(
            leading: Icon(Icons.search),
            onTap: () {
              if (snapshot.hasData) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoviePage(snapshot.data)),
                );
              }
            },
            title: Text(
                (snapshot.hasData)
                    ? snapshot.data.title
                    : (snapshot.hasError)
                        ? "No result found!"
                        : "Searching...",
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                )),
          ),
        );
      },
    );
  }
}