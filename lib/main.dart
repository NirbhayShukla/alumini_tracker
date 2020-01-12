import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:alumini_tracker/services/authentication.dart';
import 'models/user.dart';
import 'package:alumini_tracker/pageselector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authentication().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alumini Tracker',
        theme: ThemeData(
          primaryColor: Color(0xFF6CA8F1),
        ),
        home: PageSelector(),
      ),
    );
  }
}
