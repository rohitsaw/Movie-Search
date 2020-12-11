import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/model.dart';

class MoviePage extends StatelessWidget {
  final Album album;
  MoviePage(this.album);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        children: [
          const Divider(
            height: 30,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Title",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(album.title),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Released Date",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(album.releasedDate),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Runtime",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(album.runTime),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Language",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(album.language),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Genre",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(album.genre),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rated",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(album.rated),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 2,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Casts: \n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: album.casts,
                    style: TextStyle(
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Writers: \n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: album.writers,
                    style: TextStyle(
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Director: \n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: album.director,
                    style: TextStyle(
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Production: \n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: album.production,
                    style: TextStyle(
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          const Divider(
            height: 20,
            thickness: 2,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Plot: \n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: album.plot,
                    style: TextStyle(
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          const Divider(
            height: 20,
            thickness: 2,
          ),
          Center(
              child: Text(
            "Ratings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
          ...getList(album.ratings),
          if (album.imdbId != null)
            FlatButton(
              child: Text(
                "Go to IMDB",
                style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
              ),
              onPressed: () {
                var url = 'https://www.imdb.com/title/${album.imdbId}/';
                launch(url);
              },
            )
        ],
      ),
    );
  }
}

Iterable<Widget> getList(Map<String, String> mp) sync* {
  for (var each in mp.entries) {
    yield Chip(
      avatar: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey.shade800,
        child: FittedBox(child: Text(each.value)),
      ),
      label: Text(each.key),
    );
  }
}
