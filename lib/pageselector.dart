import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:alumini_tracker/login_screen/login_screen.dart';
import 'package:alumini_tracker/homescreen/homescren.dart';

import 'models/user.dart';

class PageSelector extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null)
   return LoginScreen();
   else
   return HomeScreen();
  }
}