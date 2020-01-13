import 'package:flutter/material.dart';
import 'package:alumini_tracker/services/authentication.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(
      child: RaisedButton(
        onPressed: () {
          auth.signOut();
        },
        child: Text("Log Out"),
      ),
    ));
  }
}
