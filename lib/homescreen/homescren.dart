import 'package:flutter/material.dart';

import 'package:alumini_tracker/models/user.dart';
import 'package:alumini_tracker/services/authentication.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen(this.user);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Authentication _auth =Authentication();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text("${widget.user.uid}"),
        RaisedButton(
          onPressed: () async{
            await _auth.signOut();
          },
        )
      ],),
      
    );
  }
}