import 'package:flutter/material.dart';

import 'package:alumini_tracker/homescreen/addPost.dart';
import 'package:alumini_tracker/homescreen/events.dart';
import 'package:alumini_tracker/homescreen/feedscreen.dart';
import 'package:alumini_tracker/homescreen/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> _children = [
    FeedScreen(),
    AddPost(),
    Events(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:
              Text("Aluimini Tracker", style: TextStyle(color: Colors.black)),
          actions: <Widget>[Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.send),
          )],
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,size: 35,), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box,size: 35,), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications,size: 35,), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.person,size: 35,), title: SizedBox.shrink())
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
        ));
  }
}
