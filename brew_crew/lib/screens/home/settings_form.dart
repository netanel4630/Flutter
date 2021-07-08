import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  String _currentStrength;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val)=>val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val)=> setState(()=> _currentName = val),
          ),
          SizedBox(height: 20.0),
          //dropdown
          DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currentSugars ?? '0', // initial the dropdown
              items: sugars.map((sugar){
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugars'),
                );
              }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
          ),
          //slider
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[400],
            ),
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
          )
        ],
      ),
    );
  }
}
