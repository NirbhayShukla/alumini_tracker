import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:alumini_tracker/login_screen/sign_up_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool _autovalidate = false;

  final kBoxDecorationStyle = BoxDecoration(
    color: Color(0xFF6CA8F1),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  Widget emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            onChanged: (String value) {
              _email = value;
            },
            validator: (String value) {
              if (!(value.contains('@')))
                return "Enter a valid email";
              else
                return null;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                errorStyle: TextStyle(color: Colors.white54),
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.white38)),
          ),
        ),
      ],
    );
  }

  Widget passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            onChanged: (String value) {
              _password = value;
            },
            validator: (String value) {
              if (value.length < 8)
                return "Password must be at least 8 characters";
              else
                return null;
            },
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                errorStyle: TextStyle(color: Colors.white54),
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.white38)),
          ),
        ),
      ],
    );
  }

  Widget loginButton() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        width: double.infinity,
        child: RaisedButton(
          onPressed: login,
          elevation: 5,
          padding: EdgeInsets.all(15),
          child: Text(
            "LOGIN",
            style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
        ));
  }

  Future<void> login() async {
    setState(() async {
      if (_formkey.currentState.validate()) {
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          
             
        } catch (e) {
          print(e.message);
        }
      } else
        _autovalidate = true;
    });
  }

  Widget socialSites() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/facebook.jpg"),
                )),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/google.jpg"),
                )),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }

  Widget signUp() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      ),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: "SIGN UP",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Form(
            key: _formkey,
            autovalidate: _autovalidate,
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    emailField(),
                    SizedBox(
                      height: 30,
                    ),
                    passwordField(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password?",
                          style: TextStyle(color: Colors.white)),
                    ),
                    loginButton(),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "- OR -",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign in with",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    socialSites(),
                    SizedBox(
                      height: 15,
                    ),
                    signUp(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
