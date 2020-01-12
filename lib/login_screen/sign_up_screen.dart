import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _name = "";
  String _passyear = "";
  String _studentno = "";
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

  Widget nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Full Name",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            child: TextFormField(
              onChanged: (String value) {
                _name = value;
              },
              validator: (String value) {
                if (value.isEmpty)
                  return "Enter a valid name";
                else
                  return null;
              },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(color: Colors.white54),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  hintText: "Eg. Nirbhay Shukla",
                  hintStyle: TextStyle(color: Colors.white38)),
            ),
          ),
        ),
      ],
    );
  }

  Widget passField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Year Of Passing",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            child: TextFormField(
              onChanged: (String value) {
                _passyear = value;
              },
              validator: (String value) {
                if (value.length > 4)
                  return "Enter a Valid Year";
                else
                  return null;
              },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(color: Colors.white54),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  prefixIcon: Icon(Icons.date_range, color: Colors.white),
                  hintText: "Eg. 2022",
                  hintStyle: TextStyle(color: Colors.white38)),
            ),
          ),
        ),
      ],
    );
  }

  Widget studentNoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Student Number",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            child: TextFormField(
              onChanged: (String value) {
                _studentno = value;
              },
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(color: Colors.white54),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  prefixIcon: Icon(Icons.person_pin, color: Colors.white),
                  hintText: "Eg. 1810031",
                  hintStyle: TextStyle(color: Colors.white38)),
            ),
          ),
        ),
      ],
    );
  }

  Widget emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
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
                  errorStyle: TextStyle(color: Colors.white54),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  hintText: "Eg. xyz@gmail.com",
                  hintStyle: TextStyle(color: Colors.white38)),
            ),
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            child: TextFormField(
              onChanged: (String value) {
                _password = value;
              },
              validator: (String value) {
                if (value.length <= 8)
                  return "Password must be at least 8 characters";
                else
                  return null;
              },
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(color: Colors.white54),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  hintText: "Enter password",
                  hintStyle: TextStyle(color: Colors.white38)),
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordConfirmField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Confirm Password",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            child: TextFormField(
              validator: (String value) {
                if (value.compareTo(_password) != 0)
                  return "Passwords do not match";
                else
                  return null;
              },
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(color: Colors.white54),
                  contentPadding: EdgeInsets.only(top: 12),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  hintText: "Confirm password",
                  hintStyle: TextStyle(color: Colors.white38)),
            ),
          ),
        ),
      ],
    );
  }

  Widget signUpButton() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        width: double.infinity,
        child: RaisedButton(
          onPressed: signUp,
          elevation: 5,
          padding: EdgeInsets.all(15),
          child: Text(
            "SIGN UP",
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

  void signUp() {
    setState(() async{
      if (_formkey.currentState.validate()) {
        FirebaseUser user =(await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password: _password)).user;
      } else
        _autovalidate = true;
    });
  }

  Widget login() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Already have an account? ",
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: "SIGN IN",
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
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    nameField(),
                    passField(),
                    studentNoField(),
                    emailField(),
                    passwordField(),
                    passwordConfirmField(),
                    signUpButton(),
                    login(),
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
