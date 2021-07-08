import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  
  //text field state
  String email ='';
  String psw = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          TextButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register')
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView (
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email': null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() {
                      psw = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(email, psw);
                        if(result == null){
                          setState(() {
                            error = 'Could not sign in with those credentials';
                            loading = false;
                          });
                        } else {

                        }
                      }
                    },
                    child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white)
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[400]
                    ),
                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}