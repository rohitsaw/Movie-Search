import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/model.dart';
import './widgets/searchBox.dart';
import './widgets/searchResult.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  bool _showBackButton = false;
  Future<Album> _albumDetails;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, -0.4),
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _forwardAnimation() {
    if (_controller.status == AnimationStatus.dismissed) {
      setState(() {
        _controller.forward();
        _showBackButton = true;
      });
    }
  }

  void _reverseAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      setState(() {
        _controller.reverse();
        _showBackButton = false;
        _albumDetails = null;
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      });
    }
  }

  Future<Album> _searchAlbum(String searchText) async {
    final response =
        await http.get('http://www.omdbapi.com/?t=$searchText&apikey=440b5bff&plot=full');
    final responseObj = jsonDecode(response.body);
    //print(responseObj);
    if (responseObj['Response'] != "False") {
      return Album.fromJson(responseObj);
    }
    throw Exception('Failed to load album');
  }

  void _setAlbum(String searchText) {
    setState(() {
      _albumDetails = _searchAlbum(searchText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: _showBackButton
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: _reverseAnimation,
              )
            : IconButton(
                icon: Icon(Icons.home, color: Colors.black),
                onPressed: () {},
              ),
        title: Text(widget.title),
      ),
      body: SlideTransition(
        position: _offsetAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchBox(_forwardAnimation, _setAlbum),
            if (_controller.status == AnimationStatus.completed)
              SearchResult(_albumDetails)
            else
              ListTile(
                title: Text(""),
              )
          ],
        ),
      ),
    );
  }
}
