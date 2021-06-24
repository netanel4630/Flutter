import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
        ),
        body: Center(
          child: TextButton.icon(
            icon: Icon(Icons.mail),
            onPressed: null,
            label: Text(""),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text("Hello"),
          backgroundColor: Colors.amberAccent,
        )
    );
  }
}

