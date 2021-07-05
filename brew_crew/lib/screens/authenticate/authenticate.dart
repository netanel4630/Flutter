import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign%20in.dart';
import 'package:flutter/material.dart';

class Authencticate extends StatefulWidget {
  @override
  _AuthencticateState createState() => _AuthencticateState();
}

class _AuthencticateState extends State<Authencticate> {

  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}