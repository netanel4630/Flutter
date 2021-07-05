import 'package:brew_crew/screens/authenticate/sign%20in.dart';
import 'package:flutter/material.dart';

class Authencticate extends StatefulWidget {
  @override
  _AuthencticateState createState() => _AuthencticateState();
}

class _AuthencticateState extends State<Authencticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}