import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function _callBack;
  final Function _setAlbum;

  

  const SearchBox(
    this._callBack,
    this._setAlbum, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
      child: TextField(
        onTap: _callBack,
        onChanged: _setAlbum,
        onSubmitted: _setAlbum,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
        //fontStyle: FontStyle.italic,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          hintText: 'Search by movie name',
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}